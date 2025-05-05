package create_servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/kbhai")
public class third_servlet extends HttpServlet {

	
	private static final String url="jdbc:mysql://localhost:3306/servlet";
	private static final String username="root";
	private static final String password="#bmwm5";
	
	private static final long serialVersionUID = -4074629077414648662L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String Name = req.getParameter("name");
		String Roll = req.getParameter("roll");
		String Phonenumber = req.getParameter("phonenumber");
		String Email = req.getParameter("email");
		String Dateofbirth = req.getParameter("dateofbirth");
		String Dloodgroup = req.getParameter("bloodgroup");
		String Gender = req.getParameter("gender");
		String Address = req.getParameter("address");


		resp.setContentType("text/html");
		PrintWriter writer = resp.getWriter();
		writer.println("""  
				
				<h2> Name     :  %s</h2>
				<h2> Roll     :  %s</h2>
				<h2> Phonenumber     :  %s</h2>
				<h2> Email     :  %s</h2>
				<h2> Dateofbirth     :  %s</h2>
				<h2> Dloodgroup     :  %s</h2>
				<h2> Gender     :  %s</h2>
				<h2> Address    :  %s </h2>
			
				
				  """.formatted(Name,Roll,Phonenumber,Email,Dateofbirth,Dloodgroup,Gender,Address));

	 try {
		 Class.forName("com.mysql.cj.jdbc.Driver");
		 
		 
		 Connection con=DriverManager.getConnection(url,username,password);
		 String query="insert into registrationform(name,roll,p_number,email,date_of_birth,blood_group,gender,address) values(?,?,?,?,?,?,?,?)";
		 PreparedStatement pstmt=con.prepareStatement(query);
		 
		 pstmt.setString(1, Name);
		 pstmt.setString(2, Roll);
		 pstmt.setString(3, Phonenumber);
		 pstmt.setString(4, Email);
		 pstmt.setString(5, Dateofbirth);
		 pstmt.setString(6, Dloodgroup);
		 pstmt.setString(7, Gender);
		 pstmt.setString(8, Address);
		 
		 pstmt.executeUpdate();
		 
		 
		 
		 		 
		 
	 }catch(Exception e) {
		 System.out.println(e.getMessage());
	 }
		
		
		
		
	}

}
