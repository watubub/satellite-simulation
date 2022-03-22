# Satellite Simulation

Created a simulation to answer the following quesiton: "How many satellites can be launched into orbit before astronomers on Earth can no longer observe the night sky without interruption?"

This was part of the 2020 New Zealand Engineering Science Competition where this report was awarded $2000 for coming runner-up.

## File Descriptions

**getMean.m**
* This file contains the initial parameter values which can be changed for different conditions. The program also calls simulate.m 100 times to find the approximate expected number of times a satellite obstructs an astronomers view for the given number of satellites.

**simulate.m**
* This program runs one simulation through randomly allocating a location and direction to each satellite. At the end of each simulation, it creates a visual display of the movement of the satellites.

**simulatef.m**
* Similar to simulate.m, this program also runs through one simulation. It doesnt draw a visual display which reduces runtime significantly. Call this function over simulate.m in getMean.m if you want to calculate the expected value faster.

**Report_Team1274.pdf**
* This report details the assumptions and limitations of our simulation. It is the overarching report for our simulation and was our final piece of work submitted for the competition.
