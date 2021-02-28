//
//  TabView.swift
//  beep-n-breath
//
//  Created by Jack Lord on 25/02/2021.
//

import SwiftUI

struct MainTabView: View {
    
    
    var body: some View {
        TabView {
            
            HowToView()
                .tabItem {
                    VStack {Image(systemName: "questionmark.circle")
                        Text("How To")
                    }}
            
            
            MetronomeView()
                .tabItem {
                    VStack {Image(systemName: "metronome")
                        Text("Metronome")
                    }}
                .padding(.bottom, 30)
        }
       
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
