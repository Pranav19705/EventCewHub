<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>Crew Dashboard | EventCrewHub</title>
            <link rel="stylesheet" href="../../css/style.css">
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
        </head>

        <body>
            <div class="dashboard-container">
                <%@ include file="../common/sidebar.jsp" %>

                    <div class="main-content">
                        <div class="header">
                            <h2>My Workbench</h2>
                            <span>Welcome, ${sessionScope.user.name}</span>
                        </div>

                        <c:if test="${not empty successMessage}">
                            <div
                                style="background: rgba(6, 214, 160, 0.1); color: #06d6a0; padding: 1rem; border-radius: 8px; margin-bottom: 1.5rem;">
                                ${successMessage}
                                <% session.removeAttribute("successMessage"); %>
                            </div>
                        </c:if>

                        <c:if test="${not empty errorMessage}">
                            <div
                                style="background: rgba(239, 71, 111, 0.1); color: #ef476f; padding: 1rem; border-radius: 8px; margin-bottom: 1.5rem;">
                                ${errorMessage}
                                <% session.removeAttribute("errorMessage"); %>
                            </div>
                        </c:if>

                        <div class="card-grid">
                            <div class="stats-card">
                                <div class="stats-info">
                                    <h3>${bookedEvents != null ? bookedEvents.size() : 0}</h3>
                                    <p>Active Jobs</p>
                                </div>
                            </div>

                        </div>

                        <div class="content-card" style="margin-top: 2rem;">
                            <h3>My Applications</h3>
                            <c:if test="${empty myApplications}">
                                <p style="padding: 1rem; color: var(--text-muted);">No applications yet. Apply to events
                                    below!</p>
                            </c:if>
                            <c:if test="${not empty myApplications}">
                                <div style="display: grid; gap: 1rem; margin-top: 1rem;">
                                    <c:forEach var="app" items="${myApplications}">
                                        <div
                                            style="border: 1px solid #333; border-radius: 8px; padding: 1rem; background: rgba(255,255,255,0.02);">
                                            <div
                                                style="display: flex; justify-content: space-between; align-items: start;">
                                                <div style="flex: 1;">
                                                    <h4 style="margin: 0 0 0.5rem 0;">${app.event.title}</h4>
                                                    <p style="color: var(--text-muted); margin: 0.25rem 0;">
                                                        📅 ${app.event.date} | 📍 ${app.event.venue}
                                                    </p>
                                                    <p style="color: var(--text-muted); margin: 0.25rem 0;">
                                                        💰 Budget: ₹${app.event.budget}
                                                    </p>
                                                </div>
                                                <div style="text-align: right;">
                                                    <c:choose>
                                                        <c:when test="${app.booking.status == 'PENDING'}">
                                                            <span
                                                                style="display: inline-block; background: rgba(255, 193, 7, 0.2); color: #ffc107; padding: 0.5rem 1rem; border-radius: 6px; font-weight: 600; margin-bottom: 0.5rem;">
                                                                ⏳ Waiting for Approval
                                                            </span>
                                                            <form
                                                                action="${pageContext.request.contextPath}/crew/cancelApplication"
                                                                method="post" style="margin-top: 0.5rem;">
                                                                <input type="hidden" name="bookingId"
                                                                    value="${app.booking.id}">
                                                                <button type="submit" class="btn btn-secondary"
                                                                    style="background: rgba(239, 71, 111, 0.1); color: #ef476f; border-color: #ef476f; padding: 0.4rem 0.8rem; font-size: 0.85rem;"
                                                                    onclick="return confirm('Are you sure you want to cancel this application?');">
                                                                    Cancel Application
                                                                </button>
                                                            </form>
                                                        </c:when>
                                                        <c:when test="${app.booking.status == 'ACCEPTED'}">
                                                            <span
                                                                style="display: inline-block; background: rgba(6, 214, 160, 0.2); color: #06d6a0; padding: 0.5rem 1rem; border-radius: 6px; font-weight: 600;">
                                                                ✅ Approved
                                                            </span>
                                                        </c:when>
                                                        <c:when test="${app.booking.status == 'REJECTED'}">
                                                            <span
                                                                style="display: inline-block; background: rgba(239, 71, 111, 0.2); color: #ef476f; padding: 0.5rem 1rem; border-radius: 6px; font-weight: 600;">
                                                                ❌ Rejected
                                                            </span>
                                                        </c:when>
                                                    </c:choose>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:if>
                        </div>

                        <div class="content-card" style="margin-top: 2rem;">
                            <h3>Job Opportunities</h3>
                            <c:if test="${empty availableEvents}">
                                <p style="padding: 1rem; color: var(--text-muted);">No current job opportunities
                                    available.</p>
                            </c:if>
                            <div class="card-grid" style="margin-top: 1rem;">
                                <c:forEach var="event" items="${availableEvents}">
                                    <div class="content-card" style="box-shadow: none; border: 1px solid #333;">
                                        <h4>${event.title}</h4>
                                        <p style="color: var(--text-muted); font-size: 0.9rem;">📍 ${event.venue} | 📅
                                            ${event.date}</p>
                                        <p style="margin: 0.5rem 0;">Roles:
                                            <c:forEach var="role" items="${event.requiredRoles}">
                                                <span
                                                    style="display:inline-block; background: rgba(58, 134, 255, 0.1); color: var(--primary); padding: 2px 8px; border-radius: 4px; font-size: 0.8rem; margin-right: 4px;">${role}</span>
                                            </c:forEach>
                                        </p>
                                        <p style="font-size: 0.9rem; margin-bottom: 1rem;">${event.description}</p>

                                        <!-- Check if user has already applied to this event -->
                                        <c:choose>
                                            <c:when test="${appliedEventIds.contains(event.id)}">
                                                <button class="btn" disabled
                                                    style="font-size: 0.9rem; padding: 0.5rem 1rem; background: rgba(6, 214, 160, 0.2); color: #06d6a0; cursor: not-allowed; border-color: #06d6a0;">
                                                    ✓ Applied
                                                </button>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="${pageContext.request.contextPath}/crew/viewEvent?id=${event.id}"
                                                    class="btn btn-secondary"
                                                    style="font-size: 0.9rem; padding: 0.5rem 1rem;">Details</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </c:forEach>
                            </div>
                            <div style="margin-top: 1rem;">
                                <a href="${pageContext.request.contextPath}/views/crew/updateProfile.jsp"
                                    class="btn btn-secondary">Update Profile</a>
                            </div>
                        </div>
                    </div>
            </div>
        </body>

        </html>