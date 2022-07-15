import QtQuick 2.12

Rectangle {
    height: width
    color: "black"
    border.color: foregroundColor
    property int value: 3
    property bool editable: false
    property string textColor: (editable ? accentColor : "white")

    property int indexInList: 0

    Text {
        function setText(value){
            if(value === 0) return "";
            if(value < 0) return "1";
            if(value > 9) return "9";
            return value.toString();
        }

        anchors.centerIn: parent
        text: setText(parent.value)
        color: parent.textColor
        font.pixelSize: 20
    }

    MouseArea {
        anchors.fill: parent
        onClicked: parent.changeNumber(parent.editable)
    }

    function changeNumber(flag){
        if (flag) {
            if (value == 8) {
                value = 9
            } else if (value == 9) {
                value = 0
            } else {
                value = (value + 1) % 9;
            }
            puzzle[indexInList] = value
        }
    }
}
