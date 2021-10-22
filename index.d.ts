declare module '@ibigtree/react-native-naver-login' {
    export interface NaverLoginOptions {
        consumerKey: string;
        consumerSecret: string;
        appName: string;
        serviceUrlScheme?: string;
    }

    export interface NaverLoginAuthTokenInfo {
        accessToken: string;
    }

    namespace NaverLogin {
        function login(options: NaverLoginOptions): Promise<NaverLoginAuthTokenInfo>;
        function logout(): Promise<boolean>;
    }

    export default NaverLogin;
}
