using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WaterBoardSystem.Model
{
    class Payment
    {
        private string idPayment;
        private string reference;
        private DateTime date;
        private double amtToPay;
        private double amtPaid;

        public string IdPayment
        {
            get
            {
                return idPayment;
            }

            set
            {
                idPayment = value;
            }
        }

        public string Reference
        {
            get
            {
                return reference;
            }

            set
            {
                reference = value;
            }
        }

        public DateTime Date
        {
            get
            {
                return date;
            }

            set
            {
                date = value;
            }
        }

        public double AmtToPay
        {
            get
            {
                return amtToPay;
            }

            set
            {
                amtToPay = value;
            }
        }

        public double AmtPaid
        {
            get
            {
                return amtPaid;
            }

            set
            {
                amtPaid = value;
            }
        }
    }
}
