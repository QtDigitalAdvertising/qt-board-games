import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import "../tools/RockPaperScissor.js" as RockPaperScissor

Item {
    id: root

    ColumnLayout {
        spacing: 20
        anchors.fill: parent
        anchors.margins: 20

        RockPaperScissorScoreBoard {
            id: scoreboard
            Layout.preferredWidth: 220
            Layout.preferredHeight: 80
            Layout.alignment: Qt.AlignCenter
        }

        Label {
            id: resultLabel
            Layout.fillWidth: true
            Layout.preferredHeight: 60
            font.pixelSize: 30
            font.bold: true
            color: "white"
            wrapMode: Label.WordWrap
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: "You win!"
        }

        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: 90

            RowLayout {
                anchors.fill: parent
                spacing: 20

                RoundButton {
                    text: "Rock"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                    Layout.preferredHeight: 60
                    Layout.preferredWidth: 100
                    palette.button: accentColor
                    palette.buttonText: "black"
                    onClicked: root.doTheMath(RockPaperScissor.rock)
                 }

                RoundButton {
                    text: "Paper"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                    Layout.preferredHeight: 60
                    Layout.preferredWidth: 100
                    palette.button: accentColor
                    palette.buttonText: "black"
                    onClicked: root.doTheMath(RockPaperScissor.paper)
                 }

                RoundButton {
                    text: "Scissor"
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignBottom
                    Layout.preferredHeight: 60
                    Layout.preferredWidth: 100
                    palette.button: accentColor
                    palette.buttonText: "black"
                    onClicked: root.doTheMath(RockPaperScissor.scissor)
                }
            }
        }

        Label {
            Layout.fillWidth: true
            font.pixelSize: 22
            font.bold: true
            color: "white"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: "Make your move"
        }

        Item { Layout.fillHeight: true }
    }

    function doTheMath(myResult) {
        let computerResult = RockPaperScissor.getComputerResult();

        if (computerResult === myResult) {
            resultLabel.text = RockPaperScissor.getText(myResult) + " does not beat " + RockPaperScissor.getText(computerResult) + ".. Draw!"
        } else if ((myResult === RockPaperScissor.rock && computerResult === RockPaperScissor.scissor) || (myResult === RockPaperScissor.scissor && computerResult === RockPaperScissor.paper) || (myResult === RockPaperScissor.paper && computerResult === RockPaperScissor.rock)) {
            resultLabel.text = RockPaperScissor.getText(myResult) + " beats " + RockPaperScissor.getText(computerResult) + ".. You win!"
            scoreboard.userScore += 1;
        } else {
            resultLabel.text = RockPaperScissor.getText(myResult) + " does not beat " + RockPaperScissor.getText(computerResult) + ".. You loose!"
            scoreboard.computerScore += 1;
        }

        if (computerResult !== myResult && (scoreboard.userScore > 0 || scoreboard.computerScore > 0) && (scoreboard.userScore+scoreboard.computerScore) % 20 == 0) {
            showInterstitialAd()
        }
    }
}
