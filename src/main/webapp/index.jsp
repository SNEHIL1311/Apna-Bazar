<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="p1.*" %>
    <%@ page import="java.util.*" %>
    <% 
    	connect c1= new connect(); 
    	ArrayList<String> arr=c1.getCategory();
    	String category="";
    	category = request.getParameter("category");
    	if(category==null)
    	{
    		category="all";
    	}
    	ArrayList<Products> data = c1.getAllRecords(category);
    %>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="style.css"/>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Apna Bazar</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<div class="m">
	<div class="navdiv fixed-top">
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a href="index.jsp?category=all" class="navbar-brand">ApnaBazar</a>
            <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav">
                    <a href="index.jsp?category=all" class="nav-item nav-link <%= request.getParameter("category") == null || request.getParameter("category").equals("all") ? "active" : "" %>">Home</a>
                    
                    <%
                    for(int i=0;i<arr.size();i++)
                    {
                    	String s = (String)arr.get(i);%>
                    	<a href="index.jsp?category=<%=s %>" class="nav-item nav-link <%= request.getParameter("category") != null && request.getParameter("category").equals(s) ? "active" : "" %>"><%=s%></a>
                    
                    <%} %>
                </div>
                <div class="navbar-nav ms-auto">
                    <a href="#" class="nav-item nav-link">Login</a>
                </div>
            </div>
        </div>
    </nav>
    </div>
    <div class="items">
    <%for(int i=0;i<data.size();i++){ 
    	Products p=(Products)data.get(i);%>
    	<div class="card" style="border: 1px solid darkgrey;border-radius: 1rem;">
        	<img src="<%=p.getImage() %>" class="card-img-top" alt="Sample Image">
        	<i class="fa-regular fa-heart"></i>
        	<div class="card-body text-left" data-toggle="tooltip" data-placement="bottom" title="<%=p.getTitle() %>">
            	<h5 class="card-text wtext"><%=p.getTitle() %></h5>
            	<p class="card-text"><%=p.getRate() %><i class="fa-solid fa-star"> </i> (<%=p.getCount()%> Ratings)</p>
            	<div class="sameline">
            	<h5 class="card-title"><i class="fa-solid fa-dollar-sign"></i> <%=p.getPrice() %></h5>
            	<a href="#" class="btn btn-dark">Add to cart</a>
            	</div>
        	</div>
    	</div><%} %>
    </div>
</div>
<script></script>
</body>
</html>