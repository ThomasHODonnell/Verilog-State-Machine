# Intersection Traffic Controller 

## - This program was developed in *Verilog* using *Vivado*. I used the *Vivado IDE* and *Xilinx* documentation to build and test this machine. This machine operates on the **Basys 3 FPGA** programable circuit board.  

### **Properities:** 

### This program utilizies ... 
    - A Sequential Counter Module:
     - This module uses a weighted count sequence that interacts with three modes
       - Counting 
       - Reset
       - Load one of 11 states or a car in lane X(A-F) 
     - The value selected in the sequential module is sent to a combinational module. 
     - The combinational module selects which lights can be turned green based on this selected input. 
  
  
### Next, there are four seven segment display components used in the design.
       - State Display (A - F)
       - Number of green lights at a given time 
       - Countdown timer (5-1) 
         - useful if the freerunning mode is on, which I will detail later. 
       - State in cycle (0-10)
         - 10 is represented as 0
         - digital representation of where in the cycle the state is at a given time

### The digital display component uses three external clocks to display the information. 
    - This project requested I create clocks manually ...
      - with a new clock variable based on the internal clock
      - and a counter variable to implement the clock 
    - These ideas apply to two of the clocks
      - used to control the four segment displays (fastest clock)
      - and the countdown display (slowest clock)
 ### Last, I implemented a third clock to determine 'freerunning mode'
      - When free running mode is on ... (flip of switch s)
        - all operations of this machine can be executed without the manual push of a button. 
        - at the end of the countdown timer (5-1) the state switches to whatever is programmed next
          - this includes all 3 primary functions 
            - counting 
            - reset
            - load (both in lane and state)


## Below are visuals to accompany the logic concepts described above 

- This is the RTL structural schematic for the design 
![alt text](FinalProjectSchematic2742.png "Schematic")

- Below is the physical switch / seven segment display layout for the Basys 3 FPGA board. 
![alt text](ConstraintLayout.jpg "Board Layout")

- Below is a short demonstration of the machine operating. Since this video was taken, I have added small nuance features to make the design more complete. These features are in the most recent version of the modular code, but have little effect on the logic of the machine. 
  




https://user-images.githubusercontent.com/106498739/235817921-85c7bd78-bfb4-4606-aeeb-cfe7a5db92c7.mp4



