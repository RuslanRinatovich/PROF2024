using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MICApp.Models
{

    public partial class TimeSheet
    {

        public string GetPhoto
        {
            get
            {
                if (Employee.Photo is null)
                    return null;
                return System.IO.Directory.GetCurrentDirectory() + @"\Images\Employee\" + Employee.Photo.Trim();
            }
        }

        public string GetIdFIO
        {
            get
            {

                return $"#{Employee.Id}: {Employee.Surname} {Employee.Name} {Employee.Patronymic}\n" +
                    $"{Employee.Specialization.Title}";
            }
        }

        public string GetTime
        {
            get
            {

                return $"{TimeBegin} - {TimeEnd}";
            }
        }
        public string GetRoom
        {
            get
            {

                return $"{Room.Title} #{Room.Code}";
            }
        }

        public string GetCoupons
        {
            get
            {

                string result = "Расписание приёма";
                foreach (PatientReception patientReception in PatientReceptions)
                {
                    string x = "[ ]";
                    if (patientReception.Status)
                        x = "[+]";
                    result = result + $"\n{patientReception.GetCoupon}:{x}";
                }
                return result;
            }
        }



    }
}
