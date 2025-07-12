---
title: "The @DirtiesContext Spring Annotation"
date: 2025-03-28T21:01:25-05:00
draft: false
weight: 1
type: tils
categories:
 - TIL
 - Spring Framework
---

In some test scenarios, a [Spring Bean](content/Working%20with%20Beans%20in%20Spring%20Framework.md) can become corrupted, causing other test scenarios to fail. To prevent this, we can annotate a test class or test method with [`@DirtiesContext`](https://docs.spring.io/spring-framework/reference/testing/annotations/integration-spring/annotation-dirtiescontext.html), which tells the Spring Framework that the ApplicationContext is dirty, forcing the rebuilding of the Spring container and creating a new bean instances.