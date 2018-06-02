using Models.PMSystemWPF;
using PMSystemWPF.Login;
using System;
using System.Collections.Generic;
using System.Data.Entity;
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

namespace PMSystemWPF.Users
{
    /// <summary>
    /// Interaction logic for AddUserWindow.xaml
    /// </summary>
    public partial class AddUserWindow : Window
    {
        private MySqlDbContext db;
        private User user;

        private AddUserWindow()
        {
            InitializeComponent();
            this.WindowStartupLocation = WindowStartupLocation.CenterScreen;
        }

        public AddUserWindow(MySqlDbContext db)
        {
            InitializeComponent();
            this.db = db;
            user = new User();
            SetUpUi();

        }

        private void SetUpUi()
        {
            if (!db.Roles.Any())
                db.Roles.Load();
            if (!db.Technologies.Any())
                db.Technologies.Load();
            lbRoles.ItemsSource = db.Roles.Local;
            lbTechnologies.ItemsSource = db.Technologies.Local;
            dgContacts.ItemsSource = user.contacts;
        }

        private void btn_add_Click(object sender, RoutedEventArgs e)
        {
            string name = txtName.Text;
            if (name.Equals(string.Empty))
            {
                MessageBox.Show("Name can not be empty!", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            string password = pwbPassword.Password;
            string passwordConfirm = pwbPasswordConfirm.Password;
            if (!password.Equals(passwordConfirm))
            {
                MessageBox.Show("Password confirm does not match!", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }
            
            string mail = txtMail.Text;
            if (mail.Equals(string.Empty))
            {
                MessageBox.Show("Email can not be empty!", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            user.name = name;
            user.password = PasswordProcessor.EncryptPassword(password);
            user.email = mail;
            user.created_at = DateTime.Now;
            user.updated_at = DateTime.Now;

            string status = cbStatus.SelectionBoxItem as string;
            user.status = status;

            var roles = lbRoles.SelectedItems;
            var roleEntries = db.ChangeTracker.Entries<Role>();
            foreach (Role role in roles)
            {
                user.roles.Add(role);
            }

            var technologies = lbTechnologies.SelectedItems;
            foreach(Technology tech in technologies)
            {
                tech.users.Add(user);
            }
            try
            {
                //adding row to db context
                db.Users.Add(user);
                db.SaveChanges();
            }
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message, "Error", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            this.Close();
        }

        private void btnAddContact_Click(object sender, RoutedEventArgs e)
        {
            AddUserContactWindow addContactWindow = new AddUserContactWindow(db);
            addContactWindow.ShowDialog();
            Contact contact = addContactWindow.Contact;
            if (!(contact is null))
            {
                user.contacts.Add(contact);
            }
            dgContacts.Items.Refresh();
        }

    }
}
