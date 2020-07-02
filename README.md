# @ibigtree/react-native-naver-login

React Native를 위한 네이버 로그인 라이브러리.

## Getting started

`$ npm install @ibigtree/react-native-naver-login --save`


### 공통

[Naver Developers](https://developers.naver.com) 에서 앱 생성 및 사용할 플랫폼 등록을 먼저 진행해야 합니다.

### iOS

등록한 앱의 Bundle Identifier와 프로젝트의 값이 일치해야 정상 동작합니다.


Info.plist 에 다음 내용 추가({URL_SCHEME은 사용할 앱의 URL Scheme로 설정})

```xml
<dict>
  <key>LSApplicationQueriesSchemes</key>
  <array>
     <!-- 네이버 로그인 -->
     <string>naversearchapp</string>
     <string>naversearchthirdlogin</string>
  </array>

  <key>CFBundleURLTypes</key>
  <array>
    <dict>
      <key>CFBundleURLSchemes</key>
      <array>
        <string>{URL_SCHEME}</string>
      </array>
    </dict>
  </array>
</dict>
```

AppDelegate.m에 다음 내용 추가.

* 주의: 네이버 아이디 로그인에서는 호출된 URL이 네이버 로그인을 위한 URL인지 검사하는 루틴이 없기 때문에 직접 검사를 해주셔야 합니다.

```objective-c
#import <NaverThirdPartyLogin/NaverThirdPartyLogin.h>

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary *)options {
    if ([url.scheme isEqualToString:@"{URL_SCHEME}"]) {
        return [[NaverThirdPartyLoginConnection getSharedInstance] application:app openURL:url options:options];
    }

    return NO;
}

```

### Android

등록한 앱 ID가 일치해야 정상 작동 합니다.

## Usage
```javascript
import NaverLogin from '@ibigtree/react-native-naver-login';

async function processLogin() {
    try {
        const tokenInfo = await NaverLogin.login({
            consumerKey: '{CONSUMER_KEY}',
            consumerSecret: '{CONSUMER_SECRET}',
            appName: '{APP_NAME}',
            serviceUrlScheme: '{IOS_URL_SCHEME}',  // iOS의 경우에만 필요함
        });
        console.log(tokenInfo.accessToken);
        await NaverLogin.logout();
    } catch (error) {
        if (error.code === 'E_CANCELLED') {
            // 사용자가 로그인을 취소함
            // iOS에서는 취소시에도 에러 이벤트 반환하지 않음.
        }

        // 기타 정의되지 않은 에러 (E_UNKNOWN)
    }
}
```
