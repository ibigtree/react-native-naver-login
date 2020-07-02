import Foundation
import NaverThirdPartyLogin

@objc(NaverLogin)
class NaverLogin: NSObject, RCTBridgeModule, NaverThirdPartyLoginConnectionDelegate {
    private var loginPromiseResolve: RCTPromiseResolveBlock?
    private var loginPromiseReject: RCTPromiseRejectBlock?
    
    private var logoutPromiseResolve: RCTPromiseResolveBlock?
    private var logoutPromiseReject: RCTPromiseRejectBlock?
    
    static func moduleName() -> String! {
        return "NaverLogin"
    }

    static func requiresMainQueueSetup() -> Bool {
        return false
    }

    @objc(login:resolver:rejecter:)
    func login(options: Dictionary<String, String>, resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
        loginPromiseResolve = resolve
        loginPromiseReject = reject
        
        if let connection = NaverThirdPartyLoginConnection.getSharedInstance() {
            connection.consumerKey = options["consumerKey"]
            connection.consumerSecret = options["consumerSecret"]
            connection.appName = options["appName"]
            connection.serviceUrlScheme = options["serviceUrlScheme"]
            
            connection.delegate = self
            
            DispatchQueue.main.async {
                connection.requestThirdPartyLogin()
            }
        }
    }

    @objc(logout:rejecter:)
    func logout(resolve: @escaping RCTPromiseResolveBlock, reject: @escaping RCTPromiseRejectBlock) {
        logoutPromiseResolve = resolve
        logoutPromiseReject = reject
        
        if let connection = NaverThirdPartyLoginConnection.getSharedInstance() {
            DispatchQueue.main.async {
                connection.requestDeleteToken()
            }
        }
    }
    
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        if let connection = NaverThirdPartyLoginConnection.getSharedInstance(), let resolve = loginPromiseResolve {
            resolve(["accessToken": connection.accessToken])
        }
    }
    
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        if let connection = NaverThirdPartyLoginConnection.getSharedInstance(), let resolve = loginPromiseResolve {
            resolve(["accessToken": connection.accessToken])
        }
    }
    
    func oauth20ConnectionDidFinishDeleteToken() {
        if let resolve = logoutPromiseResolve {
            resolve(true)
        }
    }
    
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        if let reject = loginPromiseReject {
            reject("E_UNKNOWN", error.localizedDescription, error)
        }
    }
}
