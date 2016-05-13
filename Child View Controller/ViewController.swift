//
//  ViewController.swift
//  Child View Controller
//
//  Created by Lotte Ravn on 29/03/16.
//  Copyright © 2016 Lotte Ravn. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource,
UIPageViewControllerDelegate, LastPageViewControllerDelegate {
    
    var pageVC: UIPageViewController!
    let pages = ["PageOneVC","PageTwoVC","PageThreeVC"]
    
    
    
    func lastPageDone() {
        print("last page done")
    }
    
    
    func pageViewController(pageViewController: UIPageViewController,
                            viewControllerBeforeViewController
        viewController: UIViewController) -> UIViewController? {
        
        if let index = pages.indexOf(viewController.restorationIdentifier!){
            if index > 0{
            return viewControllerATIndex(index - 1)
                
            }
        }
        return nil
    }
    
    func pageViewController(pageViewController: UIPageViewController,
                            viewControllerAfterViewController
        viewController: UIViewController) -> UIViewController? {
        
        if let index = pages.indexOf(viewController.restorationIdentifier!){
            if index < pages.count - 1 {
            return viewControllerATIndex(index + 1)
            }
        }
        return nil
    }
    
    //helper metode
    
    func viewControllerATIndex(index: Int)-> UIViewController? {
        
        let vc = storyboard?.instantiateViewControllerWithIdentifier(pages[index])
        
        if pages[index] == "PageThreeVC"{
        (vc as! LastPageViewController).delegate = self
        }
        return vc
    
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let vc = storyboard?.instantiateViewControllerWithIdentifier("MyPageVC"){
            
            self.addChildViewController(vc)
            self.view.addSubview(vc.view)
            
            pageVC = vc as! UIPageViewController
            pageVC.dataSource = self
            pageVC.delegate = self
            
            pageVC.setViewControllers([viewControllerATIndex(0)!], direction: .Forward, animated: true, completion: nil)
            pageVC.didMoveToParentViewController(self)
            
            
        
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

