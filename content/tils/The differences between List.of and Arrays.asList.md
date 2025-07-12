---
title: "The differences between List.of and Arrays.asList"
date: 2025-03-19T12:26:51-05:00
draft: false
weight: 1
type: tils
categories:
 - Java
 - TIL
---

[This StackOverflow answer](https://stackoverflow.com/a/46579348/6297127) explains the different between `List.of` and `Arrays.asList`.

In a nutshell, `Arrays.asList` allows us to create a mutable list and `List.of` creates an inmutable list. Also, the list created with `Arrays.asList` can hold `null` values.
