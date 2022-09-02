const createError = require("http-errors")
const express = require("express")
const path = require("path")
const cookieParser = require("cookie-parser")
const logger = require("morgan")
const expressLayouts = require("express-ejs-layouts")

const indexRouter = require("./routes/index")
const userRouter = require("./routes/user")
const loginRouter = require("./routes/login")
const catalogRouter = require("./routes/catalog")
const animalRouter = require("./routes/animal")
const requestRouter = require("./routes/request")
const adoptRouter = require("./routes/adopt")
const donateRouter = require("./routes/donate")
const missingRouter = require("./routes/missing")
const notificationRouter = require("./routes/notification")
const permissionRouter = require("./routes/permission")
const profileRouter = require("./routes/profile")
const registryRouter = require("./routes/registry")

const app = express()

if (process.env.NODE_ENV !== "production") {
  const livereload = require("livereload")
  const connectLiveReload = require("connect-livereload")
  const liveReloadServer = livereload.createServer()
  liveReloadServer.server.once("connection", () => {
    setTimeout(() => {
      liveReloadServer.refresh("/")
    }, 100)
  })
  app.use(connectLiveReload())
}

// view engine setup
app.use(expressLayouts)
app.set("views", path.join(__dirname, "views"))
app.set("layout", "layouts/default")
app.set("layout", "layouts/noaside")
app.set("view engine", "ejs")

app.use(logger("dev"))
app.use(express.json())
app.use(express.urlencoded({ extended: false }))
app.use(cookieParser())
app.use(express.static(path.join(__dirname, "public")))

app.use(function (req, res, next) {
  res.locals.currentPath = req.path
  res.locals.title = ''
  // res.locals.menu = constants.menu
  next()
})

app.use("/", indexRouter)
app.use("/user", userRouter)
app.use("/login", loginRouter)
app.use("/catalog", catalogRouter)
app.use("/animal", animalRouter)
app.use("/request", requestRouter)
app.use("/adopt", adoptRouter)
app.use("/donate", donateRouter)
app.use("/missing", missingRouter)
app.use("/notification", notificationRouter)
app.use("/permission", permissionRouter)
app.use("/profile", profileRouter)
app.use("/registry", registryRouter)

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  next(createError(404))
})

// error handler
app.use(function (err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message
  res.locals.error = req.app.get("env") === "development" ? err : {}

  // render the error page
  const status = err.status || 500
  res.status(status)
  res.render("error")
})

module.exports = app
