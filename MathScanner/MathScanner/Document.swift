//
//  Document.swift
//  MathScanner
//
//  Created by Angle Qian on 2018/12/20.
//  Copyright © 2018 Angle Qian. All rights reserved.
//

import Foundation
import Cocoa

class Document {
    var images: [NSImage]!
    
    init() {
        
    }
    
    func addImage(fileURL: URL) {
        if let image = NSImage(contentsOf: fileURL) {
            images.append(image)
        }
    }
    
    
    
    
    
}
