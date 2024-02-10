using MedInfoSystemApp.Models;
using Microsoft.Win32;
using QRCoder;
using QRCoder.Xaml;
using System;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace MedInfoSystemApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddPatient.xaml
    /// </summary>
    public partial class AddPatient : Page
    {

        private Patient _currentPatient = new Patient();
        // путь к файлу
        private string _filePath = null;
        // название текущей главной фотографии
        private string _photoName = null;
        // текущая папка приложения
        private static string _currentDirectory = Directory.GetCurrentDirectory() + @"\Images\";
        public AddPatient(Patient patient)
        {
            InitializeComponent();
            DataContext = patient;
            _currentPatient = patient;
           // GenerateQrcode();
        }


        private StringBuilder CheckFields()
        {
            StringBuilder s = new StringBuilder();
            if (string.IsNullOrWhiteSpace(_currentPatient.Surname))
                s.AppendLine("Поле Фамилия пустое");
            if (string.IsNullOrWhiteSpace(_currentPatient.Name))
                s.AppendLine("Поле Имя пустое");
            if ((DatePickerBirthday.SelectedDate is null) || (DatePickerBirthday.SelectedDate == DateTime.MinValue))
                s.AppendLine("Дата рождения не выбрана");
            if (string.IsNullOrWhiteSpace(TextBoxPassportSeries.Text) || (!int.TryParse(TextBoxPassportSeries.Text, out int series)))
                s.AppendLine("Не корректная серия паспорта");
            if (string.IsNullOrWhiteSpace(TextBoxPassportNumber.Text) || (!int.TryParse(TextBoxPassportNumber.Text, out int number)))
                s.AppendLine("Не корректный номер паспорта");

            if (string.IsNullOrWhiteSpace(_currentPatient.Address))
                s.AppendLine("Поле Адрес пустое");
            if (string.IsNullOrWhiteSpace(_currentPatient.Phone))
                s.AppendLine("Поле Телефон пустое");

            if ((!long.TryParse(TextBoxPolicyNumber.Text, out long policyNumber)) || string.IsNullOrWhiteSpace(TextBoxPolicyNumber.Text))
                s.AppendLine("Не корректный номер полиса");

            if ((DatePickerPolicyExpirationDate.SelectedDate is null ) || (DatePickerPolicyExpirationDate.SelectedDate == DateTime.MinValue))
                s.AppendLine("Не выбрана дата окончания действия страхового полиса пациента");

            if (string.IsNullOrWhiteSpace(TextBoxInsuranceCompany.Text) )
                s.AppendLine("Не указана страховая компания");

            if (string.IsNullOrWhiteSpace(TextBoxWorkPlace.Text))
                s.AppendLine("Не указано место работы");
            if (string.IsNullOrWhiteSpace(_photoName))
                s.AppendLine("фото не выбрано пустое");

            return s;
            
        }


        void GenerateQrcode()
        {
            using (QRCodeGenerator qrGenerator = new QRCodeGenerator())
            using (QRCodeData qrCodeData = qrGenerator.CreateQrCode($"{_currentPatient.Id}", QRCodeGenerator.ECCLevel.Q))
            {
                QRCode BitmapqrCode = new QRCode(qrCodeData);
                Bitmap qrCodeImage = BitmapqrCode.GetGraphic(20);

                qrCodeImage.Save(_currentDirectory + @"\MedicalCards\" + $"QrCard{_currentPatient.Id}.jpg", ImageFormat.Jpeg);

                using (XamlQRCode qrCode = new XamlQRCode(qrCodeData))
                {
                    DrawingImage qrCodeAsXaml = qrCode.GetGraphic(20);
                    ImageQRCode.Source = qrCodeAsXaml;
                }
            }

        }

        private void BtnOk_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder _error = CheckFields();
            // если ошибки есть, то выводим ошибки в MessageBox
            // и прерываем выполнение 
            if (_error.Length > 0)
            {
                MessageBox.Show(_error.ToString());
                return;
            }
            try
            {
                if (_currentPatient.Id == 0)
                {
                    // процесс добавления пациента
                    // 1. Создать медкарту. Поле Qrкода пока пустое
                    Medcard medcard = new Medcard();
                    medcard.IssueDate = DateTime.Today;
                    medcard.LastVisitDate = DateTime.Today;
                    MicEntities.GetContext().Medcards.Add(medcard);
                    MicEntities.GetContext().SaveChanges();
                    // Добавили карту, потом получили id медкарты и прикрепили ее к пациенту
                    int medcardid = medcard.Id;
                    _currentPatient.MedcardId = medcardid;
                    string photo = ChangePhotoName();
                    // путь куда нужно скопировать файл
                    string dest = _currentDirectory + @"\Patients\" + photo;
                    File.Copy(_filePath, dest);
                    _currentPatient.Photo = photo;
                    MicEntities.GetContext().Patients.Add(_currentPatient);
                    MicEntities.GetContext().SaveChanges();  // Сохраняем изменения в БД
                    // Добавили пациента. Нам нужно сгенерировать qrCode на основе id пациента
                    // Надо вначале сохранить пациента в БД. Потом БД даст ему номер
                    // На основе номера пациента при помощи библиотеки QrCoder генерируем QrCode
                    GenerateQrcode();
                    medcard.QR = $"QrCard{_currentPatient.Id}.jpg";
                    // Записываем название файла в медкарту и все
                    MicEntities.GetContext().SaveChanges();
                    MessageBox.Show("Запись Изменена");
                    Manager.MainFrame.GoBack();
                }// Возвращаемся на предыдущую форму
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        //подбор имени файла
        string ChangePhotoName()
        {
            string x = _currentDirectory + _photoName;
            string photoname = _photoName;
            int i = 0;
            if (File.Exists(x))
            {
                while (File.Exists(x))
                {
                    i++;
                    x = _currentDirectory + i.ToString() + photoname;
                }
                photoname = i.ToString() + photoname;
            }
            return photoname;
        }

        // загрузка фото 
        private void BtnLoadClick(object sender, RoutedEventArgs e)
        {
            try
            {
                
                //Диалог открытия файла
                OpenFileDialog op = new OpenFileDialog();
                op.Title = "Select a picture";
                op.Filter = "JPEG Files (*.jpeg)|*.jpeg|PNG Files (*.png)|*.png|JPG Files (*.jpg)|*.jpg|GIF Files (*.gif)|*.gif";
                // диалог вернет true, если файл был открыт
                if (op.ShowDialog() == true)
                {
                    ImagePatientPhoto.Source = new BitmapImage(new Uri(op.FileName));
                    _photoName = op.SafeFileName;
                    _filePath = op.FileName;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                _filePath = null;
            }

          
        }
    }
}
