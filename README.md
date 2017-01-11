# YLKeyChain

[![CI Status](http://img.shields.io/travis/dev-wangliugen/YLKeyChain.svg?style=flat)](https://travis-ci.org/dev-wangliugen/YLKeyChain)
[![Version](https://img.shields.io/cocoapods/v/YLKeyChain.svg?style=flat)](http://cocoapods.org/pods/YLKeyChain)
[![License](https://img.shields.io/cocoapods/l/YLKeyChain.svg?style=flat)](http://cocoapods.org/pods/YLKeyChain)
[![Platform](https://img.shields.io/cocoapods/p/YLKeyChain.svg?style=flat)](http://cocoapods.org/pods/YLKeyChain)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

YLKeyChain is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "YLKeyChain"
```

## 调用方法
```
   //存入
    NSString * token = [NSString stringWithFormat: @"3rdsjkvKSDGFht4tinvdjskn"];
    [YLKeyChain savePassWord:token];
  //读取
    NSString* getToken = [YLKeyChain readToken];
  //删除
    [YLKeyChain deleteToken];
```

## License

YLKeyChain is available under the MIT license. See the LICENSE file for more info.
