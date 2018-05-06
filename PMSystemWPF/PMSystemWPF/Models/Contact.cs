namespace Models.PMSystemWPF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("sql7235987.contacts")]
    public partial class Contact
    {
        [Column(TypeName = "uint")]
        public long id { get; set; }

        [Column(TypeName = "uint")]
        public long type_id { get; set; }

        [Column(TypeName = "uint")]
        public long user_id { get; set; }

        [Required]
        [StringLength(191)]
        public string value { get; set; }

        public virtual Contact_type contact_type { get; set; }

        public virtual User user { get; set; }
    }
}
