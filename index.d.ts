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

    export function login(options: NaverLoginOptions): Promise<NaverLoginAuthTokenInfo>;
    export function logout(): Promise<boolean>;
}
