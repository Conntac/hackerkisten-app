import QtQuick 2.0
import QtQuick.Controls 2.3

Page {
    title: qsTr("Speakers")

    GridView {
        id: gridView
        anchors.fill: parent

        model: JSONModel {
            id: listModel
            source: "data/speakers.json"
        }

        ScrollIndicator.vertical: ScrollIndicator { }

        cellWidth: width / 2
        cellHeight: cellWidth

        delegate: ItemDelegate {
            width: gridView.cellWidth
            height: gridView.cellHeight

            Image {
                anchors.fill: parent
                source: model.img_url
                opacity: 0.3
                fillMode: Image.PreserveAspectFit
            }

            Label {
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                text: "%1, %2".arg(model.name).arg(model.company)
                wrapMode: Text.Wrap
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }

    background: Item {
    }
}
