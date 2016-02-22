//
//  DetailViewController.swift
//  MOBA2-P1-Search-Master-Detail
//
//  Created by Andreas Plüss on 22.02.16.
//  Copyright © 2016 devkitchen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var likes: UILabel!

    var detailItem:InstaPost?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let b = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: "optionsButton")
        self.navigationItem.rightBarButtonItem = b

        if detailItem != nil {
            usernameLabel.text = detailItem!.user
            descriptionLabel.text = detailItem!.desc
            image.image = detailItem!.image
            likes.text = detailItem!.likes
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func optionsButton() {
        let alertController = UIAlertController(title: nil, message: "Weiterführende Links in Safari öffnen", preferredStyle: .ActionSheet)
        let cancelAction = UIAlertAction(title: "Abbrechen", style: .Cancel) { (action) in
            print("ActionSheet cancel")
        }
        let userAction = UIAlertAction(title: "Zum Profil von " + usernameLabel.text! , style: .Default) { (action) in
            let url = NSURL(string: "https://www.instagram.com/" + self.usernameLabel.text! )!
            UIApplication.sharedApplication().openURL(url)
        }
        let postAction = UIAlertAction(title: "Post anzeigen" , style: .Default) { (action) in
            let url = self.detailItem!.link
            UIApplication.sharedApplication().openURL(url)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(postAction)
        alertController.addAction(userAction)
        
        self.presentViewController(alertController, animated: true) { }
    }

}

