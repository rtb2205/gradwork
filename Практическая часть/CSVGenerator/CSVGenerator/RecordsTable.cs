using Spire.Xls;
using System.Drawing;
using System.Reflection;

namespace DataGenerator
{
    public class RecordsTable
    {

        private List<RecordModel> records = new List<RecordModel>();

        //Добавление записи в таблицу
        public void Add(RecordModel record)
        {
            records.Add(record);
        }

        //Вывод таблицы в консоль (для отладки)
        public void Show()
        {
            PropertyInfo[] properties = typeof(RecordModel).GetProperties();
            string header = string.Join("\t\t", properties.Select(p => $"{p.Name,-15}"));
            Console.WriteLine(header);
            int separatorLength = header.Length + (properties.Length - 1) * 8;
            Console.WriteLine(new string('#', separatorLength));
            foreach (var record in records)
            {
                string row = string.Join("\t\t", properties.Select(p => $"{p.GetValue(record),-15}"));
                Console.WriteLine(row);
                Console.WriteLine(new string('-', separatorLength));
            }
        }

        //Экспорт таблицы в Excel
        public void ExportToExcel(string fileName)
        {
            Workbook workbook = new Workbook();
            Worksheet sheet = workbook.Worksheets[0];
            var properties = typeof(RecordModel).GetProperties().Select(el => el.Name).ToList();
            properties.Insert(0, "№");

            //Форматирование Excel файла (установка заголовков и тд.)
            for (int i = 0; i < properties.Count; i++)
            {
               
                sheet.Range[1, i + 1].Text = properties[i];
                sheet.Range[1, i + 1].Style.Font.IsBold = true;
                sheet.Range[1, i + 1].Style.Font.Color = Color.White;
                sheet.Range[1, i + 1].Style.FillPattern = ExcelPatternType.Solid;
                sheet.Range[1, i + 1].Style.PatternKnownColor = ExcelColors.Green;
            }

            //Группировка 
            var groupedRecords = records
                .GroupBy(r => new { r.Year, r.Region, r.FuelType })
                .Select(group => new RecordModel(group.Key.Year, group.Key.Region, group.Key.FuelType)
                {
                    Price = group.Sum(r => r.Price),
                    Count = group.Sum(r => r.Count)
                })
                .ToList();

            records.Clear();
            records.AddRange(groupedRecords);

            //Заполнение Excel сгенерированными данными
            for (int i = 0; i < records.Count; i++)
            {
                RecordModel record = records[i];
                sheet.Range[i + 2, 1].Text = (i + 1).ToString();
                for (int j = 1; j < properties.Count; j++)
                {
                    sheet.Range[i + 2, j + 1].Text = record.GetType().GetProperty(properties[j])?.GetValue(record)?.ToString();
                }
            }
            var filePath = Path.Combine("E:\\Магистратура\\Диссертация\\Практическая часть\\Входные данные", fileName);
            workbook.SaveToFile(filePath, ExcelVersion.Version2013);
        }
    }
}
