//
//  ContentView.swift
//  Ginterest
//
//  Created by Gaia Giordano on 14/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.colorScheme) var colorScheme
    @State var tabSelection = 0
        
    var body: some View {
        
        VStack {
    
            TabView(selection: $tabSelection) {
                
                Group {
                    // Home
                    PositionView()
                        .tabItem {
                            Image("Home_Tab_Item")
                                .accessibilityLabel("Home")
                        }
                        .tag(0)
                    
                    // Search
                    SearchView()
                        .tabItem {
                            Image("Search_Tab_Item")
                                .accessibilityLabel("Search")
                        }
                        .tag(1)
                    
                    // Add Image (+)
                    Color.clear
                        .tabItem {
                            Image("Add_Tab_Item")
                                .accessibilityLabel("Create")
                        }
                        .tag(2)
                    
                    // Messages
                    NotificationView()
                        .badge("")
                        .tabItem {
                            Image("Notification_Tab_Item")
                                .accessibilityLabel("Notifications")
                        }
                        .tag(3)
                    
                    // Profile
                    ProfileView()
                        .tabItem {
                            Image("Profile_Tab_Item")
                                .accessibilityLabel("Profile")
                        }
                        .tag(4)
                }
                .sensoryFeedback(.selection, trigger: tabSelection)
                .toolbarBackground(colorScheme == .dark ? Color.black : Color.white, for: .tabBar)
                .toolbarBackground(.visible, for: .tabBar)
                
            }
        }
    }
}

#Preview {
    ContentView()
}
