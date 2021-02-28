//
//  HowToView.swift
//  beep-n-breath
//
//  Created by Jack Lord on 25/02/2021.
//

import SwiftUI
import AVKit

struct HowToView: View {
    var body: some View {
        VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "howTo", withExtension: "MOV")!))
    }
}

struct HowToView_Previews: PreviewProvider {
    static var previews: some View {
        HowToView()
    }
}
