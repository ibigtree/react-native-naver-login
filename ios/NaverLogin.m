#import <React/RCTBridgeModule.h>


@interface RCT_EXTERN_MODULE(NaverLogin, NSObject)

RCT_EXTERN_METHOD(login:(NSDictionary)options resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)
RCT_EXTERN_METHOD(logout:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)

@end
