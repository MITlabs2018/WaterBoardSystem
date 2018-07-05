using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WaterBoardSystem.Model
{
    
    class Members
    {
        private string accountNum;
        private  string fullName;
        private string contactNum;
        private string address;
        private DateTime joinedDate;

        public string AccountNum
        {
            get
            {
                return accountNum;
            }

            set
            {
                accountNum = value;
            }
        }

        public string FullName
        {
            get
            {
                return fullName;
            }

            set
            {
                fullName = value;
            }
        }

        public string ContactNum
        {
            get
            {
                return contactNum;
            }

            set
            {
                contactNum = value;
            }
        }

        public string Address
        {
            get
            {
                return address;
            }

            set
            {
                address = value;
            }
        }

        public DateTime JoinedDate
        {
            get
            {
                return joinedDate;
            }

            set
            {
                joinedDate = value;
            }
        }
    }
}
