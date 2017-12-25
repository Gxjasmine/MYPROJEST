

//
//  NetworkOperation.swift
//  fzOperation
//
//  Created by fuzhong on 2017/12/25.
//  Copyright © 2017年 fuzhong. All rights reserved.
//

import UIKit
import Alamofire
class NetworkOperation: CurrentOperation {

    private var request: Alamofire.Request?
    typealias networkOperationCompletionHandler = (_ response: AnyObject?,_ error: NSError?) ->Void
    
    var urlRequest: URLRequestConvertible? = nil
    var requestStr:String? = nil
    
    let completionHandler:networkOperationCompletionHandler
    
    init(urlRequest: URLRequestConvertible,completionHandler:@escaping networkOperationCompletionHandler) {
        
        self.urlRequest = urlRequest
        self.completionHandler = completionHandler
    }

    init(requestStr: String,completionHandler:@escaping networkOperationCompletionHandler) {
        
        self.requestStr = requestStr
        self.completionHandler = completionHandler
    }
    
    override func main() {
        
        /*
         *
         使用
         let operationQueue = OperationQueue()
         
         let operation = NetworkOperation(requestStr: "https://www.baidu.com") { (response, error) in
         print("---------------")
         
         }
         operationQueue.maxConcurrentOperationCount = 2
         operationQueue.addOperation(operation)
         */
        
        //test
        if requestStr?.isEmpty  == true{
            
          Alamofire.request(urlRequest!).responseJSON { (response) in
                
                self.completionHandler(response as AnyObject,response.result.error as NSError?)
                self.completeOperation()
            }
        }
        else
        {
            Alamofire.request(requestStr!).responseJSON { (response) in
                
                self.completionHandler(response as AnyObject,response.result.error as NSError?)
                self.completeOperation()
            }
            
        }
    }
    
    override func cancel() {
        self.request?.cancel()
        super.cancel()
    }
}
