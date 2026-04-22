<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>Create Event | EventCrewHub</title>
            <link rel="stylesheet" href="../../css/style.css">
            <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
        </head>

        <body>
            <div class="dashboard-container">
                <%@ include file="../common/sidebar.jsp" %>

                    <div class="main-content">
                        <div class="header">
                            <h2>Host a New Event</h2>
                            <a href="${pageContext.request.contextPath}/manager/dashboard"
                                class="btn btn-secondary">Back to Dashboard</a>
                        </div>

                        <div class="content-card" style="max-width: 800px; margin: 0 auto;">
                            <form action="${pageContext.request.contextPath}/createEvent" method="post">
                                <h3>Event Details</h3>
                                <div class="form-group">
                                    <label>Event Title</label>
                                    <input type="text" name="title" required placeholder="e.g. Summer Music Festival">
                                </div>

                                <div class="form-group">
                                    <div style="display: flex; gap: 1rem;">
                                        <div style="flex: 1;">
                                            <label>Date</label>
                                            <input type="date" name="date" required>
                                        </div>
                                        <div style="flex: 1;">
                                            <label>Venue</label>
                                            <input type="text" name="venue" required placeholder="City/Address">
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label>Budget (₹)</label>
                                    <input type="number" name="budget" step="0.01" required placeholder="5000">
                                </div>

                                <div class="form-group">
                                    <label>Required Roles (Hold Ctrl/Cmd to select multiple)</label>
                                    <select name="requiredRoles" multiple required style="height: 120px;">
                                        <option value="Promoter">Promoter</option>
                                        <option value="Coordinator">Coordinator</option>
                                        <option value="Production">Production Staff</option>
                                        <option value="Hospitality">Hospitality Staff</option>
                                        <option value="Security">Security</option>
                                        <option value="Tech">Tech Operator</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="description" rows="4"
                                        placeholder="Brief about the event..."></textarea>
                                </div>

                                <button type="submit" class="btn">Publish Event</button>
                                <a href="${pageContext.request.contextPath}/manager/dashboard" class="btn btn-secondary"
                                    style="margin-left: 1rem;">Cancel</a>
                            </form>
                        </div>
                    </div>
            </div>
        </body>

        </html>