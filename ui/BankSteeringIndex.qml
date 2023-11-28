import QtQuick 2.0

Item {
    id: bankSteeringIndex

    readonly property string canvasColor: "#09e421"
    property int xCoordinate: (bankSteeringIndex.width * (1 - velocityVectorController.xCoordinateWeight))

    onXCoordinateChanged: bankSteeringIndexCanvas.requestPaint()

    Canvas {
        id: bankSteeringIndexCanvas
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();
            ctx.strokeStyle = canvasColor;
            ctx.lineWidth = 2;
            ctx.beginPath();

            ctx.moveTo(xCoordinate, bankSteeringIndex.height * (6.5/10));
            ctx.lineTo(xCoordinate, bankSteeringIndex.height * (7/10));

            ctx.stroke();
        }
    }
}
