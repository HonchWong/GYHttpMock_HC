Pod::Spec.new do |s|
  s.name             = "GYHttpMock_HC"
  s.version          = "1.0.0"
  s.summary          = "Library for replace part/all HTTP response based Nocilla."

  s.homepage         = "https://github.com/HonchWong/GYHttpMock_HC"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { "黄鸿昌" => "honchwong404@gmail.com" }
  s.source           = { :git => "https://github.com/HonchWong/GYHttpMock_HC.git", :tag => "1.0.1" }
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source_files = '**/*.{h,m}'
  s.public_header_files = [
    'GYHttpMock.h',
    'GYMatcher.h',
    'GYNSURLProtocol.h',
    'Categories/NSString+mock.h',
    'Categories/NSURLRequest+GYURLRequestProtocol.h',
    'Hooks/GYHttpClientHook.h',
    'Hooks/GYURLHook.h',
    'Hooks/GYNSURLSessionHook.h',
    'Request/GYSubRequest.h',
    'Request/GYMockRequest.h',
    'Request/GYMockRequestDSL.h',
    'Response/GYMockResponse.h',
    'Response/GYMockResponseDSL.h',
  ]

  s.frameworks = 'Foundation','CFNetwork'

end
