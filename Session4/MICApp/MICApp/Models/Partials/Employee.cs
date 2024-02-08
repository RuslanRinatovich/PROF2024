using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MICApp.Models
{
    public partial class Employee
    {
        public string GetPhoto
        {
            get
            {
                //если поле фото пустое, отобразим картинку заглушку
                if (Photo is null)
                    return Directory.GetCurrentDirectory() + @"\Images\picture.png";
                return Directory.GetCurrentDirectory() + @"\Images\Patients\" + Photo.Trim();
            }
        }

        public string GetIdFIO
        {
            get
            {

                return $"#{Id}: {Surname} {Name} {Patronymic}\n" +
                    $"{Specialization.Title}";
            }
        }
        public string GetFIO
        {
            get
            {

                return $"{Surname} {Name} {Patronymic}";
            }
        }
    }
}
