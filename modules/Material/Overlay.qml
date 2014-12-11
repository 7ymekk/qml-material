import QtQuick 2.0
import QtQuick.Window 2.2

Rectangle 
{
    id: overlay

    x: - Screen.height
    y: - Screen.width
    height: Screen.height * 3
    width: Screen.width * 3

    property bool showing: false

    color: "black"
    opacity: showing ? 0.4 : 0

    z: -1

    signal clicked()

    MouseArea 
	{
        enabled: showing
        anchors.fill: parent
        hoverEnabled: true

        onClicked: overlay.clicked()
    }

    Behavior on opacity{
        NumberAnimation { duration: 200 }
    }
}
