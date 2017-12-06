//
//  Constant.swift
//  myProject
//
//  Created by fuzhong on 2017/12/6.
//  Copyright © 2017年 fuzhong. All rights reserved.
//

import UIKit
import AssistantKit

class Constant: NSObject {

    struct TEXT_ATTRIBUTE {
        
        static let emptyMessageTextAttributeNormal: [String : AnyObject] = {

            let attribute : [String:AnyObject] = [NSAttributedStringKey.foregroundColor.rawValue : UIColor.white, NSAttributedStringKey.font.rawValue : UIFont(name: "Helvetica", size: 18)!]
            return attribute
        }()
        
        static let navigationBarTextAttribute : [NSAttributedStringKey:AnyObject] = {
            
            let attribute : [NSAttributedStringKey:AnyObject] = [NSAttributedStringKey.foregroundColor : UIColor.white, NSAttributedStringKey.font : (Device.screen == .inches_3_5 || Device.screen == .inches_4_0) ? UIFont(name: "Avenir-Light", size: 14)! : UIFont(name: "Avenir-Light", size: 18)!]
            return attribute
            
        }()
    }
}
