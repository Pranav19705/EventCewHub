<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <!DOCTYPE html>
        <html>

        <head>
            <title>Verify OTP | EventCrewHub</title>
            <link rel="stylesheet" href="../../css/style.css">
        </head>

        <body
            style="display: flex; justify-content: center; align-items: center; min-height: 100vh; flex-direction: column;">

            <div class="content-card" style="max-width: 400px; width: 100%; text-align: center;">
                <h2>Verify OTP</h2>
                <p style="color: var(--text-muted); margin-bottom: 2rem;">
                    Enter the 4-digit OTP sent to your email.
                </p>

                <c:if test="${not empty errorMessage}">
                    <div
                        style="background: rgba(239, 71, 111, 0.1); color: var(--danger); padding: 1rem; border-radius: 8px; margin-bottom: 1.5rem;">
                        ${errorMessage}
                    </div>
                </c:if>

                <form action="${pageContext.request.contextPath}/verifyResetOtp" method="post">
                    <div class="form-group">
                        <label>Enter 4-Digit OTP</label>
                        <input type="text" name="otp" placeholder="XXXX" required maxlength="4" pattern="[0-9]{4}"
                            style="text-align: center; font-size: 1.5rem; letter-spacing: 0.5rem;">
                    </div>

                    <button type="submit" class="btn" style="width: 100%;">Verify OTP</button>
                </form>
            </div>

        </body>

        </html>