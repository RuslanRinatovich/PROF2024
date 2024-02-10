using MedInfoSystemApp.Models;
using MedInfoSystemApp.Pages;
using QRCoder;
using QRCoder.Xaml;
using System;
using System.Windows;
using System.Windows.Media;

namespace MedInfoSystemApp
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        User _currentUser; //текущий пользователь в системе
        public MainWindow()
        {
            InitializeComponent();
            LoadData();
        }

        /// <summary>
        /// загружаем данные и инициализируем переменные
        /// </summary>
        void LoadData()
        {
            MainFrame.Navigate(new PatientsPage());
            Manager.MainFrame = MainFrame;
        }
        private void WindowClosed(object sender, EventArgs e)
        {
            // показать владельца формы
            //Owner.Show();
            // или если надо, то можно закрыть приложение  командой
            Application.Current.Shutdown();
        }

        //событие попытки закрытия окна,
        // если пользователь выберет Cancel, то форму не закроем
        private void WindowClosing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            MessageBoxResult x = MessageBox.Show("Вы действительно хотите выйти?", "Выйти",
              MessageBoxButton.OKCancel, MessageBoxImage.Question);
            if (x == MessageBoxResult.Cancel)
                e.Cancel = true;
        }

        private void BtnBackClick(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.GoBack();
        }



        private void MainFrame_ContentRendered(object sender, EventArgs e)
        {
            if (MainFrame.CanGoBack)
            {
                BtnBack.Visibility = Visibility.Visible;
            }
            else
            {
                BtnBack.Visibility = Visibility.Collapsed;
            }
        }

        void GenerateQrcode()
        {
            using (QRCodeGenerator qrGenerator = new QRCodeGenerator())
            using (QRCodeData qrCodeData = qrGenerator.CreateQrCode("The text which should be encoded.", QRCodeGenerator.ECCLevel.Q))
            {
                using (XamlQRCode qrCode = new XamlQRCode(qrCodeData))
                {
                    DrawingImage qrCodeAsXaml = qrCode.GetGraphic(20);
                }
            }
        }

        private void BtnAddPatient_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new AddPatient(new Patient()));
        }
    }
}
