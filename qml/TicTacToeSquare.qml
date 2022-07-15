import QtQuick 2.12

Item {
    height: squareSize
    width: squareSize
    property var squareMark: mark

    MouseArea {
        anchors.fill: parent
        onClicked: {
            if (mark.text) { return; }
            mark.text = turn
            nextTurn()
        }
    }

    Rectangle {
        color: backgroundColor
        anchors.fill: parent
        border.width: borderWidth
        border.color: foregroundColor
    }

    Text {
        id: mark
        anchors.centerIn: parent
        text: ""
        font.pointSize: markSize
        color: markColor
    }
}
