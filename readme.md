```js 
const [streak, setStreak] = useState(2);
const date = 14;
const streakSaver = () => {
    setIsStreak(streak + 1);
    console.log(`Current streak is ${streak}`);
}

streakSaver();

```