//
//  SFSafariView.swift
//  SetKit
//
//  Created by Viacheslav Kukin on 14.11.2024.
//

import SafariServices
import SwiftUI

public struct SFSafariView: UIViewControllerRepresentable {
    public let url: URL
    
    public init(url: URL) {
        self.url = url
    }
    
    public func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    public func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        // make updates
    }
}


#if DEBUG
#Preview {
    SFSafariView(url: URL(string: "https://apple.com")!)
}
#endif
