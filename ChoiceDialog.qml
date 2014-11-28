import QtQuick 2.0
import Material 0.1
import ListItems 0.1

Dialog
{
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
            if (currentValue === jsonObject.value)
                listView.currentIndex = i
        }

        opacity = 1;
    }

    ListView
    {
        id: listView

        anchors.centerIn: parent
        clip: true

        height: parent.height * 2 / 3
        width: parent.width

        model: ListModel{ id: choicesModel }

        delegate: Subtitled{
            property var isCurrent: ListView.isCurrentItem

            action: Item {

                anchors.fill: parent
                Rectangle
                {
                    anchors.centerIn: parent
                    height: parent.height * 2 / 3
                    width: height
                    radius: width/2
                    color: "transparent"

                    opacity: isCurrent ? 1 : 0.5

                    border
                    {
                        width: units.dp(2)
                        color: theme.primary
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
                        color: theme.primary

                        scale: isCurrent ? 1 : 0

                        Behavior on scale{
                            NumberAnimation { duration: 200 }
                        }
                    }
                }
            }
            text: label

            onTriggered: listView.currentIndex = index
        }

        Rectangle
        {
            height: units.dp(1)
            anchors
            {
                left: parent.left
                right: parent.right
                bottom: parent.bottom
            }

            color: theme.blackColor("divider")
        }
    }
}
