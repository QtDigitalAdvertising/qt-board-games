import QtQuick 2.12
import QtQuick.Window 2.12
import QtDigitalAdvertising 1.1
import QtWebView 1.1
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Material.impl 2.12

import QtQuick.Layouts 1.15
import QtMultimedia 5.4

Item {
    id: fullScreenRoot

    property int defaultSeconds: 2
    property int seconds: defaultSeconds

    Image {
        id: closeButton
        height: 40
        width:40
        source: "qrc:/images/close.png"
        anchors{
            top: parent.top
            left: parent.left
            margins: 10
        }

        visible: false

        MouseArea {
             anchors.fill: parent
             onClicked: {
                 closeInterstitialAd()
            }
        }
    }

    Label{
        id: secondsLabel
        anchors{
            top: parent.top
            left: parent.left
            margins: 10
        }
        font.pixelSize: 18
        color: "white"
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: seconds + " seconds"
    }

    MobileAd {
        id: bigAd
        anchors.fill: parent
        anchors.topMargin: 65
        playMode: QtDigitalAdvertising.AutoPlay
        displayMode: QtDigitalAdvertising.Loop
        formatId: "<FORMAT ID GOES HERE>"
        pageId: {
            switch (Qt.platform.os) {
                case "windows": return "<WINDOWS PAGE ID GOES HERE>"
                case "osx": return "<MACOS PAGE ID GOES HERE>"
                case "ios": return "<IOS PAGE ID GOES HERE>"
                default: return "<ANDROID PAGE ID GOES HERE>" // default android
            }
        }

        Connections {
            target: bigAd

            function onAdError(error) {
                console.log("Ad Error: " + error)
                closeInterstitialAd()
            }
        }
    }

    Timer {
        id: innerTimer
        interval: 1000; running: true; repeat: true
        onTriggered: {
            fullScreenRoot.seconds--;
            secondsLabel.text = fullScreenRoot.seconds + " seconds"
            closeButton.visible = false
            if (fullScreenRoot.seconds == 0) {
                secondsLabel.visible = false
                closeButton.visible = true
                running = false;
                fullScreenRoot.seconds = fullScreenRoot.defaultSeconds
            }
        }
    }

    function closeInterstitialAd() {
        stackView.pop()
        bannedAd.visible = true
        qtLogo.visible = true
        toolbar.visible = true
    }
}

