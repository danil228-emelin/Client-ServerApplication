var finalX = 0;
var finalY = 0;
canvas.addEventListener('click', () => {


    drawPoint(ctx, finalX, finalY, 'yellow', 5)
})
var pixelValue = 6.5;
var width = canvas.getBoundingClientRect().width;
var height = canvas.getBoundingClientRect().height

function drawPoint(context, x, y, color, size) {
    if (color == null) {
        color = '#000';
    }
    if (size == null) {
        size = 5;
    }
    let radius = 0.5 * size;
    let pointX = Math.round(x - radius);
    let pointY = Math.round(y - radius);
    redrawElement(color)
    let requestX = Math.round((x - width / 2) / pixelValue);
    let requestY = Math.round((height/2-y) / pixelValue);
    console.log("Simple x:".concat(pointX));
    console.log("Simple y:".concat(pointY));
    console.log("x:".concat(requestX));
    console.log("y:".concat(requestY));
    if (r === null) {
        alert("Fill parameter r")
        context.fill();
        return;
    }
    let currentTime = new Date().toLocaleString("ru-RU", {
        timeZone: "Europe/Moscow",
        hour: "numeric",
        minute: "numeric",
        second: "numeric",
    });
    axios.get('http://localhost:8080/web/', {
        headers: {
            'Access-Control-Allow-Origin':'*',
            'x': requestX,
            'y': requestY,
            'r': r*pixelValue,
            'currentTime': currentTime
        }
    })
        .then(function (response) {
            if (response.headers['inrange'] === "1") {
                console.log("YES")
                context.stroke();
                redrawElement('#0ce53f')
                context.fill();

            } else {
                console.log("NO")
                redrawElement('#e5350c')
                context.fill();
            }

        }).catch(() => {
        redrawElement('#e5350c')

        context.fill();
    });

    context.fill();

    function redrawElement(color) {
        context.beginPath();
        context.fillStyle = color;
        context.fillRect(pointX, pointY, size, size);
    }
}

canvas.addEventListener('mousedown', function (e) {
    getCursorPosition(canvas, e);
})

function getCursorPosition(canvas, event) {
    const rect = canvas.getBoundingClientRect()
    finalX = event.clientX - rect.left;
    finalY = event.clientY - rect.top;

}


