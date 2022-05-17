//
//  tblViewCellViewModel.swift
//  MVVMexample-2
//
//  Created by Ahmet WOW on 17/05/2022.
//
/// Source : https://www.youtube.com/watch?v=qzXJckVxE4w

import UIKit

struct tblViewCellViewModel {
    let name:String
    let username: String
    var currentlyFollowing: Bool
    let image: UIImage?
    
    init(with model:Person) {
        name = model.Name
        username = model.username
        currentlyFollowing = false
        image = UIImage(named: "person")
    }
}
