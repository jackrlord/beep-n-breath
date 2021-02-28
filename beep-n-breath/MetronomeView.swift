//
//  MetronomeView.swift
//  beep-n-breath
//
//  Created by Jack Lord on 24/02/2021.
//

import SwiftUI

struct MetronomeView: View {
    @StateObject var metronome = Metronome()
@State private var showDuration = true
    @State private var buttonText = "Start"
    @State private var showSettings = false

    
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                
                Image(systemName: "gearshape")
                    .padding()
                    .font(.title2)
                    .onTapGesture {
                        showSettings = true
                    }
            }
            Spacer()
            
//            Text("\(metronome.count)")
//                .font(.system(size: 80,weight: .thin))
//                .fontWeight(.thin)
            CircleView(fill: metronome.count)
                .animation(.easeInOut)
                .padding()
        
            Spacer()
            
            Text("duration: \(metronome.duration.formattForTimeDisplay)")
                .opacity(showDuration ? 1 : 0)
                .animation(.easeInOut)
            
            Button(action: {
                switch metronome.playState {
            case .isPlaying :
                metronome.stop()
            case .isStopped :
                metronome.start()
            }
            }, label: {
                Text(buttonText)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .frame(width:200)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(20)
                    .font(.largeTitle)
            })
            

            
        }
        .sheet(isPresented: $showSettings, content: {
            Settings(duration: $metronome.duration)
        })
        .onChange(of: metronome.playState, perform: { value in
            switch value {
            case .isPlaying :
                buttonText = "Stop"
                showDuration = false
            case .isStopped:
                buttonText = "Start"
                showDuration = true
            }
        })
        
    }
}

struct MetronomeView_Previews: PreviewProvider {
    static var previews: some View {
        MetronomeView()
    }
}


extension Int {
    var formattForTimeDisplay : String {
        let interval = self
           let ti = NSInteger(interval)
//          let ms = Int((interval.truncatingRemainder(dividingBy: 1)) * 100)
          let seconds = ti % 60
          let minutes = (ti / 60) % 60
//          let hours = (ti / 3600)
        
        if minutes != 0 {
        
        return "\(minutes) Minute\(minutes == 1 ? "" : "s") & \(seconds) Second\(seconds == 1 ? "" : "s")"
        } else {
            return "\(seconds) Second\(seconds == 1 ? "" : "s")"
        }
//          return String(format: "%0.2d:%0.2d:%0.2d.%0.2d",hours,minutes,seconds,ms)
       }
}
