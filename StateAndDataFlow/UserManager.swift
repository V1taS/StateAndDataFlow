//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 27.07.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import Combine

final class UserManager: ObservableObject {
    @Published var isRegister = false
    @Published var correctName = false
    @Published var name = "" {
        didSet {
            if name.count >= 3 {
                correctName = true
            }
        }
    }
    
    init(){}
    
    init(name: String) {
        self.name = name
    }
}
