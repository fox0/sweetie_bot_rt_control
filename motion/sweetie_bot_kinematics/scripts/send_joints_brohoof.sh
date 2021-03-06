#!/bin/sh
ROSTOPIC=/kinematics/input_joint_state
ROSTYPE=sensor_msgs/JointState
VARIABLE="
{
 header: auto,
 name: [joint11, joint12, joint13, joint14, joint15, joint16, joint31, joint32, joint33,
        joint34, joint35, joint36, joint41, joint42, joint43, joint44, joint45, joint46,
        joint21, joint22, joint23, joint24, joint25, joint26, joint51, joint52, joint53,
        joint54, joint55, joint56, eyes_pitch, eyes_yaw, joint_eyes_focus_x, joint_eyes_focus_y, joint_eyes_focus_z],
 position: [0.005101218439763147, 0.6058472147446674, 1.5637687244926577, -0.4439311725582396, 0.0016327091739311108, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -0.15181667747762959, -0.015961501381540667, 0.16430957304527252, -0.14897063932483057, 0.1513580778015329, 0.0, 0.0, -4.275521649840042e-34, 0.0, -0.24143491384385488, -2.1585868025503037e-62, 4.166614485812376e-22, 0.0, 0.0, 0.0, 0.0, 0.0],
 velocity: [-4.274467065024101e-17, -3.221218864563058e-15, -1.241075384822432e-14, 4.381328741649704e-15, -9.75781955236954e-18, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.551334066632673e-15, 1.527471454442625e-16, -1.0201597054095013e-15, 8.814021561220908e-16, -1.3964252931070176e-15, 0.0, 0.0, 3.5307221820317904e-48, 0.0, 1.9454110631450527e-15, 1.7825591658249627e-76, -3.0151430098591675e-36, 0.0, 0.0, 0.0, 0.0, 0.0],
 effort:   [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
}"

echo "<<<" $ROSTOPIC "$VARIABLE" "\n<<<"
echo ">>>"
rostopic pub $ROSTOPIC $ROSTYPE --once "$VARIABLE"
echo ">>>"
