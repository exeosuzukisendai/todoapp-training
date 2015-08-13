//
//  TodoTableViewController.swift
//  TodoApp
//
//  Created by エクシオ ジャパン on 2015/08/09.
//  Copyright (c) 2015年 exeojapan. All rights reserved.
//

import UIKit

class TodoTableViewController: UIViewController, UITableViewDataSource {

    var tableView: UITableView?
    var todo = TodoDataManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let header = UIImageView(frame: CGRect(x: 0, y: 0, width: 320, height: 64))
        header.image = UIImage(named: "header")
        
        let title = UILabel(frame: CGRect(x: 10, y:20, width: 310, height: 44))
        title.text = "TODOリスト"
        header.addSubview(title)
        
        let screenWidth = UIScreen.mainScreen().bounds.size.height
        self.tableView = UITableView(frame: CGRect(x: 0, y: 60, width: 320, height: screenWidth - 60))
        self.tableView!.dataSource = self

        self.view.addSubview(self.tableView!)
        self.view.addSubview(header)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: nil)
        cell.textLabel?.text = "todo"
        return cell
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TodoTableViewController : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todo.size
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        let cell = UITableViewCell(style: .Default, reuseIdentifier: nil)
        cell.textLabel?.text = self.todo[row].title
        
        return cell
    }
}