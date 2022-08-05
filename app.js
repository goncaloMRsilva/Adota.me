var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

var indexRouter = require('./routes/index');
var userRouter = require('./routes/user');
var loginRouter =     require("./routes/login");
var catalogRouter = require("./routes/catalog");
var animalRouter = require("./routes/animal");
var requestRouter = require("./routes/request");
var adoptRouter = require("./routes/adopt");
var donateRouter = require("./routes/donate");
var missingRouter = require("./routes/missing");
var notificationRouter = require("./routes/notification");
var permissionRouter = require("./routes/permission");
var profileRouter = require("./routes/profile");

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));


app.use('/', indexRouter);
app.use('/user', userRouter);
app.use("/login", loginRouter);
app.use("/catalog", catalogRouter);
app.use("/animal", animalRouter);
app.use("/request", requestRouter);
app.use("/adopt", adoptRouter);
app.use("/donate", donateRouter);
app.use("/missing", missingRouter);
app.use("/notification", notificationRouter);
app.use("/permission", permissionRouter);
app.use("/profile", profileRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
