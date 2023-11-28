import QtQuick 2.0


Item {
    id: pitchScale

    readonly property string canvasColor: "#09e421"

    property int currentPitch: pitchScaleController.currentPitch
    property int roundedCurrentPitch: Math.round(currentPitch / 20) * 20
    property int virtualPitchLineCenterX: pitchScale.width / 2 + pitchScaleController.currentXCoordinate
    property int virtualPitchLineCenterY: pitchScale.height / 2 // + pitchScaleController.currentYCoordinate
    
    readonly property int scaleLineLength: pitchScale.width / 4
    readonly property int zeroScaleLineLength: pitchScale.width / 2.5
    readonly property int emptySpaceLength: pitchScale.width / 21

    onCurrentPitchChanged: pitchScaleCanvas.requestPaint()
    onVirtualPitchLineCenterXChanged: pitchScaleCanvas.requestPaint()
    onVirtualPitchLineCenterYChanged: pitchScaleCanvas.requestPaint()

    Canvas {
        id: pitchScaleCanvas
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();
            ctx.font = "12px Arial";
            ctx.fillStyle = canvasColor;
            ctx.strokeStyle = canvasColor;
            ctx.lineWidth = 2;
            ctx.beginPath();

            // Virtual line length
            var virtualLineLength = pitchScale.height;

            // Scale lines
            for (var i = 0; i < 7; i++) 
            {
                var scaleLineDegree = pitchScale.roundedCurrentPitch + (i - 3)*20;
                var relativePerpendicularDistance = ((pitchScale.currentPitch - scaleLineDegree) / 80) * virtualLineLength;

                var scaleLineDegreeText = Math.abs(scaleLineDegree/4) % 180;
                var scaleLineDegreeTextMargin = Math.abs(scaleLineDegreeText) > 9 ? (Math.abs(scaleLineDegreeText) > 99 ? 23 : 16) : 9;

                var scaleLineStartX;
                var scaleLineEndX;
                var scaleLineY;

                if (scaleLineDegree == 0)
                {
                    scaleLineStartX = pitchScale.virtualPitchLineCenterX - pitchScale.zeroScaleLineLength/2;
                    scaleLineEndX = pitchScale.virtualPitchLineCenterX + pitchScale.zeroScaleLineLength/2;
                    scaleLineY = pitchScale.virtualPitchLineCenterY + relativePerpendicularDistance;
                }
                else
                {
                    scaleLineStartX = pitchScale.virtualPitchLineCenterX - pitchScale.scaleLineLength/2;
                    scaleLineEndX = pitchScale.virtualPitchLineCenterX + pitchScale.scaleLineLength/2;
                    scaleLineY = pitchScale.virtualPitchLineCenterY + relativePerpendicularDistance;
                }

                var middleSpaceStartX = pitchScale.virtualPitchLineCenterX - pitchScale.emptySpaceLength/2;
                var middleSpaceEndX = pitchScale.virtualPitchLineCenterX + pitchScale.emptySpaceLength/2;
                var middleSpaceY = pitchScale.virtualPitchLineCenterY + relativePerpendicularDistance;

                if (scaleLineDegree >= 0) 
                {
                    ctx.moveTo(scaleLineStartX, scaleLineY);
                    ctx.lineTo(middleSpaceStartX, middleSpaceY);
                    ctx.moveTo(middleSpaceEndX, middleSpaceY);
                    ctx.lineTo(scaleLineEndX, scaleLineY);

                    if (scaleLineDegree != 0)
                    {
                        // Small lines at the both ends of the scale line
                        ctx.moveTo(scaleLineStartX, scaleLineY);
                        ctx.lineTo(scaleLineStartX, scaleLineY + 10);
                        ctx.moveTo(scaleLineEndX, scaleLineY);
                        ctx.lineTo(scaleLineEndX, scaleLineY + 10);

                        // Degree text
                        ctx.fillText(scaleLineDegreeText, scaleLineStartX - scaleLineDegreeTextMargin, scaleLineY + 9);
                        ctx.fillText(scaleLineDegreeText, scaleLineEndX + 2, scaleLineY + 9);
                    }
                } 
                else 
                {
                    var xDistance = middleSpaceStartX - scaleLineStartX;

                    for (var j = 0; j < 11; j+=2) 
                    {
                        ctx.moveTo(scaleLineStartX + j*xDistance/11, scaleLineY);
                        ctx.lineTo(scaleLineStartX + (j + 1)*xDistance/11, scaleLineY);
                    }

                    xDistance = middleSpaceEndX - scaleLineEndX;

                    for (var j = 0; j < 11; j+=2) 
                    {
                        ctx.moveTo(scaleLineEndX + j*xDistance/11, scaleLineY);
                        ctx.lineTo(scaleLineEndX + (j + 1)*xDistance/11, scaleLineY);
                    }

                    // Small lines at the both ends of the scale line
                    ctx.moveTo(scaleLineStartX, scaleLineY);
                    ctx.lineTo(scaleLineStartX, scaleLineY - 10);
                    ctx.moveTo(scaleLineEndX, scaleLineY);
                    ctx.lineTo(scaleLineEndX, scaleLineY - 10);

                    // Degree text
                    ctx.fillText(scaleLineDegreeText, scaleLineStartX - scaleLineDegreeTextMargin, scaleLineY);
                    ctx.fillText(scaleLineDegreeText, scaleLineEndX + 2, scaleLineY);
                }
            }

            ctx.stroke();
        }
    }
}
