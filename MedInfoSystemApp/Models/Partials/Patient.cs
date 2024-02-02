using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MedInfoSystemApp.Models
{
    public partial class Patient

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


        public string GetQrCode
        {
            get
            {
                if (Medcard is null)
                    return null;
                //если поле фото пустое, отобразим картинку заглушку
                if (Medcard.QR is null)
                    return Directory.GetCurrentDirectory() + @"\Images\picture.png";
                return Directory.GetCurrentDirectory() + @"\Images\MedicalCards\" + Medcard.QR.Trim();
            }
        }

        public string GetIdFIO
        {
            get
            {

                return $"#{Id}: {Surname} {Name} {Patronymic}";
            }
        }
        public string GetFIO
        {
            get
            {

                return $"{Surname} {Name} {Patronymic}";
            }
        }
        public string GetPassport
        {
            get
            {

                return $"Паспорт: {PassportSeries} {PassportNumber}";
            }
        }

    }
}
