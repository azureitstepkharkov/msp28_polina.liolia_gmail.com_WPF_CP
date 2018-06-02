using Models.PMSystemWPF;
using PMSystemWPF.Projects;
using PMSystemWPF.Tasks;
using PMSystemWPF.Users;
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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace PMSystemWPF
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window, IDisposable
    {
        private User currentUser;
        private MySqlDbContext db;
        public MainWindow(User user)
        {
            InitializeComponent();
            this.WindowStartupLocation = WindowStartupLocation.CenterScreen;
            db = new MySqlDbContext();
            LoadDataFromDb();
            this.currentUser = user;
        }

        private void LoadDataFromDb()
        {
            db.Users.Load();
            dg_Users.DataContext = db.Users.Local;
            db.Projects.Load();
            dg_Projects.DataContext = db.Projects.Local;
            db.Tasks.Load();
            dg_Tasks.DataContext = db.Tasks.Local;
            db.Roles.Load();
            db.Project_technology.Load();
            db.Technologies.Load();
            db.Task_technology.Load();
            db.Task_user.Load();
            db.Comment_task.Load();
            db.Comment_user.Load();
            db.Contacts.Load();
            db.Contact_types.Load();
        }


        #region Users
        private void dg_Users_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                if (e.AddedItems[0] is User)
                {
                    User currentUser = e.AddedItems[0] as User;
                    if (!(currentUser is null))
                    {
                        dg_UserContacts.ItemsSource = currentUser.contacts;
                        dg_UserRoles.ItemsSource = currentUser.roles;
                        dg_UserTechnologies.ItemsSource = currentUser.technologies;
                    }
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
            }
        }

        private void dg_Users_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            ShowEditUserWindow(dg_Users);
            
        }

        private void btn_editUser_Click(object sender, RoutedEventArgs e)
        {
            ShowEditUserWindow(dg_Users);
            dg_UserContacts.Items.Refresh();
            dg_UserRoles.Items.Refresh();
            dg_UserTechnologies.Items.Refresh();
            dg_Users.Items.Refresh();
        }

        private void ShowEditUserWindow(DataGrid dg)
        {
            if (dg.SelectedIndex >= 0)
            {
                if (dg.SelectedItem is User)
                {
                    User currentUser = dg.SelectedItem as User;
                    if (!(currentUser is null))
                    {
                        EditUserWindow editUserWindow = new EditUserWindow(currentUser, db);
                        editUserWindow.ShowDialog();
                        try
                        {
                            db.SaveChanges();
                            dg_UserContacts.Items.Refresh();
                            dg_UserRoles.Items.Refresh();
                            dg_UserTechnologies.Items.Refresh();
                            dg_Users.Items.Refresh();
                        }
                        catch(Exception ex)
                        {
                            MessageBox.Show(ex.Message, "Error", MessageBoxButton.OK, MessageBoxImage.Error);
                        }
                        
                    }
                }
            }
            else
                MessageBox.Show("No row was selected!", "Nothing to edit", MessageBoxButton.OK, MessageBoxImage.Exclamation);
        }

        private void btn_addUser_Click(object sender, RoutedEventArgs e)
        {
            AddUserWindow addUserWindow = new AddUserWindow(db);
            addUserWindow.ShowDialog();
            db.SaveChanges();
        }

        private void btn_deleteUser_Click(object sender, RoutedEventArgs e)
        {
            if (dg_Users.SelectedIndex >= 0)
            {
                if (dg_Users.SelectedItem is User)
                {
                    User currentUser = dg_Users.SelectedItem as User;
                    if (!(currentUser is null))
                    {
                        MessageBoxResult result = MessageBox.Show($"Do you want to delete {currentUser.name}?",
                                                                   "Confirmation",
                                                                   MessageBoxButton.YesNo,
                                                                   MessageBoxImage.Question);
                        if (result == MessageBoxResult.Yes)
                        {
                            db.Users.Remove(currentUser);
                            db.SaveChanges();
                        }
                    }
                }
            }
            else
                MessageBox.Show("No row was selected!", "Nothing to delete", MessageBoxButton.OK, MessageBoxImage.Exclamation);
        }

        #endregion

        #region Projects
        private void dg_Projects_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                if (e.AddedItems[0] is Project)
                {
                    Project currentProj = e.AddedItems[0] as Project;
                    if (currentProj != null)
                    {
                        dg_ProjectTasks.ItemsSource = currentProj.tasks;
                        dg_ProjectTechnologies.ItemsSource = currentProj.project_technologies;
                    }
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
            }
        }

        private void dg_Projects_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            ShowEditProjectWindow(dg_Projects);
        }

        private void btn_editProject_Click(object sender, RoutedEventArgs e)
        {
            ShowEditProjectWindow(dg_Projects);
        }

        private void ShowEditProjectWindow(DataGrid dg)
        {
            if (dg.SelectedIndex >= 0)
            {
                if (dg.SelectedItem is Project)
                {
                    Project currentProject = dg.SelectedItem as Project;
                    if (!(currentProject is null))
                    {
                        EditProjectWindow editProjectWindow = new EditProjectWindow(currentProject, db);
                        editProjectWindow.ShowDialog();
                        db.SaveChanges();
                    }
                }
            }
            else
                MessageBox.Show("No row was selected!", "Nothing to edit", MessageBoxButton.OK, MessageBoxImage.Exclamation);
        }

        private void btn_addProject_Click(object sender, RoutedEventArgs e)
        {
            AddProjectWindow addProjectWindow = new AddProjectWindow(db);
            addProjectWindow.ShowDialog();
        }

        private void btn_deleteProject_Click(object sender, RoutedEventArgs e)
        {
            if (dg_Projects.SelectedIndex >= 0)
            {
                if (dg_Projects.SelectedItem is Project)
                {
                    Project currentProject = dg_Projects.SelectedItem as Project;
                    if (!(currentProject is null))
                    {
                        MessageBoxResult result = MessageBox.Show($"Do you want to delete {currentProject.name}?",
                                                                   "Confirmation",
                                                                   MessageBoxButton.YesNo,
                                                                   MessageBoxImage.Question);
                        if (result == MessageBoxResult.Yes)
                        {
                            db.Projects.Remove(currentProject);
                            db.SaveChanges();
                        }
                    }
                }
            }
            else
                MessageBox.Show("No row was selected!", "Nothing to delete", MessageBoxButton.OK, MessageBoxImage.Exclamation);
        }

        private void dg_ProjectTasks_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            ShowEditTaskWindow(dg_ProjectTasks);
        }

        #endregion

        #region Tasks
        private void dg_Tasks_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            try
            {
                if (e.AddedItems[0] is MyTask)
                {
                    MyTask currentTask = e.AddedItems[0] as MyTask;
                    if (currentTask != null)
                    {
                        dg_TaskComments.ItemsSource = currentTask.comment_task;
                        dg_TaskDevs.ItemsSource = currentTask.task_users;
                        dg_TaskTechnologies.ItemsSource = currentTask.task_technologies;
                    }
                }
            }
            catch (Exception ex)
            {
                Debug.WriteLine(ex.Message);
            }
        }

        private void btn_editTask_Click(object sender, RoutedEventArgs e)
        {
            ShowEditTaskWindow(dg_Tasks);
        }

        private void dg_Tasks_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            ShowEditTaskWindow(dg_Tasks);
        }

        private void ShowEditTaskWindow(DataGrid dg)
        {
            if (dg.SelectedIndex >= 0)
            {
                if (dg.SelectedItem is MyTask)
                {
                    MyTask currentTask = dg.SelectedItem as MyTask;
                    if (!(currentTask is null))
                    {
                        EditTaskWindow editTaskWindow = new EditTaskWindow(currentTask, db);
                        editTaskWindow.ShowDialog();
                        db.SaveChanges();
                    }
                }
            }
            else
                MessageBox.Show("No row was selected!", "Nothing to edit", MessageBoxButton.OK, MessageBoxImage.Exclamation);
        }

        private void btn_addTask_Click(object sender, RoutedEventArgs e)
        {
            AddTaskWindow addTaskWindow = new AddTaskWindow(db);
            addTaskWindow.ShowDialog();
        }

        private void btn_deleteTask_Click(object sender, RoutedEventArgs e)
        {
            if (dg_Tasks.SelectedIndex >= 0)
            {
                if (dg_Tasks.SelectedItem is MyTask)
                {
                    MyTask currentTask = dg_Tasks.SelectedItem as MyTask;
                    if (!(currentTask is null))
                    {
                        MessageBoxResult result = MessageBox.Show($"Do you want to delete {currentTask.name}?",
                                                                   "Confirmation",
                                                                   MessageBoxButton.YesNo,
                                                                   MessageBoxImage.Question);
                        if (result == MessageBoxResult.Yes)
                        {
                            db.Tasks.Remove(currentTask);
                            db.SaveChanges();
                        }
                    }
                }
            }
            else
                MessageBox.Show("No row was selected!", "Nothing to delete", MessageBoxButton.OK, MessageBoxImage.Exclamation);
        }

        private void dg_TaskDevs_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            ShowEditUserWindow(dg_TaskDevs);
        }
        #endregion

        #region Object disposing
        public void Dispose()
        {
            this.db.Dispose();
        }

        private void Window_Closed(object sender, EventArgs e)
        {
            this.Dispose();
        }
        #endregion


    }
}
