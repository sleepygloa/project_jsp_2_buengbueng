<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="/buengbueng/js/menu/menu.js"></script>
    	
			<tr>
			<td>제 품</td><td>제조사</td><td>가 격</td>
			</tr>
		<c:forEach var="menu" items="${menuList}">
		<tr>
			<td>${menu.name}</td>	<td>${menu.company}</td> 	<td>${menu.price}</td>
			<td><input type="button" name="order" value="주 문" onclick="window.location='userOrderPro.do?order=${menu.name}'">
			</td>
		</tr>		
		</c:forEach>
		
	