import QtQuick 2.0

Item {
    id: airspeedScale

    readonly property string canvasColor: "#09e421"

    property int currentAirspeed: airspeedScaleController.currentAirspeed
    property int roundedCurrentAirspeed: Math.round(currentAirspeed / 10) * 10

    onCurrentAirspeedChanged: airspeedScaleCanvas.requestPaint()

    Canvas {
        id: airspeedScaleCanvas
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();
            ctx.font = "17px Arial";
            ctx.fillStyle = canvasColor;
            ctx.strokeStyle = canvasColor;
            ctx.lineWidth = 2;
            ctx.beginPath();

            // Indicator
            ctx.moveTo(airspeedScale.width, airspeedScale.height * (19/40));
            ctx.lineTo(airspeedScale.width * (17/20), airspeedScale.height * (20/40));
            ctx.lineTo(airspeedScale.width, airspeedScale.height * (21/40));

            // Scale vertical line
            ctx.moveTo(airspeedScale.width * (8/10), 0);
            ctx.lineTo(airspeedScale.width * (8/10), airspeedScale.height);

            // Scale horizontal lines
            for (var i = 0; i < 15; i++) {
                var airSpeed = roundedCurrentAirspeed + (i - 7) * 10;
                var relativeYPosition = airspeedScale.height/2 + ((airSpeed - currentAirspeed) / 150) * airspeedScale.height;

                ctx.moveTo(airspeedScale.width * (8/10), relativeYPosition);

                if(Math.abs(airSpeed) % 50 == 0) {
                    ctx.lineTo(airspeedScale.width * (5/10), relativeYPosition);
                    ctx.fillText(airSpeed, 0, relativeYPosition + 5);
                } else {
                    ctx.lineTo(airspeedScale.width * (6.5/10), relativeYPosition);
                }
            }

            ctx.stroke();
        }
    }
}
