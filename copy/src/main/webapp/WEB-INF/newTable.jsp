<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Table</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

</head>

<body>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Navbar</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/tables">All tables</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/home">my tables</a>
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

    <main>
        <div class="container-fluid">
            <form:form action="/tablet/new" method="POST" modelAttribute="tablet">
                <div class="form-group">
                    <form:label path="guestName" for="guestName">Guest name</form:label>
                    <form:errors path="guestName" class="badge text-bg-primary" />
                    <form:input type="text" class="form-control" id="guestName" path="guestName" />
                </div>
                <div class="form-group">
                    <form:label path="numberOfGuests" for="numberOfGuests">Creator</form:label>
                    <form:errors path="numberOfGuests" class="badge text-bg-primary" />
                    <form:select class="form-control" id="numberOfGuests" path="numberOfGuests" name="numberOfGuests" >
                        <c:forEach begin="1" end="10" var="number">
                            <option value="${number}"><c:out value="${number}" /></option>
                        </c:forEach>
                    </form:select>
                </div>
                <div class="form-group">
                    <form:label path="notes" for="notes">Current version</form:label>
                    <form:errors path="notes" class="badge text-bg-primary" />
                    <form:input type="text" class="form-control" id="notes" path="notes" />
                </div>
                <button type="submit" class="btn btn-primary">
                    Submit
                </button>
            </form:form>
        </div>
    </main>

</body>

</html>