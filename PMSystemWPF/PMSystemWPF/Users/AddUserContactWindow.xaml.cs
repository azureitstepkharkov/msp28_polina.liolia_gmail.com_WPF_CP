using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Diagnostics;
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
using Models.PMSystemWPF;

namespace PMSystemWPF.Users
{
    /// <summary>
    /// Interaction logic for AddUserContactWindow.xaml
    /// </summary>
    public partial class AddUserContactWindow : Window
    {
        private MySqlDbContext db;
        public Contact Contact { get; internal set; }

        private AddUserContactWindow()
        {
            InitializeComponent();
        }

        public AddUserContactWindow(MySqlDbContext db)
        {
            InitializeComponent();
            this.db = db;
            db.Contact_types.Load();
            cbContactTypes.ItemsSource = db.Contact_types.Local;
            cbContactTypes.DisplayMemberPath = "contact_type";
            cbContactTypes.SelectedValuePath = "id";
            Contact = new Contact();
        }

       

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            string contactValue = txtContact.Text;
            if (contactValue.Equals(string.Empty))
            {
                MessageBox.Show("Contact value can not be empty!", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            int typeId = -1;
            try
            {
                typeId = Convert.ToInt32(cbContactTypes.SelectedValue);
            }
            catch(Exception ex)
            {
                Debug.WriteLine(ex.Message);
                MessageBox.Show("Can not identify contact type value.", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            if (!db.Contact_types.Any())
                db.Contact_types.Load();
            Contact.type_id = typeId;
            Contact.contact_type = db.Contact_types.Find(typeId);
            Contact.value = contactValue;

            this.Close();
        }
    }
}
