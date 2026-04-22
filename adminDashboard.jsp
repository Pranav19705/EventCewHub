<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>Admin Dashboard | EventCrewHub</title>
            <link rel="stylesheet" href="../../css/style.css">
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
        </head>

        <body>
            <div class="dashboard-container">
                <%@ include file="../common/sidebar.jsp" %>

                    <div class="main-content">
                        <div class="header">
                            <h2>System Overview</h2>
                            <span>Welcome, Admin</span>
                        </div>

                        <div class="card-grid">
                            <div class="stats-card">
                                <div class="stats-info">
                                    <h3>${userList.size()}</h3>
                                    <p>Registered Users</p>
                                </div>
                            </div>
                            <div class="stats-card">
                                <div class="stats-info">
                                    <h3>${eventList.size()}</h3>
                                    <p>Total Events</p>
                                </div>
                            </div>
                            <div class="stats-card">
                                <div class="stats-info">
                                    <h3>12</h3>
                                    <p>Pending Approvals</p>
                                </div>
                            </div>
                            <div class="stats-card">
                                <div class="stats-info">
                                    <h3>$45,200</h3>
                                    <p>Total Bookings Value</p>
                                </div>
                            </div>
                        </div>

                        <div class="content-card" style="margin-top: 2rem;">
                            <h3>Recent Users</h3>
                            <table>
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Email</th>
                                        <th>Role</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="user" items="${userList}">
                                        <tr>
                                            <td>${user.name}</td>
                                            <td>${user.email}</td>
                                            <td><span class="status-badge status-accepted">${user.role}</span></td>
                                            <td><button class="btn btn-secondary"
                                                    style="padding: 0.25rem 0.5rem; font-size: 0.8rem;">View</button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
            </div>
        </body>

        </html>