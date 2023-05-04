# Arma-3-Chromium
### November 2020

![Radiation Detector](https://user-images.githubusercontent.com/25553633/173250753-ff43510d-6930-49d8-b361-fdf79e50aab3.png)
> Radiation detector close to the source
> 
![Detector Far](https://user-images.githubusercontent.com/25553633/173251136-d9f67c37-a3b4-4c68-9f99-eb48f86b7fc9.png)
> Radiation detector far from the source
> 
[Video Demonstration](https://youtu.be/bvMkEmlvFSc)
## Setting
1 - 4 player scenario where you take on the role of NATO special forces tasked with investigating the crash of a C-130 carrying weapons grade nuclear material "November" over war stricken Chernarus. Soviet forces are already flooding the area. Act with discretion and wait for the right moment to strike. Find and retrieve November and if possible rescue any survivors.

## Features
This is complete scenario and is fairly simple in scope. There aren't any big set pieces but this scenario introduces one of my favourite systems I implemented:
- Fully functional radiation system!
  - Objects can be marked as radioactive via a function call that also lets the designer assign a minimum and maximum range to radiation effects and also a maximum intensity.
  - Fully implements one of the unused tools from the Contact DLC as fully usable Geiger counter, that can be used to track current radiation levels.
  - Implements a radation safety system, where the player takes damage while not wearing protective clothing or a mask based on radiation intensity.
  - Protective clothing can be assigned or unassinged simply by adding the class name to a list.
  - While wearing a mask, the player will experience laboured breathing SFX and will see a gas mask overlay, to add to the ambience.
  - While in proximity to a radioactive source, any geiger counters the player is holding will initially emit a beep of variable length and will eventually let out a recognisable geiger crackle. (Sound effects not included in this repository as they are premium assets).

## Notes
This was an absolute blast of a mission to make. The radiation system presented a lot of interesting challenges, mostly due to the freedom I wanted the player to have. Ultimately while there is only a single radioactive source object in the mission, the system does support multiple objects and will handle them seamlessly. Looking back, I'd love to do another scenario using this system, probably with more of an emphasis on exploring and using the Geiger Counter to find dynamically placed objects.
