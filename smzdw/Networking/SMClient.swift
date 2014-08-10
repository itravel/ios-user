//
//  SMClient.swift
//  smzdw
//
//  Created by Nic on 14-8-3.
//  Copyright (c) 2014年 smzdw. All rights reserved.
//


class SMClient: AFHTTPSessionManager {
    class var clientAPIBaseURLString: String {
        return "http://115.28.129.120/services"
    }
        
    class var sharedInstance: SMClient {
        struct Static {
            static let instance: SMClient = SMClient()
        }
        return Static.instance
    }
    
}
