import QtQuick
import qs.Commons
import qs.Ui

Item {
  id: root

  property real iconSize: Style.font.icon
  property color color: Color.foreground
  property color badgeColor: Color.urgent
  property bool crossed: false
  property bool warning: false

  // Two equal side lobes plus a shallow cap. A tall center disc reads as a
  // bottle at bar size; a wide dumpling reads as a cloud.
  width: iconSize * 1.42
  height: iconSize
  implicitWidth: iconSize * 1.42
  implicitHeight: iconSize

  readonly property real s: height

  Item {
    id: cloud
    anchors.fill: parent

    Rectangle {
      width: root.s * 0.64
      height: width
      radius: width / 2
      color: root.color
      x: 0
      y: root.height * 0.30
    }

    Rectangle {
      width: root.s * 0.64
      height: width
      radius: width / 2
      color: root.color
      x: root.width - width
      y: root.height * 0.30
    }

    Rectangle {
      width: root.s * 0.48
      height: width
      radius: width / 2
      color: root.color
      x: (root.width - width) / 2
      y: root.height * 0.08
    }

    Rectangle {
      width: root.width * 0.78
      height: root.height * 0.38
      radius: Math.max(1, root.s * 0.10)
      color: root.color
      x: root.width * 0.11
      y: root.height * 0.54
    }
  }

  Rectangle {
    visible: root.crossed
    anchors.centerIn: parent
    width: parent.width * 1.02
    height: Math.max(2, parent.height * 0.14)
    radius: height / 2
    color: root.color
    rotation: -45
  }

  BorderSurface {
    visible: root.warning
    width: Math.max(7, parent.height * 0.42)
    height: width
    radius: width / 2
    color: root.badgeColor
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    borderSpec: Border.flat(Color.popups.background, 1)

    Text {
      anchors.centerIn: parent
      text: "!"
      color: Color.background
      font.family: Style.font.family
      font.pixelSize: Math.max(6, parent.height * 0.72)
      font.bold: true
    }
  }
}
