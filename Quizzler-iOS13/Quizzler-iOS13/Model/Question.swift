//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Ayeon on 2022/07/05.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question{
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
