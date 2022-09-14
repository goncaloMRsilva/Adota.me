
function register() {
  const name = document.querySelector("#name").value
  const email = document.querySelector("#userEmail").value
  const email1 = document.querySelector("#userEmailConfirm").value
  const password = document.querySelector("#userPassword").value
  const password1 = document.querySelector("#userPasswordConfirm").value
  const phone = document.querySelector("#phone").value

  function serialize(formData) {
    let requestArray = []
    Object.keys(formData).forEach(function (key) {
      requestArray.push(key + "=" + formData[key])
    })
    if (requestArray.length > 0) return requestArray.join("&")
    else return false
  }

  fetch("/registry", {
    body: serialize({
      name,
      email,
      email1,
      password,
      password1,
      phone,
    }),
    method: "POST",
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
  })
    .then((res) => {
      if (res.status === 200) {
        $('#registryModal').modal('hide');
        $('#modal-thankModal').modal('show');
      } else {
        console.error("Error on register new user", res.statusText)
        return res
      }
    })
    .catch((err) => {
      console.error("Error on register new user", err)
    })
}
