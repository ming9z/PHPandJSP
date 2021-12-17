<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page info = "test.jsp" contentType="text/html; charset=utf-8" %>
<% request.setCharacterEncoding("utf-8");%>


<form name="form1"  action="test.jsp" method="get" >
<font size="8">서울시 wifi 검색</font><br>
(id) :    <input type="text" name="id">
검색어  :       <input type="text" name="search">  <input type="submit" value="검색">  <br>

<input type="checkbox" name="table" value="category">category
<input type="checkbox" name="table" value="gu_nm">gu_nm
<input type="checkbox" name="table" value="instl_y">instl_y
<input type="checkbox" name="table" value="place_name">place_name
<input type="checkbox" name="table" value="instl_div">instl_div
<input type="checkbox" name="table" value="place_addr">place_addr
<input type="checkbox" name="table" value="objectid">objectid
<input type="checkbox" name="table" value="instl_x">instl_x
<input type="checkbox" name="table" value="place_addr_sub">place_addr_sub

</form>

<%

 String USER = "min";
 String PASS="dkffh4189";
 Connection conn=null;
 Statement stmt = null;
 ResultSet rs = null;
 ResultSet rs2 = null;
 PreparedStatement pstmt=null;

 String search = request.getParameter("search");
 String id = request.getParameter("id");
 String table = request.getParameter("table");
   String sql = "select * from wifi";
 String sqlid = "insert into ipid(id,search,ip) values(?, ?, ?)";

 if(table != null && search != null){


 if(table.equals("gu_nm")){
    sql += " where gu_nm like '%" + search + "%'";
}else if(table.equals("place_addr")){
    sql += " where place_addr like '%" + search + "%'";
}else if(table.equals("instl_y")){
    sql += " where instl_y like '%" + search + "%'";
}else if(table.equals("instl_x")){
    sql += " where instl_x like '%" + search + "%'";
}else if(table.equals("objectid")){
    sql += " where objectid like '%" + search + "%'";
}else if(table.equals("place_addr_sub")){
    sql += " where place_addr_sub like '%" + search + "%'";
 }
else if(table.equals("category")){
    sql += " where category like '%" + search + "%'";
 }
else if(table.equals("instl_div")){
    sql += " where instl_div like '%" + search + "%'";
 }
else if(table.equals("place_name")){
    sql += " where place_name like '%" + search + "%'";
 }
}   //if문 종료
 try {



   Class.forName("com.mysql.jdbc.Driver");
conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/homework", "min", "dkffh4189");
  stmt = conn.createStatement();
  rs = stmt.executeQuery(sql);


   while(rs.next()) {

        out.print(rs.getString("place_addr_sub")+"\t");
        out.print(rs.getString("gu_nm")+"\t");
        out.print(rs.getString("instl_y")+"\t");
        out.print(rs.getString("instl_x")+"\t");
        out.print(rs.getString("category")+"\t");
        out.print(rs.getString("place_name")+"\t");
        out.print(rs.getString("instl_div")+"\t");
        out.print(rs.getString("place_addr")+"\t");
        out.print(rs.getString("objectid")+"\t");

     out.print("\n");
}

   pstmt = conn.prepareStatement(sqlid);
   pstmt.setString(1,id);
   pstmt.setString(2,search);
   pstmt.setString(3,request.getRemoteAddr());
   pstmt.executeUpdate();


 }catch(SQLException e) {   //try문 종료
  e.getMessage();
 }
 finally {
  if(rs != null)try{rs.close();}catch(SQLException ex){}
  if(stmt != null)try{stmt.close();}catch(SQLException ex){}
  if(conn != null)try{conn.close();}catch(SQLException ex){}
 }

%><br>
