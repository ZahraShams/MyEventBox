//
//  Calendar.swift
//  EventBox
//
//  Created by zahra  on 9/28/17.
//  Copyright © 2017 shams. All rights reserved.
//

import Foundation
class Calendar : BussinessEntity {
    
    internal var Title: String
    internal var Events:[Event]

    
    init(id: Int,title:String,events:[Event]) {
        self.Title = title
        self.Events = events
        super.init(id: id)

    }
    
   
    
}
