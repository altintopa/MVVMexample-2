//
//  Models.swift
//  MVVMexample-2
//
//  Created by Ahmet WOW on 16/05/2022.
//
/// Source : https://www.youtube.com/watch?v=qzXJckVxE4w

import Foundation

struct Person {
    let Name : String
    let birthDate : Date?
    let middleName : String?
    let gender : Gender
    let address : String?
    var username : String
    
    init(name: String,
         birthDate: Date? = nil,
         middleName: String? = nil,
         address:String? = nil,
         gender:Gender = .unspecified,
         username:String
    ){
        self.Name = name
        self.birthDate = birthDate
        self.middleName = middleName
        self.address = address
        self.gender = gender
        self.username = username
    }
}

enum Gender {
    case male , female , unspecified
}
