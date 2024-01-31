using MedInfoSystemApp.Models;
using System.Drawing;
using QRCoder;
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
using MessagingToolkit.QRCode.Codec;
using MessagingToolkit.QRCode.Codec.Data;
using Microsoft.Win32;

namespace MedInfoSystemApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для PatientsPage.xaml
    /// </summary>
    public partial class PatientsPage : Page
    {
        int _itemcount = 0; // количество записей в таблице Events
        public PatientsPage()
        {
            InitializeComponent();
            LoadAndInitData();
        }
        /// <summary>
        /// Загрузка и подготовка данных страницы
        /// </summary>
        void LoadAndInitData()
        {
            // загрузка мероприятий в ListBox сортируем по Дате
            ListBoxPatients.ItemsSource = MicEntities.GetContext().Patients.
      OrderBy(p => p.Id).ToList();
            // запоминаем общще количество мероприятий в БД
            _itemcount = ListBoxPatients.Items.Count;

           
            TextBlockInfo.Text = $" Результат запроса: {_itemcount} записей из {_itemcount}";
        }

        private void PageIsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            //обновление данных после каждой активации окна
            if (Visibility == Visibility.Visible)
            {
                MicEntities.GetContext().ChangeTracker.Entries().ToList().
        ForEach(p => p.Reload());
                ListBoxPatients.ItemsSource = MicEntities.GetContext().Patients.
        OrderBy(p => p.Id).ToList();
            }
        }

        // Поиск мероприятий, которые содержат данную поисковую строку
        private void TBoxSearchTextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateData();
        }
        /// <summary>
        /// Метод для фильтрации и сортировки данных
        /// </summary>
        private void UpdateData()
        {
            // получаем актуальный список мероприятий из БД
            var currentPatients = MicEntities.GetContext().Patients.OrderBy(p => p.Id).ToList();
           
            if (DatePickerBirthdayDate.SelectedDate != null)
                currentPatients = currentPatients.
        Where(p => p.Birthday == DatePickerBirthdayDate.SelectedDate).ToList();
            // выбор тех мероприятий, в названии которых есть поисковая строка
            currentPatients = currentPatients.Where(p => p.Surname.ToLower().Contains(TBoxSurname.Text.ToLower())).ToList();
            currentPatients = currentPatients.Where(p => p.Name.ToLower().Contains(TBoxName.Text.ToLower())).ToList();
            currentPatients = currentPatients.Where(p => p.PassportNumber.ToString().ToLower().Contains(TBoxPassportNumber.Text.ToLower())).ToList();
            currentPatients = currentPatients.Where(p => p.PassportSeries.ToString().ToLower().Contains(TBoxPassportSeries.Text.ToLower())).ToList();
            currentPatients = currentPatients.Where(p => p.Id.ToString().ToLower().Contains(TBoxID.Text.ToLower())).ToList();
            // В качестве источника данных присваиваем список данных
            ListBoxPatients.ItemsSource = currentPatients;
            // отображение количества записей
            TextBlockInfo.Text = $" Результат запроса: {currentPatients.Count} " +
                                                    $"записей из {_itemcount}";
        }

       

        private void DatePickerBirthdayDate_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }

        private void BtnMore_Click(object sender, RoutedEventArgs e)
        {
            Patient patient = (sender as Button).DataContext as Patient;
            Manager.MainFrame.Navigate(new AddPatient(patient));
        }

        private void BtnGetByQr_Click(object sender, RoutedEventArgs e)
        {
            QRCodeDecoder decoder = new QRCodeDecoder();
            OpenFileDialog openFileDialog = new OpenFileDialog();
            if (openFileDialog.ShowDialog() == true)
            {
            //    imgQR.Source = new BitmapImage(new Uri(openFileDialog.FileName));
                MessageBox.Show(decoder.Decode(new QRCodeBitmapImage(new Bitmap(openFileDialog.FileName))));
            }

        }
    }
}
