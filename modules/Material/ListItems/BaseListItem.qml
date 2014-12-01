import QtQuick 2.0
import Material 0.1 //Android had problem with '..'

View {
    id: listItem
    anchors {
        left: parent.left
        right: parent.right
    }

    property int margins: units.dp(16)

    property int dividerInset: 0
    property bool showDivider: false

    signal triggered()

    ThinDivider {
        anchors.bottom: parent.bottom
        anchors.leftMargin: dividerInset

        visible: showDivider
    }

    Ink {
        id: ink
        onClicked: listItem.triggered()
        anchors.fill: parent
    }

    tintColor: ink.containsMouse ? Qt.rgba(0,0,0,0.05) : Qt.rgba(0,0,0,0)
}
