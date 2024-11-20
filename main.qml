import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

ApplicationWindow {
    visible: true
    width: 800
    height: 600
    title: "Draggable and Resizable Green Panel with Red Background"

    Rectangle {
        id: background
        color: "skyblue" // Background color
        anchors.fill: parent

        // Green Rectangle (Draggable and Resizable)
        Rectangle {
            id: greenPanel
            color: "maroon"
            width: 100 // Initial width
            height: 100 // Initial height (same as width for square)
            x: 0 // Initial position
            y: (parent.height - height) / 2 // Vertically centered

            Text {
                anchors.centerIn: parent
                text: "Drag me to resize"
                color: "white"
                font.pixelSize:12
            }

            // Enable dragging and resizing
            MouseArea {
                id: dragArea
                anchors.fill: parent
                drag.target: greenPanel // Set the drag target as the green panel

                onPositionChanged: {
                    // Resize the square dynamically while maintaining aspect ratio
                    let newSize = greenPanel.width + mouse.x
                    let constrainedSize = Math.max(50, Math.min(newSize, background.width))
                    greenPanel.width = constrainedSize
                    greenPanel.height = constrainedSize // Maintain square dimensions
                }
            }
        }

        // Reset Button
        Button {
            text: "Reset Size"
            width: 100
            height: 40
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottomMargin: 10

            onClicked: {
                greenPanel.width = 100 // Reset width
                greenPanel.height = 100 // Reset height (to keep it square)
            }
        }
    }
}
