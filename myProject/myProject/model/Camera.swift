

//
//  Camera.swift
//  myProject
//
//  Created by fuzhong on 2017/12/11.
//  Copyright © 2017年 fuzhong. All rights reserved.
//

import UIKit
import RealmSwift
//http://www.jianshu.com/p/06782df0b901 ream 使用

class Camera: Object {
    
    func setDefaultRealmForUser(username: String) {
        var config = Realm.Configuration()
        
        // 使用默认的目录，但是使用用户名来替换默认的文件名
        config.fileURL = config.fileURL!.deletingLastPathComponent()
            .appendingPathComponent("\(username).realm")
        
        // 将这个配置应用到默认的 Realm 数据库当中
        Realm.Configuration.defaultConfiguration = config
    }
}
