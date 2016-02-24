//
//  MasterViewController.swift
//  MOBA2-P1-Search-Master-Detail
//
//  Created by Andreas Plüss on 22.02.16.
//  Copyright © 2016 devkitchen. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var query:String = ""
    var detailViewController: DetailViewController? = nil
    var objects = [InstaPost]()
    var loading = true


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.title = "loading..."
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        tableView.rowHeight = 180
        
        GetJson.eachInstaPostFrom(Api.urlWithTag(query)) { (result) -> () in
            if result != nil {
                self.objects.append(result!)
                
                //reload data in main thread
                dispatch_async(dispatch_get_main_queue()){
                    self.tableView.reloadData()
                }
            } else {
                //reload data in main thread
                dispatch_async(dispatch_get_main_queue()){
                    self.title = self.query
                    self.loading = false
                    self.tableView.reloadData()
                }
            }
        }
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Segues

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = objects[indexPath.row]
                let controller = segue.destinationViewController as! DetailViewController
                controller.detailItem = object
            }
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if loading == true {
            return 2
        } else {
            return 1
        }
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //for data
        if section == 0 {
            return objects.count
        }
        //for loading indicator
        else {
            if loading == true {
                return 1
            } else {
                return 0
            }
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //for data
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("instaCell", forIndexPath: indexPath) as! InstaTableViewCell
            let object = objects[indexPath.row]
            cell.instaDescription.text = object.desc
            cell.instaUserName.text = object.user
            cell.instaImage.image = object.image
            return cell
            
        }
        //for loading indicator
        else {
            let cell = tableView.dequeueReusableCellWithIdentifier("waitingCell", forIndexPath: indexPath)
            return cell
        }
    }

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
}

