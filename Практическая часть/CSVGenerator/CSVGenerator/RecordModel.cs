namespace DataGenerator
{
    public class RecordModel
    {
        private static Random random = new Random();
        public RecordModel(int year, string region, string fuelType)
        {
         
            Year = year;
            Region = region;
            FuelType = fuelType;
            Count = random.Next(100, 3000);
            Price = random.Next(2000, 20001) * Count;
        }

        public int Year { get; set; }
        public string Region { get; set; }
        public string FuelType { get; set; }
        public int Price { get; set; }
        public int Count { get; set; }

    }
}
