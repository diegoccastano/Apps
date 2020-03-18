//
//  ContentView.swift
//  PhotoCapture
//
//  Created by Diego Carvalho Castano on 18/03/20.
//  Copyright © 2020 dcarvalc. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var shownImagePicker: Bool = false
    @State private var image: Image? = nil
    
    var body: some View {
        VStack {
            
            image?.resizable().scaledToFit()
            
            Button("Open Camera") {
                self.shownImagePicker = true
            }.padding()
                .background(Color.green)
                .foregroundColor(.blue)
                .cornerRadius(10)
        }.sheet(isPresented: self.$shownImagePicker) {
            PhotoCaptureView(shownImagePicker: self.$shownImagePicker, image: self.$image)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
