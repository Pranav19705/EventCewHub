<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>Manager Dashboard | EventCrewHub</title>
            <link rel="stylesheet" href="../../css/style.css">
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
        </head>

        <body>
            <div class="dashboard-container">
                <%@ include file="../common/sidebar.jsp" %>

                    <div class="main-content">
                        <div class="header">
                            <h2>My Events</h2>
                            <a href="${pageContext.request.contextPath}/views/manager/createEvent.jsp"
                                class="btn">Create New Event</a>
                        </div>

                        <c:if test="${empty myEvents}">
                            <div class="content-card" style="text-align: center; padding: 3rem;">
                                <h3>No events created yet</h3>
                                <p style="color: var(--text-muted); margin-bottom: 1rem;">Start organizing your next big
                                    event!</p>
                                <a href="${pageContext.request.contextPath}/views/manager/createEvent.jsp"
                                    class="btn btn-secondary">Create Event</a>
                            </div>
                        </c:if>

                        <div class="card-grid">
                            <c:forEach var="event" items="${myEvents}">
                                <div class="content-card">
                                    <h3>${event.title}</h3>
                                    <p style="margin-bottom: 0.5rem; color: var(--text-muted);">
                                        <span style="color: var(--primary);">📍</span> ${event.venue}
                                    </p>
                                    <p style="margin-bottom: 1rem; color: var(--text-muted);">
                                        <span style="color: var(--primary);">📅</span> ${event.date}
                                    </p>
                                    <p style="margin-bottom: 1rem;">Budget: <strong>₹${event.budget}</strong></p>
                                    <div style="display: flex; gap: 0.5rem; flex-wrap: wrap;">
                                        <a href="${pageContext.request.contextPath}/manager/viewApplications?eventId=${event.id}"
                                            class="btn" style="flex: 1; text-align: center; min-width: 140px;">View
                                            Applications</a>
                                        <a href="${pageContext.request.contextPath}/manager/searchCrew?eventId=${event.id}"
                                            class="btn btn-secondary"
                                            style="flex: 1; text-align: center; min-width: 140px;">Find Crew</a>

                                        <form action="${pageContext.request.contextPath}/manager/deleteEvent"
                                            method="post" style="width: 100%; margin-top: 0.5rem;"
                                            onsubmit="return confirm('Are you sure you want to delete this event? This action cannot be undone and will cancel all applications.');">
                                            <input type="hidden" name="eventId" value="${event.id}">
                                            <button type="submit" class="btn btn-secondary"
                                                style="width: 100%; border-color: #ef476f; color: #ef476f; background: rgba(239, 71, 111, 0.1);">
                                                Delete Event
                                            </button>
                                        </form>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
            </div>
        </body>

        </html>