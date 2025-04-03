---
title: "Form Param Request Matching with WireMock"
date: 2025-04-02T20:24:45-05:00
draft: false
weight: 1
categories:
 - Java
 - JUnit
 - WireMock
---

The following is an example of how to use the `withFormParam` method to customize the response of a stub based on the value of a from parameter. 

```java
WireMock.stubFor(post(urlEqualTo("/my-endpoint"))
	.withHeader("Content-Type", containing("application/x-www-form-urlencoded"))
	.withFormParam("field1", equalTo("value1"))
	.willReturn(aResponse()
		.withStatus(200)
		.withBody("Response for field1=value1")));
```

The `withFormParam` method was implemented in [WireMock 3.0.0](https://github.com/wiremock/wiremock/releases/tag/3.0.0) release.