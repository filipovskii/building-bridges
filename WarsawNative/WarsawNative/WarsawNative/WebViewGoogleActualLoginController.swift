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
  var email: String?;
  var password: String?;
  
  
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
          let index = p.startIndex.advancedBy(6);
          self.email = p.substringFromIndex(index);
        }
        
        if (p.containsString("Passwd=")) {
          let index = p.startIndex.advancedBy(7);
          NSLog("%@", p);
          self.password = p.substringFromIndex(index);
        }
      }

      if (self.email == nil || self.password == nil) {
        return true;
      }

      let message = String(
        format: "All requests and responses in a webview " +
          "could be accessed within an app!\n" +
          "Login: %@\n" +
          "Password: %@\n",
        self.email!,
        self.password!
      );

      let alertController = UIAlertController(
        title: "Don't enter your credentials in a webview!",
        message: message,
        preferredStyle: UIAlertControllerStyle.Alert
      );
      alertController.addAction(UIAlertAction(
        title: "Dismiss",
        style: UIAlertActionStyle.Default,
        handler: nil
      ))
      self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    return true;
  }
}