<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>Crew Applications | EventCrewHub</title>
            <link rel="stylesheet" href="../../css/style.css">
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
        </head>

        <body>
            <div class="dashboard-container">
                <%@ include file="../common/sidebar.jsp" %>

                    <div class="main-content">
                        <div class="header">
                            <h2>Applications for: ${event.title}</h2>
                            <a href="${pageContext.request.contextPath}/manager/dashboard"
                                class="btn btn-secondary">Back to Dashboard</a>
                        </div>

                        <c:if test="${not empty successMessage}">
                            <div
                                style="background: rgba(6, 214, 160, 0.1); color: #06d6a0; padding: 1rem; border-radius: 8px; margin-bottom: 1.5rem;">
                                ${successMessage}
                            </div>
                        </c:if>

                        <div class="content-card">
                            <h3>Event Details</h3>
                            <p><strong>Date:</strong> ${event.date}</p>
                            <p><strong>Venue:</strong> ${event.venue}</p>
                            <p><strong>Budget:</strong> ₹${event.budget}</p>
                        </div>

                        <div class="content-card" style="margin-top: 2rem;">
                            <h3>Crew Applications</h3>

                            <c:if test="${empty applications}">
                                <p style="color: var(--text-muted); text-align: center; padding: 2rem;">No applications
                                    yet.</p>
                            </c:if>

                            <c:forEach var="app" items="${applications}">
                                <div
                                    style="border: 1px solid #333; border-radius: 8px; padding: 1.5rem; margin-bottom: 1rem; background: rgba(255,255,255,0.02);">
                                    <div style="display: flex; justify-content: space-between; align-items: start;">
                                        <div style="flex: 1;">
                                            <h4 style="margin: 0 0 0.5rem 0;">${app.crew.name}</h4>
                                            <p style="color: var(--text-muted); margin: 0.25rem 0;">
                                                <strong>Email:</strong> ${app.crew.email}
                                            </p>
                                            <p style="color: var(--text-muted); margin: 0.25rem 0;">
                                                <strong>Phone:</strong> ${app.crew.phone != null ? app.crew.phone : 'Not
                                                provided'}
                                            </p>
                                            <p style="color: var(--text-muted); margin: 0.25rem 0;">
                                                <strong>Category:</strong> ${app.crew.category != null ?
                                                app.crew.category : 'Not specified'}
                                            </p>
                                            <p style="color: var(--text-muted); margin: 0.25rem 0;">
                                                <strong>Experience:</strong> ${app.crew.experience != null ?
                                                app.crew.experience : 'Not specified'}
                                            </p>
                                            <p style="color: var(--text-muted); margin: 0.25rem 0;">
                                                <strong>Location:</strong> ${app.crew.location != null ?
                                                app.crew.location : 'Not specified'}
                                            </p>
                                            <p style="margin: 0.5rem 0 0 0;">
                                                <span
                                                    style="padding: 4px 12px; border-radius: 4px; font-size: 0.85rem;
                                        background: ${app.booking.status == 'PENDING' ? 'rgba(255, 193, 7, 0.1)' : app.booking.status == 'ACCEPTED' ? 'rgba(6, 214, 160, 0.1)' : 'rgba(239, 71, 111, 0.1)'};
                                        color: ${app.booking.status == 'PENDING' ? '#ffc107' : app.booking.status == 'ACCEPTED' ? '#06d6a0' : '#ef476f'};">
                                                    ${app.booking.status}
                                                </span>
                                            </p>
                                        </div>

                                        <c:if test="${app.booking.status == 'PENDING'}">
                                            <div style="display: flex; gap: 0.5rem;">
                                                <form
                                                    action="${pageContext.request.contextPath}/manager/approveApplication"
                                                    method="post" style="display: inline;">
                                                    <input type="hidden" name="bookingId" value="${app.booking.id}">
                                                    <input type="hidden" name="eventId" value="${event.id}">
                                                    <input type="hidden" name="action" value="approve">
                                                    <button type="submit" class="btn"
                                                        style="padding: 0.5rem 1rem; font-size: 0.9rem;">Approve</button>
                                                </form>
                                                <form
                                                    action="${pageContext.request.contextPath}/manager/approveApplication"
                                                    method="post" style="display: inline;">
                                                    <input type="hidden" name="bookingId" value="${app.booking.id}">
                                                    <input type="hidden" name="eventId" value="${event.id}">
                                                    <input type="hidden" name="action" value="reject">
                                                    <button type="submit" class="btn btn-secondary"
                                                        style="padding: 0.5rem 1rem; font-size: 0.9rem; background: rgba(239, 71, 111, 0.1); color: #ef476f;">Reject</button>
                                                </form>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
            </div>
        </body>

        </html>