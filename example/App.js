/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */

import React from 'react';
import {SafeAreaView, Button, StatusBar} from 'react-native';
import NaverLogin from '@ibigtree/react-native-naver-login';

const App = () => {
  return (
    <>
      <StatusBar barStyle="dark-content" />
      <SafeAreaView>
        <Button
          title="Login"
          onPress={async () => {
            try {
              const result = await NaverLogin.login({
                consumerKey: '{CONSUMER_KEY}',
                consumerSecret: '{CONSUMER_SECRET}',
                appName: '{APP_NAME}',
                serviceUrlScheme: '{IOS_URL_SCHEME}',
              });
              console.log(result);
            } catch (error) {
              if (error.code === 'E_CANCELLED') {
                alert('User Cancelled');
              } else {
                console.error(error);
              }
            }
          }}
        />
        <Button
          title="Logout"
          onPress={() => {
            NaverLogin.logout();
          }}
        />
      </SafeAreaView>
    </>
  );
};

export default App;
