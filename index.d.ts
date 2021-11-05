export interface NaverLoginOptions {
    consumerKey: string;
    consumerSecret: string;
    appName: string;
    serviceUrlScheme?: string;
}

export interface NaverLoginAuthTokenInfo {
    accessToken: string;
}

export interface NaverLogin {
    login(options: NaverLoginOptions): Promise<NaverLoginAuthTokenInfo>;
    logout(): Promise<boolean>;
}

declare const NaverLogin: NaverLogin;

export default NaverLogin;

