//
//  Enum.swift
//  myProject
//
//  Created by fuzhong on 2017/12/6.
//  Copyright © 2017年 fuzhong. All rights reserved.
//

import UIKit

class Enum: NSObject {
    
    enum ContentType : Int {
        case image = 0
        case video = 1
    }
    
    enum AppVersionStatus: String {
        case Latest = "LATEST"
        case NeedUpdate = "UPDATE"
        case Unsupported = "UNSUPPORTED"
        case Unknown = "UNKNOWN"
    }
    
    struct STORYBOARDS {
        static let MAIN_STORYBOARD            =   UIStoryboard(name: "Main", bundle: nil)
        static let SETTING_STORYBOARD         =   UIStoryboard(name: "Settings", bundle: nil)

    }
}
