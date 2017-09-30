//
//  Event.swift
//  EventBox
//
//  Created by zahra  on 9/28/17.
//  Copyright © 2017 shams. All rights reserved.
//

import Foundation
class Event : BussinessEntity {
    
    internal var Title: String
    internal var StartTime: String
    internal var EndTime: String
    internal var Description: String?
    internal var Location: String
    internal var Status : EventStatus
    
    init(id: Int,title:String,startTime:String,endTime:String,status:EventStatus,location:String) {
        self.Title = title
        self.StartTime = startTime
        self.EndTime = endTime
        self.Status = status
        self.Location = location
        super.init(id: id)
        
    }
    
    
    
}
enum EventStatus {
    case pending
    case accepted
    case rejected

}
