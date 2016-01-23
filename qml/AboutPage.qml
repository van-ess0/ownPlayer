import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    Column{
        Text {
            text: qsTr("This is About Page")
        }

        Text {
            // http://www.flaticon.com/authors/daniel-bruce
            textFormat: Text.RichText
            text: qsTr('Thanks for the icons to
                        <a href="http://www.flaticon.com/authors/daniel-bruce">Daniel Bruce</a>')
        }

        Text {
            text: qsTr("Authors:")
        }

        Text {
            textFormat: Text.RichText
            text: "Suratov Vladislav<br>
                   <a href='https://twitter.com/suratovvlad'>@suratovvlad</a><br>
                   <a href='https://github.com/suratovvlad'>GitHub</a>"
        }

        Text {
            textFormat: Text.RichText
            text: "Piskunov Ivan<br>
                  <a href='https://twitter.com/Van_ess0'>@Van_ess0</a><br>
                  <a href='https://github.com/van-ess0'>GitHub</a>"
        }
    }
}

