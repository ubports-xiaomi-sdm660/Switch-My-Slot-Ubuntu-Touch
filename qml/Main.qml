import QtQuick 2.7
import Ubuntu.Components 1.3
//import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import io.thp.pyotherside 1.3

MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'switch-my-slot.shouko'
    automaticOrientation: true

    width: units.gu(45)
    height: units.gu(75)

    Page {
        anchors.fill: parent
        header: PageHeader {
            id: header
            title: i18n.tr('Switch My Slot')
        }

        Label {
          anchors {
              top: header.bottom
            }
            id: halVersionLabel
            text: i18n.tr('HAL Version: ')
        }

        Label {
            anchors {
                top: halVersionLabel.bottom
            }
            id: appVersionLabel
            text: i18n.tr('App Version: v0.1')
        }

        Label {
          anchors {
              top: appVersionLabel.bottom
            }
            id: noOfSlotsLabel
            text: i18n.tr('Number of slots: ')
        }

        Label {
          anchors {
              top: noOfSlotsLabel.bottom
            }
            id: currentSlotSuffixLabel
            text: i18n.tr('Current slot suffix: ')
        }

        Button {
          anchors {
              top: currentSlotSuffixLabel.bottom
              horizontalCenter: parent.horizontalCenter
            }
            id: switchSlotButton
            text: i18n.tr('Switch Slot')
            onClicked: {
                    python.switchSlotFunc();
                }
        }

        Label {
          anchors {
              top: switchSlotButton.bottom
              horizontalCenter: parent.horizontalCenter
            }
            id: currentSlotLabel
            text: i18n.tr('Current slot: ')
        }

        Label {
          anchors {
              left: parent.left
              right: parent.right
              bottom: parent.bottom
              bottomMargin: units.gu(2)
            }
            id: developerLabel
            text: i18n.tr('Developed by Shouko')
            verticalAlignment: Label.AlignVCenter
            horizontalAlignment: Label.AlignHCenter
        }

        Label {
        anchors {
                top: developerLabel.bottom
                left: parent.left
                right: parent.right
          }
            id: urlAndLicenseLabel
            text: "<a href='https://github.com/ubports-xiaomi-sdm660/Switch-My-Slot-Ubuntu-Touch/blob/master/LICENSE'>Licensed under MIT</a>"
                onLinkActivated: Qt.openUrlExternally(link)
            verticalAlignment: Label.AlignVCenter
            horizontalAlignment: Label.AlignHCenter
        }
    }

    Python {
                    id: python

                    Component.onCompleted: {
                        addImportPath(Qt.resolvedUrl('../src/'));
                        setHandler('halVersion', function(halVersion) {
                           halVersionLabel.text = halVersion;
                        });
                        setHandler('noOfSlots', function(noOfSlots) {
                           noOfSlotsLabel.text = "Number of slots: " + noOfSlots;
                        });
                        setHandler('currentSlotSuffix', function(currentSlotSuffix) {
                           currentSlotSuffixLabel.text = "Current slot suffix: " + currentSlotSuffix;
                        });
                        setHandler('currentSlot', function(currentSlot) {
                           currentSlotLabel.text = "Current slot: " + currentSlot;
                        });
                        importModule('logic', function () {});
                    }

                    function switchSlotFunc() {
                        switchSlotButton.enabled = false;
                        currentSlotLabel.text = "Please reboot/ turn off your phone now";
                        call('logic.switchSlotFunc', function() {});
                    }

                    onError: {
                        console.log('python error: ' + traceback);
                    }

                    onReceived: {
                        console.log('got message from python: ' + data);
                    }
                }
}
