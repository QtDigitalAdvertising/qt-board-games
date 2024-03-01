import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Material.impl 2.12
import QtQuick.Layouts 1.15

Item {
    id: root

    property int squareSize: {
        switch (Qt.platform.os) {
            case "android": return root.width / 3
            case "ios": return root.width / 3
            default: return 170 // windows and osx
        }
    }

    property int boxCount: 3
    property int gamesPlayed: 0

    property string backgroundColor: "black"
    property string markColor: "white"
    property string winColor: accentColor

    property string player1: "X"
    property string player2: "O"
    property string turn: player1

    property int markSize: 0.35 * squareSize
    property int borderWidth: 0.05 * squareSize

    ColumnLayout {
        spacing: 20
        anchors.fill: parent
        anchors.topMargin: 20

        TicTacToeScoreBoard {
            id: scoreboard
            Layout.preferredWidth: 220
            Layout.preferredHeight: 80
            Layout.alignment: Qt.AlignCenter
        }

        Column {
            id: gameArea
            Layout.alignment: Qt.AlignCenter
            Repeater {
                id: rowIndex
                model: boxCount;
                Row {
                    property var columnIndex: columnIndexer
                    Repeater {
                        id: columnIndexer;
                        model: boxCount;
                        TicTacToeSquare {}
                    }
                }
            }
        }

        MouseArea {
            id: resetArea
            anchors.fill: parent
            enabled: false
            onClicked: {
                enabled = false
                for (var i = 0; i < boxCount; ++i) {
                    for (var j = 0; j < boxCount; ++j) {
                        var mark = rowIndex.itemAt(i).columnIndex.itemAt(j).squareMark;
                        mark.color = markColor
                        mark.text = ""
                    }
                }
            }
        }
    }

    function nextTurn() {
        for (var i = 0; i < boxCount; ++i) {
            if (isThreeInARow(i) || isThreeInAColumn(i)) {
                endGame();
                return;
            }
        }
        if (isThreeInForwardDiagonal() || isThreeInBackwardDiagonal()) {
            endGame();
            return;
        }
        if (isCatsGame()) {
            endGame();
            return;
        }
        turn = turn === player1 ? player2 : player1
    }

    function endGame() {
        loadInterstialAd()
        resetArea.enabled = true;
        turn = player1;
        if (gamesPlayed > 8) {
            gamesPlayed = 0
            showInterstitialAd()
        } else {
            gamesPlayed++
        }
    }

    function isThree(marks) {
        if (marks.every(doesMatch)) {
            marks.forEach(showWinner);
            if (marks[0].text === player1) {
                scoreboard.xScore += 1;
            } else if (marks[0].text === player2) {
                scoreboard.oScore += 1;
            }
            return true;
        }
        return false;
    }

    function isThreeInAColumn(index) {
        var marks = [];
        for (var i = 0; i < boxCount; ++i) {
            marks.push(rowIndex.itemAt(index).columnIndex.itemAt(i).squareMark);
        }
        return isThree(marks);
    }

    function isThreeInARow(index) {
        var marks = [];
        for (var i = 0; i < boxCount; ++i) {
            marks.push(rowIndex.itemAt(i).columnIndex.itemAt(index).squareMark);
        }
        return isThree(marks);
    }

    function isThreeInForwardDiagonal() {
        var marks = [];
        for (var i = 0; i < boxCount; ++i) {
            marks.push(rowIndex.itemAt(i).columnIndex.itemAt(i).squareMark);
        }
        return isThree(marks);
    }

    function isThreeInBackwardDiagonal() {
        var marks = [];
        for (var i = 0; i < boxCount; ++i) {
            marks.push(rowIndex.itemAt(i).columnIndex.itemAt(boxCount - i - 1).squareMark);
        }
        return isThree(marks);
    }

    function isCatsGame() {
        var marks = [];
        for (var i = 0; i < boxCount; ++i) {
            for (var j = 0; j < boxCount; ++j) {
                marks.push(rowIndex.itemAt(i).columnIndex.itemAt(j).squareMark);
            }
        }
        return marks.every(isMarked);
    }

    function doesMatch(currentValue) {
        return currentValue.text === turn;
    }

    function isMarked(currentValue) {
        return currentValue.text === player1 || currentValue.text === player2;
    }

    function showWinner(currentValue) {
        currentValue.color = winColor
    }
}
