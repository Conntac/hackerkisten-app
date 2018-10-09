import QtQuick 2.0

ListModel {
    id: listModel

    property bool ready: false
    property url source

    Component.onCompleted: reload()
    onSourceChanged: reload()

    function reload()
    {
        if (!source) {
            return;
        }

        listModel.clear();
        ready = false;

        var doc = new XMLHttpRequest();
        doc.onreadystatechange = function() {
           if (doc.readyState === XMLHttpRequest.DONE) {
               var json = JSON.parse(doc.responseText);

                for(var i in json) {
                    var entry = json[i];

                    listModel.append(entry);
                }

                ready = true;
            }
        }

        doc.open("GET", source);
        doc.send();
    }
}
