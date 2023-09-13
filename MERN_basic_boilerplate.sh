#!/bin/bash

# Create a directory for your MERN project
mkdir my-mern-boilerplate
cd my-mern-boilerplate

# Create the server directory and initialize a Node.js backend
mkdir server
cd server
npm init -y
npm install express body-parser cors mongoose

# Create a basic Express server file
cat <<EOF > server.js
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const app = express();
const port = process.env.PORT || 5000;

app.use(bodyParser.json());
app.use(cors());

app.get('/', (req, res) => {
  res.send('Hello from the backend!');
});

app.listen(port, () => {
  console.log(\`Server is running on port \${port}\`);
});
EOF

# Create the client directory and initialize a React frontend
cd ..
npx create-react-app client
cd client

# Create a proxy setup for the React app
cat <<EOF > src/setupProxy.js
const { createProxyMiddleware } = require('http-proxy-middleware');

module.exports = function (app) {
  app.use(
    '/api',
    createProxyMiddleware({
      target: 'http://localhost:5000',
      changeOrigin: true,
    })
  );
};
EOF

# Start the development environment
cd ..
npm install concurrently
cat <<EOF > start-dev.sh
#!/bin/bash
npm run start --prefix server & npm run start --prefix client
EOF
chmod +x start-dev.sh

# Provide instructions to the user
echo "MERN stack boilerplate setup completed!"
echo "To start the development environment, run './start-dev.sh'."
