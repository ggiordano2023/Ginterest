//
//  testview.swift
//  Ginterest
//
//  Created by Gaia Giordano on 18/11/23.
//

import SwiftUI


//Positioning of TabBar and ScrollView

    struct PositionView: View {
    
        @State var currentTab: Int = 0
    
        var body: some View {
        
            NavigationStack{
                VStack(alignment: .center, spacing: -70) {
                
                    TabBarView(currentTab: self.$currentTab)
                
                    TabView(selection: self.$currentTab) {
                        HomeView().tag(0)
                        WebDesignView().tag(1)
                    
                    }
                    .tabViewStyle(.page(indexDisplayMode: .never))
                    .edgesIgnoringSafeArea(.all)
                
                }
            
            }
        
        }
    
    }



//Construct of my TabBar

    struct TabBarView: View {
    
        @Environment(\.colorScheme) var colorScheme
        @Binding var currentTab: Int
        @Namespace var namespace
    
        var tabBarOptions: [String] = ["All", "Web design"]
    
        var body: some View {
        
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 25) {
                    Spacer(minLength: 86)
                    ForEach(Array(zip(self.tabBarOptions.indices,
                                  self.tabBarOptions)),
                            id: \.0,
                            content: {
                        index, name in
                        TabBarItem(currentTab: self.$currentTab,
                                   namespace: namespace.self,
                                   tabBarItemName: name,
                                   tab: index)
                    
                    })
                
                }
            
                .padding(.horizontal)
            
            }
            .background(colorScheme == .dark ? Color.black : Color.white)
            .frame(height: 100)
            .edgesIgnoringSafeArea(.all)
        
        }
    
    }



//Animation of my TabBar

    struct TabBarItem: View {
    
        @Environment(\.colorScheme) var colorScheme
        @Binding var currentTab: Int
        let namespace: Namespace.ID
    
        var tabBarItemName: String
        var tab: Int
    
        var body: some View {
            Button {
                self.currentTab = tab
            } label: {
                VStack {
                    Spacer()
                    Text(tabBarItemName)
                        .bold()
                    if currentTab == tab {
                        Color(colorScheme == .dark ? .white : .black)
                            .frame(height: 2)
                            .matchedGeometryEffect(id: "underline",
                                                   in: namespace,
                                                   properties: .frame)
                    } else {
                        Color.clear.frame(height: 2)
                    }
                    Spacer().frame(height: 17)
                
                }
                .animation(.spring(), value: self.currentTab)
                
            }
            .buttonStyle(.plain)
        
        }

    }




struct testview_Previews: PreviewProvider {
    static var previews: some View {
        PositionView()
    }
}
