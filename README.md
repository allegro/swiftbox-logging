
# SwiftBoxLogging

Logging system for Swift/Vapor.
Official https://github.com/apple/swift-log package should be used instead, this package is deprecated.

[![Build Status](https://travis-ci.org/allegro/swiftbox-logging.svg?branch=master)](https://travis-ci.org/allegro/swiftbox-logging)
![Swift 4.1](https://img.shields.io/badge/swift-4.1-brightgreen.svg)
![Linux](https://img.shields.io/badge/linux-brightgreen.svg)
![MacOS](https://img.shields.io/badge/macos-brightgreen.svg)


## General

### Usage

#### 1. Import
```swift
import SwiftBoxLogging
```

#### 2. Bootstrap
Logging should be bootstrapped before use (it defaults to `PrintLogger`).
Bootstrap requires one parameter which is the logger factory.
Logger factory must return `Logger` from `Console/Logging` package.
```swift
Logging.bootstrap({ name in Logger2(name) })
```

#### 2. Usage
Create a logger instance:
```swift
fileprivate var logger = Logging.make(#file)
```

Log a message:
```swift
logger.verbose("verbose")
logger.debug("debug")
logger.info("info")
logger.warning("warning")
logger.error("error")
logger.fatal("fatal")
```

### Custom Loggers
To create custom loggers your class must conform to `Logger` protocol from `Console/Logging` package.

### Vapor
You can use same logging in Vapor and logging package:
```swift
private func configureLogging(_ config: inout Config, _ env: inout Environment, _ services: inout Services) {
    /// Register Logger2
    services.register(Logger2.self)

    switch env {
    case .production:
        config.prefer(Logger2.self, for: Logger.self)
        Logging.bootstrap({ name in Logger2(name) })
    default:
        config.prefer(PrintLogger.self, for: Logger.self)
        Logging.bootstrap({ _ in PrintLogger() })
    }
}
```
