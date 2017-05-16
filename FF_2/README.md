# Search_Swarm_Sim
Simulation of a swarm for search and rescue aplicaions. Developed for RPI's Distributed Systems and Sensor Networks course in the fall of 2016. 

Introductions:
The project develops a framework for distributed robotic response to the problem of
mapping post disaster enviroments. In particular the emphasis is placed on creating a
method to examine the impact of communication deadzones on the mapping algorithm.
This project developed a frontier and algorithm for the overall mapping and use the
Dijkstra algorithm to and the shortest path to the frontier. Results were obtained
to determine the response of this mapping procedure to diffrent enviroments with and
without communication deadzones as well as with diffrent communication ranges and
number of robots.

Background:
In the event of a disaster search and rescue efforts may be delayed until it is safe for
humans to enter the enviroment, however this must be balanced with the fact that delays
in these efforts can signifcantly lower the potential for survivors to recover. An important
task in disaster response is the ability to develop a map of the disaster zone and search
for hazards and/or surivivors. This is an optimal task for a robotic swarm, hazards for
human first responders can be identifed and thus addressed or avoided, resources can
be targeted to where they are most needed, areas which are too small for humans can
be explored and using swarm methodology this process can be expidited with a large
number of robots. The primary goal is for robots to completely explore the enviroment
since missing a small area can result in the loss of critical information such as the
location of an unstable element or a survior. Futhermore in a post disaster enviroment
communication is often limited, this can be seen in both the robotic responses to 9/11
and the response to the fuckashima disaster where robotic response were limited due to
communication dead zones from enviromental factors.

Notes:
This program is broken into many parts to improve its modulaity and ability to function as a plug and play framework. The following describes the purpose of each file.

Collide.m ; determined if the desired move of a robot will result in a collision with another robot. 
Comm.m ; preforms data exchange with all robots in communication range.
DEATH.m ; generates a randomly determined communication dead zone map.
dijk.m ; preforms the dijksta search to find the most optimal frontier to move towards. 
Frontier_Find.m ; generates a list of all squares of the search area which are known as frontiers.
main,m ; main function basic program structue calls the other functions.
Map.m ; used to generate teh actual map.
Move.m ; caculates the best move for a robot. 
Robot.m ; class for the robot object to they can be created as instances with uniue attributes. 
