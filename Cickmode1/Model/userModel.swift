//
//  userModel.swift
//  Cickmode1
//
//  Created by Apple Esprit on 23/11/2021.
//  Copyright © 2021 macbook. All rights reserved.
//

import Foundation
struct userModel{
    internal init(image:String?=nil,
                _id: String?=nil,
                firstname:String?=nil,
                lastname:String?=nil,
                email: String?=nil,
                password: String?=nil,
                phone: String?=nil,
                adress: String?=nil,
                  role: String?=nil
    ){
        self.image = image
        self._id = _id
        self.firstname = firstname
        self.lastname = lastname
        self.email = email
        self.password = password
        self.phone = phone
        self.adress = adress
        self.role = role
        
    }
    let image : String?
    let _id :String?
    let firstname:String?
    let lastname:String?
    let email:String?
    let password:String?
    let phone:String?
    let adress:String?
    let role:String?
    
}
