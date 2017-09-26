using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace rssFeed.SubscriberService
{
   public class Subscriber
    {

       public string Subscribe(string email, string name){

           if (SearchByEmail(email) == false)
           {
              return  CreateAccount(name, email);
           }
           else
               return "exists";
           
       }

       private bool SearchByEmail(string email)
       {
           return false;
       }

      public string CreateAccount(string name, string email)
       {
           XmlWriter xmlWriter = XmlWriter.Create("test.xml");

           xmlWriter.WriteStartDocument();
           xmlWriter.WriteStartElement("Subscriber");
           xmlWriter.WriteAttributeString("name", name);
           xmlWriter.WriteStartElement("email");
          
           xmlWriter.WriteString(email);
           xmlWriter.WriteEndElement();

           xmlWriter.WriteEndDocument();
           xmlWriter.Close();
           return "created";
       }

    }


}
