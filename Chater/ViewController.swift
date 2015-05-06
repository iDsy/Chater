//
//  ViewController.swift
//  Chater
//
//  Created by 董思言 on 15/5/6.
//  Copyright (c) 2015年 董思言. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var temp = ["Andy", "Bob", "Chris"]
    @IBOutlet var mainTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return temp.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("listcell") as! UITableViewCell
        cell.textLabel?.text = temp[indexPath.row]
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "chat" {
            var chatController:ChatController = segue.destinationViewController as! ChatController
            var index = mainTableView.indexPathForSelectedRow()!.row
            chatController.navigationItem.title = temp[index]
        }
            
    }
}

