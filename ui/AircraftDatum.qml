import QtQuick 2.0

Item {
    id: aircraftDatum

    readonly property string canvasColor: "#09e421"
    
    Canvas {
        id: aircraftDatumCanvas
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();
            ctx.strokeStyle = canvasColor;
            ctx.lineWidth = 2;
            ctx.beginPath();

            ctx.moveTo(0, 0);
            ctx.lineTo(aircraftDatum.width * (2/8), 0);                     //  -
            ctx.lineTo(aircraftDatum.width * (3/8), aircraftDatum.height);  //  \
            ctx.lineTo(aircraftDatum.width * (4/8), 0);                     //  /
            ctx.lineTo(aircraftDatum.width * (5/8), aircraftDatum.height);  //  \
            ctx.lineTo(aircraftDatum.width * (6/8), 0);                     //  /
            ctx.lineTo(aircraftDatum.width, 0);                             //  -

            ctx.stroke();
        }
    }
}
