using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WpfMICApp.Models
{
    public partial class PROF2024Entities : DbContext
    {
        private static PROF2024Entities _context;
        /// <summary>
        /// Метод возвращающий контекст подключения
        /// </summary>
        /// <returns></returns>
        public static PROF2024Entities GetContext()
        {
            if (_context == null)
            {
                _context = new PROF2024Entities();
            }
            return _context;
        }

    }
}
