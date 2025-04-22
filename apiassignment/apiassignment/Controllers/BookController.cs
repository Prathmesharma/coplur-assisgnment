using apiassignment.Manager;
using Microsoft.AspNetCore.Mvc;

namespace apiassignment.Controllers {
    [ApiController]
    [Route("[Controller]")]

    public class BookController : Controller
    {
      private  IBookManager _IBookManager;
        public BookController(IBookManager BManager )
        {
            _IBookManager = BManager;

        }
        [HttpGet("books")]

        public IActionResult GetAllBooks()
        {
            var res = _IBookManager.GetAllBooks();
            return Ok(res);
        }
        [HttpGet("books/{id}")]

        public IActionResult GetBookById(int id)
        {
            var res = _IBookManager.GetBookById(id);
            return Ok(res);
        }
        [HttpPost("books")]

        public IActionResult AddBook([FromBody] Book book)
        {
            var res = _IBookManager.AddBook(book);
            return Ok(res);
        }
        [HttpPut("books/{id}")]

        public IActionResult UpdateBook(int id)
        {
            var res = _IBookManager.UpdateBook(id);
            return Ok(res);
        }
        [HttpDelete("books/{id}")]

        public IActionResult DeleteBook(int id)
        {
            var res = _IBookManager.DeleteBook(id);
            return Ok(res);
        }

    }
}

public class Book
{
    public int id { get; set; }
    public string title { get; set; }   
    public string author {  get; set; }

    public int yearOfPublication { get; set; }  
}
