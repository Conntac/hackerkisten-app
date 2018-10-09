import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Page {
    title: qsTr("Talks")

    ListView {
        id: listView
        anchors.fill: parent

        model: JSONModel {
            id: listModel
            source: "data/talks.json"
        }

        spacing: 5

        currentIndex: -1

        ScrollIndicator.vertical: ScrollIndicator { }

        section.property: "day"
        section.delegate: Label {
            text: "Freitag"
        }

        delegate: ColumnLayout {
            id: talkDelegate
            width: ListView.view.width

            ItemDelegate {
                Layout.fillWidth: true
                text: model.title
                onClicked: listView.currentIndex = model.index
            }

            Rectangle {
                Layout.fillWidth: true
                color: "white"

                height: visible ? 300 : 0
                visible: talkDelegate.ListView.isCurrentItem
                clip: true

                Behavior on height {
                    SequentialAnimation {

                        NumberAnimation {
                            easing.type: Easing.OutBack
                            duration: 500
                        }

                        ScriptAction {
                            script: listView.forceLayout()
                        }
                    }
                }
            }
        }
    }

    background: Item {
    }
}
