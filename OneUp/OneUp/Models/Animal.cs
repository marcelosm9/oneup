using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace OneUp.Models
{
    public class Animal
    {
        [Key]
        public int AnimalID { get; set; }

        [DisplayName("Nome")]
        public string Nome { get; set; }

        [DisplayName("Observação")]
        public string Observacao { get; set; }

        public virtual ICollection<Adocao> Adocao { get; set; }
    }
}