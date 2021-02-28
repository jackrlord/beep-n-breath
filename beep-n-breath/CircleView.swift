//
//  CircleView.swift
//  beep-n-breath
//
//  Created by Jack Lord on 28/02/2021.
//

import SwiftUI

struct CircleView: View {
    
    var fill: Int
    
    let color = Color.blue
    
    let currentStrokeColor = Color.blue//Color("currentCircleStrokeColour")
    
    var body: some View {
        VStack {
                HStack {
                    Circle()
                        .stroke(fill  == 1 ? currentStrokeColor : color, lineWidth: fill == 1 ? 3 : 1)
                        .background(Circle().foregroundColor(fill >= 1 ? color : Color.clear))
                    
                    
                
                Circle()
                    .stroke(fill  == 2 ? currentStrokeColor : color, lineWidth: fill == 2 ? 3 : 1)
                    .background(Circle().foregroundColor(fill >= 2 ? color : Color.clear))
                
                Circle()
                    .stroke(fill  == 3 ? currentStrokeColor : color, lineWidth: fill == 3 ? 3 : 1)
                    .background(Circle().foregroundColor(fill >= 3 ? color : Color.clear))
                
                Circle()
                    .stroke(fill  == 4 ? currentStrokeColor : color, lineWidth: fill == 4 ? 3 : 1)
                    .background(Circle().foregroundColor(fill >= 4 ? color : Color.clear))
                
                Circle()
                    .stroke(fill  == 5 ? currentStrokeColor : color, lineWidth: fill == 5 ? 3 : 1)
                    .background(Circle().foregroundColor(fill >= 5 ?color : Color.clear))
                
                Circle()
                    .stroke(fill  == 6 ? currentStrokeColor : color, lineWidth: fill == 6 ? 3 : 1)
                    .background(Circle().foregroundColor(fill >= 6 ?color : Color.clear))
                
                
            }
           
        } .padding(.horizontal)
    }
}
    
    struct CircleView_Previews: PreviewProvider {
        static var previews: some View {
            CircleView(fill: 4)
        }
    }
