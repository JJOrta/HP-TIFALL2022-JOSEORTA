const expresss = require('express');
const authRouter = express.Router(); //PROBABLY NEED TO CHANGE LOOK!
const auth = require('../middlewares/auth');

// add to do lists
authRouter.post('/api/addToDoList', auth, async(req, res) => {
  try {
    const {taskName, taskCompleted, onChanged, deleteFunction} = req.body;
  } catch (e) {
    res.status(500).son({error: e.message});
  }
})