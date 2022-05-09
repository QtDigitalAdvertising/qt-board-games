import QtQuick 2.0
import QtQuick.Controls 2.12

Label {
    id: root
    color: "white"
    width: 42
    height: 20
    background: Rectangle {
        anchors.fill: parent
        radius: 5
        color: "#CC614B"
    }
    verticalAlignment: Text.AlignVCenter
    horizontalAlignment: Text.AlignHCenter
    font.pixelSize: 16
    font.bold: true
    font.family: "Consolas"
}
