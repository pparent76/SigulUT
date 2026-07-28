import QtQuick 2.9
import Ubuntu.Components 1.3
import QtQuick.Window 2.2
import Ubuntu.Components.ListItems 1.3 as ListItemm
import Ubuntu.Content 1.3

MainView {

                            // Background
                            Rectangle {
                                anchors.fill: parent
                                color: "#5172ff"
                            }

                            PageHeader {
                                title: i18n.tr("Notifications how-to")          
                                leadingActionBar.actions: [
                                Action {
                                iconName: "back"
                                text: i18n.tr("Back")
                                onTriggered: {
                                    Qt.quit()
                                    }
                                }
                                ]
                                
                            }

                            Image {
                                anchors.horizontalCenter: parent.horizontalCenter
                                anchors.top: parent.top
                                anchors.topMargin: parent.height * 0.12
                                width: parent.width
                                fillMode: Image.PreserveAspectFit
                                source: "Backgrounds/Notifications-howto.jpg"
                            }
                    
}
