using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MICApp.Models
{
    public partial class MicEntities : DbContext
    {
        private static MicEntities _context;
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
