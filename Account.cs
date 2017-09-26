using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace rssFeed.SubscriberService
{
    public class Account
    {
        public Account(string name, string email) {
            Email = email;
            Name = name;
        }
      public string Email { get; set; }
      public string Name { get; set; }


    }
}
