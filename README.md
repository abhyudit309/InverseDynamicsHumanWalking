# ME4490 B.Tech. Project: Inverse Dynamics Analysis of Human Walking

See [`Project_Report.pdf`](Project_Report.pdf) for a more detailed description of the project.

## Abstract

Many spinal cord injury and stroke patients lose their ability to walk. Exoskeletons are wearable devices that help them in regaining this ability by applying moments corresponding to normal walking at their joints. This warrants an inverse dynamics analysis for normal and healthy walking, in order to estimate these joint moments. Such an analysis typically requires kinematic data and data about the ground reaction forces (GRF). Thus in this project, various inverse dynamics models have been investigated, in both 2D and 3D, and joint moments have been computed. 

We initially look at models where the GRF is known, and then address the situation when data about the GRF might be unavailable. For this, we present a novel formulation in which the GRF is estimated from a 2D whole body lagrangian analysis and the zero-moment point (ZMP) concept. We also try to estimate the GRF by utilizing the ZMP concept for a 3D whole body analysis. Once the joint moments have been computed, the motors of the exoskeleton can then apply these values of moments to correct the gait of a patient.

## File Descriptions

### Mathematica Codes

All Mathematica codes are present in [`Mathematica_Codes`](Mathematica_Codes).

* [`InverseDynamics2D.nb`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Mathematica_Codes/InverseDynamics2D.nb): Determines symbolic expressions of the joint moments in section 3.1 of [`Project_Report.pdf`](Project_Report.pdf).
* [`InverseDynamics3D-I.nb`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Mathematica_Codes/InverseDynamics3D-I.nb): Determines symbolic expressions of the joint moments in section 3.2 of [`Project_Report.pdf`](Project_Report.pdf).
* [`HumanoidLag2D-DS.nb`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Mathematica_Codes/HumanoidLag2D-DS.nb): Evaluates the lagrangian for the 9 DOF humanoid in section 3.4 of [`Project_Report.pdf`](Project_Report.pdf), and determines the coefficient matrix for the unknowns in the double stance phase.
* [`HumanoidLag2D-SS1.nb`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Mathematica_Codes/HumanoidLag2D-SS1.nb): Evaluates the lagrangian for the 9 DOF humanoid in section 3.4, and determines the coefficient matrix for the unknowns in the right leg single stance phase.
* [`HumanoidLag2D-SS2.nb`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Mathematica_Codes/HumanoidLag2D-SS2.nb): Evaluates the lagrangian for the 9 DOF humanoid in section 3.4, and determines the coefficient matrix for the unknowns in the left leg single stance phase.
* [`Humanoid3D-GRF.nb`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Mathematica_Codes/HumanoidLag3D-GRF.nb): Evaluates GRF for the 16 DOF humanoid in section 3.5 of [`Project_Report.pdf`](Project_Report.pdf).
