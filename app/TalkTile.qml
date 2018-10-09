import QtQuick 2.0
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3
import QtQml 2.2

Rectangle {
    id: root

    property variant talkData

    readonly property string title: talkData.title
    readonly property string room: talkData.place
    readonly property date startDate: new Date(talkData.start_time)

    Layout.fillWidth: true
    height: 150
    color: "#222222"

    opacity: 0.8

    ColumnLayout {
        anchors.fill: parent

        Label {
            Layout.fillWidth: true
            text: root.title
            elide: Text.ElideRight
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 20
            wrapMode: Text.Wrap
            maximumLineCount: 2
        }

        Label {
            Layout.fillWidth: true
            text: root.room
            elide: Text.ElideRight
            horizontalAlignment: Text.AlignHCenter
        }

        Label {
            Layout.fillWidth: true
            text: root.startDate.toLocaleString(Qt.locale("de_DE"), Locale.ShortFormat)
            elide: Text.ElideRight
            horizontalAlignment: Text.AlignHCenter
        }
    }
}
