Please go through the research paper we published to understand the work. The file name is given by 'ReferenceShapingPaper'.


FOLDER STRUCTURE
----------------

STModel_Nonlinear
-----------------

Single track non linear model (Bicycle). 

Based on below paper

Reference: Berntorp, K., Olofsson, B., Lundahl, K., & Nielsen, L. (2014). 
Models and methodology for optimal trajectory generation in safety-critical road-vehicle manoeuvres. 
Vehicle System Dynamics, 52(10), 1304–1332. https://doi.org/10.1080/00423114.2014.939094

DTModel
--------

Double track non linear model (4 wheel planar)

Based on below paper

Reference: Berntorp, K., Olofsson, B., Lundahl, K., & Nielsen, L. (2014). 
Models and methodology for optimal trajectory generation in safety-critical road-vehicle manoeuvres. 
Vehicle System Dynamics, 52(10), 1304–1332. https://doi.org/10.1080/00423114.2014.939094

SbWControl
-------------------

The steer by wire controller used in the published paper

You can run the files named aptly for all the variants mentioned in the paper. The plotDLC code plots the comparisons of the vehicle response. The simulink model 'InputShaper' runs only the feedforward control. The other simulink model runs feedforward+feedback control. 

14DOF
-----

14 DOF 3D vehicle model for roll dynamics studies.

Based on below paper

Reference: Shim, Taehyun, and Chinar Ghike. “Understanding the Limitations of Different Vehicle Models for Roll Dynamics Studies.” 
Vehicle System Dynamics, vol. 45, no. 3, 2007, pp. 191–216., doi:10.1080/00423110600882449.