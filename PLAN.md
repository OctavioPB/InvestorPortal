# InvestorPortal — Plan de Desarrollo
**Cliente:** OPB Capital  
**Proyecto:** Portal web para inversionistas  
**Stack:** ASP.NET WebForms (.NET 4.8), C#, Bootstrap 4, SQL Server  
**Última actualización:** 2026-04-08

---

## Resumen Ejecutivo

El portal actualmente es un prototipo funcional con datos hardcodeados, sin base de datos, sin autenticación real y con páginas incompletas. El objetivo es convertirlo en una aplicación lista para distribución con rebranding completo a OPB Capital.

---

## Sprint 1 — Rebranding: GreenPACE Capital → OPB Capital

### 1.1 Sustitución de nombre en UI

Reemplazar todas las ocurrencias del texto "GreenPACE Capital" y "Purchaser Portal" por "OPB Capital" e "Investor Portal" en los siguientes archivos:

| Archivo | Línea(s) | Cambio |
|---|---|---|
| `AdminView.aspx` | 13, 30 | `Purchaser Portal` / `GreenPACE Capital` → `OPB Capital` |
| `PurchaseForm.aspx` | 13, 30, 157 | Ídem |
| `PurchaserDashboard.aspx` | 14, 31 | Ídem |
| `PurchaserPortal.aspx` | 14, 31, 129, 134, 148, 184 | Ídem |
| `PuchaserProjects.aspx` | 120, 121 | Emails y textos de contacto |

### 1.2 Sustitución de dominio en credenciales y emails

Reemplazar `@greenpacecapital.com` por `@opbcapital.com` en:

- `Login.aspx.cs` — líneas 22, 34, 46, 58 (usuarios hardcodeados, hasta Sprint 3)
- `PurchaserPortal.aspx` — `PostBackUrl` del LinkedIn ImageButton (línea 182)
- `PuchaserProjects.aspx` — emails de contacto en footer (líneas 120–121)

### 1.3 Títulos de página

Todas las páginas tienen `<title></title>` vacío (excepto AdminView que dice "Admin"). Actualizar:

| Página | Título nuevo |
|---|---|
| `Login.aspx` | `OPB Capital — Iniciar Sesión` |
| `PurchaserPortal.aspx` | `OPB Capital — Mi Portal` |
| `PurchaserDashboard.aspx` | `OPB Capital — Dashboard` |
| `PurchaseForm.aspx` | `OPB Capital — Detalle de Proyecto` |
| `AdminView.aspx` | `OPB Capital — Administración` |

---

## Sprint 2 — Rebranding Visual: Colores OPB Capital

### 2.1 Definir paleta OPB Brand

> **Acción requerida:** Confirmar con el cliente los valores hexadecimales oficiales de OPB Capital.  
> Los siguientes son placeholders hasta recibir el brand guide:

```css
/* OPB Brand — confirmado desde opb-html SKILL.md */
--opb-primary:    #003366;   /* Color principal (botones, navbar) */
--opb-secondary:  #C8982A;   /* Color secundario / acento (gold) */
--opb-dark:       #1C1C2E;   /* Fondo navbar, headers */
--opb-light:      #F4F6F9;   /* Fondos de tarjetas */
--opb-text:       #1C1C2E;   /* Texto principal */
```

### 2.2 Aplicar paleta al proyecto

Una vez confirmados los colores, los cambios se realizan en:

1. **`style.css`** — Reemplazar las variables CSS de Bootstrap en `:root {}` (líneas 13–33):
   - `--primary` → color principal OPB
   - `--dark` → color oscuro OPB (afecta navbar `bg-dark`)
   - `--secondary` → color secundario OPB

2. **Inline styles en .aspx** — Los archivos tienen `style` atributos directos que sobreescriben Bootstrap. Eliminar o migrar a clases CSS:
   - `PurchaseForm.aspx` — múltiples `style="background-color: #..."` en tarjetas de proyecto
   - `PurchaserPortal.aspx` — `style="background-color:..."` en secciones hero
   - Navbar: `class="navbar-dark bg-dark"` → cambiar a clase personalizada `bg-opb`

3. **Crear `opb-brand.css`** — Nuevo archivo con overrides de Bootstrap para OPB:
   ```css
   /* opb-brand.css */
   .bg-opb        { background-color: var(--opb-dark) !important; }
   .btn-opb       { background-color: var(--opb-primary); color: #fff; }
   .btn-opb:hover { background-color: var(--opb-secondary); }
   .navbar-brand  { /* logo / fuente OPB */ }
   ```

4. **Logo** — Reemplazar texto "OPB Capital" en navbar por `<img>` del logo oficial cuando esté disponible.

---

## Sprint 3 — Seguridad Crítica

### 3.1 Bug: doble escritura de `itcValue`
**Archivo:** `PurchaseForm.aspx.cs` líneas 26 y 29  
`purchaseValue` se asigna dos veces; `itcValue` nunca se muestra. Corregir el mapeo:
```csharp
itcValue.Value      = Session["itcValue"].ToString();    // línea 26 — corregir
purchaseValue.Value = Session["purchaseCost"].ToString(); // línea 29 — mantener
```

### 3.2 Sin autenticación en AdminView
**Archivo:** `AdminView.aspx.cs` — `Page_Load` completamente vacío.  
Cualquier visitante anónimo puede acceder a `/AdminView.aspx` directamente.

**Acción:** Crear `BasePage.cs` y `AdminBasePage.cs`:
```csharp
// BasePage.cs — todas las páginas autenticadas heredan de esta
public class BasePage : System.Web.UI.Page {
    protected override void OnPreLoad(EventArgs e) {
        if (Session["UserId"] == null) Response.Redirect("Login.aspx");
        base.OnPreLoad(e);
    }
}

// AdminBasePage.cs — solo para páginas de admin
public class AdminBasePage : BasePage {
    protected override void OnPreLoad(EventArgs e) {
        base.OnPreLoad(e);
        if (Session["Role"]?.ToString() != "Admin") Response.Redirect("PurchaserPortal.aspx");
    }
}
```

Cambiar herencia: `AdminView` → `: AdminBasePage`, resto → `: BasePage`.

### 3.3 Credenciales hardcodeadas
**Archivo:** `Login.aspx.cs` — switch con emails y contraseñas en texto plano en el código fuente.

**Fix interino (inmediato):** Mover a `Web.config` `<appSettings>`.  
**Fix permanente (Sprint 4):** Reemplazar con autenticación PBKDF2 contra base de datos.

### 3.4 Eliminar `Response.Write` para alertas
**Archivos:** `Login.aspx.cs`, `PurchaserPortal.aspx.cs`, `PurchaserDashboard.aspx.cs`, `PurchaseForm.aspx.cs`  
El patrón `Response.Write("<script>alert(...);</script>")` + `Server.Transfer(...)` produce respuestas HTTP malformadas. Reemplazar con controles `<asp:Label>` en las páginas .aspx.

### 3.5 Agregar página de Logout
Crear `Logout.aspx.cs`:
```csharp
Session.Clear();
Session.Abandon();
Response.Redirect("Login.aspx");
```
Agregar enlace "Cerrar Sesión" en navbar de todas las páginas.

---

## Sprint 4 — Base de Datos y Autenticación Real

### 4.1 Esquema de base de datos

```sql
CREATE TABLE Users (
    UserId       INT PRIMARY KEY IDENTITY,
    Email        NVARCHAR(255) UNIQUE NOT NULL,
    PasswordHash NVARCHAR(512) NOT NULL,
    Salt         NVARCHAR(256) NOT NULL,
    Role         NVARCHAR(20)  NOT NULL,  -- 'Admin' | 'Purchaser'
    FullName     NVARCHAR(100),
    Phone        NVARCHAR(30),
    Entity       NVARCHAR(100)
);

CREATE TABLE Projects (
    ProjectId     INT PRIMARY KEY IDENTITY,
    Name          NVARCHAR(200) NOT NULL,
    Location      NVARCHAR(100),
    DealType      NVARCHAR(50),   -- 'PPA' | 'Prepay'
    BusinessType  NVARCHAR(50),   -- 'COMMERCIAL' | 'NON-PROFIT'
    ITCValue      DECIMAL(18,2),
    PurchaseCost  DECIMAL(18,2),
    ImageUrl      NVARCHAR(300),
    IsAvailable   BIT DEFAULT 1
);

CREATE TABLE UserProjects (
    Id              INT PRIMARY KEY IDENTITY,
    UserId          INT REFERENCES Users(UserId),
    ProjectId       INT REFERENCES Projects(ProjectId),
    Status          NVARCHAR(50),  -- 'Interested' | 'Reserved' | 'Paid'
    ReservedAt      DATETIME,
    CallScheduledFor DATETIME
);

CREATE TABLE Payments (
    Id           INT PRIMARY KEY IDENTITY,
    UserProjectId INT REFERENCES UserProjects(Id),
    AmountDue    DECIMAL(18,2),
    AmountPaid   DECIMAL(18,2),
    DueDate      DATETIME,
    PaidDate     DATETIME
);

CREATE TABLE Documents (
    Id            INT PRIMARY KEY IDENTITY,
    UserProjectId INT REFERENCES UserProjects(Id),
    FileName      NVARCHAR(300),
    UploadedAt    DATETIME,
    ReviewStatus  NVARCHAR(30)  -- 'Pending' | 'Approved' | 'Rejected'
);

CREATE TABLE Notifications (
    Id      INT PRIMARY KEY IDENTITY,
    UserId  INT REFERENCES Users(UserId),
    Type    NVARCHAR(50),  -- 'PaymentPending' | 'DocumentPending' | 'CallScheduled'
    IsActive BIT DEFAULT 1
);
```

### 4.2 Autenticación con hash
Reemplazar el `switch` de `Login.aspx.cs` con:
```csharp
var hash = Rfc2898DeriveBytes.Pbkdf2(password, salt, 100_000, HashAlgorithmName.SHA256, 32);
```
Usar `System.Security.Cryptography` (incluido en .NET 4.8, sin NuGet extra).

### 4.3 Centralizar datos de proyectos
Crear `Models/Project.cs` y `Data/ProjectRepository.cs` para reemplazar los 3 `Button_Click` hardcodeados en `PurchaserPortal.aspx.cs`. Usar un `<asp:Repeater>` en el `.aspx`.

---

## Sprint 5 — Completar Funcionalidades

### 5.1 AdminView — guardar y cargar compradores
- Conectar `DropDownList` de compradores a la DB en `Page_Load`
- Agregar botón **Cargar** (`btnLoad_Click`) para poblar el formulario
- Agregar botón **Guardar** (`btnSave_Click`) para persistir cambios
- Las checkboxes de banners (`Payment Pending`, `Documents Pending`) deben mapearse a la tabla `Notifications`

### 5.2 Alertas dinámicas en páginas de comprador
Los divs de alerta en `PurchaserPortal.aspx` y `PurchaseForm.aspx` son HTML estático — siempre visibles, para todos los usuarios. Reemplazar por `<asp:Panel Visible="false">` cuya visibilidad se controla desde el code-behind según la DB.

### 5.3 Crear Projects.aspx
El archivo `.aspx` no existe — solo su code-behind y designer. Crear la página conectada a `ProjectRepository`.

### 5.4 Conectar botón Submit de PurchaseForm
El botón `id="submit"` no tiene `OnClick`. Implementar `btnSubmit_Click` que inserte en `UserProjects` y `Payments`.

### 5.5 Dashboard con datos reales
- Reemplazar KPIs hardcodeados (`400,000$`, `50,000$`, etc.) por `<asp:Label>` con valores de la DB
- Eliminar las gráficas de plantilla (CPU, RAM, uso de navegadores) — no tienen relación con un portal financiero
- Reemplazar con gráficas de inversión reales usando Highcharts + datos del usuario

---

## Sprint 6 — Estructura y Limpieza

### 6.1 Adoptar Site.Master en todas las páginas
Completar `Site.Master` con:
- Head compartido (Bootstrap, CSS)
- Navbar condicional por rol (`Admin` vs `Purchaser`)
- `ContentPlaceHolder` para contenido
- Footer con copyright OPB Capital

Migrar las 5 páginas para usar `MasterPageFile="~/Site.Master"`. Elimina el navbar duplicado 4 veces y la inconsistencia de CSS.

### 6.2 Corregir bugs menores y typos

| Archivo | Línea | Problema | Corrección |
|---|---|---|---|
| `AdminView.aspx` | 16 | `</span>x` (x visible en mobile) | `</span>` |
| `AdminView.aspx` | 86 | `plac3eholder` (atributo inválido) | `placeholder` |
| `PurchaserPortal.aspx` | 148 | `aviable` | `available` |
| `PurchaseForm.aspx` | 79 | `Bussiness Type` | `Business Type` |
| `Login.aspx.cs` | 61–72 | Mensajes mezclados en español/inglés | Unificar idioma |
| `PuchaserProjects.aspx` | 120 | `infot@` | `info@` |

### 6.3 Eliminar archivo obsoleto
Eliminar `PuchaserProjects.aspx` y sus archivos asociados. Su funcionalidad la reemplaza `Projects.aspx`.

### 6.4 Estandarizar namespace
Cambiar `namespace PurchaserPortal1` → `namespace InvestorPortal` en todos los `.cs`.

---

## Sprint 7 — Empaquetado para Distribución

### 7.1 Prerequisitos antes de empaquetar

- [ ] `Web.config` de producción con `<compilation debug="false" />` y `customErrors mode="On"`
- [ ] Cadena de conexión a SQL Server de producción en `Web.config`
- [ ] Todos los secretos (passwords, connection strings) fuera del código fuente
- [ ] Archivos de log configurados (`Elmah` o `System.Diagnostics`)

### 7.2 Publicación con Visual Studio (método recomendado)

1. Click derecho en proyecto → **Publish**
2. Seleccionar perfil: **Web Deploy Package** o **Folder**
3. Configuración: `Release`
4. Destino: carpeta local `publish/`

Genera en `publish/`:
```
publish/
├── bin/                  ← DLLs compilados
├── Content/              ← CSS, imágenes
├── Scripts/              ← JS
├── *.aspx                ← Páginas web
├── Web.config            ← Configuración IIS
└── InvestorPortal.SetParameters.xml
```

### 7.3 Publicación por CLI (MSBuild)

```bash
msbuild InvestorPortal.csproj \
  /p:Configuration=Release \
  /p:DeployOnBuild=true \
  /p:WebPublishMethod=Package \
  /p:PackageAsSingleFile=true \
  /p:PackageLocation="./dist/InvestorPortal.zip"
```

Genera un único archivo `InvestorPortal.zip` desplegable con Web Deploy.

### 7.4 Despliegue en IIS (servidor destino)

**Requisitos del servidor:**
- Windows Server 2016+ con IIS 10
- .NET Framework 4.8 instalado
- Web Deploy 3.6 (para despliegue con .zip)
- SQL Server 2017+ (o SQL Server Express para ambientes pequeños)

**Pasos:**
1. Crear un nuevo sitio en IIS Manager
2. Apuntar la ruta física a la carpeta publicada
3. Asignar Application Pool con `.NET CLR v4.0`
4. Ejecutar el script de base de datos (`schema.sql`) en el servidor SQL
5. Actualizar `Web.config` con la connection string de producción
6. Configurar SSL/TLS (obligatorio para portal de inversiones)

### 7.5 Configuración Web.config para producción

```xml
<configuration>
  <system.web>
    <compilation debug="false" targetFramework="4.8" />
    <customErrors mode="On" defaultRedirect="Error.aspx" />
    <sessionState timeout="30" />
    <httpCookies httpOnlyCookies="true" requireSSL="true" />
  </system.web>
  <connectionStrings>
    <add name="InvestorPortalDB"
         connectionString="Server=PROD_SERVER;Database=InvestorPortal;..."
         providerName="System.Data.SqlClient" />
  </connectionStrings>
</configuration>
```

### 7.6 Checklist pre-distribución

- [x] Rebranding completo a OPB Capital aplicado (Sprint 1)
- [x] Colores OPB Brand implementados en CSS (Sprint 2 — opb-brand.css)
- [x] Credenciales hardcodeadas movidas a Web.config appSettings (Sprint 3); reemplazar con DB en producción
- [x] Esquema de base de datos creado en App_Data/schema.sql (Sprint 4)
- [x] Todas las páginas con autenticación/autorización — BasePage / AdminBasePage (Sprint 3)
- [x] AdminView funcional — cargar / guardar comprador, checkboxes de notificación (Sprint 5)
- [x] Alertas dinámicas conectadas a DB via NotificationRepository (Sprint 5)
- [x] PurchaseForm submit conectado a UserProjectRepository.Reserve() (Sprint 5)
- [x] Página de Logout implementada (Sprint 3)
- [x] Site.Master adoptado en todas las páginas (Sprint 6)
- [x] Web.Release.config aplica `debug="false"` y `customErrors` al publicar (Sprint 7)
- [x] Error.aspx creado como destino de customErrors (Sprint 7)
- [ ] Connection string de producción configurada en Web.Release.config (`PROD_SERVER`)
- [ ] SSL configurado en IIS (paso de infraestructura — fuera del código)
- [ ] `schema.sql` ejecutado en servidor SQL de producción
- [ ] Build de Release sin errores ni warnings — ejecutar `msbuild /p:Configuration=Release`
- [ ] Prueba smoke en ambiente de staging

---

## Secuencia recomendada de implementación

```
Sprint 1  →  Rebranding nombre (1 día)
Sprint 2  →  Colores OPB — requiere brand guide del cliente
Sprint 3  →  Seguridad crítica (2 días)
Sprint 4  →  Base de datos + auth real (3–4 días)
Sprint 5  →  Funcionalidades faltantes (3 días)
Sprint 6  →  Limpieza estructural (1–2 días)
Sprint 7  →  Empaquetado y despliegue (1 día)
```

---

## Archivos clave del proyecto

| Archivo | Rol | Prioridad de cambio |
|---|---|---|
| `Login.aspx.cs` | Autenticación — credenciales hardcodeadas | CRÍTICA |
| `AdminView.aspx` / `.cs` | Panel admin — sin auth, sin funcionalidad | ALTA |
| `PurchaseForm.aspx.cs` | Bug de itcValue, submit sin handler | ALTA |
| `PurchaserPortal.aspx.cs` | 3 proyectos hardcodeados como session strings | MEDIA |
| `PurchaserDashboard.aspx` | KPIs y gráficas de plantilla falsas | MEDIA |
| `style.css` | Variables de color Bootstrap a reemplazar por OPB | MEDIA |
| `Site.Master.cs` | Master page sin implementar | MEDIA |
| `PuchaserProjects.aspx` | Archivo obsoleto a eliminar | BAJA |
