<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>Register | EventCrewHub</title>
        <link rel="stylesheet" href="../../css/style.css">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
    </head>

    <body class="auth-container">
        <div class="auth-card" style="max-width: 500px;">
            <h2>Join EventCrewHub</h2>
            <% if(request.getAttribute("errorMessage") !=null) { %>
                <p style="color:red; background: rgba(239, 71, 111, 0.1); padding: 1rem; border-radius: 8px;">
                    <%= request.getAttribute("errorMessage") %>
                </p>
                <% } %>
                    <form action="<%=request.getContextPath()%>/register" method="post">
                        <div class="form-group">
                            <label>Full Name</label>
                            <input type="text" name="name" required placeholder="John Doe" minlength="3">
                        </div>
                        <div class="form-group">
                            <label>Email Address</label>
                            <input type="email" name="email" required placeholder="john@example.com"
                                pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
                            <small style="color: var(--text-muted); font-size: 0.85rem;">Enter a valid email
                                address</small>
                        </div>
                        <div class="form-group">
                            <label>Phone Number</label>
                            <input type="tel" name="phone" required placeholder="+91 98765 43210"
                                pattern="[0-9+\s-]{10,15}">
                            <small style="color: var(--text-muted); font-size: 0.85rem;">Enter your contact
                                number</small>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" name="password" required placeholder="Create a secure password"
                                minlength="6">
                            <small style="color: var(--text-muted); font-size: 0.85rem;">Minimum 6 characters</small>
                        </div>
                        <div class="form-group">
                            <label>Role</label>
                            <select name="role" required>
                                <option value="" disabled selected>Select your role</option>
                                <option value="MANAGER">Event Manager (Hire Crew)</option>
                                <option value="CREW">Crew Member (Find Work)</option>
                                <!-- Admin role is usually manually assigned but we allow it for demo -->
                                <option value="ADMIN">System Admin</option>
                            </select>
                        </div>
                        <button type="submit" class="btn">Create Account</button>
                        <p style="margin-top: 1rem; color: #a0a0b0;">
                            Already have an account? <a href="login" style="color: var(--primary);">Login</a>
                        </p>
                    </form>
        </div>
    </body>

    </html>