---
title: "Validate the arguments passed to a method"
date: 2025-03-26T19:25:29-05:00
draft: false
weight: 1
type: tils
categories:
 - TIL
 - Java
 - JUnit
 - Mockito
---

The [Mockito](https://site.mockito.org/) framework has the [ArgumentCaptor](https://site.mockito.org/javadoc/current/org/mockito/ArgumentCaptor.html) class that can be use to validate the arguments passed to a mocked method.

```java
import org.junit.jupiter.api.Test;
import org.mockito.ArgumentCaptor;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.mockito.Mockito.*;

public class MyServiceTest {

    @Test
    public void testMethodArgument() {
        // Arrange
        MyDependency mockDependency = mock(MyDependency.class);
        MyService myService = new MyService(mockDependency);

        // Act
        myService.execute("testArgument");

        // Capture the argument
        ArgumentCaptor<String> argumentCaptor = ArgumentCaptor.forClass(String.class);
        verify(mockDependency).methodToBeCalled(argumentCaptor.capture());

        // Validate the captured argument
        String capturedArgument = argumentCaptor.getValue();
        assertEquals("testArgument", capturedArgument);
    }
}
```