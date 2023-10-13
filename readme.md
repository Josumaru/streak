```js
/*

This is simple program to save your GitHub Streak
Currently only work on linux or run using WSL and also Android terminal emulator and Linux environment app

[TODO]
    a. Make autostart
    b. create new markdown UI
    c. ~~~~~~~~~~~~~~~~~~~~~~
*/

const [streak, setStreak] = useState(2);
const date = 14;
const streakSaver = () => {
    setIsStreak(streak + 1);
    console.log(`Current streak is ${streak}`);
}

streakSaver();

```
