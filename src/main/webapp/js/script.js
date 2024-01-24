const buttons = document.querySelectorAll("button[class=b]");
const checkBoxes = document.querySelectorAll("input[name=num]");
const inputY = document.querySelector("input[type=text]");
const SEND_BUTTON = document.querySelector("button[name=send]");


const LEFT_BORDER = -5;
const RIGHT_BORDER = 3;

let table = document.querySelector("table[id=results]");
 r = null;
let x = null;
let y = null;
const MAX_ROWS_SAVED = 50;

buttons.forEach((b) => {
    b.addEventListener("click", () => {
        buttons.forEach((b) => (b.style.color = "white"));
        b.style.color = "red";
    });
});
addEventListener("load", () => {
    inputY.value = "";
    checkBoxes.forEach((box) => {
        box.checked = false;
    });
    r = null;
    x = null;
    y = null;
});
inputY.addEventListener("input", (element) => {
    element.target.setCustomValidity("");
    const isValid = element.target.checkValidity();
    let res = inputY.value;
    if (!isValid) {
        return;
    }
    if (res < LEFT_BORDER || res > RIGHT_BORDER) {
        element.target.setCustomValidity("Invalid field.");
        return;
    }
    y = parseFloat(res);
});

checkBoxes.forEach((box) => {
    box.addEventListener("change", () => {
        box.checked = true;
        checkBoxes.forEach((item) => {
            if (item !== box) item.checked = false;
        });
        x = box.value;
    });
});
buttons.forEach((b) => {
    b.addEventListener("click", () => {
        r = b.value;
    });
});

SEND_BUTTON.addEventListener("click", async () => {
    if (r === null) {
        alert("Fill parameter r");
        return;
    }
    if (x === null) {
        alert("Fill parameter x");
        return;
    }
    if (y === null) {
        alert("Fill parameter y");
        return;
    }
    let currentTime = new Date().toLocaleString("ru-RU", {
        timeZone: "Europe/Moscow",
        hour: "numeric",
        minute: "numeric",
        second: "numeric",
    });


  let res=  await axios.get('http://localhost:8080/web/', {
        headers: {
            'Access-Control-Allow-Origin':'*',
            'x': x,
            'y': y,
            'r': r,
            'currentTime': currentTime
        }
    }).catch((error)=>{
        console.log(error.response.data);
      document.body.innerHTML=error.response.data;

  });

});

function removeAllElements() {
    $("#results").find("tr:gt(0)").remove();
    axios.delete('http://localhost:8080/web/',{ headers: {
            'Access-Control-Allow-Origin':'*'
        }
    });
}

