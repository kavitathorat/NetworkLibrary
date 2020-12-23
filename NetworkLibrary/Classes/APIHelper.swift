//
//  APIHelper.swift
//  MyFawry
//
//  Created by Kavita Thorat on 21/12/20.
//  Copyright © 2020 Ehab Asaad Hanna. All rights reserved.
//

import Foundation
import Alamofire

@objc open class APIHelper : NSObject {
   
    @objc public static func callPostWebservice(parameters : [String:Any]? = nil, headers:[String:String], url : String = "", success : @escaping (_ responseData : [String:Any]) -> Void) { 
//        var httpHeader : HTTPHeaders = [:]
//        for (name,value) in headers {
//            httpHeader.add(name: name, value: value)
//        }
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers : headers).responseData { response in

            if response.response?.statusCode == 401 {

                return
            }
            switch response.result {
            case .success:
                do {
                    if let responseData = response.data {
                        let jsonDictionary = try JSONSerialization.jsonObject(with: responseData, options: [])
                        print(jsonDictionary)
                        DispatchQueue.main.async {
                            success(jsonDictionary as! [String : Any])
                        }
                    }

                    //                    let sysData = try JSONDecoder().decode(T.self, from: response.data!) as T
                    //                    print(sysData)
                    //                    DispatchQueue.main.async {
                    //                        success(sysData)
                    //                    }
                }
                catch {
                    print(error.localizedDescription)
                }
                print("Validation Successful")
            case .failure(let error):
                print(error)
            //                CommonHelper.showAlert(vc: controller, title: "SALAMA", msg: error.localizedDescription)
            }
        }
    }

}
