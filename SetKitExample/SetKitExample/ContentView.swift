//
//  ContentView.swift
//  SetKitExample
//
//  Created by Viacheslav Kukin on 14.11.2024.
//

import SwiftUI
import SetKit

struct ContentView: View {
    
    @StateObject
    private var settingsViewModel: STSettingsViewModel
    
    init() {
        if let testURL: URL = .init(string: "https://google.com") {
            let wrappedViewModel: STSettingsViewModel = .init(
                privacyPolicyURL: testURL,
                termsOfUseURL: testURL,
                appId: "00000"
            )
            self._settingsViewModel = StateObject(wrappedValue: wrappedViewModel)
        } else {
            self._settingsViewModel = StateObject(wrappedValue: .init())
            assertionFailure("provide correct link")
        }
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("SetKit Example")
                .font(.title)
                .foregroundColor(.primary)
                .padding(.bottom, 20)
            Spacer()
            mainView()
            Spacer()
            Image(systemName: "globe")
                .scaleEffect(3.0)
                .foregroundStyle(Color.blue)
            Spacer()
            footerView()
        }
        .padding(.vertical, 30)
        .padding(.horizontal, 20)
        .background(Color(.secondarySystemBackground))
        .cornerRadius(16)
        .padding(20)
        .asSTSettings(viewModel: settingsViewModel)
    }
    
    @ViewBuilder
    private func mainView() -> some View {
        Button("Share app", action: { settingsViewModel.showShareApp() })
            .buttonStyle(.bordered)
        
        Button("Rate Us", action: { settingsViewModel.showRequestRateApp() })
            .buttonStyle(.borderedProminent)
    }
    
    private func footerView() -> some View {
        HStack(alignment: .center, spacing: 0) {
            Button(action: { settingsViewModel.showPrivacyPolicy() }, label: {
                Text("Privacy Policy")
                    .underline()
                    .foregroundStyle(Color(.label))
            })
            Spacer()
            Button(action: { settingsViewModel.showTermsOfUse() }, label: {
                Text("Terms Of Use")
                    .underline()
                    .foregroundStyle(Color(.label))
            })
        }
    }
}

#Preview {
    ContentView()
}
