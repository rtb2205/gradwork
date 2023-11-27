namespace DataGenerator
{
    //Генератор записей в таблице
    static class Generator
    {
        private static List<string> Regions;
        private static List<int> Years;
        private static List<string> FuelType;
        private static Random random = new Random();

        static Generator()
        {
            //инициализация списков возможных значений
            Regions = new List<string> { "Baku", "Ganja", "Sumgait", "Mingachevir", "Nakhchivan", "Shaki", "Lankaran", "Yevlakh", "Gabala", "Goychay" };
            FuelType = new List<string> { "Diesel", "Gasoline", "Electric", "Hybrid" };
            Years = new List<int> { 2018, 2019, 2020, 2021, 2022, 2023 };
        }

        public static (int Year, string Region, string FuelType) GetRandomRecord()
        {
            //генерация случайной тройки (год, регион, тип топлива)
            int randomYear = Years[random.Next(Years.Count)];
            string randomRegion = Regions[random.Next(Regions.Count)];
            string randomFuelType = FuelType[random.Next(FuelType.Count)];

            return (randomYear, randomRegion, randomFuelType);
        }
    }
}
