using Models.PMSystemWPF;
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

namespace PMSystemWPF.Login
{
    /// <summary>
    /// Interaction logic for Register.xaml
    /// </summary>
    public partial class RegisterWindow : Window
    {
        public User UserRegistered { get; set; }
        public RegisterWindow()
        {
            InitializeComponent();
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

            using (MySqlDbContext db = new MySqlDbContext())
            {
                UserRegistered = new User();
                UserRegistered.name = name;
                UserRegistered.password = PasswordProcessor.EncryptPassword(password);
                UserRegistered.email = mail;
                UserRegistered.created_at = DateTime.Now;
                UserRegistered.updated_at = DateTime.Now;

                UserRegistered.status = "active";
                db.Roles.Load();
                Role clientRole = db.Roles.FirstOrDefault(r => r.name.Equals("Client"));
                if(!(clientRole is null))
                    UserRegistered.roles.Add(clientRole);
               
                //adding row to db context
                db.Users.Add(UserRegistered);
                db.SaveChanges();
                this.Close();
            }
               
        }

        private void btn_cancel_Click(object sender, RoutedEventArgs e)
        {
            UserRegistered = null;
            this.Close();
        }
    }
}
