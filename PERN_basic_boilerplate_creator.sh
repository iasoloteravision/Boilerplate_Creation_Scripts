#!/bin/bash

# Define your project name and directory
project_name="pern-stack-app"
project_dir="$HOME/$project_name"

# Create a directory for your project
mkdir -p "$project_dir"
cd "$project_dir"

# Initialize a Git repository
git init

# Create a package.json file for the Node.js backend
echo '{
  "name": "'"$project_name"'-backend",
  "version": "1.0.0",
  "description": "PERN Stack Backend",
  "scripts": {
    "start": "node index.js"
  },
  "dependencies": {
    "express": "^4.17.1",
    "pg": "^8.7.1"
  }
}' > package.json

# Install Node.js backend dependencies
npm install

# Create an Express.js server file (e.g., index.js)
echo 'const express = require("express");
const app = express();
const port = process.env.PORT || 5000;

app.get("/", (req, res) => {
  res.send("Hello, PERN stack!");
});

app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});' > index.js

# Initialize a PostgreSQL database and create a sample table
sudo -u postgres createdb "$project_name"
sudo -u postgres psql -d "$project_name" -c "CREATE TABLE items (id serial PRIMARY KEY, name VARCHAR(255) NOT NULL);"

# Create a package.json file for the React.js frontend
npx create-react-app client

# Move into the client directory
cd client

# Start the React development server
npm start

# Print instructions to access the development server
echo "Your PERN stack app is now set up. To start the development server, run 'cd $project_dir/client' and then 'npm start'."
