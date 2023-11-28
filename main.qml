import QtQuick 2.9
import QtQuick.Window 2.2

import "ui"

Window {
    id: mainWindow
    visible: true
    width: 740
    height: 740
    color: "#00000000"
    title: qsTr("F15-HUD")
    flags: Qt.Window | Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint | Qt.WindowTransparentForInput

    property double opacityOfElements: systemOpacityController.currentOpacity

    AircraftDatum {
        id: aircraftDatum
        width: mainWindow.width / 20
        height: aircraftDatum.width / 4
        y: mainWindow.height * (4/10)
        anchors.horizontalCenter: parent.horizontalCenter
        opacity: opacityOfElements
    }

    GunCross {
        id: gunCross
        width: mainWindow.width / 35
        height: gunCross.width
        y: mainWindow.height * (2/10)
        anchors.horizontalCenter: parent.horizontalCenter
        opacity: opacityOfElements
    }

    VelocityVector {
        id: velocityVector
        width: mainWindow.width / 20
        height: velocityVector.width
        x: (mainWindow.width * velocityVectorController.xCoordinateWeight) - (velocityVector.width / 2)
        y: mainWindow.height * velocityVectorController.yCoordinateWeight
        opacity: opacityOfElements
    }

    AirspeedScale {
        id: airspeedScale
        width: mainWindow.width * (1/10)
        height: mainWindow.height * (13/20)
        anchors {
            left: parent.left
            leftMargin: mainWindow.width / 50
            top: parent.top
            topMargin: mainWindow.height / 10
        }
        opacity: opacityOfElements
    }

    AltitudeScale {
        id: altitudeScale
        width: mainWindow.width * (3/20)
        height: mainWindow.height * (13/20)
        anchors {
            right: parent.right
            rightMargin: mainWindow.width / 50
            top: parent.top
            topMargin: mainWindow.height / 10
        }
        opacity: opacityOfElements
    }

    HeadingScale {
        id: headingScale
        width: mainWindow.width * (12/20)
        height: mainWindow.height * (1/10)
        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: mainWindow.height * (2/30)
        }
        opacity: opacityOfElements
    }

    GInformation {
        id: gInformation
        width: mainWindow.width * (2/30)
        height: mainWindow.height * (1/40)
        anchors {
            bottom: parent.bottom
            bottomMargin: mainWindow.height * (1/10)
            left: parent.left
            leftMargin: mainWindow.width * (3/50)
        }
        opacity: opacityOfElements
    }

    FlightDetail {
        id: flightDetail
        width: mainWindow.width * (1/10)
        height: mainWindow.height * (1/50)
        anchors {
            bottom: parent.bottom
            bottomMargin: mainWindow.height * (3/20)
            right: parent.right
            rightMargin: mainWindow.width * (3/50)
        }
        opacity: opacityOfElements
    }

    PitchScale {
        id: pitchScale
        anchors.fill: parent
        rotation: pitchScaleController.currentInclination/5
        opacity: opacityOfElements
    }

    BankSteeringIndex {
        id: bankSteeringIndex
        anchors {
            fill: parent
        }
        opacity: opacityOfElements
    }
}
