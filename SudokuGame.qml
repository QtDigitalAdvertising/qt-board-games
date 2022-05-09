import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtDigitalAdvertising 1.1

Item {
    id: root

    Rectangle{
        id: rect

        function setMax(a,b) {
            return Math.max(a, b);
        }

        anchors.centerIn: parent

        SudokuField {

            function setCellWidth(pWidth, num) {
                return(pWidth - (pWidth % num))/num
            }

            id: field2
            anchors.centerIn: parent
            cellWidth: setCellWidth(parent.width, cellsPerRow)
        }

        height: setMax(parent.height,parent.width) - 200
        width: height

    }

    Rectangle {
        id: rect1
        height: 50
        width: 100
        color: foreground_color
        anchors {
            margins: 20
            horizontalCenter: root.horizontalCenter
            top: parent.top
        }

        Label {
            id:label
            text: "Good Luck!"
            color:"white"
            anchors {
                horizontalCenter: rect1.horizontalCenter
                top: rect1.top
            }
        }

        RoundButton {
            text: "Check"
            width: 60
            height: 40
            font.pixelSize: 14
            onClicked: field2.check()
            anchors {
                horizontalCenter: rect1.horizontalCenter
                top: label.bottom
            }
        }
    }

    Rectangle {
        id: ad1
        height: 70
//        Layout.fillWidth: true
        opacity: 0.1
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
    }

    MobileAd {
        anchors.centerIn: ad1
        id: ad2
        width: root.width / 1.2
        height: 70
        playMode: QtDigitalAdvertising.AutoPlay
        displayMode: QtDigitalAdvertising.Loop
        pageId: "<PAGE ID GOES HERE>"
        formatId: "<FORMAT ID GOES HERE>"
    }

    Component.onCompleted: {
        // TODO
    }

    Component.onDestruction: {
        // TODO
    }

}
