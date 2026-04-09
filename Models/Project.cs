namespace InvestorPortal.Models
{
    public class Project
    {
        public int     ProjectId    { get; set; }
        public string  Name         { get; set; }
        public string  Location     { get; set; }
        public string  DealType     { get; set; }
        public string  BusinessType { get; set; }
        public decimal ITCValue     { get; set; }
        public decimal PurchaseCost { get; set; }
        public string  ImageUrl     { get; set; }
        public bool    IsAvailable  { get; set; }
    }
}
