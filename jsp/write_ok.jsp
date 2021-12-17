<%@ page language="java" contentType="text/html; charset=utf-8"

    pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
        request.setCharacterEncoding("utf-8");

        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost/choimik1076";
        String id = "choimik1076";
        String pass = "dkffh4189";
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String title = request.getParameter("title");
        String memo = request.getParameter("memo");

        try {
                Connection conn = DriverManager.getConnection(url,id,pass);

                String sql = "INSERT INTO board1(USERNAME,PASSWORD,TITLE,MEMO) VALUES(?,?,?,?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);

                pstmt.setString(1, name);
                pstmt.setString(2, password);
                pstmt.setString(3, title);
                pstmt.setString(4, memo);

                pstmt.execute();
                pstmt.close();

                conn.close();
} catch(SQLException e) {
        out.println( e.toString() );
        }
%>
  <script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="list.jsp";

</script>
