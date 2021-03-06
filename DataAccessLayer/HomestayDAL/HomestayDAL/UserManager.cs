﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HomestayDAL
{
    class UserManager
    {
        public void User_Insert(User user)
        {
            try
            {
                HomestayEntities HomestayEntities = new HomestayEntities();
                HomestayEntities.Users.Add(user);
                HomestayEntities.SaveChanges();
            }
            catch (Exception e)
            {

                Console.WriteLine(e.InnerException);
            }
        }
        public void User_Update(User user)
        {
            try
            {
                HomestayEntities HomestayEntities = new HomestayEntities();
                User us = HomestayEntities.Users.First(u => u.UserID == user.UserID);
                us.LastModifiedDate = DateTime.Today;
                us.Password = user.Password;
                us.Address = user.Address;
                us.Phone = user.Phone;
                us.Email = user.Email;
                us.UserScore = user.UserScore;
                us.ScoreDate = user.ScoreDate;
                HomestayEntities.SaveChanges();
            }
            catch (Exception e)
            {

                Console.WriteLine(e.InnerException);
            }
        }
        public void User_Delete(User user)
        {
            try
            {
                HomestayEntities HomestayEntities = new HomestayEntities();
                User us = HomestayEntities.Users.First(u => u.UserID == user.UserID);
                HomestayEntities.Users.Remove(us);
                HomestayEntities.SaveChanges();
            }
            catch (Exception e)
            {

                Console.WriteLine(e.InnerException);
            }
        }
    }
}
