//
//  User.swift
//  Appetizers
//
//  Created by Telles Ivan on 4/11/24.
//

import Foundation

struct User: Codable {
   var firstName = ""
   var lastName = ""
   var emailAddress = ""
   var birthdate = Date()
   var extraNapkins = false
   var frequentRefills = false
}
