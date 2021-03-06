package il.ac.hit.finalproject;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Home
 */
@WebServlet("/Login")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private IDAO dao = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Home() {
        super();
        // TODO Auto-generated constructor stub
    }
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	PrintWriter out = response.getWriter();
    	//ToDoListItem item1 = new ToDoListItem("Test", "What house?", new Date(), new Date());
		//User item2 = new User(1, "Jaleveqrtoqwv", "BLAAAAdqAAAA", "jleverqtov@walla.com", true);
    	
    	IDAO dao = DAO.GetInstance();
		try {
			List<ToDoListItem> items = dao.GetItemsTest();
			for(ToDoListItem it: items)
			{
				out.println("<h6> " + it + "</h6><br>");
			}
		} catch (ToDoListPlatformException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			out.close();
		}
    	
    	
    	//getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//dao = DAO.GetInstance();
		doGet(request, response);
	}

}
