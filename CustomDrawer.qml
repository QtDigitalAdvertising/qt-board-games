import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.15
Drawer {
    id: drawer

    ColumnLayout {
        anchors.leftMargin: 5
        anchors.topMargin: 10
        anchors.fill: parent

        Image {
            height: 20
            width: 90
            source: "qrc:/images/builtwithqt.png"
            anchors {
                top: parent.top
                left: drawer.left
                right: drawer.right
            }
        }

        Item {
           height:30
        }

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

        Item{
           Layout.fillHeight: true
        }
    }
}
