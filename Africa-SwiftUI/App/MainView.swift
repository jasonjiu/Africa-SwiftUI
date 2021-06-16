//
//  MainView.swift
//  Africa-SwiftUI
//
//  Created by Jason Prosia on 08/06/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        TabView{
            ContentView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Browse")
                }// content tab
            
            VideoListView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Watch")
                }// video tab
            
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Location")
                }// map tab
            
            GalleryView()
                .tabItem {
                    Image(systemName: "photo")
                    Text("Gallery")
                }// gallery tab
        }//BOTTOM NAVBAR TABVIEW

    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
