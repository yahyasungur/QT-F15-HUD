import QtQuick 2.0

Item {
    id: altitudeScale

    readonly property string canvasColor: "#09e421"

    property int currentAltitude: altitudeScaleController.currentAltitude
    property int roundedcurrentAltitude: Math.round(currentAltitude / 100) * 100
    
    onCurrentAltitudeChanged: altitudeScaleCanvas.requestPaint()

    Canvas {
        id: altitudeScaleCanvas
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();
            ctx.font = "16px Arial";
            ctx.fillStyle = canvasColor;
            ctx.strokeStyle = canvasColor;
            ctx.lineWidth = 2;
            ctx.beginPath();

            // Indicator
            ctx.moveTo(0, altitudeScale.height * (19/40));
            ctx.lineTo(altitudeScale.width * (2/20), altitudeScale.height * (20/40));
            ctx.lineTo(0, altitudeScale.height * (21/40));

            // Scale vertical line
            ctx.moveTo(altitudeScale.width * (8/60), 0);
            ctx.lineTo(altitudeScale.width * (8/60), altitudeScale.height);

            // Scale horizontal lines
            for (var i = 0; i < 15; i++) {
                var altitude = roundedcurrentAltitude + (i - 7) * 100;
                var relativeYPosition = altitudeScale.height/2 - ((altitude - currentAltitude) / 1500) * altitudeScale.height;

                ctx.moveTo(altitudeScale.width * (8/60), relativeYPosition);

                if(Math.abs(altitude) % 500 == 0) {
                    ctx.lineTo(altitudeScale.width * (20/60), relativeYPosition);
                    ctx.fillText(altitude, altitudeScale.width * (24/60), relativeYPosition + 5);
                } else {
                    ctx.lineTo(altitudeScale.width * (14/60), relativeYPosition);
                }
            }

            ctx.stroke();
        }
    }
}
