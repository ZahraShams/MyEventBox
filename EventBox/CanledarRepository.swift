//
//  CanledarRepository.swift
//  EventBox
//
//  Created by zahra  on 9/28/17.
//  Copyright © 2017 shams. All rights reserved.
//

import Foundation
class CanledarRepository : ICanledarRepository {
    var data : InitialData!
    
     func AllCanledars() -> [Calendar]? {
      
        return InitialData.shared().Calendars
        
    }
    
    func AllCanledarEvents(id: Int)  ->  [Event]? {
    
       return
        (InitialData.shared().Calendars.filter({$0.Id == id}).first?.Events)
    }
    
    func GetCanledar(id: Int) -> Calendar? {
  return
    InitialData.shared().Calendars.filter({$0.Id == id}).first}
    
}
