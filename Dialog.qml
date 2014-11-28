/*
 * QML Material - An application framework implementing Material Design.
 * Copyright (C) 2014 Michael Spencer
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as
 * published by the Free Software Foundation, either version 2.1 of the
 * License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
import QtQuick 2.2
import QtQuick.Window 2.2

View {
    id: dialog
    width: 270
    height: 300
    elevation: 5

    property string title
    property alias dialogContent: contentItem.data

    z: 99999999
    clipContent: false

    opacity: 0
    visible: opacity !=0

    signal accepted();
    signal rejected();

    function show()
    {
        opacity = 1;
    }

    function close()
    {
        hide()
    }

    function hide()
    {
        opacity = 0;
    }

    Behavior on opacity {
        NumberAnimation { duration: 200 }
    }

    Rectangle {
        id: overlay

        x: - Screen.height
        y: - Screen.width
        height: Screen.height * 3
        width: Screen.width * 3

        color: "black"
        opacity: dialog.opacity * 0.4

        z: -1

        MouseArea {
            anchors.fill: parent
        }
    }

    Label {
        id: titleItem
        text: title

        style: "title"

        anchors {
            left: parent.left
            right: parent.right
            top: parent.top
            margins: units.dp(24)
        }
    }

    Item
    {
        id: contentItem

        anchors
        {
            top: titleItem.bottom
            bottom: cancelButton.top
            left: parent.left
            right: parent.right
        }
    }

    Button {
        id: cancelButton
        anchors {
            right: acceptButton.left
            bottom: parent.bottom
            bottomMargin: units.dp(16)
        }

        text: "CANCEL"

        onTriggered:
        {
            rejected()
            dialog.hide()
        }
    }

    Button {
        id: acceptButton

        anchors {
            right: parent.right
            bottom: parent.bottom
            margins: units.dp(16)
        }

        style: "primary"
        text: "ACCEPT"

        onTriggered:
        {
            accepted()
            dialog.hide()
        }
    }
}
