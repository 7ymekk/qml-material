import QtQuick 2.3

import Material 0.1

View
{
    id: view
    property alias action: icon.action

    height: units.dp(56) * 1.2
    width: height

    elevation: mouseArea.containsMouse ? 4 : 2
    radius: width / 2

    backgroundColor: Theme.primaryColor

    signal triggered();

    Icon
    {
        id: icon

        color: "white"
        anchors.centerIn: parent

        height: parent.height * 2 / 3
        width: height

        name: action ? action.iconName : ""
        enabled: action ? action.enabled : true

        opacity: enabled ? 1 : 0.6

        property Action action
    }

    MouseArea
    {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true

        onClicked: view.triggered()
    }

    //needs animation: https://material.angularjs.org/#/demo/material.components.button
    states: [
    State
    {
        when: mouseArea.containsMouse
        PropertyChanges { target: view; backgroundColor:  Qt.darker(Theme.primaryColor, 1.1); }
    }]

    transitions: Transition {
        PropertyAnimation { properties: "backgroundColor"; duration: 100 }
    }
}
