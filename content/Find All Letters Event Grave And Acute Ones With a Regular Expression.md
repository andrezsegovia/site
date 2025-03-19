---
title: "Find All Letters Event Grave And Acute Ones With a Regular Expression"
date: 2025-03-19T09:16:36-05:00
draft: false
weight: 1
categories:
 - Regular Expresions
 - TIL
---

```java
String value = "a Á á É é Í 8 . - ? í Ó ó Ú ú ü / ! ¿";  
  
Stream.of(value.split("")).filter(s -> s.matches("\\p{L}"))  
        .forEach(System.out::printf);

//ÁaáÉeéÍiíÓóoOÚúü
```

The regular expression uses a [Unicode character class escape](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape) with  a [General category property](https://www.unicode.org/reports/tr18/#General_Category_Property) for filter only the letters. 
