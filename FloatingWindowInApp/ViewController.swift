//
//  ViewController.swift
//  FloatingWindowInApp
//
//  Created by Johnny on 2020/6/16.
//  Copyright © 2020 Johnny. All rights reserved.
//

import UIKit

class ViewController: BaseVC {

    @IBOutlet weak var floatingWindowContainer: FloatingWindowContainerView!
    @IBOutlet weak var floatingWindow: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Floating Window Demo"
        floatingWindowContainer.marginCalculation = MyMarginCalculation()
        
    }
    @IBAction func myButtonClick(_ sender: Any) {
        floatingWindowContainer.setFloatingWindowMargin(
            leftMargin: floatingWindowContainer.frame.size.width - 40,
            topMargin: floatingWindowContainer.frame.size.height - floatingWindow.frame.size.height - 60,
            animated: true) {
            print("Complete!")
        }
    }
}

class MyMarginCalculation: MarginCalculationProtocol {
    func getMinLeftMargin(containerWidth: CGFloat, floatingWindowWidth: CGFloat) -> CGFloat {
        return -floatingWindowWidth + 40
    }
    
    func getMinTopMargin(containerHeight: CGFloat, floatingWindowHeight: CGFloat) -> CGFloat {
        return -floatingWindowHeight + 40
    }
    
    func getMaxLeftMargin(containerWidth: CGFloat, floatingWindowWidth: CGFloat) -> CGFloat {
        return containerWidth - 40
    }
    
    func getMaxTopMargin(containerHeight: CGFloat, floatingWindowHeight: CGFloat) -> CGFloat {
        return containerHeight - 40
    }
}
