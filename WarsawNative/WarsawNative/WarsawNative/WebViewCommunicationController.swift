//
//  WebViewCommunicationController.swift
//  WarsawNative
//
//  Created by Andrey Salomatin on 10/08/16.
//  Copyright © 2016 Andrey Salomatin. All rights reserved.
//

import UIKit
import JavaScriptCore

let JS_CONTEXT_KEY = "documentView.webView.mainFrame.javaScriptContext";

class WebViewCommunicationController: UIViewController, UIWebViewDelegate {

  @IBOutlet weak var input: UITextField!
  @IBOutlet weak var sendBtn: UIButton!
  @IBOutlet weak var webViewMessage: UILabel!
  @IBOutlet weak var webView: UIWebView!


  @IBAction func onClickSend(sender: AnyObject) {
    let context = _getJSContext();
    let receive = context!.objectForKeyedSubscript("receiveMsg");
    let inputValue = self.input.text;
    receive.callWithArguments([inputValue!]);
  }

  private func _getJSContext() -> JSContext? {
    return webView.valueForKeyPath(JS_CONTEXT_KEY) as? JSContext;
  }


  override func viewDidLoad() {
    super.viewDidLoad();
    let url = NSBundle.mainBundle()
      .URLForResource("communication", withExtension:"html");
    webView.loadRequest(NSURLRequest(URL: url!));
    webView.delegate = self;
  }


  func webViewDidFinishLoad(webView: UIWebView) {
      let context = _getJSContext();

      let send: @convention(block) String -> Bool = { msg in
        dispatch_async(dispatch_get_main_queue(), {
          self.webViewMessage.text = msg;
        });
        return true;
      }


      context!.setObject(
        unsafeBitCast(send, AnyObject.self),
        forKeyedSubscript:"sendMsg"
      );
  }
}
