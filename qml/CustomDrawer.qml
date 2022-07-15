import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15
import Qt.labs.platform 1.1

Drawer {
    id: drawer

    MessageDialog {
        id: confirmDialog
        text: "Are you sure?"
        informativeText: "This allows the app to provide you with a better ads experience."
        buttons: MessageDialog.Yes | MessageDialog.Cancel
        onAccepted: settings.setValue("trackUserData", adsSwitch.checked)
        onRejected: adsSwitch.checked = true
    }

    ColumnLayout {
        anchors.leftMargin: 10
        anchors.topMargin: 10
        anchors.bottomMargin: 20
        anchors.fill: parent

        Image {
            height: 20
            width: 90
            source: "qrc:/images/builtwithqt.png"
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            visible: true
        }

        Item { height: 30 }

        ItemDelegate {
            text: qsTr("TicTacToe Multiplayer")
            width: parent.width
            onClicked: {
                stackView.replace("TicTacToeGame.qml")
                drawer.close()
            }
        }

        ItemDelegate {
            text: qsTr("Sudoku")
            width: parent.width
            onClicked: {
                stackView.replace("SudokuGame.qml")
                drawer.close()
            }
        }

        ItemDelegate {
            text: qsTr("Rock Paper Scissors")
            width: parent.width
            onClicked: {
                stackView.replace("RockPaperScissorGame.qml")
                drawer.close()
            }
        }

        Item {  height: 250 }

        Switch {
            id: adsSwitch
            text: qsTr("Share Data For Personalized Ads")
            checked: settings.boolValue("trackUserData", true) === true
            Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
            onClicked: {
                if (adsSwitch.checked == false) {
                    confirmDialog.visible = true
                } else {
                    settings.setValue("trackUserData", true)
                }
            }
        }

        Label {
            text: "Terms or Service"
            color: "darkgray"
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter | Qt.AlignBottom
            font.underline: true
            MouseArea{
                 anchors.fill: parent
                 onClicked: {
                     Qt.openUrlExternally("https://www.qt.io/terms-conditions/digital-ads-privacy")
                }
            }
        }
    }
}
