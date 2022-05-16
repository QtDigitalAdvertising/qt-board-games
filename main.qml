import QtQuick 2.5
import QtQuick.Window 2.2
import QtDigitalAdvertising 1.1
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.3
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
        Material.foreground: "#41CD52"
        Material.background: "#41CD52"
        Material.accent: "#41CD52"

        RowLayout{
            anchors.leftMargin: 10
            anchors.topMargin: 10

            Item{
                height: 40
                width: 40

                Image {
                    id: mainButton
                    anchors.fill: parent
                    fillMode: Image.PreserveAspectFit
                    source: "qrc:/images/menu.png"

                    MouseArea{
                        anchors.fill: parent
                        onClicked: {
                            if (stackView.depth > 1) {
                                stackView.pop()
                            } else {
                                drawer.open()
                            }
                        }
                    }
                }
            }
            Item{
               width:2
            }


            Label {
                id: toolbarLabel
                text: {
                    return "Games made with Qt"
                }
                color: "white"
                font.pixelSize: 22
            }

            Item{
                Layout.fillWidth: true
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

}
