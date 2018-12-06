//
//  AbstractionViewController.swift
//  AbstractionApp
//
//  Created by Jarman, Caroline on 12/6/18.
//  Copyright © 2018 ctec. All rights reserved.
//

import UIKit

public class AbstractionViewController: UIPageViewController, UIPageViewControllerDataSource
{
    
    //MARK: - DATA MEMBERS
    
    private lazy var orderedAbstractionViews : [UIViewController] =
    {
        return [
           self.newAbstractionViewController(abstractionLevel: "Swift"),
           self.newAbstractionViewController(abstractionLevel: "Block"),
           self.newAbstractionViewController(abstractionLevel: "ByteCode"),
           self.newAbstractionViewController(abstractionLevel: "Binary" ),
           self.newAbstractionViewController(abstractionLevel: "LogicalGate")
        ]
    }()

    
    //MARK: -HELPER METHOD (TO RETRIEVE THE CORRECT VIEWCONTROLLER BASED ON THE DATA MEMBER
    
    private func newAbstractionViewController (abstractionLevel : String ) -> UIViewController
    {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(abstractionLevel)ViewController")
    }
    
    //MARK: - LIFECYCLE METHODS

    public override func viewDidLoad()
    {
        super.viewDidLoad()
        dataSource = self
        
        if let firstViewController = orderedAbstractionViews.first
        {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
            
        }

        // Do any additional setup after loading the view.
    }
    
    
    //MARK: - DATASOURCE REQUIRED METHODS
    //Swipe left:
    public func pageViewController(_ pageViewController: UIPageViewController,
                                   viewControllerBefore: UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex = orderedAbstractionViews.index(of: viewController)
            else
        {
            return nil
        }
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0
            else
        {
            return orderedAbstractionViews.last
        }
        
        guard orderedAbstractionViews.count > previousIndex
            else
        {
            return nil
        }
        
        return orderedAbstractionViews[previousIndex]
    }
    
    //swipe right
    public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter: UIViewController) -> UIViewController?
    {
        guard let viewControllerIndex =  orderedAbstractionViews.index(of: viewController)
            else
        {
            return nil
        }
        let nextIndex = viewControllerIndex + 1
        
        guard nextIndex >= 0
            else
        {
            return nil
        }
        
        guard nextIndex < orderedAbstractionViews.count
            else
        {
            return orderedAbstractionViews.first
        }
        
        return orderedAbstractionViews[nextIndex]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
