<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <div class="sidebar">
        <h2 style="padding-left: 1rem;">EventCrewHub</h2>
        <ul class="nav-links">
            <c:choose>
                <c:when test="${sessionScope.user.role == 'ADMIN'}">
                    <li><a href="${pageContext.request.contextPath}/admin/dashboard">Dashboard</a></li>
                    <li><a href="#">Manage Users</a></li>
                    <li><a href="#">System Reports</a></li>
                </c:when>
                <c:when test="${sessionScope.user.role == 'MANAGER'}">
                    <li><a href="${pageContext.request.contextPath}/manager/dashboard">Dashboard</a></li>
                    <li><a href="${pageContext.request.contextPath}/views/manager/createEvent.jsp">Create Event</a></li>
                    <li><a href="${pageContext.request.contextPath}/manager/searchCrew">Find Crew</a></li>
                    <li><a href="${pageContext.request.contextPath}/manager/dashboard">My Bookings</a></li>
                </c:when>
                <c:when test="${sessionScope.user.role == 'CREW'}">
                    <li><a href="${pageContext.request.contextPath}/crew/dashboard">Dashboard</a></li>
                    <li><a href="${pageContext.request.contextPath}/views/crew/updateProfile.jsp">My Profile</a></li>
                    <li><a href="${pageContext.request.contextPath}/crew/dashboard">Job Opportunities</a></li>

                </c:when>
            </c:choose>
            <li><a href="${pageContext.request.contextPath}/logout" style="color: var(--danger);">Logout</a></li>
        </ul>
    </div>