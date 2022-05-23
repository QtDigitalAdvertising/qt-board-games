import QtQuick 2.12
import QtQuick.Window 2.12
import QtDigitalAdvertising 1.1
import QtWebView 1.1
import QtQuick.Layouts 1.15

Item {

    id: root

    Rectangle {
        id: ad1
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
        anchors.centerIn: ad1
        id: ad2
        width: root.width / 1.2
        height: 60
        playMode: QtDigitalAdvertising.AutoPlay
        displayMode: QtDigitalAdvertising.Loop
        pageId: "<PAGE ID GOES HERE>"
        formatId: "<FORMAT ID GOES HERE>"

        Connections {
            target: ad2

            function onAdError(error) {
                console.log("Ad Error: " + error)
                ad1.visible = false
                ad2.visible = false
            }
        }
    }
}
