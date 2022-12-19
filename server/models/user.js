const mongoose = require('mongoose');

const userSchema = mongoose.Schema({
  name: {
    required: true,
    type: String,
    trim: true, //removes spaces in inputs
  },
  email: {
    required: true,
    type: String,
    trim: true,
    validate: {
      validator: (value) => {
        // Regex is a sequence of characters that specify a search pattern in a text.
        const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
        return value.match(re); // whatever value you enter, it will match it for match and return it
      },
      message: 'Please enter a valid email address', // this triggers when the validator is false
    },
  },
  password: {
    required: true,
    type: String,
    validate: {
      validator: (value) => {
        
        return value.length > 6; //minimum characters for a password, if it does not meet this minimum requirement, it will not allow the inputed password
      },
      message: 'Please enter a long password', // this triggers when it does not meet the password minimum character requirement
    },
  },
  address: {
    type: String,
    default: '',
  },
  type: {
    type: String,
    default: 'user',
  },
  // cart
});

const User = mongoose.model('User', userSchema);
module.exports = User;