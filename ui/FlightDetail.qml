import QtQuick 2.0

Item {
    id: flightDetail

    readonly property string textColor: "#09e421"

    property int currentWaypointNumber: 1
    property string currentMode: "NAV"
    property string currentDirection: "N"
    property double rangeToCurrentWaypoint: 42.1
    property int flightTimeToNextWaypoint: 7
    property string flightTimeToNextWaypointIUnit: "MIN"

    Text {
        id: flightDetailText
        anchors.fill: parent
        text: 
            flightDetail.currentWaypointNumber 
            + "  " 
            + flightDetail.currentMode 
            + "\n" 
            + flightDetail.currentDirection 
            + "  " 
            + flightDetail.rangeToCurrentWaypoint 
            + "\n" 
            + flightDetail.flightTimeToNextWaypoint 
            + "  " 
            + flightDetail.flightTimeToNextWaypointIUnit
        font.pixelSize: 16
        color: flightDetail.textColor
    }
}
