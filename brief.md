Enclosed is the Mars Rover programming problem. We are seeking evidence of clean, simple, tested code with evidence of good design and OOP skills. We would like to see that your code has been developed using TDD and expect a good level of knowledge of the chosen language.

If successful at this stage, the next stage will include a technical interview with two TW developers where you will discuss your code and look to adapt the solution for an extension to the problem. The interview may vary depending on the level of your original submission and on your previous coding knowledge. It may focus on something quite simple such as at introducing a test with Test Driven Development or discussing Object-Orientated Programming or may discuss more complex ideas. We will be assessing how well you interact and pick up new ideas as well as your passion for technology.

For the solution, we request that you use either Java, Ruby or C#. You may not use any external libraries to solve this problem, but you may use external libraries or tools for building or testing purposes. Specifically, you may use unit testing libraries or build tools available for your chosen language (e.g., JUnit, Ant, NUnit, Rspec, Rake, etc.) For security reasons, please do not submit your C# code as a .msi file. You may also include a brief explanation of your design and assumptions along with your code.

Please use the URL below to submit your assignment. Please compress your files into a single .zip file before upload. Ensure there are no executables in your submission. Our system blocks executable files for security purposes, and we want to avoid any delays in your process.

When submitting your code, please label it in the following manner:

ExerciseLanguageYourInitials    for example   MarsRoverJavaMS
https://jobs.thoughtworks.com/DataCompletionRequest?uid=1lOSbCycvAhWlyET&jobId=1544

** Executable File Types are: asp, bat, class, cmd, com, cpl, dll, exe, fon, hta, ini, ins, iw, jar, jsp, js, jse, pif, scr, shs, sh, vb, vbe, vbs, ws, wsc, wsf, wsh

==========

Introduction to the problem

The problem below requires some kind of input. You are free to implement any mechanism for feeding input into your solution (for example, using hard coded data within a unit test). You should provide sufficient evidence that your solution is complete by, as a minimum, indicating that it works correctly against the supplied test data.


Problem: Mars Rovers

A squad of robotic rovers are to be landed by NASA on a plateau on Mars. This plateau, which is curiously rectangular, must be navigated by the rovers so that their on-board cameras can get a complete view of the surrounding terrain to send back to Earth.

A rover’s position and location is represented by a combination of x and y co-ordinates and a letter representing one of the four cardinal compass points. The plateau is divided up into a grid to simplify navigation. An example position might be 0, 0, N, which means the rover is in the bottom left corner and facing North.

In order to control a rover, NASA sends a simple string of letters. The possible letters are ‘L’, ‘R’ and ‘M’. ‘L’ and ‘R’ makes the rover spin 90 degrees left or right respectively, without moving from its current spot. ‘M’ means move forward one grid point, and maintain the same heading.

Assume that the square directly North from (x, y) is (x, y+1).

Input: The first line of input is the upper-right coordinates of the plateau, the lower-left coordinates are assumed to be 0,0.

The rest of the input is information pertaining to the rovers that have been deployed. Each rover has two lines of input. The first line gives the rover’s position, and the second line is a series of instructions telling the rover how to explore the plateau.

The position is made up of two integers and a letter separated by spaces, corresponding to the x and y co-ordinates and the rover’s orientation.

Each rover will be finished sequentially, which means that the second rover won’t start to move until the first one has finished moving.

Output: The output for each rover should be its final co-ordinates and heading.

Input and Output

Test Input:
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM

Expected Output:
1 3 N
5 1 E
