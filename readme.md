```js
/*
This is simple program to save your GitHub Streak
!Make streak.sh executeable and start automatically when reboot, adjust your Desktop Environment
Currently only work on linux or run using WSL and also Android terminal emulator and Linux environment app   
*/

const [streak, setStreak] = useState(3);
const date = 14;
const streakSaver = () => {
    setIsStreak(streak + 1);
    console.log(`Current streak is ${streak}`);
}

streakSaver();

```
