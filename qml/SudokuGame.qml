import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15

Item {
    id: root

    Rectangle {
        id: rect

        color: foregroundColor

        function setMax(a,b) {
            return Math.max(a, b);
        }

        anchors.centerIn: parent

        SudokuField {

            function setCellWidth(pWidth, num) {
                if (Qt.platform.os === "osx" || Qt.platform.os === "windows"){
                    return 55
                }

                return (pWidth - (pWidth % num)) / num
            }

            id: field2
            anchors.centerIn: parent
            cellWidth: setCellWidth(parent.width, cellsPerRow)
        }

        height: parent.width
        width: height

    }

    Rectangle {
        id: rect1
        height: 50
        width: 100
        color: foregroundColor
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
            palette.button: accentColor
            palette.buttonText: "white"
            anchors {
                horizontalCenter: rect1.horizontalCenter
                top: label.bottom
                topMargin: 10
            }
        }
    }
}
