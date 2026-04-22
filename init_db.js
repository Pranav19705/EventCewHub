// MongoDB Initialization Script for EventCrewHub
// Usage: mongosh < init_db.js

// 1. Connect to Database
db = db.getSiblingDB("EventCrewHub");

// 2. Drop existing collections to start fresh
db.users.drop();
db.events.drop();
db.bookings.drop();
db.payments.drop();

// 3. Create Collections explicitly (optional but good for schema validation in future)
db.createCollection("users");
db.createCollection("events");
db.createCollection("bookings");
db.createCollection("payments");

// Hash for password "password"
// Generated using BCrypt (cost 10)
const passwordHash = "$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOcXBJD.W.9u";

// 4. Insert Users (Admin, Managers, Crew)

// Admin
db.users.insertOne({
    "name": "System Admin",
    "email": "admin@eventcrewhub.com",
    "password": passwordHash,
    "role": "ADMIN"
});

// Managers
var manager1 = db.users.insertOne({
    "name": "Sarah Jenkins",
    "email": "sarah@events.com",
    "password": passwordHash,
    "role": "MANAGER"
});

var manager2 = db.users.insertOne({
    "name": "Mike Ross",
    "email": "mike@festival.com",
    "password": passwordHash,
    "role": "MANAGER"
});

// Crew Members
var crew1 = db.users.insertOne({
    "name": "John Doe",
    "email": "john@crew.com",
    "password": passwordHash,
    "role": "CREW",
    "category": "Promoter",
    "experience": "Intermediate",
    "availability": "Weekends",
    "location": "New York",
    "skills": ["Crowd Control", "Ticket Scanning"],
    "rating": 4.5
});

var crew2 = db.users.insertOne({
    "name": "Alice Smith",
    "email": "alice@crew.com",
    "password": passwordHash,
    "role": "CREW",
    "category": "Tech",
    "experience": "Expert",
    "availability": "Anytime",
    "location": "Los Angeles",
    "skills": ["Sound Engineering", "Lighting"],
    "rating": 5.0
});

var crew3 = db.users.insertOne({
    "name": "Bob Brown",
    "email": "bob@crew.com",
    "password": passwordHash,
    "role": "CREW",
    "category": "Security",
    "experience": "Beginner",
    "availability": "Weekdays",
    "location": "Chicago",
    "skills": ["Bouncer", "First Aid"],
    "rating": 3.8
});

// 5. Insert Events
var event1 = db.events.insertOne({
    "managerId": manager1.insertedId,
    "title": "Summer Music Festival 2024",
    "date": "2024-07-15",
    "venue": "Central Park, NY",
    "budget": 50000.00,
    "description": "A large outdoor music festival requiring extensive security and tech support.",
    "requiredRoles": ["Security", "Tech", "Promoter"]
});

var event2 = db.events.insertOne({
    "managerId": manager2.insertedId,
    "title": "Tech Conference 2024",
    "date": "2024-09-10",
    "venue": "Convention Center, LA",
    "budget": 20000.00,
    "description": "Annual tech gathering.",
    "requiredRoles": ["Coordinator", "Hospitality"]
});

// 6. Insert Bookings
db.bookings.insertOne({
    "eventId": event1.insertedId,
    "crewId": crew2.insertedId, // Alice (Tech)
    "status": "PENDING",
    "paymentStatus": "PENDING",
    "agreedAmount": 500.00
});

db.bookings.insertOne({
    "eventId": event1.insertedId,
    "crewId": crew3.insertedId, // Bob (Security)
    "status": "CONFIRMED",
    "paymentStatus": "PAID",
    "agreedAmount": 300.00
});

print("Database 'EventCrewHub' initialized successfully with sample data.");
print("All users have password: 'password'");
