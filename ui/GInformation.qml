import QtQuick 2.0

Item {
    id: gInformation

    readonly property string textColor: "#09e421"

    property int currentG: 40
    property int maxAllowedG: 90

    Text {
        id: gText
        anchors.fill: parent
        text: gInformation.currentG + "  " + gInformation.maxAllowedG
        font.pixelSize: 17
        color: gInformation.textColor
    }
}
