<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
            <!DOCTYPE html>
            <html>

            <head>
                <title>Update Profile | EventCrewHub</title>
                <link rel="stylesheet" href="../../css/style.css">
                <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap"
                    rel="stylesheet">
            </head>

            <body>
                <div class="dashboard-container">
                    <%@ include file="../common/sidebar.jsp" %>

                        <div class="main-content">
                            <div class="header">
                                <h2>Edit Your Profile</h2>
                                <a href="${pageContext.request.contextPath}/crew/dashboard"
                                    class="btn btn-secondary">Back
                                    to Dashboard</a>
                            </div>

                            <div class="content-card" style="max-width: 600px; margin: 0 auto;">
                                <form action="${pageContext.request.contextPath}/updateProfile" method="post">
                                    <div class="form-group">
                                        <label>Professional Category</label>
                                        <select name="category" required>
                                            <option value="Promoter" ${sessionScope.user.category=='Promoter'
                                                ? 'selected' : '' }>Promoter</option>
                                            <option value="Coordinator" ${sessionScope.user.category=='Coordinator'
                                                ? 'selected' : '' }>Event Coordinator</option>
                                            <option value="Production" ${sessionScope.user.category=='Production'
                                                ? 'selected' : '' }>Production Staff</option>
                                            <option value="Hospitality" ${sessionScope.user.category=='Hospitality'
                                                ? 'selected' : '' }>Hospitality / Wait Staff</option>
                                            <option value="Security" ${sessionScope.user.category=='Security'
                                                ? 'selected' : '' }>Security</option>
                                            <option value="Tech" ${sessionScope.user.category=='Tech' ? 'selected' : ''
                                                }>
                                                Sound/Light Technician</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label>Experience Level</label>
                                        <select name="experience" required>
                                            <option value="Beginner" ${sessionScope.user.experience=='Beginner'
                                                ? 'selected' : '' }>Beginner (0-1 years)</option>
                                            <option value="Intermediate" ${sessionScope.user.experience=='Intermediate'
                                                ? 'selected' : '' }>Intermediate (1-3 years)</option>
                                            <option value="Expert" ${sessionScope.user.experience=='Expert' ? 'selected'
                                                : '' }>Expert (3+ years)</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <label>Skills (Comma separated)</label>
                                        <c:set var="userSkills" value="" />
                                        <c:if test="${sessionScope.user.skills != null}">
                                            <c:forEach var="skill" items="${sessionScope.user.skills}"
                                                varStatus="status">
                                                <c:set var="userSkills"
                                                    value="${userSkills}${skill}${!status.last ? ', ' : ''}" />
                                            </c:forEach>
                                        </c:if>
                                        <input type="text" name="skills" value="${userSkills}"
                                            placeholder="e.g. Crowd Management, Ticket Scanning, First Aid">
                                    </div>

                                    <div class="form-group">
                                        <label>Current Location</label>
                                        <input type="text" name="location" value="${sessionScope.user.location}"
                                            placeholder="City, Area" required>
                                    </div>

                                    <div class="form-group">
                                        <label>Availability</label>
                                        <select name="availability">
                                            <option value="Weekdays" ${sessionScope.user.availability=='Weekdays'
                                                ? 'selected' : '' }>Weekdays</option>
                                            <option value="Weekends" ${sessionScope.user.availability=='Weekends'
                                                ? 'selected' : '' }>Weekends</option>
                                            <option value="Anytime" ${sessionScope.user.availability=='Anytime'
                                                ? 'selected' : '' }>Anytime</option>
                                        </select>
                                    </div>

                                    <button type="submit" class="btn">Save Profile</button>
                                    <a href="${pageContext.request.contextPath}/crew/dashboard"
                                        class="btn btn-secondary" style="margin-left: 1rem;">Cancel</a>
                                </form>
                            </div>
                        </div>
                </div>
            </body>

            </html>