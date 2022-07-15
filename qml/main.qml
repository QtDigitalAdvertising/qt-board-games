import QtQuick 2.12
import QtQuick.Window 2.12
import QtDigitalAdvertising 1.1
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.15

ApplicationWindow {
    id: window
    visible: true
    property string foregroundColor: "#303030"
    property string accentColor: "#41CD52"

    color: foregroundColor
    Material.theme: Material.Dark
    Material.accent: accentColor

    property bool builtWithQtButtonVisible: true

    minimumWidth: 670
    minimumHeight: 750

    MobileConfig {
        id: mobileConfig
        qdaApiKey: "<API KEY GOES HERE>"
        networkId: "4147"
        appName: "Board Games"
        bundleId: "io.qt.boardgames"
        dnt: settings.boolValue("trackUserData", true) === false
        siteId: {
            switch (Qt.platform.os) {
                case "windows": return "<WINDOWS SITE ID GOES HERE>"
                case "osx": return "<MACOS SITE ID GOES HERE>"
                case "ios": return "<IOS SITE ID GOES HERE>"
                default: return "<ANDROID SITE ID GOES HERE>" // default android
            }
        }
        Component.onCompleted: {
            // is a one-time request to authorize or deny access to app-related data that can be used for tracking the user or the device
            // it's mandatory offer the best ads experience.
            // see https://developer.apple.com/documentation/apptrackingtransparency/attrackingmanager/3547037-requesttrackingauthorizationwith
            if(Qt.platform.os==="ios" || Qt.platform.os==="osx"){
                mobileConfig.requestTrackingAuthorization()
            }
        }
    }

    header: CustomToolbar {
        id: toolbar
    }

    CustomDrawer {
        id: drawer
        width: window.width * 0.8
        height: window.height
    }

    Image {
        id: qtLogo
        height: 35
        width: 33
        z: 100
        source: "qrc:/images/builtwithqtrect.png"
        anchors{
            bottom: parent.bottom
            right: parent.right
            rightMargin: 20
            bottomMargin: 70
        }
    }

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: TicTacToeGame{}
    }

    ConsentDialog { anchors.fill: parent }

    BannerAdView {
        id: bannedAd
        height: 60
        Layout.fillWidth: true
        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }
    }

    function showInterstitialAd() {
        bannedAd.visible = false
        qtLogo.visible = false
        toolbar.visible = false
        stackView.push("InterstitialAdView.qml")
    }
}
