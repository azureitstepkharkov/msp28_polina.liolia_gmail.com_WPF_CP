namespace Models.PMSystemWPF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("sql7235987.permissions")]
    public partial class Permission
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Permission()
        {
            roles = new HashSet<Role>();
        }

        [Column(TypeName = "uint")]
        public long id { get; set; }

        [Required]
        [StringLength(191)]
        public string name { get; set; }

        [StringLength(191)]
        public string display_name { get; set; }

        [StringLength(191)]
        public string description { get; set; }

        [Column(TypeName = "timestamp")]
        public DateTime? created_at { get; set; }

        [Column(TypeName = "timestamp")]
        public DateTime? updated_at { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Role> roles { get; set; }
    }
}
