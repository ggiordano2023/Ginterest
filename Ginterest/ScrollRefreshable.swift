//
//  ScrollRefreshable.swift
//  Ginterest
//
//  Created by Gaia Giordano on 16/11/23.
//

import SwiftUI

struct ScrollRefreshable<Content: View>: View {
    
    var content: Content
    var onRefresh: () async ->()
    
    init(title: String, tintColor: Color, @ViewBuilder content: @escaping()->Content, onRefresh: @escaping () async ->()){
        self.content = content()
        self.onRefresh = onRefresh
        
        UIRefreshControl.appearance().attributedTitle = NSAttributedString(string: title)
        UIRefreshControl.appearance().tintColor = UIColor(tintColor)
    }
    
    let spacing: CGFloat = 10
    let horizontalPadding: CGFloat = 10
    
    var body: some View {
        
        List {
            content
                .listRowSeparatorTint(.clear)
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        .listStyle(.plain)
        .refreshable {
            await onRefresh()
            
        }
        
    }
    
}

#Preview {
    ContentView()
}
