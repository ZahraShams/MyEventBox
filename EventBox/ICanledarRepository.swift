//
//  ICanledarRepository.swift
//  EventBox
//
//  Created by zahra  on 9/28/17.
//  Copyright © 2017 shams. All rights reserved.
//

import Foundation
protocol ICanledarRepository:IRepository {
    
     func GetCanledar(id:Int) -> Calendar?
     func AllCanledars()  -> [Calendar]?
     func AllCanledarEvents  (id:Int) -> [Event]?


}
