﻿#pragma checksum "..\..\..\Windows\PatientReceptionWindow.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "43B7A6B012EA6E6CADBB2E99A7C60F918842C587EBD5D0136C71726E693BBE80"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using MICApp.Windows;
using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;


namespace MICApp.Windows {
    
    
    /// <summary>
    /// PatientReceptionWindow
    /// </summary>
    public partial class PatientReceptionWindow : System.Windows.Window, System.Windows.Markup.IComponentConnector {
        
        
        #line 29 "..\..\..\Windows\PatientReceptionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox TBoxID;
        
        #line default
        #line hidden
        
        
        #line 35 "..\..\..\Windows\PatientReceptionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox TBoxSurname;
        
        #line default
        #line hidden
        
        
        #line 41 "..\..\..\Windows\PatientReceptionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox TBoxName;
        
        #line default
        #line hidden
        
        
        #line 47 "..\..\..\Windows\PatientReceptionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox TBoxPassportSeries;
        
        #line default
        #line hidden
        
        
        #line 53 "..\..\..\Windows\PatientReceptionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox TBoxPassportNumber;
        
        #line default
        #line hidden
        
        
        #line 61 "..\..\..\Windows\PatientReceptionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.DatePicker DatePickerBirthdayDate;
        
        #line default
        #line hidden
        
        
        #line 64 "..\..\..\Windows\PatientReceptionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnGetByQr;
        
        #line default
        #line hidden
        
        
        #line 67 "..\..\..\Windows\PatientReceptionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBlock TextBlockInfo;
        
        #line default
        #line hidden
        
        
        #line 70 "..\..\..\Windows\PatientReceptionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ListBox ListBoxPatients;
        
        #line default
        #line hidden
        
        
        #line 119 "..\..\..\Windows\PatientReceptionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox ComboCoupon;
        
        #line default
        #line hidden
        
        
        #line 123 "..\..\..\Windows\PatientReceptionWindow.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.Button BtnOk;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/MICApp;component/windows/patientreceptionwindow.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\..\Windows\PatientReceptionWindow.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.TBoxID = ((System.Windows.Controls.TextBox)(target));
            
            #line 30 "..\..\..\Windows\PatientReceptionWindow.xaml"
            this.TBoxID.TextChanged += new System.Windows.Controls.TextChangedEventHandler(this.TBoxSearchTextChanged);
            
            #line default
            #line hidden
            return;
            case 2:
            this.TBoxSurname = ((System.Windows.Controls.TextBox)(target));
            
            #line 36 "..\..\..\Windows\PatientReceptionWindow.xaml"
            this.TBoxSurname.TextChanged += new System.Windows.Controls.TextChangedEventHandler(this.TBoxSearchTextChanged);
            
            #line default
            #line hidden
            return;
            case 3:
            this.TBoxName = ((System.Windows.Controls.TextBox)(target));
            
            #line 42 "..\..\..\Windows\PatientReceptionWindow.xaml"
            this.TBoxName.TextChanged += new System.Windows.Controls.TextChangedEventHandler(this.TBoxSearchTextChanged);
            
            #line default
            #line hidden
            return;
            case 4:
            this.TBoxPassportSeries = ((System.Windows.Controls.TextBox)(target));
            
            #line 48 "..\..\..\Windows\PatientReceptionWindow.xaml"
            this.TBoxPassportSeries.TextChanged += new System.Windows.Controls.TextChangedEventHandler(this.TBoxSearchTextChanged);
            
            #line default
            #line hidden
            return;
            case 5:
            this.TBoxPassportNumber = ((System.Windows.Controls.TextBox)(target));
            
            #line 54 "..\..\..\Windows\PatientReceptionWindow.xaml"
            this.TBoxPassportNumber.TextChanged += new System.Windows.Controls.TextChangedEventHandler(this.TBoxSearchTextChanged);
            
            #line default
            #line hidden
            return;
            case 6:
            this.DatePickerBirthdayDate = ((System.Windows.Controls.DatePicker)(target));
            
            #line 62 "..\..\..\Windows\PatientReceptionWindow.xaml"
            this.DatePickerBirthdayDate.SelectedDateChanged += new System.EventHandler<System.Windows.Controls.SelectionChangedEventArgs>(this.DatePickerBirthdayDate_SelectedDateChanged);
            
            #line default
            #line hidden
            return;
            case 7:
            this.BtnGetByQr = ((System.Windows.Controls.Button)(target));
            
            #line 64 "..\..\..\Windows\PatientReceptionWindow.xaml"
            this.BtnGetByQr.Click += new System.Windows.RoutedEventHandler(this.BtnGetByQr_Click);
            
            #line default
            #line hidden
            return;
            case 8:
            this.TextBlockInfo = ((System.Windows.Controls.TextBlock)(target));
            return;
            case 9:
            this.ListBoxPatients = ((System.Windows.Controls.ListBox)(target));
            return;
            case 10:
            this.ComboCoupon = ((System.Windows.Controls.ComboBox)(target));
            return;
            case 11:
            this.BtnOk = ((System.Windows.Controls.Button)(target));
            
            #line 123 "..\..\..\Windows\PatientReceptionWindow.xaml"
            this.BtnOk.Click += new System.Windows.RoutedEventHandler(this.BtnOk_Click);
            
            #line default
            #line hidden
            return;
            }
            this._contentLoaded = true;
        }
    }
}

