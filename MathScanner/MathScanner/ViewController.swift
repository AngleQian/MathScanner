//
//  ViewController.swift
//  MathScanner
//
//  Created by Angle Qian on 2018/12/16.
//  Copyright © 2018 Angle Qian. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var tempLabel: NSTextField!
    @IBOutlet weak var dragView: DragView!
    @IBOutlet weak var importSpinner: NSView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        dragView.delegate = self
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func tempConvert(_ sender: NSButton) {
        tempLabel.stringValue = "LOL"
    }
    
}

extension ViewController: DragViewDelegate {
    func dragView(didDragFileWith URL: URL) {
        let document = Document()
        document.addImage(fileURL: URL)
        
        tempLabel.stringValue = URL.absoluteString
    }
}

