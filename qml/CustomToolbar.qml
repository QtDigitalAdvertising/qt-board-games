import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.15

ToolBar {

    background: Rectangle {
        implicitHeight: 40
        color: accentColor

        Rectangle {
            width: parent.width
            height: 1
            anchors.bottom: parent.bottom
            color: "transparent"
            border.color: "#21be2b"
        }
    }

    RowLayout {
        anchors.fill: parent

        ToolButton {
            contentItem:  Item {
                height: 40
                width: 40
                Image {
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/images/menu.png"
                }
             }
             onClicked: {
                if (stackView.depth > 1) {
                    stackView.pop()
                } else {
                    drawer.open()
                }
            }
        }

        Label {
            text: "Games made with Qt"
            elide: Label.ElideRight
            horizontalAlignment: Qt.AlignHCenter
            verticalAlignment: Qt.AlignVCenter
            Layout.fillWidth: true
            color: "white"
            font.pixelSize: 20
        }
    }
}
