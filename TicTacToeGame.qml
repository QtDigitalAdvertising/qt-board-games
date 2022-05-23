import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Material.impl 2.12
import QtQuick.Layouts 1.15

Item {
    id: root

    property int square_size: {
        switch (Qt.platform.os) {
            case "android": return root.width / 3
            case "ios": return root.width / 3
            default: return 170
        }
    }

    property int box_count: 3
    property int games_played: 0

    property string background_color: "black"
    property string mark_color: "white"
    property string win_color: "#41CD52"

    property string player1: "X"
    property string player2: "O"
    property string turn: player1

    property int mark_size: 0.35 * square_size
    property int border_width: 0.05 * square_size

    function nextTurn() {
        for (var i = 0; i < box_count; ++i) {
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
        reset_area.enabled = true;
        turn = player1;
        if (games_played > 8) {
            games_played = 0
            qt_logo.visible = false
            toolbar.visible = false
            stackView.push("InterstitialAdView.qml")
        } else {
            games_played++
        }
    }

    function isThree(marks) {
        if (marks.every(doesMatch)) { marks.forEach(showWinner); return true; }
        return false;
    }

    function isThreeInAColumn(index) {
        var marks = [];
        for (var i = 0; i < box_count; ++i) {
            marks.push(row_index.itemAt(index).column_index.itemAt(i).squareMark);
        }
        return isThree(marks);
    }

    function isThreeInARow(index) {
        var marks = [];
        for (var i = 0; i < box_count; ++i) {
            marks.push(row_index.itemAt(i).column_index.itemAt(index).squareMark);
        }
        return isThree(marks);
    }

    function isThreeInForwardDiagonal() {
        var marks = [];
        for (var i = 0; i < box_count; ++i) {
            marks.push(row_index.itemAt(i).column_index.itemAt(i).squareMark);
        }
        return isThree(marks);
    }

    function isThreeInBackwardDiagonal() {
        var marks = [];
        for (var i = 0; i < box_count; ++i) {
            marks.push(row_index.itemAt(i).column_index.itemAt(box_count - i - 1).squareMark);
        }
        return isThree(marks);
    }

    function isCatsGame() {
        var marks = [];
        for (var i = 0; i < box_count; ++i) {
            for (var j = 0; j < box_count; ++j) {
                marks.push(row_index.itemAt(i).column_index.itemAt(j).squareMark);
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
        currentValue.color = win_color
    }

    Column {
        id: game_area
        anchors.centerIn: parent
        Repeater {
            id: row_index
            model: box_count;
            Row {
                property var column_index: column_indexer
                Repeater {
                    id: column_indexer;
                    model: box_count;
                    TicTacToeSquare {}
                }
            }
        }
    }

    MouseArea {
        id: reset_area
        anchors.fill: parent
        enabled: false
        onClicked: {
            enabled = false
            for (var i = 0; i < box_count; ++i) {
                for (var j = 0; j < box_count; ++j) {
                    var mark = row_index.itemAt(i).column_index.itemAt(j).squareMark;
                    mark.color = mark_color
                    mark.text = ""
                }
            }
        }
    }

    BannerAdView {
        height: 60
        Layout.fillWidth: true
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
    }
}
