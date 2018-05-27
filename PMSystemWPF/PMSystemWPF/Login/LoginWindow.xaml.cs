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
    /// Interaction logic for Login.xaml
    /// </summary>
    public partial class LoginWindow : Window
    {
        public LoginWindow()
        {
            InitializeComponent();
        }

        private void btn_Login_Click(object sender, RoutedEventArgs e)
        {
            string email = txt_Email.Text.ToLower();
            User user = null;
            using (MySqlDbContext db = new MySqlDbContext())
            {
                db.Users.Load();
                user = db.Users.FirstOrDefault(u => u.email.ToLower().Equals(email));
            }
            if(!(user is null))
            {
                string password = txt_Password.Password;
                bool isPasswordCorrect = PasswordProcessor.CheckPasswordsMatch(user.password, password);
                if(isPasswordCorrect)
                {
                    MainWindow mainWindow = new MainWindow(user);
                    mainWindow.Show();
                    this.Close();
                }
            }
            else
            {
                MessageBox.Show("Wrong password or email!", "Authentification failed", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void btn_Register_Click(object sender, RoutedEventArgs e)
        {
            RegisterWindow registerWindow = new RegisterWindow();
            this.Hide();
            registerWindow.ShowDialog();
            if (!(registerWindow.UserRegistered is null))
            {
                MainWindow mainWindow = new MainWindow(registerWindow.UserRegistered);
                mainWindow.Show();
                this.Close();
            }

        }
    }
}
