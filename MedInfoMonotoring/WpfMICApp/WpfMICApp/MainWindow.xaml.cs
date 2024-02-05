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
using WpfMICApp.Pages;

namespace WpfMICApp
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            LoadData();
        }

        void LoadData()
        {
            MainFrame.Navigate(new LookPatientsPage());
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
            MainFrame.GoBack();
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

      

        private void BtnAddPatient_Click(object sender, RoutedEventArgs e)
        {
           
        }

        private void BtnLook_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
