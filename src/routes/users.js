const database = require('../services/database');
const express = require('express');
const router = express.Router();

router.get('/', (req, res) => {
    database.listAllUsers(req.query.pageToken)
        .then(data => {
            res.send(data);
        })
        .catch(e => {
            res.status(500).send(e)
        })
});

router.post('/create', (req, res) => {
    database.createUser(req.body)
        .then((data) => {
            res.send(data);
        })
        .catch(e => {
            res.status(500).send(e)
        })
});

router.post('/update', (req, res) => {
    database.updateUser(req.body)
        .then((data) => {
            res.send(data);
        })
        .catch(e => {
            res.status(500).send(e)
        })
});

router.post('/delete', (req, res) => {
    database.deleteUser(req.body)
        .then((data) => {
            res.send(data);
        })
        .catch(e => {
            res.status(500).send(e)
        })
});

router.post('/details', (req, res) => {
    database.getMoreUserDetails(req.body)
        .then((data) => {
            res.send(data);
        })
        .catch(e => {
            res.status(500).send(e)
        })
});

router.post('/updateMargins', (req, res) => {
    database.updateMargins(req.body)
        .then((data) => {
            res.send(data);
        })
        .catch(e => {
            res.status(500).send(e)
        })
});

router.post('/login', (req, res) => {
    database.authenticateUser(req.body.email, req.body.password)
        .then((data) => {
            res.send(data);
        })
        .catch(e => {
            res.status(401).send({ error: e.message })
        })
});

router.get('/validate', (req, res) => {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1];

    if (!token) {
        return res.status(401).json({ error: 'Access token required' });
    }

    database.verifyToken(token)
        .then((user) => {
            res.send(user);
        })
        .catch(e => {
            res.status(403).send({ error: 'Invalid or expired token' })
        })
});

module.exports = router;