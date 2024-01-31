using MedInfoSystemApp.Models;
using QRCoder;
using QRCoder.Xaml;
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

namespace MedInfoSystemApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddPatient.xaml
    /// </summary>
    public partial class AddPatient : Page
    {
        public AddPatient(Patient patient)
        {
            InitializeComponent();
            DataContext = patient;
            GenerateQrcode();
        }

        void GenerateQrcode()
        {
            using (QRCodeGenerator qrGenerator = new QRCodeGenerator())
            using (QRCodeData qrCodeData = qrGenerator.CreateQrCode("The text which should be encoded.", QRCodeGenerator.ECCLevel.Q))
            {
                using (XamlQRCode qrCode = new XamlQRCode(qrCodeData))
                {
                    DrawingImage qrCodeAsXaml = qrCode.GetGraphic(20);
                   
                    ImageQRCode.Source = qrCodeAsXaml;
                }
            }

        }
    }
}
