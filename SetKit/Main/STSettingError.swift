//
//  STSettingError.swift
//  SetKit
//
//  Created by Viacheslav Kukin on 14.11.2024.
//


public enum STSettingError: LocalizedError {
    case privacyPolicyURLIsNil
    case termsOfUseURLIsNil
    case appIdIsNil
    
    public var errorDescription: String? {
        switch self {
        case .privacyPolicyURLIsNil:
            return "Privacy policy URL is nil"
        case .termsOfUseURLIsNil:
            return "Terms of usage URL is nil"
        case .appIdIsNil:
            return "App ID is nil"
        }
    }
}
