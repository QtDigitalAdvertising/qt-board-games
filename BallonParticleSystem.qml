import QtQuick 2.12
import QtQuick.Particles 2.12

ParticleSystem {

    id: particleSystem

    property int life: emitter.lifeSpan
    property int speed: 500
    property int ballSize: 120

    Emitter {
        id: emitter
        anchors.bottom: parent.bottom
        width: parent.width
        group: "alive"
        emitRate: 2
        maximumEmitted: 5
        lifeSpan: (parent.height * 1000 / speed) + 1000
        size: ballSize
        velocity: AngleDirection { angle: 270; magnitude: speed }
    }

    ParticleGroup {
        name: "alive"
        duration: 100000

        ImageParticle {
            source: "qrc:/images/greenballoon.png"
        }
    }
    ParticleGroup {
        name: "shooted"
        duration: 100000000
        onEntered: {
            speed += 5
            root.shooted++
        }
        to: {"dead":1}
    }
    ParticleGroup {
        name: "missed"
        duration: 100000
        onEntered: root.missed++
        to: {"dead":1}
    }

    ParticleGroup {
        name: "dead"
    }

    GroupGoal {
        groups: ["alive"]
        goalState: "shooted"
        jump: true
        enabled: mouseArea.entered
        width: ballSize/1.3
        height: ballSize/1.3
        x: mouseArea.mouseX - width/2
        y: mouseArea.mouseY - height/2
    }

    GroupGoal {
        id: finishLine
        anchors.top: parent.top
        width: parent.width; height: 10
        system: particleSystem
        groups: ['alive']
        goalState: 'missed'
        jump: true
    }


    MouseArea {
        id: mouseArea
        anchors.fill: parent
    }

}
