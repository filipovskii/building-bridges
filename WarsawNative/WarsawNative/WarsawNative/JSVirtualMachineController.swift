//
//  JSVirtualMachineController.swift
//  WarsawNative
//
//  Created by Andrey Salomatin on 10/08/16.
//  Copyright © 2016 Andrey Salomatin. All rights reserved.
//


// Example to try
// for (var i = 0; i < 1000) {
//    Math.random() / Math.random();
// }
//


import UIKit
import JavaScriptCore

class JSVirtualMachineController: UIViewController {
  var jsContext: JSContext?;
  
  @IBOutlet weak var jsInput: UITextView!
  @IBOutlet weak var outputInput: UITextView!

  
  @IBAction func onRunClick(sender: AnyObject) {
    let input = jsInput.text;
    
//    let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT;
//    dispatch_async(dispatch_get_global_queue(priority, 0)) {
//        let output = self.jsContext?.evaluateScript(input);
//
//      dispatch_async(dispatch_get_main_queue()) {
//        self.outputInput.text = String(format: "%@", output!);
//      }
//    }
//    return;
    
    
    let output = self.jsContext?.evaluateScript(input);
    outputInput.text = String(format: "%@", output!);
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad();
    self.jsContext = JSContext(virtualMachine: JSVirtualMachine());
  }
}
