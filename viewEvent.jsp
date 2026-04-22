<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
            <!DOCTYPE html>
            <html>

            <head>
                <title>${event.title} | Event Details</title>
                <link rel="stylesheet" href="../../css/style.css">
                <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap"
                    rel="stylesheet">
            </head>

            <body>
                <div class="dashboard-container">
                    <%@ include file="../common/sidebar.jsp" %>

                        <div class="main-content">
                            <div class="header">
                                <h2>Event Details</h2>
                                <a href="${pageContext.request.contextPath}/crew/dashboard"
                                    class="btn btn-secondary">Back to Dashboard</a>
                            </div>

                            <div class="content-card">
                                <h2>${event.title}</h2>
                                <p style="color: var(--text-muted); margin-bottom: 0.5rem;">
                                    <span style="display:inline-block; width: 20px;">📅</span> ${event.date}
                                </p>
                                <p style="color: var(--text-muted); margin-bottom: 0.5rem;">
                                    <span style="display:inline-block; width: 20px;">📍</span> ${event.venue}
                                </p>
                                <p style="color: var(--text-muted); margin-bottom: 1.5rem;">
                                    <span style="display:inline-block; width: 20px;">💰</span> Budget: ₹${event.budget}
                                </p>

                                <h4 style="margin-bottom: 0.5rem;">Description</h4>
                                <p style="margin-bottom: 1.5rem;">${event.description}</p>

                                <h4 style="margin-bottom: 0.5rem;">Required Roles</h4>
                                <div style="display: flex; gap: 0.5rem; flex-wrap: wrap; margin-bottom: 2rem;">
                                    <c:forEach var="role" items="${event.requiredRoles}">
                                        <span
                                            style="background: rgba(58, 134, 255, 0.1); color: var(--primary); padding: 4px 12px; border-radius: 4px;">${role}</span>
                                    </c:forEach>
                                </div>

                                <div style="border-top: 1px solid #333; padding-top: 1.5rem;">
                                    <form action="${pageContext.request.contextPath}/crew/acceptEvent" method="post">
                                        <input type="hidden" name="eventId" value="${event.id}">
                                        <button type="submit" class="btn"
                                            style="padding: 0.75rem 2rem; font-size: 1rem;">Accept & Apply</button>
                                    </form>
                                    <p style="margin-top: 1rem; color: var(--text-muted); font-size: 0.9rem;">
                                        By clicking "Accept & Apply", you are expressing interest in this event. The
                                        event manager will review your profile.
                                    </p>
                                </div>
                            </div>
                        </div>
                </div>
            </body>

            </html>