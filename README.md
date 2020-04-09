# Photo-Editor-9000
A fun digital image manipulation application!

# Instructions
- Download the necessary files for your operating system (as specified in each OS folder's README)
- Run the executable file.
- Next, load an image in by clicking the load image button located on the top right corner of the program.
- Clicking it will create a file explorer window. Find the image you wish to edit (supports all common image file types) and open it.
- The image will appear in the program.
- Next, click one of the filter buttons on the right side of the program (please refer to the filter section to see the effects and uses of the different filters).
- If you would like a more interactive experience, run the .pde file in Processing so that the console is visible. For example, in one case, text is displayed in the console if you forget to do something.
- Filters can stack on top of each other but some may override other filters (Red Saturation + Static is overridden by grey scale, but the static stays).
- To remove all filter effects, click the reset button.
-If you like the result of the filters, you can save the new image by hitting the “Save Picture” button below the “Load Picture” button.

# Filters
## Filter 1: Red/Green/Blue “Static” Saturation
If ‘r’ on the keyboard is pressed before selecting this filter, then a red saturation will be applied. The same applies for green and blue with ‘g’ and ‘b’, respectively. If no key is pressed before the filter is applied, then the filter displays a message in the console prompting the user to tap a key before activating the filter; in this case, nothing happens to the image.
## Filter 1 Execution
The program executes filter 1 by going through a loop that will repeat for each pixel in the image. Inside of that loop, the current pixel’s color is obtained. Then, the red, green, or blue value is increased by 50 depending on which keyboard button was pressed before. The filter is considered static because each time the loop is run, there is a 50% chance that the index will be increased by 2. Therefore, the image appears static after this filter is applied. The 50% possibility is determined through the random() function.

Original Image:
![Filter 1 Original](filter1Original.PNG)


## Filter 2: Invert 2.0
