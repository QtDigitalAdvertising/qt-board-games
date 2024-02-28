import QtQuick 2.15
import QtQuick.Window 2.15
import QtDigitalAdvertising 2.0
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.2
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

    Rectangle {
        id: bannerBackground
        height: 50
        Layout.fillWidth: true

        opacity: 0.1

        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
        }

        visible: bannerAd.visible

        BannerAd {
            id: bannerAd

            anchors.horizontalCenter: parent.horizontalCenter

            adUnitId: "/6499/example/banner"
            bannerType: BannerAd.BANNER
            testDevicesIds: [""]

            state: "UNKNOWN"

            Component.onCompleted: {
                console.log("QDA: BannerAd trigger show")
                bannerAd.show()
            }

            Connections{
                target: bannerAd
                function onLoading() {
                    bannerAd.state = "LOADING"
                    console.log("QDA: BannerAd loading")
                }
                function onLoaded() {
                    bannerAd.state = "READY"
                    console.log("QDA: BannerAd loaded")
                }
                function onClicked() {
                    console.log("QDA: BannerAd clicked")
                }
                function onClosed() {
                    bannerAd.state = "CLOSED"
                    console.log("QDA: BannerAd closed")
                }
                function onLoadError(errorId) {
                    bannerAd.state = "ERROR"
                    console.log("QDA: BannerAd error " + errorId)
                }
            }

            //You can apply visual efects that fit your UI
            //No size animation allowed.
            Behavior on opacity {
                NumberAnimation {
                    duration: 1000
                }
            }

            //Custom states which fits your UI needs
            states: [
                State {
                    name: "READY"
                    PropertyChanges {
                        target: bannerAd;
                        visible: true;
                        opacity: 1; //Opacity animation allowed
                    }
                }, State {
                    name: "CLOSED"
                    PropertyChanges {
                        target: bannerAd;
                        visible: false;
                        opacity: 0; //Opacity animation allowed
                    }
                }
            ]
        }

        MouseArea {
            anchors.fill: parent
            acceptedButtons: Qt.MiddleButton | Qt.RightButton
            onPressed: {
                console.log("BannerAd clickled.")
                if (mouse.button === Qt.RightButton) {
                    console.log("BannerAd right-clickled.")
                    mouse.accepted = true
                }
            }
        }
    }

    InterstitialAd {
        id: interstitialAd

        adUnitId: "/6499/example/interstitial"
        testDevicesIds: ["123","4321"]

        state: "CLOSED"

        Connections{
            target: interstitialAd

            function onLoading() {
                interstitialAd.state = "LOADING"
                console.log("QDA: InterstitialAd loading")
            }
            function onClicked() {
                console.log("QDA: InterstitialAd clicked")
            }
            function onLoadError(errorId) {
                interstitialAd.state = "ERROR"
                console.log("QDA: InterstitialAd error " + errorId)
            }
            function onLoaded()  {
                interstitialAd.state = "READY"
                console.log("QDA: InterstitialAd loaded")
            }
            function onClosed()  {
                interstitialAd.state = "CLOSED"
                console.log("QDA: InterstitialAd closed")
            }
        }
    }

    RewardedAd {
        id: rewardedAd

        adUnitId: "/21775744923/example/rewarded_interstitial"
        testDevicesIds: ["123","4321"]

        state: "CLOSED"

        Connections{
            target: rewardedAd

            function onLoading() {
                rewardedAd.state = "LOADING"
                console.log("QDA: RewardedAd loading")
            }
            function onClicked() {
                console.log("QDA: RewardedAd clicked")
            }
            function onLoadError(errorId) {
                rewardedAd.state = "ERROR"
                console.log("QDA: RewardedAd error " + errorId)
            }
            function onRewarded(type, amount)  {
                console.log("QDA: RewardedAd, type: "+ type +", amount:" + amount)
            }
            function onLoaded()  {
                rewardedAd.state = "READY"
                console.log("QDA: RewardedAd loaded")
            }
            function onClosed()  {
                rewardedAd.state = "CLOSED"
                console.log("QDA: RewardedAd closed")
            }
        }
    }

    function loadInterstialAd() {
        console.log("QDA: load InterstitialAd state: " + interstitialAd.state)
        if (interstitialAd.state === "CLOSED" ||
                interstitialAd.state === "ERROR") {
            interstitialAd.load()
        }
    }

    function showInterstitialAd() {
        console.log("QDA: show InterstitialAd state: " + interstitialAd.state)
        if (interstitialAd.state === "READY" ||
                interstitialAd.state === "LOADING") {
            interstitialAd.show()
        }
    }

    function loadRewardedAd() {
        console.log("QDA: load RewardedAd state: " + rewardedAd.state)
        if (rewardedAd.state === "CLOSED" ||
                rewardedAd.state === "ERROR") {
            rewardedAd.load()
        }
    }

    function showRewardedAd() {
        console.log("QDA: show RewardedAd state: " + rewardedAd.state)
        if (rewardedAd.state === "READY" ||
                rewardedAd.state === "LOADING") {
            rewardedAd.show()
        }
    }
}
