//
//  InitialData.swift
//  EventBox
//
//  Created by zahra  on 9/28/17.
//  Copyright © 2017 shams. All rights reserved.
//

import Foundation

class InitialData {
    
    // MARK: - Properties
    
    static let initialData = InitialData()
    var Calendars = [Calendar]()
    
  
    class func shared() -> InitialData {
        return initialData
    }
    
    private init() {
        
        
       
        
        let  holidayCal = Calendar(id: 1, title:"Holidays",events: [])
        let  schoolCal = Calendar(id: 2, title: "Schooldays",events: [])
        let  sportCal = Calendar(id: 3, title: "Sportdays",events: [])
        
        let breakfast = Event(id: 1, title: "breakfast", startTime: "8:00", endTime: "9:00",status: EventStatus.accepted,location: "Iran,Tehtan,Shariaty")
        let shortsleep = Event(id: 2, title: "sleep again", startTime: "9:00", endTime: "10:00",status: EventStatus.pending,location: "Iran,Tehtan,Beheshty")
        let mails = Event(id: 3, title: "check mails", startTime: "10:00", endTime: "10:30",status: EventStatus.accepted,location: "Iran,Tehtan,Jordan")
        let lunch = Event(id: 4, title: "lunch", startTime: "14:00", endTime: "15:00",status: EventStatus.pending,location: "Iran,Tehtan,Mirdamad")
        let tv = Event(id: 5, title: "tv time", startTime: "15:00", endTime: "16:00",status: EventStatus.rejected,location: "Iran,Tehtan,Vanak")
        let dinner = Event(id: 6, title: "dinner", startTime: "18:00", endTime: "19:00",status: EventStatus.pending,location: "Iran,Tehtan,Tajrish")
        let sleep = Event(id: 7, title: "sleep", startTime: "22:00", endTime: "7:00",status: EventStatus.accepted,location: "Iran,Tehtan,YousefAbad")
        
        holidayCal.Events.append(contentsOf: [breakfast,shortsleep,mails,lunch,tv,dinner,sleep])
        
        schoolCal.Events.append(contentsOf: [breakfast,mails,lunch,dinner,sleep])
        
        
        sportCal.Events.append(contentsOf: [breakfast,mails,lunch,dinner,sleep])
        
        
        Calendars.append(holidayCal)
        Calendars.append(schoolCal)
        Calendars.append(sportCal)
        
        

    }
    

    
}
