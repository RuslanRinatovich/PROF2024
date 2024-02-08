using MICApp.Models;
using MICApp.Windows;
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

namespace MICApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для TimeSheetPage.xaml
    /// </summary>
    public partial class TimeSheetPage : Page
    {
        int _itemcount = 0;
        public TimeSheetPage()
        {
            InitializeComponent();
        }

        void LoadDataGrid()
        {
            MicEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
            List<TimeSheet> timeSheets = MicEntities.GetContext().TimeSheets.OrderBy(p => p.Date).ToList();
            ListBoxEmployeeTimeSheet.ItemsSource = timeSheets;
            _itemcount = timeSheets.Count;
            TextBlockInfo.Text = $" Результат запроса: {timeSheets.Count} записей из {timeSheets.Count}";
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
            var currentData = MicEntities.GetContext().TimeSheets.OrderBy(p => p.Date).ToList();

            if (ComboSpecialization.SelectedIndex > 0)
                currentData = currentData.Where(p => p.Employee.SpecializationId == (ComboSpecialization.SelectedItem as Specialization).Id).ToList();

            // выбор тех товаров, в названии которых есть поисковая строка
            currentData = currentData.Where(p => p.Employee.Name.ToLower().Contains(TBoxName.Text.ToLower())).ToList();
            currentData = currentData.Where(p => p.Employee.Surname.ToLower().Contains(TBoxSurname.Text.ToLower())).ToList();
            currentData = currentData.Where(p => p.Employee.Id.ToString().ToLower().Contains(TBoxID.Text.ToLower())).ToList();

            if (CheckBoxTimeSheetOnWeek.IsChecked == true)
            {
                DayOfWeek dayOfWeek = DayOfWeek.Monday;

                DayOfWeek currentDayOfWeek = DateTime.Now.DayOfWeek;
                int k = currentDayOfWeek - dayOfWeek;
                MessageBox.Show(k.ToString());
                DateTime startDay = DateTime.Now.AddDays(-(k+1));
                DateTime endDay = startDay.AddDays(7);
                currentData = currentData.Where(p => (p.Date >= startDay) && (p.Date <= endDay)).ToList();

            }
            else
            {
                if (DatePickerDate.SelectedDate != null)
                {
                    currentData = currentData.Where(p => p.Date == DatePickerDate.SelectedDate).ToList();
                }
            }
            // В качестве источника данных присваиваем список данных
            ListBoxEmployeeTimeSheet.ItemsSource = currentData;
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

                ListBoxEmployeeTimeSheet.ItemsSource = null;
                //загрузка обновленных данных
       
                LoadComboBoxItems();
                LoadDataGrid();

            }
        }



        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                PatientReceptionWindow  window = new PatientReceptionWindow((sender as Button).DataContext as TimeSheet);
                if (window.ShowDialog() == true)
                {
                    LoadDataGrid();
                }
            }
            catch
            {
                MessageBox.Show("Ошибка");
            }

        }

        private void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddTimeSheet(new TimeSheet()));
        }

        private void CheckBoxTimeSheetOnWeek_Checked(object sender, RoutedEventArgs e)
        {
            UpdateData();
        }

        private void CheckBoxTimeSheetOnWeek_Unchecked(object sender, RoutedEventArgs e)
        {
            UpdateData();
        }
    }
}
