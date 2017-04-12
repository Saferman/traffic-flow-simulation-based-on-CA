## traffic-flow-simulation-based-on-CA
During the period of American Mathematical Modeling Competition in Jabuary 2017, I met a problem that we needed to simulate  the traffic flow in order to caculate some parameters. To solve this problem, we first looked through a lot of thesises and ultimately we decided to simulate the traffic flow based on Cellular Automation(CA)   
   
Nevertheless, almost all the programs of traffic flow simulation made by Matlab are really simple and isolate.In other words, although these programs can handle their original questions toa proper extent, it's very difficult for others to use these programs in other circumstances.Those programs have poor compatibility and inconvenience.
  
Therefore, I am willing to make a simple matlab tool which can be used to do trafic flow simulation easily. Let me give you some details.    

**Attention** : this program merely simulate traffic flow around the exit part of the barrier tolls plaza

### 1. the structure of my tool
Here is a picture showing the crucial ralationships among the .m files:  
![structe](https://github.com/Saferman/traffic-flow-simulation-based-on-CA/tree/master/images/structure.png)

As you can see, there is a main function called "cellularF", which includes some important parameters such as the shape parameters of the toll plaza, the time of simulation, etc.

### 2. the characteristics of my tool
Different from the other similar programs, my tool has these particular characteristics as below:
  
- I use a function called "cellularF" to package all codes so that you can invoke my program easily by using this function.
- The tool is Modular. Also, the tool is Readable.
- The tool supports two usage methods. In the first method, program will show the plaza with traffic flow in a matlab figure. In the second method, the program will run without any display so that the program runs at a higher speed.
- In the program, you can easily change any prameters such as shape of the toll plaza. So the tool can be applied to more circumstances.
- The program is based on many theories I have referred to. To keep the tool scientific and practical, I always modify my program acording to the newest and most correct traffic theories.

### 3. how to use the tool
As I mentioned above, you can just easily use the tool by calling a functioncalled "cellularF". The function with parameters is below:  
  
<code>function [average\_P,cost,W]=cellularF(Y,m,number\_T,L,B,shape\_matrix\_value,Vmax,autoVmax,ak,a,bm,bMAT,bEAT,bECT,lamda,draw)   
  
% Y stands for the length of plaza.  
  
% m is a 1xL matrix which is used to determine merging pattern of the area following the toll barrier in which vehicles fan in from B tollbooth egress lanes down to L lanes of traffic.  
  
% number\_T means how many parts you want discretize one day to  
  
% L means the number of lanes  
  
% B means the number of  tollbooths 
  
% shape\_matrix\_value is a matrix to determine the shape of the plaza  
  
% Vmax means the highest speed of common vehicles  
  
% autoVmax means the highest speed of autonomous (self-driving) vehicles  
  
% ak is a percent of autonomous vehicles in the whole vehicles  
  
% a is the cost of a discrete unit of the plaza  
  
% bm is a 1xL matrix which is used to appoint the number of conventional(human-staffed) tollbooths, exact-change(automated) tollbooths and electronic toll collection booths(such as electronic toll collection via a transponder in the vehicle).  
  
% bMAT,bEAT,bECT stand for the cost of conventional(human-staffed) tollbooths, exact-change(automated) tollbooths and electronic toll collection booths respectively.  
  
% lamda is a parameter used in the poisson model. The bigger lamda is, the more vehicles there wiil be.  
  
% draw is used to choose usage method. If draw equals 1, the program will run with real-time display of the plaza. If draw equals 0, the program will run without any display.  
  
% average\_P,cost,W stand for total Accident risk, total cost and  throughput (number of vehicles per hour passing the point where the end of the plaza joins the L outgoing traffic lanes) respectively. 
</code> 
  
Here are my examples :  
<code>[average\_P,cost,W]=cellularF(21,[1 6 2],24,3,9,[5 2 1 0 0 0 1 2 5],8.1,10.2,0,4,[0 4 5],8,5,5,10000,1)  
[average\_P,cost,W]=cellularF(21,[1 6 2],24*3600,3,9,[5 2 1 0 0 0 1 2 5],8.1,10.2,0,4,[0 4 5],8,5,5,400000,1)
</code>  
  
The result:  
![structe](https://github.com/Saferman/traffic-flow-simulation-based-on-CA/tree/master/images/running2.png)

More details or usages of cellularF is coming soon in wiki. 

### 4. expectation
However, there are still some obvious problems in my tool including the lack of error detection of users' input. I will overcome these weaknesses in next version.