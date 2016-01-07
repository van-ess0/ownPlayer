import QtQuick 2.0

Item {
    id: library_element
    property var element_view: null
    property string element_text: ""
    property bool elemet_playbutton_visible: true

    width: element_view.width
    height: 60

    function onPlayTouched() {

    }

    function onPressAndHold() {

    }

    function onClicked() {

    }

    function onDoubleClicked() {

    }

    Rectangle {
        anchors.margins: 5
        anchors.fill: parent

        border {
            color: "black"
            width: 1
        }

        BottomPanelButton {
            id: playbutton_element
            objectName: "playbutton"
            anchors.left: parent
            anchors.verticalCenter: parent.verticalCenter
            height: parent.height
            width: height
            iconSource: "qrc:/resources/images/play.svg"
            function onTouched() {
                library_element.onPlayTouched()
            }

            visible: library_element.elemet_playbutton_visible
        }

        Text {
            id: text_element
            anchors.verticalCenter: playbutton_element.verticalCenter
            anchors.left: playbutton_element.right
            renderType: Text.NativeRendering
            text: element_text
        }

        MouseArea {
            id: mouse_area_element
            height: parent.height
            width: parent.width - playbutton_element.width
            anchors.left: playbutton_element.right
            onPressAndHold: library_element.onPressAndHold()
            onClicked: library_element.onClicked()
            onDoubleClicked: library_element.onDoubleClicked()
        }
    }

}

