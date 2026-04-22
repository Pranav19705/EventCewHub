<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>Reset Password | EventCrewHub</title>
            <link rel="stylesheet" href="../../css/style.css">
        </head>

        <body
            style="display: flex; justify-content: center; align-items: center; min-height: 100vh; flex-direction: column;">

            <div class="content-card" style="max-width: 400px; width: 100%; text-align: center;">
                <h2>Reset Password</h2>
                <p style="color: var(--text-muted); margin-bottom: 2rem;">
                    Enter your new password.
                </p>

                <c:if test="${not empty errorMessage}">
                    <div
                        style="background: rgba(239, 71, 111, 0.1); color: var(--danger); padding: 1rem; border-radius: 8px; margin-bottom: 1.5rem;">
                        ${errorMessage}
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/resetPassword" method="post">
                    <div class="form-group">
                        <label>New Password</label>
                        <input type="password" name="newPassword" placeholder="Enter new password" required
                            minlength="6">
                    </div>

                    <div class="form-group">
                        <label>Confirm Password</label>
                        <input type="password" name="confirmPassword" placeholder="Confirm new password" required
                            minlength="6">
                    </div>

                    <button type="submit" class="btn" style="width: 100%;">Reset Password</button>
                </form>
            </div>

        </body>

        </html>