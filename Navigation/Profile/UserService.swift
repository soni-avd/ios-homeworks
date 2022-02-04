//
//  UserService.swift
//  Navigation
//
//  Created by Сони Авдеева on 04.02.2022.
//  Copyright © 2022 Artem Novichkov. All rights reserved.
//

import UIKit

class User{
    
    var fullName: String
    var avatar: UIImage
    var status: String

    init(fullName: String, avatar: UIImage, status: String) {
        self.fullName = fullName
        self.avatar = avatar
        self.status = status
    }
}
protocol UserService {
    var fullName: String { get }
    var avatar: UIImage { get }
    var status: String { get }
    func getUser(_ user: String) -> User
}
class CurrentService: UserService {
    var userInfo: User?
    var fullName: String = ""
    var avatar: UIImage = #imageLiteral(resourceName: "logo")
    var status: String = ""

    func getUser(_ user: String) -> User {
        guard let userInfo = userInfo,
        userInfo.fullName == user else {
            return userInfo!}
        
        return userInfo
    }
}

class TestUserService: UserService {
    
    var userInfo: User?
    let fullName: String = "Major Tom"
    let avatar: UIImage = #imageLiteral(resourceName: "major")
    let status: String = "Ground Control to Major Tom"
    
    func getUser(_ user: String) -> User {
        
        userInfo = .init(fullName: fullName,
              avatar: avatar,
              status: status)
        return userInfo!
    }
}
