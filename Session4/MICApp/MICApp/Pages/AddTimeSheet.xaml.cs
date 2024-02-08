using MICApp.Models;
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

namespace MICApp.Windows
{
    /// <summary>
    /// Логика взаимодействия для AddTimeSheet.xaml
    /// </summary>
    public partial class AddTimeSheet : Page
    {
        int _itemcount = 0;
        private TimeSheet _currentTimeSheet= new TimeSheet();
        public AddTimeSheet(TimeSheet timeSheet)
        {
            InitializeComponent();
            _currentTimeSheet = timeSheet;
            DataContext = timeSheet;
        }

        private StringBuilder CheckFields()
        {
            StringBuilder s = new StringBuilder();
            if (ComboBoxTimeBegin.SelectedIndex == -1)
                s.AppendLine("Укажите время начала приёма");

            if (ComboBoxTimeEnd.SelectedIndex == -1)
                s.AppendLine("Укажите время окончания приёма");

            if (ComboBoxRoom.SelectedIndex == -1)
                s.AppendLine("Укажите кабинет");

            if ((DatePickerDate.SelectedDate is null) || (DatePickerDate.SelectedDate == DateTime.MinValue))
                s.AppendLine("Не выбрана дата приёма");     

            if (ListBoxEmployee.SelectedItems.Count == 0)
                s.AppendLine("Не выбран врач");

            if (ComboBoxTimeBegin.SelectedIndex >= ComboBoxTimeEnd.SelectedIndex)
                s.AppendLine("Время окончания приёма не может совпадать с временем начала ");
            return s;
        }

        void LoadDataGrid()
        {
            MicEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            List<Employee> employees = MicEntities.GetContext().Employees.OrderBy(p => p.Id).ToList();
            ListBoxEmployee.ItemsSource = employees;
            _itemcount = employees.Count;

            ComboBoxRoom.ItemsSource = MicEntities.GetContext().Rooms.Where(r => r.RoomTypeId == 2).OrderBy(p => p.Title).ToList();
            TextBlockInfo.Text = $" Результат запроса: {employees.Count} записей из {employees.Count}";
        }

        void LoadComboBoxItems()
        {
            var specialisation = MicEntities.GetContext().Specializations.OrderBy(p => p.Title).ToList();
            specialisation.Insert(0, new Specialization
            {
                Title = "Все виды"
            }
            );
            ComboSpecialization.ItemsSource = specialisation;
            ComboSpecialization.SelectedIndex = 0;

        }

        /// <summary>
        /// Метод для фильтрации и сортировки данных
        /// </summary>
        private void UpdateData()
        {
            // получаем текущие данные из бд
            var currentData = MicEntities.GetContext().Employees.OrderBy(p => p.Id).ToList();

            if (ComboSpecialization.SelectedIndex > 0)
                currentData = currentData.Where(p => p.SpecializationId == (ComboSpecialization.SelectedItem as Specialization).Id).ToList();

            // выбор тех товаров, в названии которых есть поисковая строка
            currentData = currentData.Where(p => p.Name.ToLower().Contains(TBoxName.Text.ToLower())).ToList();
            currentData = currentData.Where(p => p.Surname.ToLower().Contains(TBoxSurname.Text.ToLower())).ToList();
            currentData = currentData.Where(p => p.Id.ToString().ToLower().Contains(TBoxID.Text.ToLower())).ToList();

            // В качестве источника данных присваиваем список данных
            ListBoxEmployee.ItemsSource = currentData;
            // отображение количества записей
            TextBlockInfo.Text = $" Результат запроса: {currentData.Count} записей из {_itemcount}";
        }

        private void DatePickerDate_SelectedDateChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }

        private void ComboSpecialization_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            UpdateData();
        }

        private void TBoxID_TextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateData();
        }

        private void TBoxSurname_TextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateData();
        }

        private void TBoxName_TextChanged(object sender, TextChangedEventArgs e)
        {
            UpdateData();
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            //событие отображения данного Page
            // обновляем данные каждый раз когда активируется этот Page
            if (Visibility == Visibility.Visible)
            {
                ListBoxEmployee.ItemsSource = null;
                //загрузка обновленных данных

                LoadComboBoxItems();
                LoadDataGrid();

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
                if (_currentTimeSheet.Id == 0)
                {
                    Employee em =  ListBoxEmployee.SelectedItems[0] as Employee;
                    _currentTimeSheet.EmployeeId = em.Id;
                    _currentTimeSheet.DurationPersonTime = 30;
                    _currentTimeSheet.RoomId = (ComboBoxRoom.SelectedItem as Room).Id;
                    _currentTimeSheet.TimeBegin = TimeSpan.Parse(ComboBoxTimeBegin.Text);
                    _currentTimeSheet.TimeEnd = TimeSpan.Parse(ComboBoxTimeEnd.Text);

                    MicEntities.GetContext().TimeSheets.Add(_currentTimeSheet);
                    MicEntities.GetContext().SaveChanges();

                    List<PatientReception> patientReceptions = new List<PatientReception>();
                    TimeSpan timeBegin = _currentTimeSheet.TimeBegin;
                    TimeSpan timeEnd = _currentTimeSheet.TimeEnd;
                    TimeSpan duration = new TimeSpan(0, 30, 0);
                    TimeSpan timeSpan = timeBegin.Add(duration);
                    int couponNumber = 1;
                    while (timeSpan <= timeEnd)
                    {
                        PatientReception patientReception = new PatientReception();
                        patientReception.Status = false;
                        patientReception.TimeSheetId = _currentTimeSheet.Id;
                        patientReception.TimeBegin = timeBegin;
                        patientReception.TimeEnd = timeSpan;
                        patientReception.CouponNumber = couponNumber;
                        couponNumber++;
                        timeSpan = timeSpan.Add(duration);
                        timeBegin = timeBegin.Add(duration);
                        patientReceptions.Add(patientReception);
                    }


              

                    MicEntities.GetContext().PatientReceptions.AddRange(patientReceptions);
                    MicEntities.GetContext().SaveChanges();
                    MessageBox.Show("Запись добавлена");
                    Manager.MainFrame.GoBack();
                }// Возвращаемся на предыдущую форму
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void BtnCancel_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.GoBack();
        }
    }
}
