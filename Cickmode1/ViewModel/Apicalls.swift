//
//  Apicalls.swift
//  Cickmode1
//
//  Created by Apple Esprit on 23/11/2021.
//  Copyright © 2021 macbook. All rights reserved.
//
import Foundation
import Alamofire
import SwiftyJSON
import UIKit.UIImage

extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}
class Apicalls {
    static let shareInstence = Apicalls()
    func adduser(user: userModel, uiImage: UIImage, completed: @escaping (Bool) -> Void ) {
        print("hi")
        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(uiImage.jpegData(compressionQuality: 0.5)!, withName: "image" , fileName: "image.jpeg", mimeType: "image/jpeg")
            
            for (key, value) in
                    [
                        "firstname": user.firstname!,
                        "lastname": user.lastname!,
                        "email": user.email!,
                        "password":user.password!,
                        "phone":user.phone!,
                        "adress":user.adress!,
	                        
                        
                        //"date": publication.date!,
                        //"utilisateur": UserDefaults.standard.string(forKey: "userId")!
                    ]
            {
                multipartFormData.append((value.data(using: .utf8))!, withName: key)
            }
            
        },to: "http://localhost:3000/api/users",
                  method: .post)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseData { response in
                switch response.result {
                case .success:
                    print("Success")
                    completed(true)
                case let .failure(error):
                    completed(false)
                    print(error)
                }
            }
    }
    func login(email: String, password: String,completionHandler:@escaping (Bool)->()){
    let headers: HTTPHeaders = [.contentType("application/json")]
    AF.request("http://localhost:3000/api/login", method: .post, parameters: ["email":email, "password": password],encoder: JSONParameterEncoder.default, headers: headers ).response{ response in debugPrint(response)
        switch response.result{
        case .success(let data):
            do {
                let json  = try JSONSerialization.jsonObject(with: data!, options: [])
                //print(json)
                if response.response?.statusCode == 200{
            
                    let jsonData = JSON(response.data!)
                    print(jsonData)
                    //UserDefaults.standard.set(jsonData["token"].stringValue, forKey: "token")
                    UserDefaults.standard.setValue(jsonData["token"].stringValue  , forKey: "token")

                    //let jsonData = JSON(response.data!)
                    UserDefaults.standard.set(jsonData["_id"].stringValue, forKey: "_id")
                    //UserDefaults.standard.set(jsonData["prenom"].stringValue, forKey: "prenom")
                    //UserDefaults.standard.set(jsonData["email"].stringValue, forKey: "email")

                    print(UserDefaults.standard.string(forKey: "token")!)
                    print(UserDefaults.standard.string(forKey: "_id")!)

                    completionHandler(true)
                }else{
                    completionHandler(false)
                }
                
            } catch  {
                print(error.localizedDescription)
                completionHandler(false)
                
                
            }
        case .failure(let err):
            print(err.localizedDescription)
        }
    }
}
}
