namespace Models.PMSystemWPF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("sql7235987.file_task")]
    public partial class File_task
    {
        [Column(TypeName = "uint")]
        public long id { get; set; }

        [Column(TypeName = "uint")]
        public long task_id { get; set; }

        [Column(TypeName = "uint")]
        public long user_id { get; set; }

        [Required]
        [StringLength(500)]
        public string path { get; set; }

        [Column(TypeName = "timestamp")]
        public DateTime? created_at { get; set; }

        [Column(TypeName = "timestamp")]
        public DateTime? updated_at { get; set; }

        public virtual MyTask tasks { get; set; }

        public virtual User users { get; set; }
    }
}
