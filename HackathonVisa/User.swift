//
//  User.swift
//  HackathonVisa
//
//  Created by Jean Paul Marinho on 15/02/19.
//  Copyright © 2019 aKANJ. All rights reserved.
//

import Foundation

struct User: Codable {
    
    var balance = "00,00"
    var debits = [Debit]()
}
