//
//  STSettingsViewModifier.swift
//  SetKit
//
//  Created by Viacheslav Kukin on 14.11.2024.
//

import SwiftUI
import StoreKit

struct STSettingsViewModifier: ViewModifier {
    
    @ObservedObject
    public var viewModel: STSettingsViewModel
    
    
    public func body(content: Content) -> some View {
        content
            .fullScreenCover(isPresented: $viewModel.privacyPolicyIsShowing, content: {
                if let privacyPolicyURL = viewModel.privacyPolicyURL {
                    SFSafariView(url: privacyPolicyURL)
                }
            })
            .fullScreenCover(isPresented: $viewModel.termsOfUseIsShowing, content: {
                if let termsOfUseURL = viewModel.termsOfUseURL {
                    SFSafariView(url: termsOfUseURL)
                }
            })
            .sheet(isPresented: $viewModel.shareAppIsShowing, content: {
                if let appId = viewModel.appId {
                    STShareAppView(appId: appId)
                }
            })
            .alert(
                isPresented: $viewModel.errorIsShowing,
                error: viewModel.error,
                actions: {
                    Button(
                        action: { viewModel.removeError() },
                        label: { Text("OK") }
                    )
                }
            )
            .onReceive(viewModel.$rateUsShowing, perform: { isShowing in
                if let scene = UIApplication.getScene, isShowing {
                    SKStoreReviewController.requestReview(in: scene)
                }
            })
    }
}


public extension View {
    func asSTSettings(viewModel: STSettingsViewModel) -> some View {
        modifier(STSettingsViewModifier(viewModel: viewModel))
    }
}
