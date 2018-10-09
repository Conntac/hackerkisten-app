import QtQuick 2.9
import QtQuick.Controls 2.3
import QtQuick.Controls.Material 2.2
import QtQuick.Layouts 1.2
import QtGraphicalEffects 1.0

ApplicationWindow {
    visible: true
    width: 500
    height: 800
    title: qsTr("Hackerkiste 2018")

    Material.theme: Material.Dark
    Material.accent: Material.Grey
    Material.primary: "#222222"

    header: ToolBar {
        Image {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.margins: 5
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectFit
            source: "hackerkiste-logo.png"
            visible: !titleLabel.text.length
        }

        RowLayout {
            anchors.fill: parent
//            ToolButton {
//                text: qsTr("‹")
//                onClicked: stack.pop()
//                visible: false
//            }
            Label {
                id: titleLabel
                text: view.currentItem.title
                elide: Label.ElideRight
                horizontalAlignment: Qt.AlignHCenter
                verticalAlignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }

//            ToolButton {
//                text: qsTr("⋮")
//                onClicked: menu.open()
//                visible: false
//            }
        }
    }

    background: LinearGradient {
        start: Qt.point(0, 0)
        end: Qt.point(0, parent.height)
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#ffc00c" }
            GradientStop { position: 1.0; color: "#ff0028" }
        }
    }

    SwipeView {
        id: view
        anchors.fill: parent

        onCurrentIndexChanged: bar.currentIndex = currentIndex

        LivePage {
        }

        SpeakerPage {
        }

        TalkPage {
        }
    }

    footer: TabBar {
        id: bar
        width: parent.width
        TabButton {
            text: "Live"
        }
        TabButton {
            text: "Speakers"
        }
        TabButton {
            text: "Talks"
        }

        onCurrentIndexChanged: view.currentIndex = currentIndex
    }
}
