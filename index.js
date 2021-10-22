import {NativeModules} from "react-native";

const {NaverLogin} = NativeModules;

async function login(options): Promise<NaverLoginAuthTokenInfo> {
  return await NaverLogin.login(options);
}

async function logout(): Promise<boolean> {
  return await NaverLogin.logout();
}

export default {
  login,
  logout,
};
