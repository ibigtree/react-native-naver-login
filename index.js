// @flow
import { NativeModules } from 'react-native';

const { NaverLogin } = NativeModules;

type NaverLoginOptions = {
    consumerKey: string,
    consumerSecret: string,
    appName: string,
    serviceUrlScheme: ?string,
}

type NaverLoginAuthTokenInfo = {
    accessToken: string,
}

async function login(options: NaverLoginOptions): Promise<NaverLoginAuthTokenInfo> {
    return await NaverLogin.login(options);
}

async function logout(): Promise<boolean> {
    return await NaverLogin.logout();
}

export default NaverLogin;
