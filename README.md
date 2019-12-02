# NoveLogger

[![Version](https://img.shields.io/cocoapods/v/NoveLogger.svg?style=flat)](https://cocoapods.org/pods/NoveLogger) [![License](https://img.shields.io/cocoapods/l/NoveLogger.svg?style=flat)](https://cocoapods.org/pods/NoveLogger) [![Platform](https://img.shields.io/cocoapods/p/NoveLogger.svg?style=flat)](https://cocoapods.org/pods/NoveLogger)

A simple Swift logger using `print` in Debug and `NSLog` in Production.


## Features

- [x] Uses `print` in Debug and `NSLog` in Production.
- [x] Format output in Debug and in Production.
- [x] Supports log levels
- [x] Contains the date, the log level, the file, the line and the function of the log’s call.
- [x] Is unit tested.


## Requirements

- iOS 9.0+
- Mac OS X 10.15+
- WatchOS 2.0+
- TV OS 9.0+


## Installation

NoveLogger uses [CocoaPods](http://cocoapods.org). It is a dependency manager for Cocoa projects.

To integrate **NoveLogger** into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
use_frameworks!

pod 'NoveLogger', '~> 1.0'
```

Then, run the following command:

```bash
$ pod install
```


## Usage

### Basics

Import NoveLogger first:

```swift
import NoveLogger
```

You have 3 ways to log:

```swift
// Using static functions (it will use the default logger)
NoveLogger.verbose("Your log message")

// Using the default logger
NoveLogger.defaultLogger.verbose("Your log message")

// Using an instanciated logger
let logger = NoveLogger()
logger.verbose("Your log message")
```

Here is an exemple of an output:

```
2019-12-02 15:25:41.031 [VERBOSE] [NoveLoggerTests.swift:42] testSimpleMessage(): Your log message
```

### Log levels

NoveLogger allows 5 log levels:

```swift
NoveLogger.verbose("Verbose log.")
NoveLogger.debug("Debug log.")
NoveLogger.info("Info log.")
NoveLogger.warning("Warning log.")
NoveLogger.error("Error log.")
```

A log will not be outputted if its level is lower than the log level defined in the logger.

```swift
let logger = NoveLogger()
logger.logLevel = .info
logger.verbose("This message will not be printed.")
logger.error("This message will be printed.")
```

When you set the log level of your logger, you can set, from low to high:

```swift
.all // Everything will be printed.
.verbose
.debug
.info
.warning
.error
.off // Nothing will be printed.
```

By default, log levels are set as `.all` in Debug and `.warning` in Production.

You can override the default logger level by calling (for example):

```swift
NoveLogger.defaultLogger.logLevel = .debug
```

### Format

You can use format to include contents into your log:

```swift
NoveLogger.verbose("Here is a message containing %d %@.", args: 2, "arguments")

> 2019-12-02 15:25:40.023 [VERBOSE] [NoveLoggerTests.swift:51] testFormat(): Here is a message containing 2 arguments.
```


## Credits

Steve Gigou ([Website](https://steve.gigou.fr), [Twitter](https://twitter.com/stevegigou))


## License

NoveLogger is available under the MIT license. See the LICENSE file for more informations.