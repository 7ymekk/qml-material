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
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program. If not, see <http://www.gnu.org/licenses/>.
 */
import QtQuick 2.0
import QtQuick.Window 2.2

View {
    width: units.dp(320)
    fullHeight: true

    objectName: "navDrawer"
    z: 15

    clipContent: false

    anchors {
        left: parent.left
        top: parent.top
        bottom: parent.bottom

        leftMargin: showing ? 0 : -width

        Behavior on leftMargin {
            NumberAnimation { duration: 200 }
        }
    }

    backgroundColor: "white"
    elevation: 3

    property bool showing

    function open() {
        showing = true
    }

    function close() {
        showing = false
    }

    Rectangle {
        id: overlay

        x: - Screen.height
        y: - Screen.width
        height: Screen.height * 3
        width: Screen.width * 3

        color: "black"
        opacity: showing ? 0.4 : 0

        z: -1

        MouseArea {
            enabled: showing
            anchors.fill: parent
            hoverEnabled: showing

            onClicked: { close() }
        }

        Behavior on opacity{
            NumberAnimation { duration: 200 }
        }
    }
}
