package p1;
import java.util.*;
import java.sql.*;

public class connect {
		private Connection con;
		private PreparedStatement ps;
		private ResultSet rs;
		public connect()
		{
			try {
				Class.forName("com.mysql.jdbc.Driver");  
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/db","root","Braty@098"); 
				System.out.println("Connected");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
		}
		public ArrayList<String> getCategory(){
			ArrayList<String> arr = new ArrayList<String>();
			try {
				String sql = "select distinct(category) from products";
				ps=con.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()) {
					arr.add(rs.getString(1));
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return arr;
		}
		public ArrayList<Products>getAllRecords(String category){
			ArrayList<Products>arr = new ArrayList<Products>();
			try {
				String sql="";
				if(category.equals("all")) {
					sql = "select id,title,category,description,image,price,rating_rate,rating_count from products";
					ps = con.prepareStatement(sql);
				}else {
					sql = "select id,title,category,description,image,price,rating_rate,rating_count from products where category=?";
					ps = con.prepareStatement(sql);
					ps.setString(1, category);
				}
				rs = ps.executeQuery();
				while(rs.next()) {
					Products p1  = new Products();
					p1.setId(rs.getInt(1));
					p1.setTitle(rs.getString(2));
					p1.setCategory(rs.getString(3));
					p1.setDescription(rs.getString(4));
					p1.setImage(rs.getString(5));
					p1.setPrice(rs.getDouble(6));
					p1.setRate(rs.getDouble(7));
					p1.setCount(rs.getLong(8));
					arr.add(p1);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return arr;
		}
}