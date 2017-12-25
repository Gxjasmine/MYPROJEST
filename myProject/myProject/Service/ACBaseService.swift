//
//  ACBaseService.swift
//  myProject
//
//  Created by fuzhong on 2017/12/11.
//  Copyright © 2017年 fuzhong. All rights reserved.
//

import UIKit
import Alamofire

//MARK: 设置请求超时 https://stackoverflow.com/questions/41803856/set-timeout-in-alamofire
class ACBaseService: NSObject {
    private var resumeData: Data?
    var request: Alamofire.Request? = nil

    func requestdata() -> () {
        
       let parameters: Parameters = ["firmwareFamily": "iPhone_7-0001-L", "cameraSerialNumber": "", "appVersion": "1.5.0", "appBuildNumber": "1462", "firmwareVersion": "{  \"camera\" : {    \"platform\" : \"iOS\",    \"build\" : \"No\",    \"model\" : \"0001-L\",    \"product\" : \"ION360U\",    \"name\" : \"ION360U_3551\",    \"version\" : \"3.1.18\"  },  \"case\" : {    \"version\" : \"2.3.18\",    \"product\" : \"ION360U\",    \"model\" : \"0002\",    \"platform\" : \"iOS\"  }}"]
//        let request = NSMutableURLRequest(url: URL(string: "http://ion360cloud-com-updates-test.s3.us-west-2.amazonaws.com/Apollo%280001-L%29-ios_V3.3.1.bin?AWSAccessKeyId=ASIAIXFNARHIGHJKFTVA&Expires=1513043956&Signature=EOPLJfforZym1VEnKiyjbPd%2FIQY%3D&x-amz-security-token=FQoDYXdzEPv%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaDNCJXvqVBkv%2FmQ2RiSL5ARoA6SemSULAJnYV8aHTPjKaOWVxGYTmYJpvNG6%2FxjBaHtXb1bh3dEl0EyMaAS7YgXpYe28Q5O7%2BwpogfnUpx029sxiPQsYTloPv132eG5fKr%2BtF5LU2iqZU%2Bs6OWi8YlbmglbGltRufJZmanvE2z%2F%2Fa0fOzRNA%2FE2dHQJ%2F4SM47UNk3bZ0ItsV54OKvx%2B1mt3OcLmK36EGPUo1Pj8rtzIiYE5UvJjVHZBagPfZ6pFA2WKKqU0ecjT3TXW9ilKmZhyPFLc%2FlYKPdG6ni0xM%2BpmqcmhBJ7Cm6JsqQPfVM0lyQ6%2FLszn2B5Vw8i5bbTXRDxwXPmxcClLYcPSjb57zRBQ%3D%3D")!)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.timeoutInterval = 10 // 10 secs
//        let values = ["key": "value"]
//        request.httpBody = try! JSONSerialization.data(withJSONObject: values, options: [])
        
        Alamofire.request("https://hzfm0ac4di.execute-api.us-west-2.amazonaws.com/test/firmwareVersionCheck", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { (response) in
            print("-----response:\(response)")
        }

    }
    
    func downLoadFw() -> () {
        
        let request = NSMutableURLRequest(url: URL(string: "http://ion360cloud-com-updates-test.s3.us-west-2.amazonaws.com/Apollo%280001-L%29-ios_V3.3.4.bin?AWSAccessKeyId=ASIAI2ZLCCPPQG6GSNEQ&Expires=1513306808&Signature=k9zWdvLex8%2FVXS7Sd9217oLHac4%3D&x-amz-security-token=FQoDYXdzEFQaDEE6PvgzRuAJKmZPaiL5AWFdQAl%2F18tjQ4eNCDr2bMh2XlT9w3f5xUr92aNOTwvcB%2FwkjNgXLj5cYb3dbGH0MyEIBGrNTCiGybdIkF1W2aEnQFKhLvKqD4I0dP%2BT3A4Sh%2FXH9QEbViTbDeZdHPfXWwjCpKk0t2IlF6G9MLlHUQibVicTgkuFc6mxKNBGkq8%2Fgx8gx5RD2xhL4%2FruRaMiqg8SViv%2B6VXD59K7jHQlfmfq8fqoIdyw1ZEEJdJf7N9p%2FbOwXbqLHM%2BP7uLmmnGCmYlAFqswyYO74itCvnWnFQd%2BYv9R8HNiZuYF6mTR%2FgwzojbCj1ULCI6AP%2BnElyjRS4nlEfEb4sSR0Siy7szRBQ%3D%3D")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 60 // 10 secs
        
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentsURL.appendingPathComponent("fwss")
            
            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        //http://120.25.226.186:32812/resources/videos/minion_03.mp4
        
//        let configuration = URLSessionConfiguration.default
//        let configuration = URLSessionConfiguration.background(withIdentifier: "background")
//        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
//        configuration.timeoutIntervalForRequest = 5
//        configuration.timeoutIntervalForResource = 10
//       let sessionManager: SessionManager = SessionManager(configuration: configuration)
//        SessionManager.`defaultBackground`.download("http://120.25.226.186:32812/resources/videos/minion_03.mp4", method: .get, parameters:nil, encoding: URLEncoding.default, headers: nil, to: destination).downloadProgress { (progress) in
//            let val = progress.fractionCompleted
//            print("----download-val:\(val)")
//            }.responseString { (response) in
//                guard response.result.isSuccess else {
//                    var errorMsg = ""
//                    if let error = response.result.error as? AFError {
//                        errorMsg = error.localizedDescription
//                    } else if let error = response.result.error as? URLError {
//                        errorMsg = error.localizedDescription
//                    } else {
//                        errorMsg = (response.result.error?.localizedDescription)!
//                    }
//                    print(errorMsg)
//                    print("----Ndownload-errorMsg:\(errorMsg)")
//
//                    return
//
//                }
//                print("----Ndownload-result:\(String(describing: response.result.value))")
//        }
        
        
          SessionManager.`defaultBackground`.download("http://120.25.226.186:32812/resources/videos/minion_03.mp4", to: destination).downloadProgress { (progressStatus) in
            let val = progressStatus.fractionCompleted
            print("----download-val:\(val)")

            }.responseString { (response) in

                guard response.result.isSuccess else {
                    var errorMsg = ""
                    if let error = response.result.error as? AFError {
                        errorMsg = error.localizedDescription
                    } else if let error = response.result.error as? URLError {
                        errorMsg = error.localizedDescription
                    } else {
                        errorMsg = (response.result.error?.localizedDescription)!
                    }
                    print(errorMsg)
                    print("----Ndownload-errorMsg:\(errorMsg)")
     
                    return

                }
                print("----Ndownload-response:\(response)")

        }
        
    }
}
