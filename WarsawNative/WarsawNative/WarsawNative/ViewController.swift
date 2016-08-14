//
//  ViewController.swift
//  WarsawNative
//
//  Created by Andrey Salomatin on 10/08/16.
//  Copyright © 2016 Andrey Salomatin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBAction func goToSlides(sender: AnyObject) {
  UIApplication.sharedApplication()
    .openURL(
      NSURL(string: "https://filipovskii.github.io/building-bridges/#1")!
    );

  }

  @IBAction func goToSource(sender: AnyObject) {
    UIApplication.sharedApplication()
    .openURL(
      NSURL(string: "https://github.com/filipovskii/building-bridges/tree/gh-pages/WarsawNative/WarsawNative/WarsawNative")!
    );

  }

}

