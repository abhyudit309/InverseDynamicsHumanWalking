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

* [`InverseDynamics3D-II.nb`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Mathematica_Codes/InverseDynamics3D-II.nb): Determines symbolic expressions of the joint moments in section 3.3 of [`Project_Report.pdf`](Project_Report.pdf).

* [`HumanoidLag2D-DS.nb`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Mathematica_Codes/HumanoidLag2D-DS.nb): Evaluates the lagrangian for the 9 DOF humanoid in section 3.4 of [`Project_Report.pdf`](Project_Report.pdf), and determines the coefficient matrix for the unknowns in the double stance phase.

* [`HumanoidLag2D-SS1.nb`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Mathematica_Codes/HumanoidLag2D-SS1.nb): Evaluates the lagrangian for the 9 DOF humanoid in section 3.4, and determines the coefficient matrix for the unknowns in the right leg single stance phase.

* [`HumanoidLag2D-SS2.nb`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Mathematica_Codes/HumanoidLag2D-SS2.nb): Evaluates the lagrangian for the 9 DOF humanoid in section 3.4, and determines the coefficient matrix for the unknowns in the left leg single stance phase.

* [`Humanoid3D-GRF.nb`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Mathematica_Codes/Humanoid3D-GRF.nb): Evaluates GRF for the 16 DOF humanoid in section 3.5 of [`Project_Report.pdf`](Project_Report.pdf).

### MATLAB Codes

All MATLAB codes are present in [`Matlab_Codes`](Matlab_Codes).

* [`InverseDynamics2D.m`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Matlab_Codes/InverseDynamics2D.m): Computes and plots the joint moments in section 3.1 using function [`torques2D.m`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Matlab_Codes/torques2D.m).

* [`InverseDynamics3D_I.m`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Matlab_Codes/InverseDynamics3D_I.m): Computes and plots the joint moments in section 3.2 using function [`torques3D_I.m`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Matlab_Codes/torques3D_I.m).

* [`InverseDynamics3D_II.m`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Matlab_Codes/InverseDynamics3D_II.m): Computes and plots the joint moments in section 3.3 using function [`torques3D_II.m`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Matlab_Codes/torques3D_II.m).

* [`Humanoid2D_lag.m`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Matlab_Codes/Humanoid2D_lag.m): Computes and plots GRF for the 9 DOF humanoid in section 3.4 using functions [`double_stance_lag.m`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Matlab_Codes/double_stance_lag.m) (for double stance), [`single_stance_r_lag.m`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Matlab_Codes/single_stance_r_lag.m) (for right leg single stance) and [`single_stance_l_lag.m`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Matlab_Codes/single_stance_l_lag.m) (for left leg single stance).

* [`ts1.m`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Matlab_Codes/ts1.m), [`ts2.m`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Matlab_Codes/ts2.m), [`ts3.m`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Matlab_Codes/ts3.m), [`ts4.m`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Matlab_Codes/ts4.m), [`ts5.m`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Matlab_Codes/ts5.m), and [`ts6.m`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Matlab_Codes/ts6.m): Gait data and GRF data for 6 healthy individuals.

* [`Ridge_lasso_GRF.m`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Matlab_Codes/Ridge_lasso_GRF.m): Evaluates coefficients for ridge regression and the lasso from the 6 training sets.

* [`Humanoid2D_lag_regression.m`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Matlab_Codes/Humanoid2D_lag_regression.m): Evaluates GRF for the particular individual using coefficients corresponding to ridge regression and the lasso.

* [`Humanoid3D_GRF_moments.m`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Matlab_Codes/Humanoid3D_GRF_moments.m): Computes and plots GRF for the 16 DOF humanoid in section 3.5 using functions [`double_stance_GRF.m`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Matlab_Codes/double_stance.m) (for double stance) and [`single_stance_GRF.m`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Matlab_Codes/single_stance.m) (for single stance). It then computes and plots the joint moments using the function [`torquesHumanoid3D.m`](https://github.com/abhyudit309/InverseDynamicsHumanWalking/blob/main/Matlab_Codes/torquesHumanoid3D.m).
