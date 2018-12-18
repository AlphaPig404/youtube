//
//  File.swift
//  youtube
//
//  Created by 付伦 on 2018/12/17.
//  Copyright © 2018 loopslive. All rights reserved.
//

import UIKit

class Video: NSObject {
    var thumbnailImageName: String?
    var title: String?
    var numberOfViews: NSNumber?
    var uploadDate: NSDate?
    
    var channel: Channel?
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
}
