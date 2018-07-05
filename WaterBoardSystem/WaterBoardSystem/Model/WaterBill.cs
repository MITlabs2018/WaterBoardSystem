using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WaterBoardSystem.Model
{
    class WaterBill
    {
        private string idWaterBill;
        private DateTime issuedDate;
        private DateTime effPeriod;
        private double meterReading;

        public string IdWaterBill
        {
            get
            {
                return idWaterBill;
            }

            set
            {
                idWaterBill = value;
            }
        }

        public DateTime IssuedDate
        {
            get
            {
                return issuedDate;
            }

            set
            {
                issuedDate = value;
            }
        }

        public DateTime EffPeriod
        {
            get
            {
                return effPeriod;
            }

            set
            {
                effPeriod = value;
            }
        }

        public double MeterReading
        {
            get
            {
                return meterReading;
            }

            set
            {
                meterReading = value;
            }
        }
    }
}
