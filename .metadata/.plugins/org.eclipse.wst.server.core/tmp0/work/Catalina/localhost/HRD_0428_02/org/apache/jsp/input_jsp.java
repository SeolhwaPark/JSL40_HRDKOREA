/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.51
 * Generated at: 2020-04-30 04:51:41 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import model.*;

public final class input_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("java.util");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("model");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("  \r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>(과정평가형 정보처리산업기사)학생관리 프로그램 ver 1.0</title>\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("*{padding:0;margin:0}\r\n");
      out.write(".logo{padding:40px 0;text-align:center;color:#c85179; background-color:#fdeff2}\r\n");
      out.write(".navi{padding:10px 0;overflow:hidden; background-color:#e198b4}\r\n");
      out.write(".navi ul, li{padding:0 10px;float:left;list-style:none}\r\n");
      out.write("a{text-decoration:none; color:#fff}\r\n");
      out.write("\r\n");
      out.write(".section{color:#c85179;}\r\n");
      out.write(".title{text-align:center;padding:20px;}\r\n");
      out.write(".content{margin:0 auto}\r\n");
      out.write(".content table{margin:0 auto}\r\n");
      out.write(".content table th, td{text-align:center;color:#c85179; border: 1px solid #e198b4}\r\n");
      out.write(".btn_group{text-align:center;}\r\n");
      out.write("\r\n");
      out.write(".footer{padding:20px 0;background-color:#e198b4}\r\n");
      out.write(".footer p{text-align:center;color:#fdeff2;}\r\n");
      out.write("</style>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("function send() {\r\n");
      out.write("\tif(insert.hakbun.value==\"\"){\r\n");
      out.write("\t\talert(\"학번이 입력되지 않았습니다!\");\r\n");
      out.write("\t\tinsert.hakbun.focus();\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\tif(insert.kor.value==\"\"){\r\n");
      out.write("\t\talert(\"국어성적이 입력되지 않았습니다!\");\r\n");
      out.write("\t\tinsert.kor.focus();\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\tif(insert.eng.value==\"\"){\r\n");
      out.write("\t\talert(\"영어성적이 입력되지 않았습니다!\");\r\n");
      out.write("\t\tinsert.eng.focus();\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\tif(insert.mat.value==\"\"){\r\n");
      out.write("\t\talert(\"수학성적이 입력되지 않았습니다!\");\r\n");
      out.write("\t\tinsert.mat.focus();\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\talert(\"학생성적을 등록합니다!\");\r\n");
      out.write("\tinsert.submit();\r\n");
      out.write("}\r\n");
      out.write("function del() {\r\n");
      out.write("\talert(\"입력된 모든 항목을 삭제합니다\");\r\n");
      out.write("\tinsert.reset();\r\n");
      out.write("}\r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("<div class=\"header\">\r\n");
      out.write("\t<header>\r\n");
      out.write("\t\t<h1 class=\"logo\">(과정평가형 정보처리산업기사)학생관리 프로그램 ver 1.0</h1>\r\n");
      out.write("\t\t<nav class=\"navi\">\r\n");
      out.write("\t\t<ul>\r\n");
      out.write("\t\t\t\t<li><a href=\"insert.jsp\">학생정보등록</a></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"list.jsp\">학생정보조회</a></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"input.jsp\">성적정보등록</a></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"view.jsp\">학생성적조회</a></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"view2.jsp\">학년성적조회</a></li>\r\n");
      out.write("\t\t\t\t<li><a href=\"index.jsp\">홈으로</a></li>\r\n");
      out.write("\t\t\t</ul>\r\n");
      out.write("\t\t</nav>\r\n");
      out.write("\t</header>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"section\">\r\n");
      out.write("\t<section>\r\n");
      out.write("\t\t<h2 class=\"title\">학생성적 등록</h2>\r\n");
      out.write("\t\t<div class=\"content\">\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\t<form name=\"insert\" method=\"post\" action=\"input_pro.jsp\">\r\n");
      out.write("\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th>학번</th>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"hakbun\" value=\"\">예)1101</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th>국어점수</th>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"kor\" value=\"\"></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th>영어점수</th>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"eng\" value=\"\"></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th>수학점수</th>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"mat\" value=\"\"></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td colspan=\"2\" class=\"btn_group\">\r\n");
      out.write("\t\t\t\t\t\t<input type=\"button\" value=\"성적저장\" onClick=\"send()\">\r\n");
      out.write("\t\t\t\t\t\t<input type=\"button\" value=\"다시쓰기\" onClick=\"del()\"></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t\t<br><br>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t</section>\r\n");
      out.write("</div>\r\n");
      out.write("<div class=\"footer\">\r\n");
      out.write("\t<footer>\r\n");
      out.write("\t\t<p>HRDKOREA Copyright@2016 All rights reserve. Human Resources Development Service of Korea</p>\r\n");
      out.write("\t</footer>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
