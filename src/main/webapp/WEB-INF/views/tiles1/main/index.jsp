<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<%
	String ctxPath = request.getContextPath();
    //     /board 
%>

<div class="container">
    <div style="width: 90%;">
		<div id="carousel_advertise" class="carousel slide" data-ride="carousel">
		  <ol class="carousel-indicators">
		    <%-- 
			    <li data-target="#carousel_advertise" data-slide-to="0" class="active"></li>
			    <li data-target="#carousel_advertise" data-slide-to="1"></li>
			    <li data-target="#carousel_advertise" data-slide-to="2"></li>
			    <li data-target="#carousel_advertise" data-slide-to="3"></li>
		    --%>
		    <c:forEach items="${requestScope.imgfilenameList}" varStatus="status">
		        <c:if test="${status.index == 0}">
		           <li data-target="#carousel_advertise" data-slide-to="${status.index}" class="active"></li>
			    </c:if>
			    <c:if test="${status.index > 0}">
		           <li data-target="#carousel_advertise" data-slide-to="${status.index}"></li>
			    </c:if>
		    </c:forEach>
		  </ol>
		  
		  <div class="carousel-inner">
		    <c:forEach var="imgfilename" items="${requestScope.imgfilenameList}" varStatus="status">
		        <c:if test="${status.index == 0}">
		           <div class="carousel-item active">
			    </c:if>
			    <c:if test="${status.index > 0}">
		           <div class="carousel-item">
			    </c:if>
			          <img src="<%= ctxPath%>/resources/images/${imgfilename}" class="d-block w-100" alt="..."> <!-- d-block 은 display: block; 이고  w-100 은 width 의 크기는 <div class="carousel-item active">의 width 100% 로 잡으라는 것이다. -->
				   </div>
		    </c:forEach>
		  </div>
		  
		  <a class="carousel-control-prev" href="#carousel_advertise" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carousel_advertise" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
		</div>
    </div>
  </div>
    