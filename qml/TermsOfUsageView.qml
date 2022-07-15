import QtQuick 2.5
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Material.impl 2.12


Item {
    id: fullScreenRoot

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


    Text {
         id: mytext
         anchors.fill: parent
         textFormat: Text.RichText
         text: "<div><table border='1'><caption><h4>Test stats</h4>"+
         "</caption><tr bgcolor='#9acd32'><th/><th>Number1</th><th>Number2</th></tr> <tr><th>Line1</th>"+
            "<td> 0 </td> <td> 1 </td> </tr> <tr><th>Line2</th> <td> 0 </td> <td> 1 </td> </tr>"+
            "<tr><th>Line3</th> <td> 0 </td> <td> 0 </td> </tr> <tr><th>Line4</th> <td> 1 </td> <td> 0 </td> </tr>"+
            "<tr><th>Line5</th> <td> 1 </td> <td> 1 </td> </tr> <tr><th>Line6</th> <td> 1 </td> <td> 1 </td> </tr> </div>"
    }
}

