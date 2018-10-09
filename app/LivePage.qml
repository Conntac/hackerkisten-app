import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Page {
//    title: qsTr("Zurzeit läuft")

    padding: 5

    JSONModel {
        id: listModel
        source: "data/events.json"

        onReadyChanged: {
            if (!ready) {
                return;
            }

            talks = [listModel.get(0), listModel.get(1)];
            barcamps = [listModel.get(2), listModel.get(3)];
            follow_up = [listModel.get(4), listModel.get(5)];
        }

        property variant talks
        property variant barcamps
        property variant follow_up
    }

    background: Item {
    }

    Component {
        id: loadingComponent

        BusyIndicator {
            anchors.centerIn: parent
            running: !listModel.ready
        }
    }

    Component {
        id: dataComponent

        GridLayout {
            columns: 2

            Label {
                Layout.fillWidth: true
                Layout.columnSpan: 2
                text: "12:00"
                horizontalAlignment: Text.AlignHCenter

                font.pointSize: 20
                padding: 10

                Component.onCompleted: updateTime()

                function updateTime() {
                    var now = new Date();
                    text = now.toLocaleTimeString(Qt.locale("de_DE"), Locale.ShortFormat);
                }

                Timer {
                    interval: 1000
                    onTriggered: parent.updateTime()
                    running: true
                    repeat: true
                }
            }

            Label {
                Layout.fillWidth: true
                Layout.columnSpan: 2
                text: "Talks"
                font.pixelSize: 16
            }

            TalkTile {
                talkData: listModel.talks[0]
            }

            TalkTile {
                talkData: listModel.talks[1]
            }

            //////////////////////

            Label {
                Layout.fillWidth: true
                Layout.columnSpan: 2
                text: "Barcamps"
                font.pixelSize: 16
            }

            TalkTile {
                talkData: listModel.barcamps[0]
            }

            TalkTile {
                talkData: listModel.barcamps[1]
            }

            //////////////////////

            Label {
                Layout.fillWidth: true
                Layout.columnSpan: 2
                text: "Im Anschluss daran ..."
                font.pixelSize: 16
            }

            TalkTile {
                talkData: listModel.follow_up[0]
            }

            TalkTile {
                talkData: listModel.follow_up[1]
            }

            Item {
                Layout.fillWidth: true
                Layout.fillHeight: true
            }
        }
    }

    Loader {
        anchors.fill: parent

        sourceComponent: {
            if (listModel.ready) {
                dataComponent;
            } else {
                return loadingComponent;
            }
        }
    }
}
