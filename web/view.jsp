<%-- 
    Document   : viewCart
    Created on : Jan 13, 2021, 1:11:04 PM
    Author     : AVITA
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Cart</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    </head>
    <body>
        <jsp:include page="navbar.jsp"/>
        <div class="container">
            <c:set var="cart" value="${sessionScope.CART}"></c:set>
            <c:if test="${not empty cart}">
                <h1>Your Cart Includes</h1>
            </c:if>

            <div class="form-row mb-2 mt-3">
                <div class="col-md-3">
                    <a href="search.jsp" class="btn btn-primary">Add More Items To Cart</a>
                </div>
            </div>

            <c:set var="mapFood" value="${cart.food}"></c:set>
            <c:set var="confirmError" value="${requestScope.CONFIRM_ERROR}"/>
            <c:if test="${not empty confirmError}">
                <p class="alert alert-danger">
                    <c:forEach var="item" items="${confirmError}">
                        <font color="red">${item}<br/></font>
                    </c:forEach>
                </p>
            </c:if>

            <c:if test="${not empty cart}">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>FoodName</th>
                            <th>Price</th>
                            <th>Category</th>
                            <th>Description</th>
                            <th>Amount</th>
                            <th>Image</th>
                            <th>Total</th>
                            <th>Update</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="item" items="${cart.items}" varStatus="counter" >
                        <form action="DispatcherController">
                            <tr>
                                <c:set var="foodId" value="${item.key}"/>
                                <c:set var="amount" value="${item.value}"></c:set>
                                <c:set var="foodDto" value="${mapFood.get(foodId)}" ></c:set>

                                    <td>${counter.count}</td>
                                <td>${foodDto.foodname}</td>
                                <td>${cart.getPriceDisplay(foodId)}</td>
                                <td>${foodDto.getCategoryname(foodDto.categoriID)}</td>
                                <td>${foodDto.description}</td>
                                <td><input class="form-control" type="text" name="txtAmount" value="${amount}" /></td>
                                <td><img src="${foodDto.imageLink}" width="150"/></td> 
                                <td>${cart.getPriceOfEachItemDisplay(foodId)}</td>
                                <td>
                                    <input type="hidden" name="txtFoodId" value="${foodId}" />
                                    <input class="btn btn-info" type="submit" name="btAction" value="Update Item" />
                                </td>
                                <td>
                                    <c:url var="deleteUrl" value="DispatcherController?btAction=DeleteItem">
                                        <c:param name="txtFoodId" value="${foodId}"> </c:param>
                                    </c:url>
                                    <a class="btn btn-danger" href="${deleteUrl}" onclick="return confirm('Are you sure to remove item?');">Delete</a>
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                    <tr>
                        <td colspan="5"></td>
                        <td>Total Price: ${cart.totalPriceDisplay}</td>
                        <td colspan="4">                    
                            <form action="DispatcherController" method="POST">
                                <div> 
                                    <input class="btn btn-success ml-5" type="submit" name="btAction" value="Confirm Booking" onclick="return confirm('Are you sure to Confirm?');"/>       
                                </div>
                            </form> 
                        </td>
                    </tr>
                    </tbody>
                </table>
            </c:if>
            <c:if test="${empty cart}">
                <img class="container border rounded mt-3 mr-5 mb-4" src="img/empty-cart2.png" width="400" height="450" />
            </c:if>
        </div>
    </body>
    <c:if test="${not empty cart}">
        <jsp:include page="footer.jsp"/>
    </c:if>

</html>
