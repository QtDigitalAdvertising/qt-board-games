import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.15

Item {
    id: root
    anchors.fill: parent

    Dialog {
        id: consentDialog
        closePolicy: Popup.CloseOnEscape

        title: "FIRST THINGS FIRST!"

        readonly property int margin: 20
        width: parent ? (parent.width - margin) : 200

        x: parent ? ((parent.width - width) / 2) : 0
        y: parent ? ((parent.height - height) / 2) : 0
        modal: true

        ColumnLayout {
            id: column
            width: parent ? parent.width : 100
            Label {
                wrapMode: Text.Wrap
                width: parent ? parent.width - 10 : 200
                text: "To start playing our games you must Accept our Terms of Service "
                Layout.columnSpan: 2
                Layout.fillWidth: true
            }
            Label {
                text: "<a href=\"https://www.qt.io/terms-conditions/privacy-policy\">Tap Here to read our Terms or Service</a>"
                Layout.columnSpan: 2
                Layout.fillWidth: true
                font.italic: true
                color: "steelblue"
                MouseArea{
                     anchors.fill: parent
                     onClicked: {
                         Qt.openUrlExternally("https://www.qt.io/terms-conditions/privacy-policy")
                    }
                }
            }
            Item { height: 20 }
            RowLayout {
                Layout.alignment: Qt.AlignRight
                Button{
                    text: "Accept"
                    onClicked: {
                        consentDialog.close()
                        settings.setValue("isDataConsentGiven", "true")
                    }
                }
                Button{
                    text: "Decline"
                    onClicked: {
                        close();
                    }
                }
            }
        }

        Component.onCompleted: {
            if (settings.boolValue("isDataConsentGiven", false) === false) {
                visible = true
            }
        }
    }
}
