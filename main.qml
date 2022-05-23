import QtQuick 2.12
import QtQuick.Window 2.12
import QtDigitalAdvertising 1.1
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: window
    visible: true
    property string foreground_color: "#303030"

    color: foreground_color
    Material.theme: Material.Dark
    Material.accent: "#41CD52"

    property bool builtWithQtButtonVisible: true

    minimumWidth: 670
    minimumHeight: 750

    MobileConfig {
       qdaApiKey: "<API KEY GOES HERE>"
       networkId: "4147"
       siteId: "<SITE ID GOES HERE>"
       appName: "Board Games"
       bundleId: "io.qt.boardgames"
    }

    header: ToolBar {

        id: toolbar

        background: Rectangle {
            implicitHeight: 40
            color: "#41CD52"

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
                contentItem:  Item{
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


    CustomDrawer {
        id: drawer
        width: window.width * 0.8
        height: window.height
    }

    Image {
        id: qt_logo
        visible: true
        height: 40
        width: 36
        z: 100
        source: "qrc:/images/builtwithqtrect.png"
        anchors{
            top: parent.top
            right: parent.right
            margins: 20
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem:  TicTacToeGame{}
    }

    ConsentDialog { anchors.fill: parent }
}
