---
title: "Working with Beans in Spring Framework"
date: 2025-03-28T08:10:38-05:00
draft: false
weight: 1
categories:
 - TIL
 - Spring Framework
---

A **JavaBean** is a standard Java class with **getter/setter methods, a no-arg constructor, and is serializable**. And a **Spring Bean** is any Java object **managed by Spring** and can be automatically injected into other components. The **Spring Dependency injection** allows Spring to manage and inject beans where needed.

## Creating a bean

We can create beans with Spring Framework as follows:

### Using `@Component` Annotation

```java
import org.springframework.stereotype.Component;

@Component
public class UserService {
    public String getUserName() {
        return "john.doe";
    }
}
```

### Using `@Bean` inside a `@Configuration` class

```java
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class AppConfig {

    @Bean
    public UserService userService() {
        return new UserService();
    }
}
```

### Using XML-based bean definition

```xml
`<bean id="userService" class="com.example.UserService"/>`
```

This approached was used before the annotations implementation.

## Using a bean

Once a class is defined as a bean, it can be injected into other components/beans using the `@Autowired` annotation. 

```java
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Service {

    private final UserService userService;

    @Autowired
    public Service(UserService userService) {
        this.userService = userService;
    }

    public void printUserName() {
        System.out.println(userService.getUserName());
    }
}

```

## Bean scopes

By default, all beans in Spring Framework have a Singleton scope (one instance per spring container), but we can change their scope.

The following are the scopes a bean can has:

|Scope|Description|
|--|--|
|Singleton|Default. A single instance is created and shared.|
|Prototype|A new instance is created every time the bean is requested.|
|Request|A new instance is created per HTTP request (for web apps).|
|Session|A new instance is created per user session (for web apps).|

The scope can be change with the `@Scope` annotation:

```java
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
public class PrototypeBean {
    // Bean logic here
}

```