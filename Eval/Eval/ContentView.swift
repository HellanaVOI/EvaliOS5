//
//  ContentView.swift
//  Eval
//
//  Created by Tony Izzi on 25/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            
            Group{
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "gamecontroller")
                    }
                
                FavoriteView()
                    .tabItem {
                        Label("Favorite", systemImage: "star")
                    }
            }
            .toolbarBackground(.black, for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
            .toolbarColorScheme(.dark, for: .tabBar)
            
        }}
}

#Preview {
    ContentView()
}
