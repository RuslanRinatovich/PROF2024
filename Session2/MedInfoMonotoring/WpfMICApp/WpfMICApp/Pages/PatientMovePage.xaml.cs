using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using WpfMICApp.Models;

namespace WpfMICApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для PatientMovePage.xaml
    /// </summary>
    public partial class PatientMovePage : Page
    {
        static int dh = 10;
        static Dictionary<String, int[]> wards_points = new Dictionary<String, int[]>()
        {
           {"101", new int[]{32,666, 32,722, 32,780, 144,666, 144, 780}},
            {"102", new int[]{32,514,32,572,32,630,144,514,144,630}},
             {"103", new int[]{32,280,32,344,32,412,32,478,144,344,144,412}},
             {"104", new int[]{32,136, 32,36, 144,36, 144,136}},
            {"105", new int[]{206,136, 206,36, 318,36, 318, 136}},
            {"106", new int[]{378,136, 378,36, 490,36, 490, 136}},
            {"107", new int[]{548,136, 548,36, 660,36, 660, 136}},
            {"108", new int[]{770,24, 770,88, 770,150}},
            {"109", new int[]{880,24, 880, 88, 880, 150}},
            {"110", new int[]{990,24, 990, 88, 990, 150}},
            {"111", new int[]{1002,284, 1002, 384, 890,384,890,284}},
            {"112", new int[]{852,284, 852, 384, 750,384,750,284}},
            {"113", new int[]{706,284, 706, 384, 592,384, 592, 284}},
            {"114", new int[]{552,284, 552, 384, 440, 384, 440, 284}},
            {"115", new int[]{386, 276,386,344,386,410,386,478,296,344,296,410}},
            {"116", new int[]{388, 514, 388, 580}},
            {"117", new int[]{ 388, 616, 388, 680}},
            {"118", new int[]{ 388, 716, 388, 780}},

        };
        public PatientMovePage()
        {
            InitializeComponent();
            DrawWards();
        }

        void DrawWards()
        {
            MyCanvas.Children.Clear();
            List<Ward> wards = PROF2024Entities.GetContext().Wards.Where(p => p.DepartmentId == 2).OrderBy(p => p.Title).ToList();
            foreach (Ward ward in wards)
            {
                List<HospitalBed> hospitalBeds = ward.HospitalBeds.OrderBy(p => p.Title).ToList();
               // List<HospitalBed> hospitalBeds = PROF2024Entities.GetContext().HospitalBeds.Where(p => p.WardId == ward.Id).ToList();
                int i = 0;
                foreach (HospitalBed hospitalBed in hospitalBeds)
                {
                    int dx = wards_points[ward.Title][i] - dh;
                    int dy = wards_points[ward.Title][i+1] - dh;
                    i += 2;
                    if (hospitalBed.IsFree == false)
                    {
                        Ellipse myEllipse = new Ellipse();
                        SolidColorBrush mySolidColorBrush = new SolidColorBrush();
                        mySolidColorBrush.Color = Colors.Green;
                        myEllipse.Fill = mySolidColorBrush;
                        myEllipse.Width = 2*dh;
                        myEllipse.Height = 2*dh;
                        myEllipse.SetValue(Canvas.LeftProperty, (Double)dx);
                        myEllipse.SetValue(Canvas.TopProperty, (Double)dy);
                        MyCanvas.Children.Add(myEllipse);
                    }
                }
            }

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            PROF2024Entities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());

            MyCanvas.Children.Clear(); 
            DrawWards();
            MessageBox.Show("+"); 
        }
    }
}


