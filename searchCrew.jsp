<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>Search Crew | EventCrewHub</title>
            <link rel="stylesheet" href="../../css/style.css">
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
        </head>

        <body>
            <div class="dashboard-container">
                <%@ include file="../common/sidebar.jsp" %>

                    <div class="main-content">
                        <div class="header">
                            <h2>Find Crew for Your Event</h2>
                            <a href="${pageContext.request.contextPath}/manager/dashboard"
                                class="btn btn-secondary">Back to Dashboard</a>
                        </div>

                        <c:if test="${empty eventId}">
                            <div class="content-card"
                                style="padding: 1rem; margin-bottom: 2rem; border-left: 4px solid var(--warning);">
                                <p>Please select an event from your dashboard.</p>
                            </div>
                        </c:if>

                        <div class="content-card">
                            <h3>Available Crew Members</h3>
                            <div class="filter-bar" style="margin-bottom: 1rem;">
                                <input type="text" id="searchInput" placeholder="Filter by skills, name..."
                                    style="max-width: 300px;">
                            </div>

                            <table>
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Role/Category</th>
                                        <th>Experience</th>
                                        <th>Rating</th>
                                        <th>Contact Information</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="crew" items="${crewList}">
                                        <tr>
                                            <td>${crew.name}</td>
                                            <td>${crew.category != null ? crew.category : 'General Crew'}</td>
                                            <td>${crew.experience != null ? crew.experience : 'N/A'}</td>
                                            <td>⭐ 4.5</td> <!-- Static for now -->
                                            <td>
                                                <div style="display: flex; flex-direction: column; gap: 0.5rem;">
                                                    <div style="display: flex; align-items: center; gap: 0.5rem;">
                                                        <span
                                                            style="color: var(--text-muted); font-size: 0.85rem;">📧</span>
                                                        <a href="mailto:${crew.email}"
                                                            style="color: var(--primary); text-decoration: none; font-size: 0.9rem;"
                                                            title="Send email to ${crew.name}">
                                                            ${crew.email}
                                                        </a>
                                                    </div>
                                                    <c:if test="${not empty crew.phone}">
                                                        <div style="display: flex; align-items: center; gap: 0.5rem;">
                                                            <span
                                                                style="color: var(--text-muted); font-size: 0.85rem;">📱</span>
                                                            <a href="tel:${crew.phone}"
                                                                style="color: var(--primary); text-decoration: none; font-size: 0.9rem;"
                                                                title="Call ${crew.name}">
                                                                ${crew.phone}
                                                            </a>
                                                        </div>
                                                    </c:if>
                                                </div>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
            </div>
            <script>
                document.getElementById('searchInput').addEventListener('keyup', function (e) {
                    const term = e.target.value.toLowerCase();
                    document.querySelectorAll('tbody tr').forEach(row => {
                        const text = row.innerText.toLowerCase();
                        row.style.display = text.includes(term) ? '' : 'none';
                    });
                });
            </script>
        </body>

        </html>