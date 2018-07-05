using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WaterBoardSystem.Model
{
    class Attendence
    {
        private string idAttendence;
        private DateTime date;
        private DateTime effDate;
        private int status;
        private string remarks;

        public DateTime Date
        {
            get
            {
                return Date;
            }

            set
            {
                Date = value;
            }
        }

       

        public DateTime EffDate
        {
            get
            {
                return effDate;
            }

            set
            {
                effDate = value;
            }
        }

        public int Status
        {
            get
            {
                return status;
            }

            set
            {
                status = value;
            }
        }

        public string Remarks
        {
            get
            {
                return remarks;
            }

            set
            {
                remarks = value;
            }
        }

        public string IdAttendence
        {
            get
            {
                return IdAttendence;
            }

            set
            {
                IdAttendence = value;
            }
        }

        
    }
}
