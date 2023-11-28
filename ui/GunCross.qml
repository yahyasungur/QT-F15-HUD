import QtQuick 2.0

Item {
    id: gunCross

    readonly property string canvasColor: "#09e421"
    
    Canvas {
        id: gunCrossCanvas
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();
            ctx.strokeStyle = canvasColor;
            ctx.lineWidth = 2;
            ctx.beginPath();

            ctx.moveTo(gunCross.width/2, 0);
            ctx.lineTo(gunCross.width/2, gunCross.height); // vertical line
            ctx.moveTo(0, gunCross.height/2);
            ctx.lineTo(gunCross.width, gunCross.height/2); // horizontal line

            ctx.stroke();
        }
    }
}
