//
//  ContentView.swift
//  beep-n-breath
//
//  Created by Jack Lord on 24/02/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showDisclaimer = true
    
    
    var body: some View {
        if showDisclaimer {
            DisclaimerView(showDisclaimer: $showDisclaimer)
        } else {
            MainTabView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
