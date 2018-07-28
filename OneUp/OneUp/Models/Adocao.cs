using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace OneUp.Models
{
    public class Adocao
    {
        [Key]
        public int AdocaoID { get; set; }

        [DisplayName("Cliente")]
        public int ClienteID { get; set; }

        [DisplayName("Animal")]
        public int AnimalID { get; set; }

        [DisplayName("Data da Adoção")]
        public DateTime DataAdocao { get; set; }

        public Cliente Cliente { get; set; }
        public Animal Animal { get; set; }
    }
}