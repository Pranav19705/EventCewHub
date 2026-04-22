// MongoDB Update Script to change Admin credentials

// Connect to the DB
db = db.getSiblingDB("EventCrewHub");

// Find the admin user (assuming there's only one with role 'ADMIN')
// and update their name, email, and password.
var adminUpdateResult = db.users.updateOne(
    { role: "ADMIN" },
    {
        $set: {
            name: "pranav",
            email: "pranavmohite612@gmail.com",
            password: "$2b$12$4A7bDCXLdw6D6T4OwBRh3e5nb8v0ZjB.69IOQ366A07EwlJsbPhre" // New BCrypt Hash for 'P1972005'
        }
    }
);

if (adminUpdateResult.matchedCount === 1) {
    print("Successfully updated Admin user:");
    print("Name: pranav");
    print("Email: pranavmohite612@gmail.com");
} else {
    print("Error: Admin user not found!");
}
