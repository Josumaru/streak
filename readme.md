```js
/*
This is simple program to save your GitHub Streak
Currently only work on linux

[TODO]
    a. Make autostart
    b. create new markdown UI
    c. ~~~~~~~~~~~~~~~~~~~~~~
*/

const [streak, setStreak] = useState(81);
const date = 18;
const streakSaver = () => {
    setStreak(streak + 1);
    console.log(`Current streak is ${streak}`);
}

streakSaver();

```
