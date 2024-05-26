# Visualization-and-Standardized-Quantification-of-Surface-Charge-Density-for-Triboelectric-Materials
Accompanying code to "Visualization and Standardized Quantification of Surface Charge Density for Triboelectric Materials"

All source code must be placed in the same file in order to run. The source code demonstratede the inversion from surface potential to surface charge density. 

Usage
1.Import the transfer function matrix (H) and surface potential data (volt);
2.run the options  = VSQhybrid_flsqr('defaults') in the command window of matlab;
3.run the [Sig,info] = VSQhybrid_flsqr(H,volt,options) in the command window of matlab;

Testing
Tested on MATALB R2022a and under Windows.
