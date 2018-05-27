namespace PMSystemWPF
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;
    using Models.PMSystemWPF;

    public partial class MySqlDbContext : DbContext
    {
        public MySqlDbContext()
            : base("name=MySqlDbContext")
        {
        }

        public virtual DbSet<Comment_task> Comment_task { get; set; }
        public virtual DbSet<Comment_user> Comment_user { get; set; }
        public virtual DbSet<Contact_type> Contact_types { get; set; }
        public virtual DbSet<Contact> Contacts { get; set; }
        public virtual DbSet<File_task> File_task { get; set; }
        public virtual DbSet<Permission> Permissions { get; set; }
        public virtual DbSet<Project_technology> Project_technology { get; set; }
        public virtual DbSet<Project> Projects { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Task_technology> Task_technology { get; set; }
        public virtual DbSet<Task_user> Task_user { get; set; }
        public virtual DbSet<MyTask> Tasks { get; set; }
        public virtual DbSet<Technology> Technologies { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Password_reset> Password_resets { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Comment_task>()
                .Property(e => e.comment)
                .IsUnicode(false);

            modelBuilder.Entity<Comment_user>()
                .Property(e => e.comment)
                .IsUnicode(false);

            modelBuilder.Entity<Contact_type>()
                .Property(e => e.contact_type)
                .IsUnicode(false);

            modelBuilder.Entity<Contact_type>()
                .HasMany(e => e.contacts)
                .WithRequired(e => e.contact_type)
                .HasForeignKey(e => e.type_id);

            modelBuilder.Entity<Contact>()
                .Property(e => e.value)
                .IsUnicode(false);

            modelBuilder.Entity<File_task>()
                .Property(e => e.path)
                .IsUnicode(false);

            modelBuilder.Entity<Permission>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<Permission>()
                .Property(e => e.display_name)
                .IsUnicode(false);

            modelBuilder.Entity<Permission>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<Permission>()
                .HasMany(e => e.roles)
                .WithMany(e => e.permissions)
                .Map(m => m.ToTable("permission_role", "sql7235987")
                .MapLeftKey("permission_id")
                .MapRightKey("role_id"));

            modelBuilder.Entity<Project>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<Project>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<Project>()
                .Property(e => e.status)
                .IsUnicode(false);

            modelBuilder.Entity<Project>()
                .HasMany(e => e.project_technologies)
                .WithRequired(e => e.projects)
                .HasForeignKey(e => e.project_id);

            modelBuilder.Entity<Project>()
                .HasMany(e => e.tasks)
                .WithRequired(e => e.project)
                .HasForeignKey(e => e.project_id);



            modelBuilder.Entity<Role>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<Role>()
                .Property(e => e.display_name)
                .IsUnicode(false);

            modelBuilder.Entity<Role>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<Role>()
                .HasMany(e => e.users)
                .WithMany(e => e.roles)
                .Map(m => m.ToTable("role_user", "sql7235987")
                .MapLeftKey("role_id")
                .MapRightKey("user_id"));

            modelBuilder.Entity<MyTask>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<MyTask>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<MyTask>()
                .Property(e => e.status)
                .IsUnicode(false);

            modelBuilder.Entity<MyTask>()
                .HasMany(e => e.comment_task)
                .WithRequired(e => e.tasks)
                .HasForeignKey(e => e.task_id);

            modelBuilder.Entity<MyTask>()
                .HasMany(e => e.file_task)
                .WithRequired(e => e.tasks)
                .HasForeignKey(e => e.task_id);

            modelBuilder.Entity<MyTask>()
                .HasMany(e => e.task_technologies)
                .WithRequired(e => e.tasks)
                .HasForeignKey(e => e.task_id);

            modelBuilder.Entity<MyTask>()
                .HasMany(e => e.task_users)
                .WithRequired(e => e.tasks)
                .HasForeignKey(e => e.task_id);

            modelBuilder.Entity<Technology>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<Technology>()
                .Property(e => e.description)
                .IsUnicode(false);

            modelBuilder.Entity<Technology>()
                .HasMany(e => e.project_technology)
                .WithRequired(e => e.technologies)
                .HasForeignKey(e => e.technology_id);

            modelBuilder.Entity<Technology>()
                .HasMany(e => e.task_technology)
                .WithRequired(e => e.technology)
                .HasForeignKey(e => e.technology_id);

            modelBuilder.Entity<Technology>()
                .HasMany(e => e.users)
                .WithMany(e => e.technologies)
                .Map(m => m.ToTable("technology_user", "sql7235987")
                .MapLeftKey("technology_id")
                .MapRightKey("user_id"));

            modelBuilder.Entity<User>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.password)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.status)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.remember_token)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .Property(e => e.avatar)
                .IsUnicode(false);

            modelBuilder.Entity<User>()
                .HasMany(e => e.comment_task)
                .WithRequired(e => e.author)
                .HasForeignKey(e => e.author_id);

            modelBuilder.Entity<User>()
                .HasMany(e => e.users_comments)
                .WithRequired(e => e.author)
                .HasForeignKey(e => e.author_id);

            modelBuilder.Entity<User>()
                .HasMany(e => e.comments_about_user)
                .WithRequired(e => e.user)
                .HasForeignKey(e => e.user_id);

            modelBuilder.Entity<User>()
                .HasMany(e => e.contacts)
                .WithRequired(e => e.user)
                .HasForeignKey(e => e.user_id);

            modelBuilder.Entity<User>()
                .HasMany(e => e.file_task)
                .WithRequired(e => e.users)
                .HasForeignKey(e => e.user_id);

            modelBuilder.Entity<User>()
                .HasMany(e => e.projects)
                .WithRequired(e => e.client)
                .HasForeignKey(e => e.client_id);

            modelBuilder.Entity<User>()
                .HasMany(e => e.projects1)
                .WithRequired(e => e.project_manager)
                .HasForeignKey(e => e.project_manager_id);

            modelBuilder.Entity<User>()
                .HasMany(e => e.task_user)
                .WithRequired(e => e.users)
                .HasForeignKey(e => e.user_id);

            modelBuilder.Entity<Password_reset>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<Password_reset>()
                .Property(e => e.token)
                .IsUnicode(false);
        }
    }
}
