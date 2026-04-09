# InvestorPortal — OPB Capital

Web portal for solar energy investors. Purchasers can browse available ITC (Investment Tax Credit) projects, schedule introductory calls, and track their portfolio. Administrators manage purchaser profiles and notification banners through a dedicated admin panel.

---

## Table of Contents

- [Overview](#overview)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Architecture](#architecture)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Running the Application](#running-the-application)
- [Database Setup](#database-setup)
- [Configuration Reference](#configuration-reference)
- [User Roles](#user-roles)
- [Key Concepts](#key-concepts)
- [Publishing for Production](#publishing-for-production)

---

## Overview

InvestorPortal is an ASP.NET WebForms 4.8 application built for **OPB Capital** to manage relationships with solar project investors. It supports two user roles:

| Role | Capabilities |
|---|---|
| **Purchaser** | Browse available projects, view project details, schedule a call, track portfolio KPIs and payment status |
| **Admin** | Manage purchaser profiles (name, phone, entity), set notification banners per user (Payment Pending, Documents Pending, Call Scheduled) |

The application runs without a database in **fallback mode** — credentials are read from `Web.config` and projects are loaded from an in-memory seed list. Full functionality (portfolio tracking, payments, documents) requires a SQL Server database.

---

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | ASP.NET WebForms 4.8 (.NET Framework 4.8) |
| Language | C# 7.3 |
| UI | Bootstrap 4, custom OPB brand CSS (`opb-brand.css`) |
| Charts | Highcharts (local scripts) |
| Database | SQL Server 2017+ / SQL Server LocalDB |
| Auth | PBKDF2-SHA256 (100,000 iterations) via `Rfc2898DeriveBytes` |
| IDE | Visual Studio 2019+ / VS Code with C# Dev Kit |

---

## Project Structure

```
InvestorPortal/
├── App_Data/
│   └── schema.sql              # DDL + seed data for SQL Server
├── Content/
│   ├── style.css               # Bootstrap variable overrides + base styles
│   ├── opb-brand.css           # OPB Capital brand colors and component overrides
│   └── deskapp2.css            # Dashboard layout styles
├── Data/
│   ├── Database.cs             # Connection factory + IsConfigured flag
│   ├── NotificationRepository.cs
│   ├── PasswordHelper.cs       # PBKDF2-SHA256 hash/verify
│   ├── ProjectRepository.cs    # DB + in-memory seed fallback
│   ├── UserProjectRepository.cs # Portfolio summary + Reserve()
│   └── UserRepository.cs
├── Images/                     # Project photos, logo, icons
├── Infrastructure/
│   ├── BasePage.cs             # Session guard for all authenticated pages
│   └── AdminBasePage.cs        # Role guard (Admin only) on top of BasePage
├── Models/
│   ├── Project.cs
│   └── User.cs
├── Pages/
│   ├── Login.aspx / .cs        # Login with DB auth + Web.config fallback
│   ├── Logout.aspx / .cs       # Session.Clear() + redirect
│   ├── PurchaserPortal.aspx    # Home page — project cards + alerts
│   ├── PurchaserDashboard.aspx # Portfolio KPI cards + Highcharts chart
│   ├── Projects.aspx           # Full project catalog
│   ├── PurchaseForm.aspx       # Project detail + schedule call form
│   ├── AdminView.aspx          # Admin panel — purchaser management
│   └── Error.aspx              # Generic error page (customErrors target)
├── Scripts/
│   └── Deskapp/                # Highcharts, dashboard JS
├── Site.Master / .cs           # Shared layout: navbar (role-conditional), footer
├── Web.config                  # App settings, connection string, session config
├── Web.Release.config          # XDT transform for production publish
├── Web.Debug.config            # XDT stub for development
├── InvestorPortal.csproj
└── PLAN.md                     # Full development plan and sprint history
```

---

## Architecture

### Page Inheritance

```
System.Web.UI.Page
└── BasePage                    # Redirects to Login if no session
    └── AdminBasePage           # Redirects to Portal if role ≠ Admin
        └── AdminView
    └── PurchaserPortal
    └── PurchaserDashboard
    └── Projects
    └── PurchaseForm
```

`Login.aspx` and `Error.aspx` inherit directly from `System.Web.UI.Page` — they must be reachable without a session.

### Authentication Flow

1. User submits email + password on `Login.aspx`.
2. If a database connection is configured (`Database.IsConfigured`), `UserRepository.GetByEmail()` is called and the password is verified with `PasswordHelper.Verify()` (PBKDF2-SHA256).
3. If no database is configured, credentials are looked up in `Web.config` `<appSettings>` as `auth_<email>` with the format `password|Role|FullName`.
4. On success, `Session["UserId"]`, `Session["Name"]`, and `Session["Role"]` are set and the user is redirected to their role-appropriate home page.

### Database Fallback

`Database.IsConfigured` returns `false` when the connection string is empty. All repositories check this flag:
- `ProjectRepository` → returns in-memory seed (3 solar projects)
- `NotificationRepository` → returns empty set (no alerts shown)
- `UserProjectRepository` → returns a zeroed `DashboardSummary`
- `UserRepository` → returns null / empty list

This allows the app to run fully in development without any SQL Server instance.

---

## Prerequisites

| Requirement | Version |
|---|---|
| Windows | 10 / 11 / Server 2016+ |
| .NET Framework | 4.8 |
| Visual Studio | 2019 or 2022 (with ASP.NET workload), **or** IIS Express |
| SQL Server *(optional)* | 2017+ or SQL Server Express / LocalDB |

> **Without a database:** the app runs with `Web.config` credentials and seed project data. All authentication and browsing works; portfolio tracking (payments, documents) requires DB.

---

## Installation

### 1. Clone the repository

```bash
git clone https://github.com/your-org/InvestorPortal.git
cd InvestorPortal
```

### 2. Restore NuGet packages

Open `InvestorPortal.csproj` in Visual Studio — packages restore automatically.

Or from Developer Command Prompt:
```bash
nuget restore InvestorPortal.csproj
```

### 3. Configure credentials (fallback mode — no DB required)

Open `Web.config` and edit the `<appSettings>` section:

```xml
<appSettings>
  <add key="auth_you@opbcapital.com" value="yourpassword|Admin|Your Name" />
</appSettings>
```

Format: `password|Role|FullName` — Role must be `Admin` or `Purchaser`.

### 4. (Optional) Set up the database

See [Database Setup](#database-setup) below.

---

## Running the Application

### Visual Studio (recommended)

1. Open `InvestorPortal.csproj` or `InvestorPortal.sln`.
2. Press **F5** (Debug) or **Ctrl+F5** (without debugger).
3. IIS Express starts and opens the application at `https://localhost:44392/`.
4. Navigate to `Pages/Login.aspx` to sign in.

### IIS Express from command line

```bash
"C:\Program Files\IIS Express\iisexpress.exe" /path:"C:\path\to\InvestorPortal" /port:44392 /clr:v4.0
```

Then open `http://localhost:44392/Pages/Login.aspx`.

### Test credentials (fallback mode)

These are configured in `Web.config` by default:

| Email | Password | Role |
|---|---|---|
| `eduardo@opbcapital.com` | `emartinez` | Admin |
| `andrew@opbcapital.com` | `agold` | Purchaser |
| `octavio@opbcapital.com` | `operez` | Purchaser |
| `lorena@opbcapital.com` | `lmarabotto` | Purchaser |

---

## Database Setup

### Option A — SQL Server LocalDB (development)

LocalDB is included with Visual Studio. No installation needed.

1. Ensure the connection string in `Web.config` points to LocalDB:
   ```xml
   <add name="InvestorPortalDB"
        connectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\InvestorPortal.mdf;Integrated Security=True"
        providerName="System.Data.SqlClient" />
   ```
2. Open **SQL Server Object Explorer** in Visual Studio → connect to `(LocalDB)\MSSQLLocalDB`.
3. Create a new database named `InvestorPortal`.
4. Open `App_Data/schema.sql` and execute it against the new database.

### Option B — SQL Server Express / Full SQL Server

1. Create the database:
   ```sql
   CREATE DATABASE InvestorPortal;
   ```
2. Execute `App_Data/schema.sql` to create tables and insert seed projects.
3. Update the connection string in `Web.config`:
   ```xml
   <add name="InvestorPortalDB"
        connectionString="Server=YOUR_SERVER;Database=InvestorPortal;Integrated Security=True;"
        providerName="System.Data.SqlClient" />
   ```

### Generating password hashes for DB users

The database schema requires PBKDF2-SHA256 hashes — plain text passwords cannot be inserted directly. Use `PasswordHelper.Create()` from `Data/PasswordHelper.cs`:

```csharp
var (hash, salt) = PasswordHelper.Create("yourpassword");
// INSERT INTO Users (Email, PasswordHash, Salt, Role, FullName)
// VALUES ('user@opbcapital.com', '<hash>', '<salt>', 'Purchaser', 'Full Name');
```

Run this from a one-off console project that references the `Data/` layer, or add a temporary setup route.

---

## Configuration Reference

All settings live in `Web.config`. The most commonly changed values are:

| Key / Section | Default | Description |
|---|---|---|
| `auth_<email>` appSetting | See file | Fallback credentials when no DB is configured. Format: `password\|Role\|FullName` |
| `InvestorPortalDB` connectionString | LocalDB | Leave empty string to force fallback mode |
| `sessionState timeout` | `30` | Session inactivity timeout in minutes |
| `httpCookies httpOnlyCookies` | `true` | Prevents JavaScript from reading session cookies |
| `compilation debug` | `true` (dev) / `false` (release via XDT) | Set to `false` in production |

`Web.Release.config` automatically patches `Web.config` at publish time:
- `debug="false"`
- `customErrors mode="On"` → redirects errors to `Pages/Error.aspx`
- `httpCookies requireSSL="true"` → enforces HTTPS-only cookies
- Connection string → replace `PROD_SERVER` with the actual server name before publishing

---

## User Roles

### Purchaser

After login, purchasers land on `PurchaserPortal.aspx`:

- **Home** — project cards with ITC value; click "Get It" to see details and schedule a call.
- **Dashboard** — portfolio KPIs (portfolio size, amount paid, amount due, projects reserved) and an investment trend chart.
- **Projects** — full catalog of available projects with purchase cost and business type.
- **Notification banners** — if the Admin has flagged a pending payment or document, a banner appears at the top of the page.

### Admin

After login, admins land on `AdminView.aspx`:

- Select a purchaser from the dropdown and click **Load** to populate their profile.
- Edit Full Name, Phone, Entity.
- Toggle notification banners: **Payment Pending**, **Documents Pending**, **Call Scheduled**.
- Click **Save Changes** to persist to the database.

---

## Key Concepts

### ITC (Investment Tax Credit)

A U.S. federal tax credit equal to a percentage of the cost of a solar energy system. Projects in this portal are solar installations whose ITC credit is being sold to third-party investors (purchasers). The portal tracks the ITC value and purchase cost for each project.

### Deal Types

| Type | Description |
|---|---|
| **PPA** (Power Purchase Agreement) | Purchaser finances the system; a host pays for the power generated over a fixed contract term |
| **Prepay** | Full upfront payment from the purchaser at the start of the agreement |

### Business Types

| Type | Description |
|---|---|
| **COMMERCIAL** | For-profit businesses (standard ITC rules apply) |
| **NON-PROFIT** | Tax-exempt entities — ITC is monetized differently; typically sold to a tax equity investor |

### Notification Banners

The Admin sets per-user banners via `AdminView`. The banner state is stored in the `Notifications` table and read on every page load via `NotificationRepository.GetActive()`. Three types exist:

| Banner | Shown on |
|---|---|
| Payment Pending | PurchaserPortal, PurchaseForm |
| Documents Pending | PurchaserPortal |
| Call Scheduled | (reserved for future use in navbar/dashboard) |

---

## Publishing for Production

### Quick publish (Visual Studio)

1. Right-click project → **Publish**.
2. Select **Folder** or **Web Deploy Package** profile.
3. Set Configuration to **Release**.
4. Publish to `publish/` directory.

### MSBuild CLI

```bash
msbuild InvestorPortal.csproj \
  /p:Configuration=Release \
  /p:DeployOnBuild=true \
  /p:WebPublishMethod=Package \
  /p:PackageAsSingleFile=true \
  /p:PackageLocation="./dist/InvestorPortal.zip"
```

### Production checklist

Before deploying:

- [ ] Set real SQL Server connection string in `Web.Release.config` (replace `PROD_SERVER`)
- [ ] Run `App_Data/schema.sql` on the production SQL Server instance
- [ ] Generate PBKDF2 hashes and insert real user records into the `Users` table
- [ ] Remove or disable the fallback `auth_*` entries in `Web.config` (or leave empty as a disabled stub)
- [ ] Configure SSL certificate and HTTPS binding in IIS
- [ ] Set Application Pool to **.NET CLR v4.0**, Integrated Pipeline Mode
- [ ] Verify `debug="false"` is applied (it is, via `Web.Release.config` XDT)

### Logo image

The application expects `Images/opb_logo.png` (displayed on the login page, home page, and error page). Add the official OPB Capital logo file at that path before deploying. The file is not committed to the repository.

---

### IIS Server Requirements

| Component | Version |
|---|---|
| Windows Server | 2016+ |
| IIS | 10+ |
| .NET Framework | 4.8 |
| SQL Server | 2017+ (or Express) |
| Web Deploy | 3.6 (for `.zip` deployment) |
