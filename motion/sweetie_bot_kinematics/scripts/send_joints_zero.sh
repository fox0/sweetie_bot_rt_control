#!/bin/sh
ROSTOPIC=/kinematics/input_joint_state
ROSTYPE=sensor_msgs/JointState
VARIABLE="
{
 header: auto,
 name: [joint11, joint12, joint13, joint14, joint15, joint16, joint31, joint32, joint33,
        joint34, joint35, joint36, joint41, joint42, joint43, joint44, joint45, joint46,
        joint21, joint22, joint23, joint24, joint25, joint26, joint51, joint52, joint53,
        joint54, joint55, joint56, joint_eyes_focus_x, joint_eyes_focus_y, joint_eyes_focus_z],
 position: [-8.797919003461117e-06, -0.0003715325867372138, -0.0002558332724872712, 0.00010262556708947107, 5.967667852314454e-05, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, -1.438608203689955e-05, 2.2280223428447994e-06, -2.2935524117395775e-05, 2.0918802044288343e-05, 2.0618736332946007e-05, 0.0, 0.0, -1.1300360162445087e-31, 0.0, 0.00018877603605153102, -5.705223902124731e-60, 1.1012514542991985e-19, 0.0, 0.0, 0.0], 
 velocity: [6.606856988583543e-20, 3.144186300207963e-18, 2.222614453595284e-18, -8.809142651444724e-19, -5.149960319306146e-19, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0503208545953324e-19, -1.7364175418713157e-20, 1.4568966692773966e-19, -1.5924219408380846e-19, -1.8634724839594607e-19, 0.0, 0.0, 8.674538049545524e-46, 0.0, -1.1655173354219173e-18, 4.379522520408699e-74, -8.669564710902076e-34, 0.0, 0.0, 0.0],
 effort:   [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
}"

echo "<<<" "$VARIABLE" "\n<<<"
echo ">>>"
rostopic pub $ROSTOPIC $ROSTYPE --once "$VARIABLE"
echo ">>>"
