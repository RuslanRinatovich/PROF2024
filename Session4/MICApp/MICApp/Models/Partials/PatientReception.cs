using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MICApp.Models
{
    public partial class PatientReception
    {
        public string GetCoupon
        {
            get
            {

                return $"#{CouponNumber}:{TimeBegin}-{TimeEnd}";
            }
        }
    }
}
