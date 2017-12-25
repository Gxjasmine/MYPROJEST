//
//  ACBaseService+request.swift
//  myProject
//
//  Created by fuzhong on 2017/12/14.
//  Copyright © 2017年 fuzhong. All rights reserved.
//

import UIKit
import Alamofire

extension SessionManager  {
    
    open static let `defaultBackground`: SessionManager = {
        let configuration = URLSessionConfiguration.background(withIdentifier: "background")
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 2
//        configuration.timeoutIntervalForResource = 2 多久之后停止下载
        return SessionManager(configuration: configuration)
    }()
    
}
