namespace apiassignment.Manager
{
    public class UserManager : IUserManager
    {
        public string AddUser(User user)
        {
            return "User added";
        }

        public string DeleteUser(int id)
        {
            return "User Deleted";
        }

        public string GetAllUser()
        {
            return "All User recieved";
        }

        public string GetUserById(int id)
        {
            return "User recieved of the id you provided";
        }

        public string UpdateUser(int id)
        {
            return "User Updated";
        }
    }
}