//
//  RestaurantTableViewController.swift
//  RestaurantsHongKong
//
//  Created by xszhao on 2016-03-21.
//  Copyright © 2016 xszhao. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    var restaurantNames = ["Cafe Deadend", "Homei", "Taskha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Trail", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Domostia", "Royal Oak", "Thai Cafe"]
    
    var restaurantImages = [ "cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "heighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traitf.jpg", "grahamevenumeals.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafine.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrain / Causal Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    var restaurantIsVisited = [false, false, false, false, false, false, false, false, false, false, false, false, false, false, false,false, false, false, false, false, false, false]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    /* 
    override func tableView(tableView: UITableView, cellForRowAtIndexPath

    */
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! CustomTableViewCell
        
        //if (cell == nil) {
        //    cell = TableViewCellTest(style: .Default, reuseIdentifier: "Cell")
        //}
        
        cell.imagesView?.image = UIImage(named: restaurantImages[indexPath.row])
        cell.imagesView.layer.cornerRadius = 30.0
        cell.imagesView.clipsToBounds = true
        
        if (restaurantIsVisited[indexPath.row]) {
            cell.accessoryType = .Checkmark
        }
        else {
            cell.accessoryType = .None
        }
        
        //cell.locationLabel?.text = restaurantNames[indexPath.row]
        
        cell.nameLabel?.text = restaurantNames[indexPath.row]
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let optionMenu = UIAlertController(title: "Title", message: "Testing?", preferredStyle:.ActionSheet)
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        
        let isVisitedAction = UIAlertAction(title: "r gun space", style: .Default, handler: {
            (action: UIAlertAction) -> Void in
            
            let cell = tableView.cellForRowAtIndexPath(indexPath)
            cell?.accessoryType = .Checkmark
            
            self.restaurantIsVisited[indexPath.row] = true
            
        })
        
        let callActionHandler = { (action: UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Alert message", message: "Alert messages", preferredStyle: .Alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            self.presentViewController(alertMessage, animated: true, completion: nil)
        }
        
        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: .Default, handler: callActionHandler)
        
        //create a new action with the "click" handler inside the handler
        
        let ppAction = UIAlertAction(title: "Alert " + "123-000-\(indexPath.row)", style: .Default, handler: { (action: UIAlertAction!) -> Void in
            print(action.title)
        })
        
        optionMenu.addAction(cancelAction)
        optionMenu.addAction(callAction)
        optionMenu.addAction(isVisitedAction)
        optionMenu.addAction(ppAction)
        
        self.presentViewController(optionMenu, animated: true, completion: nil)
    }
    
}
