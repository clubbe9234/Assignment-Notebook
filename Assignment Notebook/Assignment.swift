//
//  Assignment.swift
//  Assignment Notebook
//
//  Created by Caroline Lubbe on 2/19/19.
//  Copyright © 2019 John Hersey High School. All rights reserved.
//

import Foundation

class Assignment: Codable {
    var name: String
    var classFor: String
    var dueDate: String
    init(name: String, classFor: String, dueDate: String) {
        self.name = name
        self.classFor = classFor
        self.dueDate = dueDate
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case classFor
        case dueDate
    }
    
    required init(from decoder: Decoder) throws {
        let decodeContainer = try decoder.container(keyedBy: CodingKeys.self)
        name = try decodeContainer.decode(String.self, forKey: .name)
        classFor = try decodeContainer.decode(String.self, forKey: .classFor)
        dueDate = try decodeContainer.decode(String.self, forKey: .dueDate)
    }
    
    func encode(to encoder: Encoder) throws {
        var encodeContainer = encoder.container(keyedBy: CodingKeys.self)
        try encodeContainer.encode(name, forKey: .name)
        try encodeContainer.encode(classFor, forKey: .classFor)
        try encodeContainer.encode(dueDate, forKey: .dueDate)
    }
}
