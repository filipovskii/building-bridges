//
//  WebViewGoogleLoginController.swift
//  WarsawNative
//
//  Created by Andrey Salomatin on 10/08/16.
//  Copyright © 2016 Andrey Salomatin. All rights reserved.
//

import UIKit
class WebViewGoogleLoginController: UIViewController {

  @IBOutlet weak var webView: UIWebView!
  
  override func viewDidLoad() {
    let url = NSBundle.mainBundle()
      .URLForResource("google-login-clone/index", withExtension:"html");
    webView?.scalesPageToFit = true;
    webView.loadRequest(NSURLRequest(URL: url!));
  }
}