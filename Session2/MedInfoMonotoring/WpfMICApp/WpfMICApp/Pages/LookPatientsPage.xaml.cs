using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Timers;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Threading;
using Newtonsoft.Json;

namespace WpfMICApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для LookPatientsPage.xaml
    /// </summary>
    public partial class LookPatientsPage : Page
    {

        private DispatcherTimer timer;
        static Random rnd = new Random();
        public class Person
        {
            public int PersonCode { get; set; }
            public string PersonRole { get; set; }
            public string LastSecurityPointDirection { get; set; }
            public int LastSecurityPointNumber { get; set; }
            public DateTime LastSecurityPointTime { get; set; }
        }


       static Dictionary<int, int[]> skud = new Dictionary<int, int[]>()
        {
           {0, new int[]{530,10, 580,110}},
            {1, new int[]{610,10, 670,110}},
             {2, new int[]{695,10, 715,110}},
              {3, new int[]{740,10, 766,110}},
              {4, new int[]{786,10, 836,110}},
              {5, new int[]{856,10, 915,110}},
              {6, new int[]{935,10, 1010,110}},
              {7, new int[]{900,230, 1010,340}},
              {8, new int[]{776,230, 880,340}},
              {9, new int[]{710,230, 750,340}},
              {10, new int[]{650,230, 685,340}},
              {11, new int[]{575,230, 630,340}},
              {12, new int[]{460,230, 560,340}},
              {13, new int[]{410,230, 440,340}},
              {14, new int[]{225,230, 390,340}},
              {15, new int[]{95,230, 215,340}},
              {16, new int[]{10,230, 85,340}},
            {17, new int[]{10,10, 40,120}},
            {18, new int[]{55,10,80,110}},
            {19, new int[]{100,10,170,110}},
            {20, new int[]{190,10,215,110}},
            {21, new int[]{235,10,350,110}},
            {22, new int[]{370, 10, 385,110}}
            //{4, new int[]{1,1 }}
        };

        public LookPatientsPage()
        {
            InitializeComponent();
            timer = new DispatcherTimer();
            timer.Interval = TimeSpan.FromSeconds(3);
            timer.Tick += timer_Tick;
            timer.Start();
        }

        void timer_Tick(object sender, EventArgs e)
        {
            GetDataFromUrlAsync();
        }

        void GetDataFromUrlAsync()
        {
            MyCanvas.Children.Clear();
            var json = new WebClient().DownloadString("http://127.0.0.1:8080/person");
            File.AppendAllText(@"D:\path.json", json);
            var result = JsonConvert.DeserializeObject<List<Person>>(json);
            MessageBox.Show(result.Count.ToString());
            foreach (Person p in result)
            {
                DrawCircles(p);
            }


        }

       void DrawCircles(Person person)
        {
            Ellipse myEllipse = new Ellipse();
            SolidColorBrush mySolidColorBrush = new SolidColorBrush();
            mySolidColorBrush.Color = Colors.Green;
            if (person.PersonRole == "Сотрудник")
                mySolidColorBrush.Color = Colors.Blue;
            myEllipse.Fill = mySolidColorBrush;
            myEllipse.Width = 10;
            myEllipse.Height = 10;
        
            int skud_id = person.LastSecurityPointNumber;
            if (person.LastSecurityPointDirection == "in")
            {
                
                int x = rnd.Next(skud[skud_id][0], skud[skud_id][2]);
                int y = rnd.Next(skud[skud_id][1], skud[skud_id][3]);
                myEllipse.SetValue(Canvas.LeftProperty, (Double)x);
                myEllipse.SetValue(Canvas.TopProperty, (Double)y);
            }
            else
            {

                int x = rnd.Next(10, 990);
                int y = rnd.Next(150,200);
                myEllipse.SetValue(Canvas.LeftProperty, (Double)x);
                myEllipse.SetValue(Canvas.TopProperty, (Double)y);
            }
            MyCanvas.Children.Add(myEllipse);


        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            GetDataFromUrlAsync();
        }
    }
}
