import QtQuick
import QtQuick.Controls
import Quickshell

ShellRoot {
  PanelWindow {
    anchors {
      top: true
      left: true
      bottom: true
    }

    implicitWidth: 35
  }
  PanelWindow {
    anchors {
      top: true
      left: true
      right: true
    }

    implicitHeight: 5
  }
  PanelWindow {
    anchors {
      top: true
      right: true
      bottom: true
    }

    implicitWidth: 5
  }
  PanelWindow {
    anchors {
      right: true
      left: true
      bottom: true
    }

    implicitHeight: 5
  }
}