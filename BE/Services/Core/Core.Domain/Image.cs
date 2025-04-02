using Shared.Constant.Database;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Domain
{
    [Table(nameof(Image), Schema = DbSchema.Core)]
    public class Image
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }
        public string? LinkImage { get; set; }
        public int? TableID { get; set; }
        public string? Name { get; set; }
        public string? Table { get; set; }
    }
}
