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
        id: close_button
        height: 40
        width:40
        source: "qrc:/images/close.png"
        anchors{
            top: parent.top
            left: parent.left
            margins: 10
        }

        visible: false

        MouseArea{
             anchors.fill: parent
             onClicked: {
                 qt_logo.visible = true
                 stackView.pop()
                 toolbar.visible = true
            }
        }
    }

    Label{
        id: seconds_label
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
        id: ad1
        anchors.fill: parent
        anchors.topMargin: 65
        playMode: QtDigitalAdvertising.AutoPlay
        displayMode: QtDigitalAdvertising.Loop
        pageId: "<PAGE ID GOES HERE>"
        formatId: "<FORMAT ID GOES HERE>"

        Connections {
            target: ad1

            function onAdError(error) {
                console.log("Ad Error: " + error)
                qt_logo.visible = true
                stackView.pop()
                toolbar.visible = true
            }
        }
    }

    Timer {
        id: inner_timer
        interval: 1000; running: true; repeat: true
        onTriggered: {
            fullScreenRoot.seconds--;
            seconds_label.text = fullScreenRoot.seconds + " seconds"
            close_button.visible = false
            if (fullScreenRoot.seconds == 0) {
                seconds_label.visible = false
                close_button.visible = true
                running = false;
                fullScreenRoot.seconds = fullScreenRoot.defaultSeconds
            }
        }
    }
}

