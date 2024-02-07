using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MedInfoSystemApp.Models
{
    public partial class MicEntities : DbContext
    {
        private static MicEntities _context;
        /// <summary>
        /// Метод возвращающий контекст подключения
        /// </summary>
        /// <returns></returns>
        public static MicEntities GetContext()
        {
            if (_context == null)
            {
                _context = new MicEntities();
            }
            return _context;
        }

    }
}
