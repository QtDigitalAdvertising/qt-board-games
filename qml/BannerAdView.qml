import QtQuick 2.12
import QtQuick.Window 2.12
import QtDigitalAdvertising 1.1
import QtWebView 1.1
import QtQuick.Layouts 1.15

Item {
    id: root

    Rectangle {
        id: bannerBackground
        height: 60
        Layout.fillWidth: true
        opacity: 0.1
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
    }

    MobileAd {
        anchors.centerIn: bannerBackground
        id: bannerAd
        width: root.width / 1.2
        height: 60
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
            target: bannerAd

            function onAdError(error) {
                console.log("Ad Error: " + error)
                bannerBackground.visible = false
                bannerAd.visible = false
            }
        }
    }
}
