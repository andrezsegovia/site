---
title: "Formatting JSON returned by cURL in the terminal"
date: 2025-03-26T12:39:35-05:00
draft: false
weight: 1
categories:
 - TIL
 - Terminal
---

Install the `jq` package:

macOS:
```bash
brew install jq
```

Linux:
```bash
sudo apt-get install jq
```

How to use it:

```bash
curl -X GET "http://your-api-domain/resource/path" | jq .
```