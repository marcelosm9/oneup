using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace OneUp.Models
{
    public class Cliente
    {
        [Key]
        public int ClienteID { get; set; }

        [DisplayName("Nome")]
        public string Nome { get; set; }

        [DisplayName("CPF")]
        public string CPF { get; set; }

        [DisplayName("Data de Nascimento")]
        public DateTime DataNascimento { get; set; }

        public virtual ICollection<Adocao> Adocoes { get; set; }
    }
}