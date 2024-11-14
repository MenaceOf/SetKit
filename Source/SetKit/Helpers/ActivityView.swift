//
//  ActivityView.swift
//  SetKit
//
//  Created by Viacheslav Kukin on 14.11.2024.
//

import SwiftUI

public struct ActivityView: UIViewControllerRepresentable {

    public let urls: [URL?]
    public var activities: [UIActivity]?
    
    public init(urls: [URL?], activities: [UIActivity]? = nil) {
        self.urls = urls
        self.activities = activities
    }

    public func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityView>) -> UIActivityViewController {
        let urls = urls.compactMap({$0})
        
        guard !urls.isEmpty else {
            assertionFailure("ActivityView: No URL provided")
            return UIActivityViewController(activityItems: [], applicationActivities: nil)
        }
        
        let activityView: UIActivityViewController = .init(activityItems: urls, applicationActivities: activities)
        return activityView
    }

    public func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityView>) {
        // make updates
    }
}

#if DEBUG
#Preview {
    ActivityView(urls: [URL(string: "https://www.apple.com")])
}
#endif
