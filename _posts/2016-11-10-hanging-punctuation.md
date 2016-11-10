---
title: "One line of CSS to add hanging quotes"
tags:
external: https://css-tricks.com/almanac/properties/h/hanging-punctuation/
---

> The hanging-punctuation property aims at giving web web designers a finer grained control over typography on the web.

> The idea behind hanging punctuation is to put some punctuation characters from start (or to a lesser extend at the end) of text elements "outside" of the box in order to preserve the reading flow.

```
blockquote p {
  hanging-punctuation: first;
}
```

Since it only applies to quote marks, you can avoid single purpose classes and
trust that your quotes will hang everywhere.
