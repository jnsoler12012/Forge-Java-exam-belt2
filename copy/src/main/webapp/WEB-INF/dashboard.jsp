<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

</head>

<body>
    <header>
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">Navbar</a>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="/tables">All tables</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Features</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Pricing</a>
                        </li>
                        <li class="nav-item">
                            <form id="logoutForm" method="POST" action="/logout">
                                <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
                                <input type="submit" class="btn btn-success" value="Logout">
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <main>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr>
                                <th>
                                    Guest Name <c:out value="${user.email}" />
                                </th>
                                <th>
                                    # of Ghests
                                </th>
                                <th>
                                    Arrived At
                                </th>
                                <th>
                                    Actions
                                </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test = "${user.tablets != null}">
                                <c:forEach items="${user.tablets}" var="tablet">
                                    <tr>
                                        <td>
                                            <c:out value="${tablet.guestName}" />
                                        </td>
                                        <td>
                                            <c:out value="${tablet.numberOfGuests}" />
                                        </td>
                                        <td>
                                            <c:out value="${tablet.createdAt}" />
                                        </td>
                                        <td>
                                            <form:form action="/tablet/${tablet.id}" method="delete">
                                                <input type="submit" value="finished" />
                                            </form:form>
                                            <form:form action="/tablet/${tablet.id}/edit" method="delete">
                                                <input type="submit" value="edit" />
                                            </form:form>
                                            <form:form action="/tablet/${tablet.id}/giveup" method="post">
                                                <input type="submit" value="Give Up" />
                                            </form:form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:if>
                            <c:if test = "${user.tablets == null}">
                                <tr>
                                    <td>No hay valores, agregue una tabla</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <form id="newTable" method="GET" action="/tablet/new">
            <input type="submit" class="btn btn-success" value="+ New table">
        </form>
    </main>

</body>

</html>