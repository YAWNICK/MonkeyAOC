# MonkeyAOC

I've set myself the challenge of solving some 2022 [Advent of Code](https://adventofcode.com/) problems on my Garmin Forerunner 235 with an App written in Monkey C. These are my results.

## Goals
- [x] Solve day 1 part 1
- [x] Solve day 1 (both parts)
- [x] Solve more than one day
- [ ] Solve all days (Seems fairly impossible)

## Dev Setup

To anyone who wants to contribute or use this as a template:

The `bin` folder is gitignored. I don't know if the monkeyc compiler complains when it's not there.

To download the input you need an access token. [Here](https://github.com/wimglenn/advent-of-code-wim/issues/1) is how to get it. This is stored in `strings/accesstoken.xml` which should look something like this:

```xml
<strings>
    <string id="Token">asdfasdf12341234</string>
</strings>
```
