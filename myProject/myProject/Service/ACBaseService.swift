//
//  ACBaseService.swift
//  myProject
//
//  Created by fuzhong on 2017/12/11.
//  Copyright © 2017年 fuzhong. All rights reserved.
//

import UIKit
import Alamofire

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
        
        let request = NSMutableURLRequest(url: URL(string: "http://ion360cloud-com-updates-test.s3-us-west-2.amazonaws.com/Apollo%280002%29-mcu_v2.3.26.bin?AWSAccessKeyId=ASIAIHQTKUFW62P5JZGQ&Expires=1511320498&Signature=XSTgtTIn4oTlLlX7BB3W6l0amF8%3D&x-amz-security-token=FQoDYXdzEPz%2F%2F%2F%2F%2F%2F%2F%2F%2F%2FwEaDMxhelsryWxRadiaMiL5AaJwJtsSzZUEgfPAHbYGxSs9kHot5Zr%2B6aN8M2Qqmav5HZGscEckR%2Bmpg5u31As1FWOz4Smy4WOf7ESM7mv0hMftxzxSw6EiIlv2FArHJPZz%2FTNhprc05NAU1T7gLrZHqKkKTh9P8XCwkw8JXDIRMOkgG1JC7sMyMir1ubL5snCbW8pQvO6pTrLVG%2FWBqsjmY73u2m3cWU3w4qsCMPGAb%2BJ8wPMs1TLpMaTQCgxbpVqoP9szGDjck9Xcuc7krb2r%2FydAsiQtfMSUfLSJF2Vn8ns8CGz7VKTaNfduTW7uFCTuSWxLhyH8nGRe%2BAEw%2BglAwEJx3UjAtaeqhSj1xdPQBQ%3D%3D")!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.timeoutInterval = 60 // 10 secs
        
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let fileURL = documentsURL.appendingPathComponent("fw")
            
            return (fileURL, [.removePreviousFile, .createIntermediateDirectories])
        }
        //http://120.25.226.186:32812/resources/videos/minion_03.mp4
      Alamofire.download("http://120.25.226.186:32812/resources/videos/minion_03.mp4", to: destination).downloadProgress { (progressStatus) in
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

        }
        
    }
}
