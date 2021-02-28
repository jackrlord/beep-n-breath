//
//  DisclaimerView.swift
//  beep-n-breath
//
//  Created by Jack Lord on 25/02/2021.
//

import SwiftUI

struct DisclaimerView: View {
    
    @Binding var showDisclaimer :Bool
    
    var body: some View {
        VStack {
        Spacer()
        Text("Hello, World! - some disclaimer text here")
        Spacer()
            
            Button(action: {
                showDisclaimer = false
            }, label: {
                Text("I understand")
                    .padding()
                    .padding(.horizontal, 20)
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            })
            
        }
    }
}

struct DisclaimerView_Previews: PreviewProvider {
    static var previews: some View {
        DisclaimerView(showDisclaimer: .constant(false))
    }
}
