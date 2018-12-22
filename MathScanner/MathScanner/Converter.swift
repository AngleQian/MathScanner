//
//  Converter.swift
//  MathScanner
//
//  Created by Angle Qian on 2018/12/21.
//  Copyright © 2018 Angle Qian. All rights reserved.
//

import Foundation
//import Alamofire

class Converter {
    let headers = [
        "content-type": "application/json",
        "app_id": "angleqian01_gmail_com",
        "app_key": "8136893173c71992ce6e"
    ]
    let postData: Data
    let parameters = ["src": "data:image/jpeg;base64,{BASE64-STRING}"] as [String : Any]
    let request: NSMutableURLRequest
    let session = URLSession.shared
    let dataTask: URLSessionDataTask
    
    init(){
        postData = try! JSONSerialization.data(withJSONObject: parameters, options: [])
        
        request = NSMutableURLRequest(url: NSURL(string: "https://api.mathpix.com/v3/latex")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 60.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                Swift.print(error!)
            } else {
                let httpResponse = response as? HTTPURLResponse
                Swift.print(httpResponse!)
            }
        })
        
        dataTask.resume()
    }
    
    func convertImage(imageURL : URL){
        if let data = NSData(contentsOf: imageURL){
            let base64String = data.base64EncodedData(options: .init(rawValue: 0))
//            let parameters : Parameters = [
//                "src": "data:image/jpeg;base64," + base64String
//            ]
            
            
        }
    }
    
    
}
