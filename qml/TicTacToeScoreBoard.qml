import QtQuick 2.12
import QtQuick.Controls 2.12

Item {
    property int xScore: 0
    property int oScore: 0

    Rectangle {
        anchors.fill: parent
        anchors.leftMargin: xBadge.width*.5
        anchors.rightMargin: oBadge.width*.5
        color: "transparent"
        border.width: 2
        border.color: "white"
    }

    Label {
        anchors.fill: parent
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        text: xScore + " : " + oScore
        font.pixelSize: 36
        color: "white"
    }

    RockPaperScissorBadge {
        id: xBadge
        text: " X "
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
    }

    RockPaperScissorBadge {
        id: oBadge
        text: " O "
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
    }

}
