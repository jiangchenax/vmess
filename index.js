const express = require("express");

const app = express();
const PORT = process.env.PORT || 3000;

app.get("/", (req, res) => {
  res.send("Node is running.");
});

app.get("/health", (req, res) => {
  res.json({
    status: "ok",
    service: "my-node-service",
    time: new Date().toISOString()
  });
});

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Service running on port ${PORT}`);
});
