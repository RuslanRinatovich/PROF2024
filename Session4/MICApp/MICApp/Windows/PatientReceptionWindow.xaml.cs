using MessagingToolkit.QRCode.Codec;
using MessagingToolkit.QRCode.Codec.Data;
using MICApp.Models;
using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Drawing;
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
using System.Windows.Shapes;

namespace MICApp.Windows
{
    /// <summary>
    /// Логика взаимодействия для PatientReceptionWindow.xaml
    /// </summary>
    public partial class PatientReceptionWindow : Window
    {
        int _itemcount = 0; // количество записей в таблице Events
        TimeSheet currentTimeSheet;
        public PatientReceptionWindow(TimeSheet timeSheet)
        {
            InitializeComponent();
            currentTimeSheet = timeSheet;
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


            List<PatientReception> patientReception = MicEntities.GetContext().PatientReceptions.Where(x=> x.Status == false && x.TimeSheetId == currentTimeSheet.Id ).OrderBy(x => x.CouponNumber).ToList();

            ComboCoupon.ItemsSource = patientReception;
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

       
        private void BtnGetByQr_Click(object sender, RoutedEventArgs e)
        {
            // получение информации по QrCode
            // используется библиотека MessagingToolkit.QRCode
            QRCodeDecoder decoder = new QRCodeDecoder();
            OpenFileDialog openFileDialog = new OpenFileDialog();
            if (openFileDialog.ShowDialog() == true)
            {
                //    imgQR.Source = new BitmapImage(new Uri(openFileDialog.FileName));

                int id = Convert.ToInt32(decoder.Decode(new QRCodeBitmapImage(new Bitmap(openFileDialog.FileName))));

                Patient patient = MicEntities.GetContext().Patients.FirstOrDefault(p => p.Id == id);
                if (patient is null)
                    MessageBox.Show("Пациент не найден");
                else
                    MessageBox.Show($"Пациент\n{patient.GetIdFIO}\n{patient.GetPassport}");
            }

        }

        private void BtnOk_Click(object sender, RoutedEventArgs e)
        {
            if (ListBoxPatients.SelectedItems.Count == 0)
            {
                MessageBox.Show("Пациент не выбран");
                return;
            }
            if (ComboCoupon.SelectedIndex == -1)
            {
                MessageBox.Show("Не выбран талон");
                return;
            }
            int patientId = (ListBoxPatients.SelectedItems[0] as Patient).Id;
            PatientReception patientReception = ComboCoupon.SelectedItem as PatientReception;

            patientReception.PatientId = patientId;
            patientReception.Status = true;
            MicEntities.GetContext().SaveChanges();

            MessageBox.Show("Данные сохранены");
            DialogResult = true;

        }
    }
}