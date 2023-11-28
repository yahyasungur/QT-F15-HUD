import QtQuick 2.0

Item {
    id: velocityVector

    readonly property string canvasColor: "#09e421"

    readonly property int velocityVectorRadius: velocityVector.width * 0.25
    
    Canvas {
        id: velocityVectorCanvas
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();
            ctx.strokeStyle = canvasColor;
            ctx.lineWidth = 2;
            ctx.beginPath();

            // Circle
            ctx.arc(velocityVector.width / 2, velocityVector.height / 2, velocityVectorRadius, 0, 2 * Math.PI);

            // 3 lines left, right, up
            ctx.moveTo(velocityVector.width / 2 - velocityVectorRadius, velocityVector.height / 2);
            ctx.lineTo(0, velocityVector.height / 2);
            ctx.moveTo(velocityVector.width / 2 + velocityVectorRadius, velocityVector.height / 2);
            ctx.lineTo(velocityVector.width, velocityVector.height / 2);
            ctx.moveTo(velocityVector.width / 2, velocityVector.height / 2 - velocityVectorRadius);
            ctx.lineTo(velocityVector.width / 2, 0);

            ctx.stroke();
        }
    }
}
