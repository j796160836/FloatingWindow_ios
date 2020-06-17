//
//  BaseVC.swift
//  FloatingWindowInApp
//
//  Created by Johnny on 2020/6/16.
//  Copyright © 2020 Johnny. All rights reserved.
//

import Foundation
import UIKit

open class BaseVC: UIViewController {
    var data: AnyObject?
    var queryParams: [String: Any] = [:]
    
    override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: Bundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required public init() {
        let nibNameOrNil = String(describing: type(of: self))
        super.init(nibName: nibNameOrNil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
}
