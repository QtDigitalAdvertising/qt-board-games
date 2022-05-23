import QtQuick 2.12

Item {
    height: square_size
    width: square_size
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
        color: background_color
        anchors.fill: parent
        border.width: border_width
        border.color: foreground_color
    }

    Text {
        id: mark
        anchors.centerIn: parent
        text: ""
        font.pointSize: mark_size
        color: mark_color
    }
}
