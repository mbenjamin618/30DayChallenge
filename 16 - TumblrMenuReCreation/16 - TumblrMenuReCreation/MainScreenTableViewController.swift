//
//  MainScreenTableViewController.swift
//  16 - TumblrMenuReCreation
//
//  Created by Matthew Benjamin on 6/5/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import UIKit

class MainScreenTableViewController: UITableViewController {
    
    var allImages = ["dance", "iron", "la_boca", "street_art_1", "street_art_2"]
    let transitionManager = TransitionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 250
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.allImages.count

    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "imageCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TableViewCell
        
        cell.imageViewOutlet.image = UIImage(named: allImages[indexPath.row])
        
        return cell
    }


    @IBAction func unwindToMain(segue: UIStoryboardSegue) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // this gets a reference to the screen that we're about to transition to
        let toViewController = segue.destinationViewController as UIViewController
        
        // instead of using the default transition animation, we'll ask
        // the segue to use our custom TransitionManager object to manage the transition animation
        toViewController.transitioningDelegate = self.transitionManager
        
    }

    
}
