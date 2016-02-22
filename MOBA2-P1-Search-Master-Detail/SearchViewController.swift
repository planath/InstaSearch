//
//  SearchViewController.swift
//  MOBA2-P1-Search-Master-Detail
//
//  Created by Andreas Plüss on 22.02.16.
//  Copyright © 2016 devkitchen. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var queryText: UITextField!
    @IBOutlet weak var bottomDistanceConstraint: NSLayoutConstraint!
    @IBOutlet weak var topImageConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func fetchQuery() {
//        print("get results from instagramm")
//        print("when found push view")
//        
//    }
    

    @IBAction func goButton(sender: AnyObject) {
        //fetchQuery()
        //fetching done in table view controller
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let vc = segue.destinationViewController as! MasterViewController
        vc.query = queryText.text!
    }

    @IBAction func enteringText(sender: AnyObject) {
        UIView.animateWithDuration(0.5, animations: {
            self.bottomDistanceConstraint.constant = 325
            self.topImageConstraint.constant = -160
            self.view.layoutIfNeeded()
        })
    }
}
