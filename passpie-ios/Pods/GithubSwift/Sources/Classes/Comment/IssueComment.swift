//
//  IssueComment.swift
//  GithubSwift
//
//  Created by Khoa Pham on 20/04/16.
//  Copyright © 2016 Fantageek. All rights reserved.
//

import Foundation
import Tailor
import Sugar

// A single comment on an issue.
public class IssueComment: Comment {

  // The webpage URL for this comment.
  public private(set) var HTMLURL: NSURL?

  public required init(_ map: JSONDictionary) {
    super.init(map)

    self.HTMLURL <- map.transform("html_url", transformer: NSURL.init(string: ))
  }
}
