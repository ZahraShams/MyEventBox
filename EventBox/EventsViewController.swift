//
//  ViewController.swift
//  EventBox
//
//  Created by zahra  on 9/28/17.
//  Copyright © 2017 shams. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    
    var calendarRepository:ICanledarRepository?
    
    var selectedCalendar : Calendar!
    var events : [Event]!

    var expandedRows = Set<Int>()
    var refreshControl: UIRefreshControl!

  
    @IBOutlet weak var EventsTableView: UITableView!
    
    @IBAction func ChoosesCalendarAction(_ sender: Any) {
    }
    func refresh(sender:AnyObject) {
        
        events.append(Event(id: 7 - (self.events.count), title: "Temp Event" + String(self.events.count + 1) , startTime: "18:00", endTime: "19:00",status: EventStatus.pending,location: "Iran,Tehtan,Tajrish"))
        events.sort { $0.Id <  $1.Id}

        self.EventsTableView.reloadData()
        self.refreshControl.endRefreshing()
        
    }
    func preparePullToRefresh(){
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string:"loading...")
        refreshControl.addTarget(self, action: #selector(refresh), for: UIControlEvents.valueChanged)
        if #available(iOS 10.0, *) {
            EventsTableView.refreshControl = refreshControl
        } else {
            // Fallback on earlier versions
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        preparePullToRefresh()

        self.EventsTableView.rowHeight = UITableViewAutomaticDimension

        if  selectedCalendar == nil {
            EventsTableView.isHidden = true
        }
            else{
            EventsTableView.isHidden = false

            events = selectedCalendar.Events
            events.sort { $0.Id <  $1.Id}

            self.EventsTableView.reloadData()
            return
        }
      
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? EventTableViewCell
            else { return }
        
        switch cell.isExpanded
            
        {
            
        case true:
            
            self.expandedRows.remove(indexPath.row)
            
        case false:
            
            self.expandedRows.insert(indexPath.row)
            
        }
        
        
        
        cell.isExpanded = !cell.isExpanded
        cell.accessoryImage.image = UIImage(named:"minus")

        
        
        self.EventsTableView.beginUpdates()
        
        self.EventsTableView.endUpdates()
        
        
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? EventTableViewCell
            else { return }
        
        self.expandedRows.remove(indexPath.row)
        
        
        cell.isExpanded = false
        cell.accessoryImage.image = UIImage(named:"plus")

        self.EventsTableView.beginUpdates()
        
        self.EventsTableView.endUpdates()
        
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(events != nil){
            return events.count
        }
        else {
        return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventcell", for: indexPath) as! EventTableViewCell
        
        let cur_event = events[indexPath.row]
        cell.Title.text = cur_event.Title
        cell.StartTime.text = cur_event.StartTime
        cell.EndTime.text = cur_event.EndTime
        cell.Location.text = "📍" + cur_event.Location
        cell.status.backgroundColor = UIColor.red
        cell.isExpanded = self.expandedRows.contains(indexPath.row)

        cell.Detail.text = "Here Come The Detail for example the attendees or the meeting or event subjects and actions and etc.\n "
        switch cur_event.Status {
        case .accepted:
            cell.status.backgroundColor = UIColor.green
        case .rejected:
            cell.status.backgroundColor = UIColor.red
        case .pending:
            cell.status.backgroundColor = UIColor.gray

        default:
            cell.status.backgroundColor = UIColor.white
        }
        cell.accessoryImage.image = UIImage(named:"plus")

        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

