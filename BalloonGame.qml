import QtQuick 2.12
import QtQuick.Particles 2.12
import QtQuick.Layouts 1.15

Item {
    id: root
    anchors.fill: parent

    property int shooted: 0
    property int missed: 0
    property int fontSize: 36

    Item {
        id: startScreen
        anchors.fill: parent
        z: 1000
        Text {
            text: "Press anywhere\nto start a game"
            anchors.centerIn: parent
            renderType: Text.NativeRendering
            color: "white"
            font.pixelSize: fontSize
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {//Game Start
                parent.visible = false;
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

    Item {
        id: gameOverScreen
        anchors.fill: parent
        z: 1000
        visible: missed >= 20
        Text {
            text: "Game Over\n\nShooted: %1\nMissed: %2".arg(shooted).arg(missed)
            anchors.centerIn: parent
            renderType: Text.NativeRendering
            color: "white"
            font.pixelSize: fontSize
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {//Game Start
                parent.visible = false;
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

    Rectangle {
        id: bg
        anchors.fill: parent
        color: foreground_color

        Text {
            anchors.centerIn: parent.TopLeft
            renderType: Text.NativeRendering
            anchors.left: parent.left
            anchors.rightMargin: 8

            visible: !startScreen.visible && !gameOverScreen.visible

            text: "Shooted: %1\nMissed: %2".arg(shooted).arg(missed)
            color: "white"
            font.pixelSize: fontSize
        }
    }

    BallonParticleSystem {
        id: particleSystem
        anchors.fill: parent
        running: !startScreen.visible && !gameOverScreen.visible
        visible: running
    }

}
