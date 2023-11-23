//
//  HomeView.swift
//  Ginterest
//
//  Created by Gaia Giordano on 15/11/23.
//


 import SwiftUI
 
 struct HomeView: View {
 
 
 @State var currentTab: Int = 0
 
 
 func refreshData() async {
 try? await Task.sleep(nanoseconds: 3_000_000_000)
 }
 
 
 
 let spacing: CGFloat = 10
 let horizontalPadding: CGFloat = 10
 @State var arrayImageName: [Int] = Array(1...180)
 
 
 struct ColorChangingButtonStyle: ButtonStyle {
 func makeBody(configuration: Configuration) -> some View {
 configuration.label
 .foregroundColor(Color(.label))
 }
 }
 
 
 var body: some View {
 
 NavigationStack {
 
 /*            Spacer(minLength: 10)
  
  HStack{
  Button("All") {
  }
  .foregroundStyle(Color.black)
  .bold()
  .buttonStyle(ColorChangingButtonStyle())
  
  Button("Web design") {
  }
  .foregroundStyle(Color.black)
  .bold()
  .buttonStyle(ColorChangingButtonStyle())
  }
  */
 Spacer(minLength: 20)
 
 .onAppear{
 arrayImageName.shuffle()
 print(arrayImageName)
 }
 
 ScrollView(showsIndicators: false) {
 HStack(alignment: .top, spacing: spacing) {
 LazyVStack(spacing: spacing) {
 ForEach(arrayImageName.prefix(90), id: \.self) { index in
 let imageName = String(format: "%03d", index)
 Image(imageName)
 .resizable()
 .aspectRatio(contentMode: .fit)
 .aspectRatio(contentMode: .fill)
 .frame(height: CGFloat.random(in: 100...320))
 .frame(width: 180)
 .clipShape(RoundedRectangle(cornerRadius: 20))
 .scaledToFit()
 }
 }
 
 LazyVStack(spacing: spacing) {
 ForEach(arrayImageName.suffix(90), id: \.self) { index in
 let imageName = String(format: "%03d", index)
 Image(imageName)
 .resizable()
 .aspectRatio(contentMode: .fit)
 .aspectRatio(contentMode: .fill)
 .frame(height: CGFloat.random(in: 100...320))
 .frame(width: 180)
 .clipShape(RoundedRectangle(cornerRadius: 20))
 .scaledToFit()
 }
 }
 }
 }
 .padding(.horizontal, horizontalPadding)
 .refreshable {
 arrayImageName.shuffle()
 }
 .background(Color.black.opacity(0.02))
 
 }
 
 }
 
 }
 
 #Preview {
 HomeView()
 }
