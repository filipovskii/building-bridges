//
//  JSVirtualMachineController.swift
//  WarsawNative
//
//  Created by Andrey Salomatin on 10/08/16.
//  Copyright © 2016 Andrey Salomatin. All rights reserved.
//

import UIKit
import JavaScriptCore

class JSVirtualMachineController: UIViewController {
  var jsContext: JSContext?;
  
  @IBOutlet weak var jsInput: UITextView!
  @IBOutlet weak var outputInput: UITextView!

  
  @IBAction func onRunClick(sender: AnyObject) {
    let input = jsInput.text;
    let output = self.jsContext?.evaluateScript(input);
    outputInput.text = String(format: "%@", output!);
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad();
    self.jsContext = JSContext(virtualMachine: JSVirtualMachine());
  }
}
