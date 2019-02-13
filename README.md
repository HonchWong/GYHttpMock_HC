# GYHttpMock_HC

## 功能
* 本仓库fork了GYHttpMock，增加了Mock功能：支持替换request 的URL，mock流程可以看下面的时序图，方式2、3都是GYHttpMock就有的功能，方式4是GYHttpMock_HC新增的

![时序图](http://m.qpic.cn/psb?/V10JaO4w40EHz4/Rr2Xq1p5g3ZN82Bh*0sezyTSpNQpSFjI6CJLhq5cCBw!/b/dC4BAAAAAAAA&bo=YAIeAwAAAAADB10!&rf=viewer_4)

## 使用 CocoaPods 引入 

修改podfile文件

```ruby
pod 'GYHttpMock_HC'
```

## Usage

#### 替换请求的url，使用另一个url返回的response来mock数据

```objc
mockRequest(requestType, ruleInfo.urlDetail).isUseNetJsonResponse(YES).andReturn(200).withBody(@"{\"replaceURL\":\jsonPath\"}");
```

# 以下为GYHttpMock 的reame

# GYHttpMock
Library for replacing part/all HTTP response based on Nocilla.

## Features
* Support NSURLConnection, NSURLSession.
* Support replacing totally or partly HTTP response
* Match requests with regular expressions.
* Support json file for response

## Installation with CocoaPods

To integrate GYHttpMock into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'GYHttpMock'
```

Then, run the following command:

```bash
$ pod install
```

## Usage
mocking a request before the real request anywhere.

#### Mock a simple request
It will return the default response, which is a 200 and an empty body.

```objc
mockRequest(@"GET", @"http://www.google.com");
```

#### Mock requests with regular expressions
```objc
mockRequest(@"GET", @"(.*?)google.com(.*?)".regex);
```


#### Mock a request with updating response partly

```objc
mockRequest(@"POST", @"http://www.google.com").
isUpdatePartResponseBody(YES).
withBody(@"{\"name\":\"abc\"}".regex);
andReturn(200).
withBody(@"{\"key\":\"value\"}");
```

#### Mock a request with json file response

```objc
mockRequest(@"POST", @"http://www.google.com").
isUpdatePartResponseBody(YES).
withBody(@"{\"name\":\"abc\"}".regex);
andReturn(200).
withBody(@"google.json");
```
##### Examle for update part response 
    orginal response:
    {"data":{"id":"abc","location":"GZ"}}

    updatedBody: google.json
    {"data":{"time":"today"}}

    final resoponse:
    {"data":{"id":"abc","location":"GZ","time":"today"}}

#### All together
```objc
mockRequest(@"POST", @"http://www.google.com").
withHeaders(@{@"Accept": @"application/json"}).
withBody(@"\"name\":\"foo\"".regex).
isUpdatePartResponseBody(YES).
andReturn(200).
withHeaders(@{@"Content-Type": @"application/json"}).
withBody(@"google.json");
```
#### Add log
```objc
[GYHttpMock sharedInstance].logBlock = ^(NSString *logStr) {
    NSLOG(@"%@", logStr);
};
```

## License

GYHttpMock is released under the MIT license. See LICENSE for details.
