# 🐍 Snake Game – Command Line Edition (Swift)  
---

A simple Snake game built in Swift, running in the command line. Navigate the snake, eat food to grow, and avoid crashing into walls or yourself!

## 🎮 Features  
---

- Multiple game maps with different layouts  
- Smooth player controls (WASD)  
- Dynamic borders and obstacles  
- Growth mechanics when eating food  
- Collision detection for walls, obstacles, and self  
- Win condition for high score  

## Meet the Team  
---

**Rayaan Ismail:** [GitHub](https://github.com/rayaanismail)  
**Danielle Abrams:** [GitHub](https://github.com/daniabrams333)  

## 👩‍💻 My Contributions  
---

I focused on improving the game experience and structure, including:

- Implementing game maps with unique layouts and obstacles  
- Designing the border and screen layout for a clean interface  
- Implementing the win message for a rewarding end-game experience  
- Refining the snake's movement and tail appearance  
- Game testing / finding bugs  
- Tweaking game mechanics for smoother controls  
## What I Learned
---

- I learned how to modify terminal settings to handle real-time input. Our game required live input without leaving a trace of letters on the screen. To achieve this, we first stored the original terminal settings using termios() so we could restore them later when needed. Then, we created a function called setRawMode() that disabled echo (which prevents user input from being displayed) and turned off canonical mode (which allows input to be processed immediately without requiring the Enter key). This made the game more interactive and responsive.
  
![image](https://github.com/user-attachments/assets/ce96e310-df88-4800-8a65-3a812a930976)


## 📸 Screenshots  
---
Included: 
Board Size Selection  
Board Theme Selection  
Player Instructions/Objective  
Player Score and Board Occupation
Win Message

![image](https://github.com/user-attachments/assets/3e13afbe-eddc-48ec-b8e2-ff9121d2af6d)  
![image](https://github.com/user-attachments/assets/e3d7262f-40a7-4e97-832f-37e44e7243e2)

### Some Board Themes:  
<img src="https://github.com/user-attachments/assets/38d7728b-0b35-46ca-9b6c-d18d6a416e3b" width="400">
