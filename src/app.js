const express = require('express');
const app = express();
const morgan = require('morgan');
const bodyParser = require('body-parser')

const addressesRoutes = require('../API/routes/addresses')

app.use(morgan('dev'));
app.use(bodyParser.urlencoded({extended:false}))
app.use(bodyParser.json())

app.use((req, res, next)=>{
    res.header('Acces-Control-Allow-Origin', '*');
    res.header('Acces-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept, Authorization');
    if (req.method === 'OPTIONS'){
        res.header('Acces-Control-Allow-Method', 'PUT, POST, PATCH, DELETE, GET')
        return res.status(200).json({})
    }
    next();
});

app.use('/addresses',addressesRoutes)

app.use((req,res,next)=>{
    const error = new Error('Not Found');
    error.status= 404 ;
    next(error);
});

app.use((error,req,res,next)=>{
    res.status(error.status || 500);
    res.json({
        error: {
            message: error.message
        }
    });
});

module.exports = app;