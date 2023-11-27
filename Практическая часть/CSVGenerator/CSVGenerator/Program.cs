
using DataGenerator;

int numberOfRecords = int.Parse(Console.ReadLine()??"100");
RecordsTable records = new RecordsTable();
for (int i = 0; i < numberOfRecords; i++)
{
    var data = Generator.GetRandomRecord();
    records.Add(new RecordModel(data.Year, data.Region, data.FuelType));
}

records.Show();
records.ExportToExcel("output.xlsx");
