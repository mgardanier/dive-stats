var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/api', function(req, res) {
  res.json({ title: 'Helldivers II' });
});

module.exports = router;
