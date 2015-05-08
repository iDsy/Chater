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
    var needMove = false
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
// tableview
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return hsty.count + 1
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        tableView.separatorStyle = UITableViewCellSeparatorStyle.None; //cell无边框
        if indexPath.row == 0 {
            var cell:SystemCell = tableView.dequeueReusableCellWithIdentifier("systemcell") as! SystemCell
            cell.mainLabel.text = "Let's chat!"
            return cell
        }else{
            var cell:MyCell = tableView.dequeueReusableCellWithIdentifier("mycell") as! MyCell
            var n = indexPath.row - 1
            cell.msgLabel.text = hsty[n] as! String
            return cell
        }
    }
    //弹出键盘view变换
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        // textfield和button上移
        var chatTransform:CGAffineTransform = CGAffineTransformMakeTranslation(0, -256);
        self.chatTextField.transform = chatTransform
        self.chatButton.transform = chatTransform
        // table选择性缩小
        if hsty.count >= 1 {
            self.mainTableView.frame.size.height = self.mainTableView.frame.height - 256
            self.mainTableView.scrollToRowAtIndexPath(NSIndexPath(forRow: hsty.count, inSection: 0), atScrollPosition: UITableViewScrollPosition.Top, animated: true)
            needMove = true
        }
        return true
    }
    //收回键盘view变换
    func textFieldShouldEndEditing(textField: UITextField) -> Bool{
        // textfield和button下移
        var chatTransform:CGAffineTransform = CGAffineTransformMakeTranslation(0, 0);
        self.chatTextField.transform = chatTransform
        self.chatButton.transform = chatTransform
        // table复原
        if needMove {
            self.mainTableView.frame.size.height = self.mainTableView.frame.height + 256
            needMove = false
        }
        return true
    }

    @IBAction func send(sender: AnyObject) {
        chatTextField.resignFirstResponder()
        hsty.addObject(chatTextField.text)
        chatTextField.text = ""
        self.mainTableView.reloadData()
        // 滑到最后的位置
        self.mainTableView.scrollToRowAtIndexPath(NSIndexPath(forRow: hsty.count, inSection: 0), atScrollPosition: UITableViewScrollPosition.Top, animated: true)
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
