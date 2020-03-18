//
//  PhotoCaptureView.swift
//  PhotoCapture
//
//  Created by Diego Carvalho Castano on 18/03/20.
//  Copyright © 2020 dcarvalc. All rights reserved.
//

import Foundation
import SwiftUI

struct PhotoCaptureView: View {
    @Binding var shownImagePicker: Bool
    @Binding var image: Image?
    
    var body: some View {
        ImagePicker(isShown: $shownImagePicker, image: $image)
    }
}

#if DEBUG
struct PhotoCaptureView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoCaptureView(shownImagePicker: .constant(false), image: .constant(Image("")))
    }
}
#endif
