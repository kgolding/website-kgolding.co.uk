---
title: "Clever SQL search - aka poor mans full text search"
date: 2020-08-01T21:31:32Z
description: ""
tags: ["sql"]
---

Here's how I've implemented full text search feature on a SQL database for a much better user experience.
<!--more-->

The normal web app search matches exactly what you search for, typically using `...WHERE myfield LIKE '%the search text%'` and the only results will be ones that include the phrase `the search text`.

I needed a search feature that would let a user enter the words in any order and match any data that had at least one of each of the words. Here's an example of the SQL to search `myfield` for the words `this` and `that`:

```sql
SELECT *
FROM mytable
WHERE myfield LIKE '%this%' AND myfield LIKE '%that%'
```

If you're searching multiple fields:

```sql
SELECT *
FROM mytable
WHERE (myfield LIKE '%this%' AND myfield LIKE '%that%')
	OR (myfield2 LIKE '%this%' AND myfield2 LIKE '%that%')
```

Building the where clause is surprising simple, here's a js example:

```js
createWhereTextSearch(text, fields) {
    let words = text.split(" ")
    words = words.map(word => word.trim())

    return fields
        .map(field => "(" + words
            .map(word => `${field} LIKE '%${word}%'`)
            .join(" AND ") + ")"
        ).join(" OR "))
}
```

This code splits the users text into words, and then for each field it builds the conditions joined with an `AND` and 
then it joins all of these with an `OR`. Simple :)