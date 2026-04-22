<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>Forgot Password | EventCrewHub</title>
            <link rel="stylesheet" href="../../css/style.css">
        </head>

        <body
            style="display: flex; justify-content: center; align-items: center; min-height: 100vh; flex-direction: column;">

            <div class="content-card" style="max-width: 400px; width: 100%; text-align: center;">
                <h2>Forgot Password</h2>
                <p style="color: var(--text-muted); margin-bottom: 2rem;">
                    Enter your registered email to receive an OTP.
                </p>

                <c:if test="${not empty errorMessage}">
                    <div
                        style="background: rgba(239, 71, 111, 0.1); color: var(--danger); padding: 1rem; border-radius: 8px; margin-bottom: 1.5rem;">
                        ${errorMessage}
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/forgotPassword" method="post">
                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" name="email" placeholder="your@email.com" required>
                    </div>

                    <button type="submit" class="btn" style="width: 100%;">Send OTP</button>
                </form>

                <div style="margin-top: 1.5rem;">
                    <a href="${pageContext.request.contextPath}/login" style="color: var(--primary);">Back to Login</a>
                </div>
            </div>

        </body>

        </html>