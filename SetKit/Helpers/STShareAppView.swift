//
//  STShareAppView.swift
//  SetKit
//
//  Created by Viacheslav Kukin on 14.11.2024.
//

import SwiftUI
import Combine

public struct STShareAppView: View {
    
    public var appId: String
    private let url: URL?
    
    public init(appId: String) {
        self.appId = appId
        self.url = .init(string: "https://itunes.apple.com/us/app/myapp/id\(appId)")
    }
    
    public var body: some View {
        ActivityView(urls: [url])
    }
}
