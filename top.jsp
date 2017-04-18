<%@ page import="java.net.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="javax.sql.DataSource" %>
<%@ page import="javax.naming.Context" %>
<%@ page import="javax.naming.InitialContext" %>
<%@ page import="java.util.*" %>
<%
    String userName = (String)session.getAttribute("name");
    String userId = (String)session.getAttribute("userid");

    int f[] = new int[15];
    int c=0;

    if(userId != null){

      Context ctx = null;
      DataSource ds = null;
      Connection con = null;
      String strSql = null;
      PreparedStatement ps = null;
      ResultSet rs = null;

      try {

      ctx = new InitialContext( );
      ds = (DataSource)ctx.lookup("java:comp/env/jdbc/teamb");
      con = ds.getConnection();
      strSql = "select * from "+userId;
      ps = con.prepareStatement(strSql);
      rs = ps.executeQuery( );

      while(rs.next( )){
        if(rs.getInt("flag")==1){
          f[c]=1;
      }
      }


    }catch(Exception e){
      System.out.println("try block : " + e.getMessage( ));
      e.printStackTrace( );
    } finally {
      try {
        if (rs != null) rs.close( );
        if (con != null) con.close( );
        if (ps != null) ps.close( );
      } catch(Exception e) {
        System.out.println("finally block : " + e.getMessage( ));
        e.printStackTrace( );
      }
    }

    }
%>
<!DOCTYPE html>
<html lang="ja">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>トップページ</title>
    <!-- BootstrapのCSS読み込み -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/teamB2.css" rel="stylesheet">
    <!-- jQuery読み込み -->
    <script src="http://code.jquery.com/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- BootstrapのJS読み込み -->
    <script src="js/bootstrap.min.js"></script>
  </head>

    <nav class="navbar navbar-inverse navbar-static-top">
      <div class="container">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#gnavi">
          <span class="sr-only">メニュー</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a href="top.jsp" class="navbar-brand">Akitter</a>
      </div>

      <div id="gnavi" class="collapse navbar-collapse">
        <ul class="nav navbar-nav  navbar-right">
          <%
          if(userName == null) {
            out.println("<li><a href=\"login.html\">ログイン</a></li>");
          }else{
            out.println("<li><a href=\"#\" class=\"dropdown-toggle\"  data-toggle=\"dropdown\">"+ userName +"<b class=\"caret\"></b></a>");
            out.println("<ul class=\"dropdown-menu\">");
            out.println("<li><a href=\"logout.jsp\">ログアウト</a></li>");
            out.println("</ul></li>");
          }
          %>
          <li><a href="tutorial-top.jsp">チュートリアル</a></li>
          <li><a href="dictionary.jsp">用語辞典</a></li>
          <li><a href="contact.jsp">問い合わせ</a></li>
        </ul>
      </div>
    </div>
    </nav>

  <div class="container">　<!-- containerその１ -->
    <div class="main">
    <div class="text-center">
        <img src="image/top.png" class="img-responsive" width="100%" height="130">
        <p>
          <%
          if(userName == null){
        out.println("<div class=\"panel panel-default\">");
            out.println("<div class=\"panel-body\"><img width=\"50px\" height=\"50px\" src=\"image/twittercloud.png\" align=\"left\"><br><h3><a href=\"register.html\">まずは新規登録しましょう。</a></h3></div>");
        out.println("</div>");
        }
        %>
          <div class="panel panel-default">
            <div class="panel-body"><img width="50px" height="50px" src="image/twittercloud.png" align="left"><br><h3><a href="tutorial-top.jsp">チュートリアルへ</a></h3></div>
          </div>
          <div class="panel panel-default">
            <div class="panel-body"><img width="50px" height="50px" src="image/twittercloud.png" align="left"><br><h3><a href="dictionary.jsp">用語集へ</a></h3></div>
          </div>
          <div class="panel panel-default">
            <div class="panel-body"><img width="50px" height="50px" src="image/twittercloud.png" align="left"><br><h3><a href="contact.jsp">問い合わせへ</a></h3></div>
          </div>
          <div class="panel panel-default">
            <div class="panel-body"><img width="50px" height="50px" src="image/twittercloud.png" align="left"><br><h3><a href="DL.jsp">ダウンロードする</a></h3></div>
          </div>
      </p>
    </div>
</div><!-- containerその１ここまで -->

<nav class="navbar navbar-inverse navbar-fixed-bottom">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#patern04">

          </button>
    			<a href="top.jsp" class="navbar-brand">Adutter</a>
        </div>

        <div id="patern04" class="collapse navbar-collapse">
        </div>
      </div>
    </nav>

</body>
</html>
