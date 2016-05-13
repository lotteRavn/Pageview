//
//  LastPageViewController.swift
//  Child View Controller
//
//  Created by Lotte Ravn on 30/03/16.
//  Copyright © 2016 Lotte Ravn. All rights reserved.
//

import UIKit

protocol LastPageViewControllerDelegate {
    func lastPageDone()
    
}

class LastPageViewController: UIViewController {
    
    var delegate: LastPageViewControllerDelegate?
    
    
    @IBAction func doneButtonTapped(sender: UIButton) {
        
        //send message to viewcontroller
        if delegate != nil {
        delegate?.lastPageDone()
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
