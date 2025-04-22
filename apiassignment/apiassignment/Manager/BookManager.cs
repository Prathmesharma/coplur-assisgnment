namespace apiassignment.Manager
{
    public class BookManager:IBookManager
    {

        public string AddBook(Book book)
        {
            return "Book Added";
        }
        public string DeleteBook(int id)
        {
            return "Book Removed";

        }
        public string GetAllBooks()
        {
            return "Books fetched";
        }

        public string GetBookById(int id)
        {
            return "Book fetched by id";
        }

        public string UpdateBook(int id)
        {
            return "Book updated";
        }
    }
}
