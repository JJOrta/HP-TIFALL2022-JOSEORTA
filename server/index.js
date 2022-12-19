// IMPORTS FROM PACKAGES
const express = require('express');
const mongoose = require('mongoose');
// import 'package:express/express.dart'

// IMPORT FROM OTHER FILES
const authRouter = require('./routes/auth');
// import './features/auth/screens/auth_screen.dart'


// INIT
const PORT = 3000;
const app = express();
const DB = "mongodb+srv://jjorta:password12345678@cluster0.yy3qrqa.mongodb.net/?retryWrites=true&w=majority";

// middleware
// CLIENT -> middleware -> SERVER -> CLIENT
app.use(express.json());
app.use(authRouter);

// CREATING AN API
//http://<yourtipaddress>/hello-world
// GET, PUT, POST, DELETE, UPDATE -> CRUD

// Connections
mongoose.connect(DB).then(() => {
  console.log('Connection Successful');
}).catch((e) => {
  console.log(e);
});

app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});