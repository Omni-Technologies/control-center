//
//  ViewController.swift
//  Omni Mouse
//
//  Created by Naren Yenuganti on 1/4/21.
//

import Cocoa

class ViewController: NSViewController {
    lazy var window: NSWindow = self.view.window!
    var mouseLocation: NSPoint { NSEvent.mouseLocation }
    var location: NSPoint { window.mouseLocationOutsideOfEventStream }
    @IBOutlet weak var mode: NSSegmentedControl!
    @IBOutlet weak var keyboard: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        modeChange(self)
//        NSEvent.addLocalMonitorForEvents(matching: [.mouseMoved]) {
//            print("mouseLocation:", String(format: "%.1f, %.1f", self.mouseLocation.x, self.mouseLocation.y))
//            print("windowLocation:", String(format: "%.1f, %.1f", self.location.x, self.location.y))
//            return $0
//        }
        NSEvent.addGlobalMonitorForEvents(matching: [.mouseMoved]) { _ in
            print(String(format: "%.0f, %.0f", self.mouseLocation.x, self.mouseLocation.y))
        }
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
        window.acceptsMouseMovedEvents = true
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func modeChange(_ sender: Any) {
        switch mode.selectedSegment {
            case 0:
                print("normal")
            case 1:
                print("scroll")
            case 2:
                print("etc")
            default:
                print("normal")
        }
    }

    @IBAction func toggleKeyboard(_ sender: Any) {
        print("reached")
    }
    
    override func mouseDragged(with theEvent: NSEvent) {
        if (theEvent.deltaX < 0) {
            print("dragged left")
        }
        if (theEvent.deltaY < 0) {
            print("dragged up")
        }
        if (theEvent.deltaX > 0) {
            print("dragged right")
        }
        if (theEvent.deltaY > 0) {
            print("dragged down")
        }
    }
    
    override func mouseMoved(with theEvent: NSEvent) {
        print("reached")
    }
}

