//
//  STettingsViewModel.swift
//  SetKit
//
//  Created by Viacheslav Kukin on 14.11.2024.
//

import Combine

//MARK: - STSettingsViewModel
public class STSettingsViewModel: ObservableObject {
    
    public var privacyPolicyURL: URL?
    
    public var termsOfUseURL: URL?
    
    public var appId: String?
        
    @Published
    internal var privacyPolicyIsShowing: Bool = false
    
    @Published
    internal var termsOfUseIsShowing: Bool = false
    
    @Published
    internal var shareAppIsShowing: Bool = false
    
    @Published
    internal var errorIsShowing: Bool = false
    
    @Published
    internal var rateUsShowing: Bool = false
    
    internal var error: STSettingError?
    
    public init(privacyPolicyURL: URL? = nil, termsOfUseURL: URL? = nil, appId: String? = nil) {
        self.privacyPolicyURL = privacyPolicyURL
        self.termsOfUseURL = termsOfUseURL
        self.appId = appId
    }
    
    internal func removeError() {
        self.errorIsShowing = false
        self.error = nil
    }
}

//MARK: - Public show methods
public extension STSettingsViewModel {
    func showPrivacyPolicy() {
        if privacyPolicyURL != nil {
            privacyPolicyIsShowing = true
        } else {
            error = .privacyPolicyURLIsNil
        }
    }
    
    func showTermsOfUse() {
        if termsOfUseURL != nil {
            termsOfUseIsShowing = true
        } else {
            error = .termsOfUseURLIsNil
        }
    }
    
    func showShareApp() {
        if appId != nil {
            shareAppIsShowing = true
        } else {
            error = .appIdIsNil
        }
    }
    
    func showRequestRateApp() {
        rateUsShowing = true
    }
}
