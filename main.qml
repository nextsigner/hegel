import QtQuick
import QtQuick.Controls
import QtCore
import unik.Unik 1.0
import QtMultimedia

Window {
    id: app
    width: Qt.platform.os==='android'?640:608
    height: Qt.platform.os==='android'?480:1080
    visible: true
    //visibility: 'FullScreen'
    title: "Aristoteles"
    color: 'black'
    property bool appRotated: Qt.platform.os==='android'?Screen.width>Screen.height:Screen.width<Screen.height
    property int fs: !appRotated?width*0.035:height*0.035
    property var json
    property string tempFolder: ''
    property int playingFromCache: -1
    property int positionMin: 0


    Settings {
        id: apps
        property int volumeValue: 100
        property color fontColor: 'white'
        property color backgroundColor: 'black'
    }
    Connections{
        target: qmlErrorLogger
        onMessagesChanged:{
            log.text+=''+qmlErrorLogger.messages[qmlErrorLogger.messages.length-1]+'<br>'
            xLog.visible=true
        }
    }
    Item {
        Unik {
            id: unikObj
            property string cProject: ''
            property string uFilePathDownloaded: ''
            property string uFileNameDownloaded: ''

            onDownloadProgress: function(bytesReceived, bytesTotal) {
                let msg=""
                if (bytesTotal > 0) {
                    let percent = (bytesReceived / bytesTotal) * 100;
                    msg="Progreso: " + percent.toFixed(2) + "% (" + bytesReceived + " / " + bytesTotal + " bytes)"
                    console.log(msg);
                    progressBar.value = bytesReceived / bytesTotal;
                } else {
                    msg="Descargando... Bytes recibidos: " + bytesReceived
                    console.log(msg);
                }
            }
            onDownloadFinished: function(success, filePath) {
                let msg=""
                if (success) {
                    let ffn=filePath//+'/'+unikObj.uFileNameDownloaded
                    unikObj.uFilePathDownloaded=filePath
                    mediaPlayer.source='file:/'+unikObj.uFilePathDownloaded
                    mediaPlayer.play()
                } else {
                    msg="Error al descargar el archivo ZIP."
                }
            }
        }


    }

    Item {
        id: xApp
        width: !app.appRotated?parent.width-app.fs:parent.height-app.fs
        height: !app.appRotated?parent.height-app.fs*6:parent.width-app.fs*6
        rotation: !app.appRotated?0:90
        anchors.centerIn: parent
        MouseArea {
            id: touchArea
            //anchors.fill: parent
            width: xApp.width-volumeTrack.width
            height: parent.height
            anchors.right: parent.right

            property real startX: 0

            onPressed: (mouse) => {
                           startX = mouse.x;
                       }

            onReleased: (mouse) => {
                            var deltaX = mouse.x - startX;
                            var screenWidth = xApp.width;
                            var ratio = Math.abs(deltaX) / screenWidth;

                            if (ratio < 0.05) {
                                if (mediaPlayer.playbackState === MediaPlayer.PlayingState) {
                                    mediaPlayer.pause();
                                } else {
                                    mediaPlayer.play();
                                }
                                return;
                            }

                            var minJump = 10 * 1000;
                            var maxJump = 5 * 60 * 1000;

                            var jumpTime = minJump + ratio * (maxJump - minJump);
                            if (jumpTime > maxJump) jumpTime = maxJump;

                            var newPosition = mediaPlayer.position;

                            if (deltaX > 0) {
                                newPosition += jumpTime;
                                //app.positionMin=newPosition
                                mediaPlayer.position = Math.min(newPosition, mediaPlayer.duration)
                            } else {
                                newPosition -= jumpTime;
                                //app.positionMin=newPosition
                                mediaPlayer.position = Math.max(newPosition, 0)
                            }
                        }
        }
        Rectangle{
            width: app.fs*6
            height: width
            anchors.verticalCenter: parent.verticalCenter
            visible: false
            Text{
                text: 'Ms:'+app.positionMin
                font.pixelSize: app.fs
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    mediaPlayer.source='file:/'+unikObj.uFilePathDownloaded
                    mediaPlayer.play()
                    log.text+='Reproducciendo: '+(''+mediaPlayer.source).replace(/\//g, '\n\\')
                    xLog.visible=true
                }
            }
        }
        /*Column {
            spacing: app.fs*2
            anchors.top: parent.top
            anchors.topMargin: app.fs*8
            Text {
                text: "" + getMsToString(mediaPlayer.position) + '\n'+getMsToString(mediaPlayer.duration)
                width: progressContainer.width
                color: 'white'
                font.pixelSize: app.fs*2
                wrapMode: Text.WordWrap
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }*/

        // --- Control de volumen vertical (Lateral izquierdo) ---
        Rectangle {
            id: volumeTrack
            width: app.fs*3
            height: parent.height-app.fs*2
            border.width: 2
            border.color: 'white'
            color: "gray"
            z: 10
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter

            Rectangle {
                id: volumeHandle
                width: parent.width
                height: width
                color: "white"

                y: (1.0 - audioOutput.volume) * (volumeTrack.height - height)

                Text {
                    text: Math.round(audioOutput.volume * 100)
                    color: "black"
                    font.pixelSize: parent.width*0.5
                    font.bold: true
                    anchors.centerIn: parent
                }
            }

            MouseArea {
                id: volumeMouseArea
                anchors.fill: parent

                function updateVolume(mouseY) {
                    var clampedY = Math.max(0, Math.min(mouseY, volumeTrack.height));
                    var newVolume = 1.0 - (clampedY / volumeTrack.height);
                    var finalVol = Math.max(0.0, Math.min(1.0, newVolume));

                    audioOutput.volume = finalVol;
                    apps.volumeValue = Math.round(finalVol * 100);
                }

                onPressed: (mouse) => updateVolume(mouse.y)
                onPositionChanged: (mouse) => updateVolume(mouse.y)
                /*onDoubleClicked: {
                    let fp=(""+mediaPlayer.source).replace('file:', '')
                    let fe=unikObj.fileExist(fp)
                    let del=false
                    if(fe){
                        del=unikObj.deleteFile(fp)
                    }
                    //txtCentral.text+='fp: '+fp+'<br>'
                    //txtCentral.text+='del: '+del+'<br>'


                }*/
            }
        }

        Column{
            spacing: app.fs
            anchors.verticalCenter: parent.verticalCenter
            ListView {
                id: lvAudios
                width: xApp.width-volumeTrack.width
                height: xApp.height*0.2
                orientation: ListView.Horizontal
                snapMode: ListView.SnapOneItem
                highlightRangeMode: ListView.StrictlyEnforceRange
                z: 5
                rotation: -180

                model: lmAudios
                delegate: Rectangle {
                    width: lvAudios.width
                    height: lvAudios.height
                    color: "#222222"
                    border.color: "white"
                    border.width: 1
                    clip: true
                    rotation: -180
                    MouseArea{
                        anchors.fill: parent
                        //onDoubleClicked: mediaPlayer.position = posicion
                    }
                    Column {
                        anchors.centerIn: parent
                        spacing: app.fs*0.5

                        Text {
                            text: titulo
                            width: parent.parent.width-app.fs
                            wrapMode: Text.WordWrap
                            horizontalAlignment: Text.AlignHCenter
                            color: "white"
                            font.pixelSize: app.fs*2
                            font.bold: true
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        Text {
                            text: descripcion
                            width: parent.parent.width-app.fs
                            wrapMode: Text.WordWrap
                            horizontalAlignment: Text.AlignHCenter
                            color: "white"
                            font.pixelSize: app.fs*1.2
                            font.bold: true
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                        Text {
                            text: "URL: " + url
                            color: "#AAAAAA"
                            font.pixelSize: 18
                            anchors.horizontalCenter: parent.horizontalCenter
                            visible: false
                        }
                    }
                }

                // Al deslizar y cambiar el elemento seleccionado, actualiza la posición del audio
                onCurrentIndexChanged: {
                    loadData(currentIndex)
                }
                ListModel{
                    id: lmAudios
                    function addItem(t, d, u){
                        return{
                            titulo: t,
                            descripcion: d,
                            url: u
                        }

                    }
                }
            }
            Item{
                width: xApp.width
                height: volumeTrack.height-lvAudios.height-markersList.height-progressContainer.height-progressBar.height-parent.spacing*4
                anchors.horizontalCenter: parent.horizontalCenter
                /*MouseArea{
                    anchors.fill: parent
                    onDoubleClicked: {
                        mediaPlayer.source=unikObj.uFilePathDownloaded
                        mediaPlayer.play()
                    }
                }*/
                Text {
                    id: txtCentral
                    text: "" + getMsToString(mediaPlayer.position) + '\n'+getMsToString(mediaPlayer.duration)//+"\nP:"+app.playingFromCache
                    width: progressContainer.width
                    color: 'white'
                    font.pixelSize: app.fs*4
                    wrapMode: Text.WordWrap
                    horizontalAlignment: Text.AlignHCenter
                    anchors.centerIn: parent
                }
            }
            Rectangle {
                id: progressContainer
                width: xApp.width-volumeTrack.width
                height: app.fs*4
                border.width: 1
                border.color: 'white'
                //anchors.horizontalCenter: parent.horizontalCenter
                anchors.left: parent.left

                color: {
                    if (mediaPlayer.playbackState === MediaPlayer.PlayingState) {
                        return "red";
                    } else if (mediaPlayer.playbackState === MediaPlayer.PausedState) {
                        return "green";
                    } else if (mediaPlayer.mediaStatus === MediaPlayer.LoadedMedia) {
                        return "yellow";
                    } else {
                        return "white";
                    }
                }

                property int porcentaje: (mediaPlayer.duration > 0)
                                         ? Math.floor((mediaPlayer.position / mediaPlayer.duration) * 100)
                                         : 0

                Text {
                    //text: "Reproducido: %" + progressContainer.porcentaje
                    text: {
                        if (mediaPlayer.playbackState === MediaPlayer.PlayingState) {
                            return "Reproduciendo: %" + progressContainer.porcentaje;
                        } else if (mediaPlayer.playbackState === MediaPlayer.PausedState) {
                            return "Pausado: %" + progressContainer.porcentaje;
                        } else if (mediaPlayer.mediaStatus === MediaPlayer.LoadedMedia) {
                            return "Preparado: %100";
                        } else {
                            return "?";
                        }
                    }
                    color: {
                        if (mediaPlayer.playbackState === MediaPlayer.PlayingState) {
                            return "white";
                        } else if (mediaPlayer.playbackState === MediaPlayer.PausedState) {
                            return "white";
                        } else if (mediaPlayer.mediaStatus === MediaPlayer.LoadedMedia) {
                            return "black";
                        } else {
                            return "black";
                        }
                    }
                    font.pixelSize: parent.height*0.5
                    anchors.centerIn: parent
                }

                Item {
                    id: progressIndicator
                    width: 1
                    height: parent.height
                    x: (mediaPlayer.duration > 0)
                       ? (mediaPlayer.position / mediaPlayer.duration) * (progressContainer.width - width)
                       : 0
                    Rectangle {
                        width: app.fs*0.1
                        height: parent.height
                        anchors.centerIn: parent
                        SequentialAnimation on color {
                            running: true
                            loops: Animation.Infinite

                            ColorAnimation {
                                from: "red"
                                to: "yellow"
                                duration: 200
                            }
                            ColorAnimation {
                                from: "yellow"
                                to: "red"
                                duration: 350
                            }
                        }
                    }
                }
            }
            Rectangle{
                width: xApp.width
                height: progressBar.height
                color: apps.backgroundColor
                anchors.horizontalCenter: parent.horizontalCenter
                visible: app.playingFromCache===2
                Text{
                    text: 'Archivo de audio local (Descargado)'
                    font.pixelSize: app.fs
                    color: apps.fontColor
                    anchors.centerIn: parent
                }
            }
            ProgressBar {
                id: progressBar
                width: xApp.width
                height: app.fs*2
                anchors.horizontalCenter: parent.horizontalCenter
                from: 0
                to: 1
                value: 0
                visible: app.playingFromCache===1
                Rectangle{
                    color: 'transparent'
                    border.width: 2
                    border.color: apps.fontColor
                    anchors.fill: parent
                    Text{
                        text:  '%'+progressBar.value
                        font.pixelSize: app.fs*0.5
                        color: apps.fontColor
                        anchors.centerIn: parent
                        Rectangle{
                            width: parent.contentWidth+4
                            height: parent.contentHeight
                            color: apps.backgroundColor
                            anchors.centerIn: parent
                            z: parent.z-1
                        }
                    }
                }
            }
            // --- ListView Horizontal Inferior ---
            ListView {
                id: markersList
                width: xApp.width-volumeTrack.width
                height: xApp.height*0.3
                orientation: ListView.Horizontal
                snapMode: ListView.SnapOneItem
                highlightRangeMode: ListView.StrictlyEnforceRange
                z: 5
                rotation: -180

                model: lm
                delegate: Rectangle {
                    width: markersList.width
                    height: markersList.height
                    color: "#222222"
                    border.color: "white"
                    border.width: 1
                    clip: true
                    rotation: -180
                    MouseArea{
                        anchors.fill: parent
                        onDoubleClicked: {
                            //app.positionMin=posicion
                            mediaPlayer.position = posicion
                        }
                    }

                    Column {
                        anchors.centerIn: parent
                        spacing: 10

                        Text {
                            text: titulo
                            width: parent.parent.width-app.fs
                            wrapMode: Text.WordWrap
                            horizontalAlignment: Text.AlignHCenter
                            color: "white"
                            font.pixelSize: app.fs*2
                            font.bold: true
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                        Text {
                            text: descripcion
                            width: parent.parent.width-app.fs
                            wrapMode: Text.WordWrap
                            horizontalAlignment: Text.AlignHCenter
                            color: "white"
                            font.pixelSize: app.fs*1.2
                            font.bold: true
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                        Text {
                            //text: "Posición: " + (posicion / 1000) + " seg (" + posicion + " ms)"
                            text: "Posición: " + getMsToString((posicion)) + " de " + getMsToString(mediaPlayer.duration)
                            color: "#AAAAAA"
                            font.pixelSize: 18
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                }

                // Al deslizar y cambiar el elemento seleccionado, actualiza la posición del audio
                onCurrentIndexChanged: {
                    if (currentItem && mediaPlayer.duration > 0) {
                        var targetPos = model.get(currentIndex).posicion;
                        //app.positionMin=posicion
                        mediaPlayer.position = Math.min(targetPos, mediaPlayer.duration);
                    }
                }
                ListModel{
                    id: lm
                    function addItem(t, d, ms){
                        return{
                            titulo: t,
                            descripcion: d,
                            posicion: ms
                        }

                    }
                }
            }
        }
        MediaPlayer {
            id: mediaPlayer
            audioOutput: AudioOutput {
                id: audioOutput
                volume: apps.volumeValue / 100.0
            }
            onPositionChanged:{
                if(mediaPlayer.position<app.positionMin){
                    mediaPlayer.position=app.positionMin
                }
            }
            onPlaybackStateChanged: {
                    if (playbackState === MediaPlayer.StoppedState) {
                        if (position > 0 && position >= duration) {
                            console.log("¡Llegó al final de la reproducción!")
                            if(lvAudios.currentIndex<lvAudios.model.count-1){
                                lvAudios.currentIndex++
                            }
                        }
                    }
                }
            autoPlay: true
        }
        MediaPlayer {
            id: mediaPlayerSys
            audioOutput: AudioOutput {
                id: audioOutputSys
                volume: apps.volumeValue / 100.0
            }
            autoPlay: true
        }

        Rectangle{
            id: xLog
            color: 'black'
            anchors.fill: parent
            visible: false
            MouseArea{
                anchors.fill: parent
                onClicked: xLog.visible=false
            }
            Text{
                id: log
                width: parent.width-app.fs
                color: 'white'
                wrapMode: Text.WordWrap
                font.pixelSize: 12
                anchors.centerIn: parent
            }
        }
    }
    Component.onCompleted: {
        let j={}
        j.items=[]
        let item
        let marcs
        let marc

        //app.positionMin=33*1000
        //Item 1
        item={}
        item.url="https://github.com/nextsigner/hegel/releases/download/filosof%C3%ADa/hegel_1_p1.wav"
        item.tit="Enrique Pedro Mesa\nHEGEL (1.1/1.3)/3"
        item.des="Realiad y Dialéctica"
        marcs=[]

        marc={}
        marc.titulo="Preámbulo introductorio"
        marc.des="Se explica en qué consistirán las siguientes explicaciones sobre Hegel en esta calse."
        marc.ms=getHmsToMs(0, 0, 33)
        marcs.push(marc)

        marc={}
        marc.titulo="Idea 1: LA REALIDAD"
        marc.des="¿Qué es la realidad? Es todo lo que hay. PRESENTE PERMANENTE (contínuo)."
        marc.ms=getHmsToMs(0, 3, 32)
        marcs.push(marc)

        marc={}
        marc.titulo="Idea 2: LA HISTÓRIA"
        marc.des="La história demuestra que la realidad no es fija. La realidad se transforma."
        marc.ms=getHmsToMs(0, 7, 19)
        marcs.push(marc)

        marc={}
        marc.titulo="Idea 3: NUEVA DEFINICIÓN DE REALIDAD"
        marc.des="La temporalirad. LA REALIDAD ES LO QUE HAY, LO QUE ES, LO QUE FUÉ Y LO QUE SERÁ. La realidad es TODO lo que ES sin importar cuándo."
        marc.ms=getHmsToMs(0, 10, 31)
        marcs.push(marc)

        marc={}
        marc.titulo="Idea 4: EL MOTOR (EL DESARROLLO DEL ESPÍRITU ABSOLUTO)"
        marc.des="El motor podría ser IRRACIONAL. Hegel afirma que es RACIONAL porque hay un ORDEN y SENTIDO. Busca EL DESARROLLO DE LA HISTÓRIA, LA RAZÓN y el ESPÍRITU ABSOLUTO."
        marc.ms=getHmsToMs(0, 13, 16)
        marcs.push(marc)

        item.marcs=marcs
        j.items.push(item)

        //Item 2
        item={}
        item.url="https://github.com/nextsigner/hegel/releases/download/filosof%C3%ADa/hegel_1_p2.wav"
        item.tit="Enrique Pedro Mesa\nHEGEL (1.2/1.3)/3"
        item.des="Desarrollo de la razón, abstracción..."
        marcs=[]

        marc={}
        marc.titulo="EL DESARROLLO DE LA RAZÓN"
        marc.des="¿Qué es?. Superando lo real, la razón al avanzar busca que a la REALIDAD QUE HAY LE PIDE CADA VEZ MÁS. Camino a la RACIONALIDAD ABSOLUTA."
        marc.ms=getHmsToMs(0, 0, 0)
        marcs.push(marc)

        marc={}
        marc.titulo="LA ABSTRACCIÓN"
        marc.des="Ejemplo de la moneda de metal y el papel moneda."
        marc.ms=getHmsToMs(0, 2, 45)
        marcs.push(marc)

        marc={}
        marc.titulo="LA AUTOCONSCIENCIA"
        marc.des="Una mayor abstracción lleva a una mayor AUTOCONSCIENCIA. La historia va comprendiéndose a sí mismo."
        marc.ms=getHmsToMs(0, 6, 9)
        marcs.push(marc)

        marc={}
        marc.titulo="LA DIALÉCTICA"
        marc.des="La dialéctica es lo que permite es DESARROLLO DE LA HISTORIA. El elemento clave es LA NEGACIÓN . La NEGATIVIDAD por encima del CAMBIO, lo DISTINTO y lo CONTRARIO."
        marc.ms=getHmsToMs(0, 7, 44)
        marcs.push(marc)

        marc={}
        marc.titulo="SUPERACIÓN DE LOS PRINCIPIOS"
        marc.des="LOS PRINCIPIOS DE IDENTIDAD Y LOS PRINCIPIOS DE NO SUPERACIÓN."
        marc.ms=getHmsToMs(0, 15, 30)
        marcs.push(marc)

        item.marcs=marcs
        j.items.push(item)

        //Item 3
        item={}
        item.url="https://github.com/nextsigner/hegel/releases/download/filosof%C3%ADa/hegel_1_p3.wav"
        item.tit="Enrique Pedro Mesa\nHEGEL (1.3/1.3)/3"
        item.des="????"
        marcs=[]

        marc={}
        marc.titulo="TÉSIS, ANTÍTESIS Y SÍNTESIS"
        marc.des="Superación de la negatividad."
        marc.ms=getHmsToMs(0, 0, 0)
        marcs.push(marc)

        marc={}
        marc.titulo="IDEALISMO ABSOLUTO"
        marc.des="¿Qué es? La RAZÓN DETERMINA LA REALIDAD."
        marc.ms=getHmsToMs(0, 3, 18)
        marcs.push(marc)

        item.marcs=marcs
        j.items.push(item)

        app.json=j

        loadDataAudios()
        loadData(0)
    }

    Shortcut {
        sequence: 'Esc'
        onActivated: {
            Qt.quit()
        }
    }
    function loadDataAudios(){
        lmAudios.clear()
        for(var i=0;i<app.json.items.length;i++){
            lmAudios.append(lmAudios.addItem(app.json.items[i].tit, app.json.items[i].des,  app.json.items[i].url))
        }
    }
    function loadData(index){
        lm.clear()
        let item=app.json.items[index]
        let m0=item.url.split('/')
        if(index===0){
            app.positionMin=item.marcs[0].ms
        }else{
            app.positionMin=0
        }
        if(unikObj.fileExist(unikObj.getPath(2)+'/'+m0[m0.length-1])){
            mediaPlayer.source='file://'+unikObj.getPath(2)+'/'+m0[m0.length-1]
            app.playingFromCache=2
        }else{
            app.playingFromCache=1
            progressBar.visible=true
            unikObj.uFileNameDownloaded=m0[m0.length-1]
            let descargado=unikObj.downloadGitHubZip(item.url, m0[m0.length-1]);
            if(descargado){
                mediaPlayer.source='file://'+unikObj.getPath(2)+'/'+m0[m0.length-1]
            }else{
                mediaPlayer.source='file://'+unikObj.getPath(2)+'/'+m0[m0.length-1]
            }
            mediaPlayer.play()
        }
        for(var i=0;i<item.marcs.length;i++){
            let marc=item.marcs[i]
            lm.append(lm.addItem(marc.titulo, marc.des,marc.ms))
        }
    }
    function getMsToString(ms) {
        if (isNaN(ms) || ms < 0) {
            return "00:00:00";
        }

        // Convertir milisegundos a segundos totales
        var totalSeconds = Math.floor(ms / 1000);

        // Calcular horas, minutos y segundos restables
        var hours = Math.floor(totalSeconds / 3600);
        var minutes = Math.floor((totalSeconds % 3600) / 60);
        var seconds = totalSeconds % 60;

        // Formatear a 2 dígitos con cero inicial
        var hStr = hours.toString().padStart(2, '0');
        var mStr = minutes.toString().padStart(2, '0');
        var sStr = seconds.toString().padStart(2, '0');

        return hStr + ":" + mStr + ":" + sStr;
    }
    function getHmsToMs(hours, minutes, seconds) {
        var h = hours || 0;
        var m = minutes || 0;
        var s = seconds || 0;

        return ((h * 3600) + (m * 60) + s) * 1000;
    }
}
