//
//  importView.swift
//  MathScanner
//
//  Created by Angle Qian on 2018/12/20.
//  Copyright © 2018 Angle Qian. All rights reserved.
//

import Cocoa

class DropView: NSView {

    private var fileTypeIsOk = false
    private var acceptedFileExtensions = ["png"]
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.wantsLayer = true
        self.layer?.backgroundColor = NSColor.gray.cgColor
        
        registeredDraggedTypes([NSPasteboard.PasteboardType.URL, NSPasteboard.PasteboardType.fileURL])
    }
    
    override func draggingEntered(_ sender: NSDraggingInfo) -> NSDragOperation {
        fileTypeIsOk = checkExtension(drag: sender)
        return []
    }
    
    override func draggingUpdated(_ sender: NSDraggingInfo) -> NSDragOperation {
        return fileTypeIsOk ? .copy: []
    }
    
    override func performDragOperation(_ sender: NSDraggingInfo) -> Bool {
        guard let draggedFileURL = sender.draggedFileURL else {
            return false
        }
        
        return true
    }
    
    fileprivate func checkExtension(drag: NSDraggingInfo) -> Bool {
        guard let fileExtension = drag.draggedFileURL?.pathExtension?.lowercased() else {
            return false
        }
        
        return acceptedFileExtensions.contains(fileExtension)
    }
    
}

extension NSDraggingInfo{
    var draggedFileURL: NSURL? {
        let filenames = draggingPasteboard().propertyList(forType: NSPasteboard.PasteboardType(kUTTypeURL as String)) as? [String]
        let path = filenames?.first
        
        return path.map(NSURL.init)
    }
}
