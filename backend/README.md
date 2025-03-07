# Promiedos Backend

This is the backend server for the Promiedos application, providing API endpoints for soccer data, user management, and real-time match updates.

## Tech Stack

- Node.js with TypeScript
- Express.js
- PostgreSQL
- Prisma ORM
- JWT Authentication

## Prerequisites

Before you begin, make sure you have the following installed:

- Node.js (v14 or higher)
- npm or yarn
- PostgreSQL (v13 or higher)
- A Sportradar API key (for soccer data)

## Setup Instructions

1. Install dependencies:

```bash
npm install
```

1. Set up your environment variables by copying the example file:

```bash
cp .env.example .env
```

1. Configure your `.env` file with the following variables:

```env
PORT=8080                    # Port where the server will run
SERVER_URL=localhost:8080    # URL where the server will be accessible
DATABASE_URL=string         # PostgreSQL connection string (format: postgresql://user:password@localhost:5432/database_name)
SPORTRADAR_API_KEY=string   # Your Sportradar API key for soccer data
HOST=string                 # Host URL for the server
```

1. Set up the database:

```bash
# Create the database tables
npm run prisma:migrate

# Seed initial data (if available)
npm run prisma:seed
```

1. Start the development server:

```bash
npm run dev
```

The server will start on the port specified in your `.env` file (default: 8080).

## Database Setup

1. Create a PostgreSQL database for the project
2. Update the `DATABASE_URL` in your `.env` file with your database credentials
3. Run the SQL scripts in the following order:

```bash
psql -d your_database_name -f promiedos.sql
psql -d your_database_name -f updateLogosARG.sql
psql -d your_database_name -f updateLogosLigas.sql
```

## API Documentation

The API endpoints are organized into the following categories:

- Authentication
- User Management
- Teams
- Matches
- Competitions
- Statistics

For detailed API documentation, please refer to the API documentation file (TODO: Add link to API docs).

## Error Handling

The API uses standard HTTP status codes for error responses:

- 200: Success
- 400: Bad Request
- 401: Unauthorized
- 403: Forbidden
- 404: Not Found
- 500: Internal Server Error

Error responses follow this format:

```json
{
  "error": {
    "message": "Error message here",
    "code": "ERROR_CODE"
  }
}
```
