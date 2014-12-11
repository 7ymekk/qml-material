import QtQuick 2.0
import Material 0.1
import ListItems 0.1

Dialog
{
    id: dialog
    property var value: null

    /**
      choices - json object array

      example usage: show([{label: "Polish", value: 0}, {label: "English", value: 1}], 0)
      */
    function show(choices, currentValue)
    {
        choicesModel.clear()

        for(var i = 0; i < choices.length ; i++)
        {
            var jsonObject = choices[i];
            choicesModel.append(jsonObject)
            if (currentValue == jsonObject.value)
            {
                dialog.value = currentValue
                listView.currentIndex = i
            }
        }

        opacity = 1;
    }

    dialogContent: ListView {
        id: listView

        anchors
        {
            fill: parent
            margins: units.dp(8)
        }
        clip: true

        model: ListModel{ id: choicesModel }

        delegate: Subtitled{

            property var isCurrent: ListView.isCurrentItem
            text: label

            onTriggered:
            {
                dialog.value = value
                listView.currentIndex = index
            }

            action: Item {
                anchors.fill: parent
                Rectangle
                {
                    anchors.centerIn: parent
                    height: parent.height * 1 / 2
                    width: height
                    radius: width/2
                    color: "transparent"

                    opacity: isCurrent ? 1 : 0.5

                    border
                    {
                        width: units.dp(2)
                        color: Theme.primaryColor
                    }

                    Behavior on opacity{
                        NumberAnimation { duration: 200 }
                    }

                    Rectangle
                    {
                        anchors.centerIn: parent
                        height: parent.height / 2
                        width: height
                        radius: width/2
                        color: Theme.primaryColor

                        scale: isCurrent ? 1 : 0

                        Behavior on scale{
                            NumberAnimation { duration: 200 }
                        }
                    }
                }
            }
        }

        ThinDivider
        {
            anchors
            {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }
        }
    }
}
