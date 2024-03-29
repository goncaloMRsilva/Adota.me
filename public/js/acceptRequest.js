function acceptRequest(){
    const idRequest = $("#requestID").val();
    const idRequestName = $("#requestName").val();
    const idAnimal = $("#id_animal").val();

    function serialize(formData) {
        let requestArray = [];
        Object.keys(formData).forEach(function (key) {
          requestArray.push(key + "=" + formData[key]);
        });
        if (requestArray.length > 0) return requestArray.join("&");
        else return false;
    }

    fetch(`/request/accept/${idRequest}`, {
        body: serialize({
            idRequest,
            idRequestName,
            idAnimal
        }),
        method: "PUT",
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