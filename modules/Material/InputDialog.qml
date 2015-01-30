import QtQuick 2.0
import Material 0.1
import ListItems 0.1

Dialog
{
    id: dialog
    height: units.dp(150)
    property alias value: textField.text
    property alias textValidator: textField.validator
    property alias fieldInputMethodHints: textField.fieldInputMethodHints
    property alias fieldInputMask: textField.inputMask

    function show(currentValue)
    {
        textField.text = currentValue
        opacity = 1;
        textField.fieldFocus = true
        textField.selectAll()
    }

    onVisibleChanged:
    {
        if (!visible)
        {
            textField.fieldFocus = false
            Qt.inputMethod.hide()
        }
    }

    dialogContent: Item {
        anchors
        {
            fill: parent
            margins: units.dp(8)
        }
        clip: true

        TextField
        {
            id: textField
            anchors
            {
                left: parent.left
                right: parent.right
                verticalCenter: parent.verticalCenter
            }

            onReturnPressed:
            {
                accepted()
                hide();
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
