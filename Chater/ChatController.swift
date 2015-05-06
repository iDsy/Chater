//
//  ChatController.swift
//  Chater
//
//  Created by 董思言 on 15/5/6.
//  Copyright (c) 2015年 董思言. All rights reserved.
//

import UIKit

class ChatController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    var hsty:NSMutableArray = NSMutableArray()
    
    @IBOutlet var mainTableView: UITableView!
    @IBOutlet var chatTextField: UITextField!
    @IBOutlet var chatButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableView.delegate = self
        mainTableView.dataSource = self
        chatTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return hsty.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("mycell") as! UITableViewCell
        cell.textLabel?.text = hsty[indexPath.row] as! String
        return cell
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        var aTransform:CGAffineTransform = CGAffineTransformMakeTranslation(0, -256);
        self.mainTableView.transform = aTransform
        self.chatTextField.transform = aTransform
        self.chatButton.transform = aTransform
        return true
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool{
        var aTransform:CGAffineTransform = CGAffineTransformMakeTranslation(0, 0);
        self.mainTableView.transform = aTransform
        self.chatTextField.transform = aTransform
        self.chatButton.transform = aTransform
        return true
    }

    @IBAction func send(sender: AnyObject) {
        chatTextField.resignFirstResponder()
        hsty.addObject(chatTextField.text)
        chatTextField.text = ""
        self.mainTableView.reloadData()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
