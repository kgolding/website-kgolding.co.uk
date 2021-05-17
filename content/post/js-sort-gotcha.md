---
title: "Javascript .sort() gotchas"
date: 2020-12-22T23:16:32Z
description: ""
tags: ["js"]
---

It's late, and your js web app it not displaying your sorted array in quite the right order, seemlingly for no good reason?
<!--more-->

## Gotcha #1 - sort() does not return a new Array

Whilst `map` and `filter` return a new array, `.sort()` works on the array in place and also returns the same array. If you need sort to return a new Array, then clone the Array before sorting it using `concat()`.

```js
let a = ['orange', 'apple', 'pear', 'bannana']
console.log("Original", a)
console.log("Cloned and sorted", a.concat().sort())
console.log("Original untouched", a)
console.log("Sorted", a.sort())
console.log("Original has changed", a)
```

**Output**
```
Original              ["orange", "apple", "pear", "bannana"]
Cloned and sorted     ["apple", "bannana", "orange", "pear"]
Original untouched    ["orange", "apple", "pear", "bannana"]
Sorted                ["apple", "bannana", "orange", "pear"]
Original has changed  ["apple", "bannana", "orange", "pear"]
```

*JSFiddle https://jsfiddle.net/1a2hx847/*

## Gotcha #2 - sort() callback needs to return one of three different results

When sorting an array of objects you use a custom function as a callback, and many resources on the Internet show this as a simple test such as `a.age < b.age` but this isn't enough and can produced unordered results.

```js
let x = [
  {age: 52},
  {age: 38},
  {age: 39},
]
function badCompare(a, b) {
	return a.age < b.age
}
function compare(a, b) {
	return a.age < b.age ? -1 : a.age > b.age ? 1 : 0
}
console.log("Original", x)
console.log("Bad sort", x.concat().sort(badCompare))
console.log("Sorted", x.concat().sort(compare))
```

**Output**
```
Original  [{age: 52}, {age: 38}, {age: 39}]
Bad sort  [{age: 52}, {age: 38}, {age: 39}]
Sorted    [{age: 38}, {age: 39}, {age: 52}]
```

*JSFiddle* https://jsfiddle.net/1a2hx847/1/