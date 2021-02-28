//
//  Settings.swift
//  beep-n-breath
//
//  Created by Jack Lord on 25/02/2021.
//

import SwiftUI

struct Settings: View {
        @Binding var duration: Int
    @State var mins = 0
    @State var secs = 0
    @Environment(\.presentationMode) var presMode
    
    
    let minutes = Array(stride(from: 0, to: 60, by: 1))
    
    var body: some View {
        
        VStack {
            Spacer()
            
            
            Text("Duration")

            
            
            HStack {
                VStack{
                    Text("Minutes")
                    Picker("", selection: $mins) {
                        ForEach(minutes, id:\.self) {min in
                            Text("\(min)")
                        }
                    }
                    .pickerStyle(InlinePickerStyle())
                    .frame(maxWidth:100)
                    .frame(height:80)
                    .clipped()
                }
                
                VStack{
                    Text("Seconds")
                    Picker("", selection: $secs) {
                        ForEach(minutes, id:\.self) {sec in
                            Text("\(sec)")
                        }
                    }
                    .pickerStyle(InlinePickerStyle())
                    .frame(maxWidth:100)
                    .frame(height:80)
                    .clipped()
                }
            }
            
            //        .padding(.horizontal, 25)
            //                .padding(.bottom, 150)
            Spacer()
            
            Button(action: {
                                presMode.wrappedValue.dismiss()
                let dur = (mins * 60) + secs
                duration = dur
            }, label: {
                Text("Done")
                    .padding()
                    .padding(.horizontal)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            })
            
        }
        .onAppear {
            let ti = NSInteger(duration)

              secs = ti % 60
              mins = (ti / 60) % 60
            
        }
        .onDisappear {
            let dur = (mins * 60) + secs
            duration = dur
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings(duration: .constant(50))
    }
}
