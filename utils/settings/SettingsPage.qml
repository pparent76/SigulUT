import QtQuick 2.9
import Ubuntu.Components 1.3
import Qt.labs.settings 1.1
import "UCSComponents"

MainView {
    Page{
    id: settingsPage
    title: i18n.tr("Configuration")
    
      header: PageHeader {
                id:header
                title: i18n.tr("Settings")          
                leadingActionBar.actions: 
                [
                    Action {
                    iconName: "back"
                    text: i18n.tr("Back")
                    onTriggered: {
                        Qt.quit()
                        }
                    }
                ]
    }  
    
    
  Settings {
        id: config
        category: "AppSettings"

        property int appScaling: 270
        property int defaultAppScaling: 270
        property int textFontSize: 106
        property int spanFontSize: 107
        
    }
        
 

    Flickable {
    id: flick
     anchors { fill: parent; topMargin: header.height }
    clip: true

    // Dimensions du contenu à défiler
    contentWidth: width
    contentHeight: column.implicitHeight
        Column {
            id:column
            width: parent.width
            spacing: units.gu(2)
            padding: units.gu(1)
            //anchors { fill: parent}
            
                    // Warning 2
                    Row {
                        height: Math.max(imgWarning2.height, labelWarning2.implicitHeight) + units.gu(1)
                        width: parent ? parent.width : units.gu(40)
                        anchors.horizontalCenter: parent ? parent.horizontalCenter : undefined
                        leftPadding: units.gu(2)
                        spacing: units.gu(1)
                        Image {
                            source: "Icons/warning.png"
                            width: units.gu(3)
                            height: units.gu(3)
                            fillMode: Image.PreserveAspectFit
                            id:imgWarning2
                        }
                        Label {
                            text: i18n.tr("Warning: parameters will only be applied after restarting the app")
                            wrapMode: Text.Wrap
                            font.bold: true
                            color: "orange"
                            width: parent.width - units.gu(7)
                            id:labelWarning2
                        }
                    }
                

    
            Row{
            Button {
            text: i18n.tr("Reset to default values")
            onClicked: {
                config.appScaling = config.defaultAppScaling
                appScaling.value = config.defaultAppScaling
                config.textFontSize = 106
                textFontSize.value = 106
                config.spanFontSize = 107
                spanFontSize.value = 107

                }
            }
                
            }
            // --- Scaling ---
            Label { text: i18n.tr("Scaling"); font.bold: true; fontSize: "large"; color: UbuntuColors.black }
            NumberEditRow { id:appScaling; text: i18n.tr("App scaling (%)"); value: config.appScaling; onValueChanged: config.appScaling = value }
            Image {
            id: image
            source: "Backgrounds/demo.png"
            width: sourceSize.width * appScaling.value/300
            height: sourceSize.height * appScaling.value/300
            fillMode: Image.Stretch
            smooth: false
            mipmap: false
            }
        }
       }
}
}
