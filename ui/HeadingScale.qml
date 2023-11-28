import QtQuick 2.0

Item {
    id: headingScale

    readonly property string canvasColor: "#09e421"

    property int currentHeading: headingScaleController.currentHeading
    property int roundedCurrentHeading: Math.round(currentHeading/10) * 10

    onCurrentHeadingChanged: headingScaleCanvas.requestPaint()

    Canvas {
        id: headingScaleCanvas
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
            ctx.moveTo(headingScale.width * (19/40), headingScale.height);
            ctx.lineTo(headingScale.width * (20/40), headingScale.height * (17/20));
            ctx.lineTo(headingScale.width * (21/40), headingScale.height);

            // Scale horizontal line
            ctx.moveTo(0, headingScale.height * (8/10));
            ctx.lineTo(headingScale.width, headingScale.height * (8/10));

            // Scale vertical lines
            for (var i = 0; i < 15; i++) {
                var heading = roundedCurrentHeading + (i - 7) * 10;
                var relativeXPosition = headingScale.width/2 + ((heading - currentHeading) / 150) * headingScale.width;

                heading = (heading/5) % 360;

                ctx.moveTo(relativeXPosition, headingScale.height * (8/10));

                if(Math.abs(heading) % 10 == 0) {
                    ctx.lineTo(relativeXPosition, headingScale.height * (5/10));
                    var headingString = heading < 100 ? "0" + heading/10 : heading/10;
                    ctx.fillText(headingString, relativeXPosition - 9, headingScale.height * (4/10));
                } else {
                    ctx.lineTo(relativeXPosition, headingScale.height * (6.5/10));
                }
            }

            ctx.stroke();
        }
    }
}
