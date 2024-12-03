# MonkeyAOC

I've set myself the challenge of solving some 2022 [Advent of Code](https://adventofcode.com/) problems on my Garmin Forerunner 235 with an App written in Monkey C. These are my results.

Check out the [Youtube Playlist](https://www.youtube.com/playlist?list=PLTB69k7-3oNiRPEnS2kTslHSe-PZ3ixTg) to see the watch in action.

## Goals
- [x] Solve day 1 part 1
- [x] Solve day 1 (both parts)
- [x] Solve more than one day
- [ ] Solve all days (Seems fairly impossible)

## Solved Days
```
Day     1234567
---------------
Part 1: *******
Part 2: *******
```

## Dev Setup

To anyone who wants to contribute or use this as a template:

The `bin` folder is gitignored. I don't know if the monkeyc compiler complains when it's not there.

To download the input you need an access token. [Here](https://github.com/wimglenn/advent-of-code-wim/issues/1) is how to get it. This is stored in `strings/accesstoken.xml` which should look something like this:

```xml
<strings>
    <string id="Token">asdfasdf12341234</string>
</strings>
```

## Learnings to keep in mind
- `substring`: if the endindex is greater than the length of the string if behaves as if endindex would bave been the length of the string.
- Strings of length 1 and Chars are not the same. The distinction is `'` for chars and `"` for strings.
- It's not possible to use negative indices with arrays (like array[-1]), however this can be used with array.slice() from CIQ version 1.3 (but not with String.substring())
- String.toCharArray() makes it about 5x larger in memory
- Booleans seem to be completely separated from all other types. Nothing can be casted to a bool.
- With Strings always use hashCode and equals
