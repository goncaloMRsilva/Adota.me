function reproveRequest(id){
    const id = document.getElementByName("requestID");

    function serialize(formData) {
        let requestArray = [];
        Object.keys(formData).forEach(function (key) {
          requestArray.push(key + "=" + formData[key]);
        });
        if (requestArray.length > 0) return requestArray.join("&");
        else return false;
      }

    fetch(`request/reprove/${id}`,{
        body: serialize({
            id
        }),
        method: "POST",
        headers: {
            "Content-Type": "application/x-www-form-urlencoded",
        }
    })
    .then(res => {
        return res.json();
    })
    .catch(err => {
        console.log(err);
    })
}