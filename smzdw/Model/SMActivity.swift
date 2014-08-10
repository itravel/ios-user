//
//  SMActivity.swift
//  smzdw
//
//  Created by Nic on 14-8-2.
//  Copyright (c) 2014年 smzdw. All rights reserved.
//

import UIKit

class SMActivity: NSObject {
    var id: Int
    var gmt_create: String
    var gmt_modified: String
    var title: String
    var content: String
    var startTime: String
    var endTime: String
    var fromCity: String
    var fromAddress: String
    var destinationCity: String
    var destinationAddress: String
    var destinationLatitude: Double
    var destinationLongitude: Double
    var images: String
    var contact: String
    var recommender: String
    var sponsor: String
    var tags: String
    var participationType: Int
    var scale: Int
    var fee: Int
    var popularity: Int
    var convenience: Int
    var originality: Int
    var web: String
    
    init() {
        super.init()
    }
}
