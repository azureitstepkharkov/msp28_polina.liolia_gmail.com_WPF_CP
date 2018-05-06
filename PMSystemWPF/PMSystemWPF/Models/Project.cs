namespace Models.PMSystemWPF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("sql7235987.projects")]
    public partial class Project
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Project()
        {
            project_technologies = new HashSet<Project_technology>();
            tasks = new HashSet<MyTask>();
        }

        [Column(TypeName = "uint")]
        public long id { get; set; }

        [Required]
        [StringLength(150)]
        public string name { get; set; }

        [Column(TypeName = "text")]
        [StringLength(65535)]
        public string description { get; set; }

        [Column(TypeName = "uint")]
        public long client_id { get; set; }

        [Column(TypeName = "uint")]
        public long project_manager_id { get; set; }

        [Column(TypeName = "enum")]
        [Required]
        [StringLength(65532)]
        public string status { get; set; }

        [Column(TypeName = "timestamp")]
        public DateTime? created_at { get; set; }

        [Column(TypeName = "timestamp")]
        public DateTime? updated_at { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Project_technology> project_technologies { get; set; }

        public virtual User client { get; set; }

        public virtual User project_manager { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MyTask> tasks { get; set; }
    }
}
