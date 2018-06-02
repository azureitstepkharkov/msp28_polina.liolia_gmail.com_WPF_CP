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

namespace PMSystemWPF.Projects
{
    /// <summary>
    /// Interaction logic for EditProjectWindow.xaml
    /// </summary>
    public partial class EditProjectWindow : Window
    {
        private Project proj;

        public EditProjectWindow()
        {
            InitializeComponent();
            this.WindowStartupLocation = WindowStartupLocation.CenterScreen;
        }

        public EditProjectWindow(Project proj, MySqlDbContext db)
        {
            this.proj = proj;
        }
    }
}
