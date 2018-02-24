//
//  Object.swift
//  Pods
//
//  Created by Khoa Pham on 25/03/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation
import Tailor
import Sugar

// The base model class for any objects retrieved through the GitHub API.
public class Object: Mappable, Hashable, Equatable {
  
  // The unique ID for this object. This is only guaranteed to be unique among
  // objects of the same type, from the same server.
  //
  // By default, the JSON representation for this property assumes a numeric
  // representation (which is the case for most API objects). Subclasses may
  // override the `+objectIDJSONTransformer` method to change this behavior.
  public var objectID: String = ""
  
  // The URL of the API endpoint from which the receiver came. This should only be
  // set at the time of initialization, and is responsible for filling in the
  // `server` property.
  public var baseURL: NSURL? {
    get {
      return server.baseURL
    }
    set {
      guard let url = newValue else {
        server = Server.dotComServer
        return
      }
      
      if url.host == "api.github.com" {
        server = Server.dotComServer
        return
      }
      
      let baseURLString = "\(url.scheme)://\(url.host ?? "")"
      server = Server(baseURL: NSURL(string: baseURLString)!)
      
      // FiXME
      // Also set the base URL for any nested objects.
    }
  }
  
  // The server this object is associated with.
  //
  // This object is not encoded into JSON.
  public var server: Server = Server.dotComServer
  
  public required init(_ map: JSONDictionary) {
    objectID <- map.transform("id", transformer: Transformer.numberToString)
  }
  
  // MARK: - Hash
  public var hashValue: Int {
    return server.hashValue ^ objectID.hashValue
  }
}

public func ==(lhs: Object, rhs: Object) -> Bool {
  if lhs === rhs {
    return true
  }
  
  return lhs.hashValue == rhs.hashValue
}
