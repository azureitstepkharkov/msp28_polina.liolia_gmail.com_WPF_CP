namespace Models.PMSystemWPF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("sql7235987.password_resets")]
    public partial class Password_reset
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(191)]
        public string email { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(191)]
        public string token { get; set; }

        [Column(TypeName = "timestamp")]
        public DateTime? created_at { get; set; }
    }
}
