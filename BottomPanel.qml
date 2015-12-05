import QtQuick 2.5
import QtQuick.Controls 1.4

Item {

    height: parent.height / 7
    width: parent.width
    anchors.bottom: parent.bottom

    Rectangle {
        anchors.fill: parent
        color: "green"

        Text {
            id: currentPos
            text: filling()
            anchors {
                verticalCenter: progressSlider.verticalCenter
                right: progressSlider.left
            }
            function filling()
            {
                var seconds = (progressSlider.value % 60).toString();
                var minutes = ((progressSlider.value - seconds) / 60).toString();

                return (qsTr(minutes + ":" + seconds))
            }
        }

        Text {
            id: trackLength
            text: qsTr(progressSlider.maximumValue.toString())
            anchors {
                verticalCenter: progressSlider.verticalCenter
                left: progressSlider.right
            }
        }

        Slider {
            id: progressSlider
            width: parent.width / 1.5
            //Get lenght of the track
            maximumValue: 100
            minimumValue: 0
            stepSize: 1.0
            anchors.horizontalCenter: parent.horizontalCenter

            onPressedChanged: {
                if (!pressed) {
                    //set the Position
                    console.log("Position set to ", value)
                }
            }

        }

        BottomPanelButton {
            id: playbutton
            anchors.centerIn: parent
            width: 40
            height: 40
            iconSource: "qrc:/resources/images/play.svg"

            function onTouched() {
                console.log("Play touched")

            }
        }

        BottomPanelButton {
            id: prevbutton
            anchors.verticalCenter: playbutton.verticalCenter
            anchors.right: playbutton.left
            width: 20
            height: 20
            iconSource: "qrc:/resources/images/previous.svg"

            function onTouched() {
                console.log("Prev touched")

            }
        }

        BottomPanelButton {
            id: nextbutton
            anchors.verticalCenter: playbutton.verticalCenter
            anchors.left: playbutton.right
            width: 20
            height: 20
            iconSource: "qrc:/resources/images/next.svg"

            function onTouched() {
                console.log("Next touched")

            }
        }

        BottomPanelButton {
            id: shufflebutton
            anchors.verticalCenter: playbutton.verticalCenter
            x: prevbutton.x - 40
            width: 20
            height: 20
            iconSource: "qrc:/resources/images/shuffle.svg"

            function onTouched() {
                console.log("Shuffle touched")

            }
        }

        BottomPanelButton {
            id: cyclebutton
            anchors.verticalCenter: playbutton.verticalCenter
            x: nextbutton.x + 40
            width: 20
            height: 20
            iconSource: "qrc:/resources/images/cycle.svg"

            function onTouched() {
                console.log("Cycle touched")

            }
        }

    }
}

