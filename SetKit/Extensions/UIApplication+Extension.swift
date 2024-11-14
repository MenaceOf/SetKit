//
//  UIApplication+Extension.swift
//  SetKit
//
//  Created by Viacheslav Kukin on 14.11.2024.
//

import SwiftUI

public extension UIApplication {
    static var getScene: UIWindowScene? {
        UIApplication.shared.connectedScenes.first { $0.activationState == .foregroundActive } as? UIWindowScene
    }
}
