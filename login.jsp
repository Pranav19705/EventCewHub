<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>Login | EventCrewHub</title>
        <link rel="stylesheet" href="../../css/style.css">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
    </head>

    <body class="auth-container">
        <div class="auth-card">
            <h2>EventCrewHub Login</h2>
            <% if(request.getAttribute("errorMessage") !=null) { %>
                <p style="color:red">
                    <%= request.getAttribute("errorMessage") %>
                </p>
                <% } %>
                    <% if(request.getAttribute("successMessage") !=null) { %>
                        <p
                            style="color: #06d6a0; background: rgba(6, 214, 160, 0.1); padding: 1rem; border-radius: 8px;">
                            <%= request.getAttribute("successMessage") %>
                        </p>
                        <% } %>
                            <form action="<%=request.getContextPath()%>/login" method="post">
                                <div class="form-group">
                                    <label>Email</label>
                                    <input type="email" name="email" required placeholder="Enter your email">
                                </div>
                                <div class="form-group">
                                    <label>Password</label>
                                    <input type="password" name="password" required placeholder="Enter your password">
                                </div>
                                <div style="text-align: right; margin-bottom: 1rem;">
                                    <a href="<%=request.getContextPath()%>/forgotPassword"
                                        style="color: var(--primary); font-size: 0.9rem;">Forgot Password?</a>
                                </div>
                                <button type="submit" class="btn">Sign In</button>
                                <p style="margin-top: 1rem; color: #a0a0b0;">
                                    Don't have an account? <a href="register"
                                        style="color: var(--primary);">Register</a>
                                </p>
                            </form>
        </div>
    </body>

    </html>