//
//  DataItem.swift
//  iOSClub_Project
//
//  Created by Yacolate on 2026/3/11.
//

import SwiftData
import Foundation

@Model
class DataItem {
    var name: String
    var createTime: Date
    init(name: String, createTime: Date) {
        self.name = name
        self.createTime = createTime
    }
}
