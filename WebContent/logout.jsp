<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*" %>

<%
    // Invalidate the session
    HttpSession session1 = request.getSession(false);
    if (session != null) {
        session.invalidate();
    }
    
    // Redirect to the login page
    response.sendRedirect("login.jsp");
%>
