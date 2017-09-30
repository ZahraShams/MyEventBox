//
//  CalendarsViewController.swift
//  EventBox
//
//  Created by zahra  on 9/28/17.
//  Copyright © 2017 shams. All rights reserved.
//

import UIKit

class CalendarsViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    var calendarRepository:ICanledarRepository?

    var calendars : [Calendar]!
    var selectedCalendar : Calendar!

    @IBOutlet weak var CalendarsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarRepository = CanledarRepository()
        calendars = calendarRepository?.AllCanledars()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calendars.count 
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "calendarcell", for: indexPath)
        
        let cur_cal = calendars[indexPath.row]
        cell.textLabel?.text = cur_cal.Title
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "calenderschosen" {
            if let indexPath = self.CalendarsTableView.indexPathForSelectedRow{
                let selectedRow = indexPath.row
                let viewController = segue.destination as! EventsViewController
                viewController.selectedCalendar = calendars[selectedRow]
            }
          
        
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
