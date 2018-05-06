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
using System.Windows.Shapes;
using Models.PMSystemWPF;

namespace PMSystemWPF.Users
{
    /// <summary>
    /// Interaction logic for EditUserWindow.xaml
    /// </summary>
    public partial class EditUserWindow : Window
    {
        private User user;
        private MySqlDbContext db;

        private EditUserWindow()
        {
            InitializeComponent();
        }

        public EditUserWindow(User user, MySqlDbContext db)
        {
            InitializeComponent();
            this.user = user;
            this.db = db;
            SetUpUi();
        }

        private void SetUpUi()
        {
            this.DataContext = this.user;
            dgContacts.ItemsSource = this.user.contacts;
            cbStatus.SelectedIndex = user.status.Equals("active") ? 0 : 1;
            lbRoles.ItemsSource = db.Roles.Local;
            lbTechnologies.ItemsSource = db.Technologies.Local;
            foreach (Role role in user.roles)
                lbRoles.SelectedItems.Add(role);
            foreach (Technology tech in user.technologies)
                lbTechnologies.SelectedItems.Add(tech);
        }

        private void btn_edit_Click(object sender, RoutedEventArgs e)
        {
            string name = txtName.Text;
            if (name.Equals(string.Empty))
            {
                MessageBox.Show("Name can not be empty!", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            string mail = txtMail.Text;
            if (mail.Equals(string.Empty))
            {
                MessageBox.Show("Email can not be empty!", "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            user.name = name;
            user.email = mail;
            user.updated_at = DateTime.Now;

            string status = cbStatus.SelectionBoxItem as string;
            user.status = status;

            var roles = lbRoles.SelectedItems;
           // var roleEntries = db.ChangeTracker.Entries<Role>();
            user.roles.Clear();
            foreach (Role role in roles)
            {
                user.roles.Add(role);
            }

            var technologies = lbTechnologies.SelectedItems;
            user.technologies.Clear();
            foreach (Technology tech in technologies)
            {
                tech.users.Add(user);
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
