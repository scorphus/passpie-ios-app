//
//  URLOpener.swift
//  GithubSwift
//
//  Created by Khoa Pham on 09/04/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

#if os(OSX)
  import Cocoa
#elseif os(iOS)
  import UIKit
#endif

public protocol URLOpenerType {
  func openURL(url: NSURL) -> Bool
}

public class URLOpener: URLOpenerType {
  public func openURL(url: NSURL) -> Bool {
    #if os(OSX)
      return NSWorkspace.sharedWorkspace().openURL(url)
    #elseif os(iOS)
      if UIApplication.sharedApplication().canOpenURL(url) {
        // Without this, it takes long time to open Web Browser
        dispatch_async(dispatch_get_main_queue()) {
          UIApplication.sharedApplication().openURL(url)
        }
        return true
      } else {
        return false
      }
    #endif
  }
  
  public init() {}
}
