using System.Data.Entity;

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
