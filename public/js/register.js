function register() {
  const name = $("#name").val();
  const email = $("#userEmail").val();
  const email1 = $("#userEmailConfirm").val();
  const password = $("#userPassword").val();
  const password1 = $("#userPasswordConfirm").val();
  const phone = $("#phone").val();

  function serialize(formData) {
    let requestArray = [];
    Object.keys(formData).forEach(function (key) {
      requestArray.push(key + "=" + formData[key]);
    });
    if (requestArray.length > 0) return requestArray.join("&");
    else return false;
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
  }).then(res => {
    return res.json();
  })
    .then((res) => {
      debugger;
      if (!res.message) {
        $("#registryModal").modal("hide");
        $("#modal-thankModal").modal("show");
      } else {
        $("#error").text(res.message).show();
      }
    })
    .catch((res, err) => {
      console.error("Error on register new user", err);
      $("#error").text(res.message).show();
    });
}
