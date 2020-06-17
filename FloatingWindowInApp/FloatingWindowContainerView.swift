//
//  FloatingWindowContainerView.swift
//  FloatingWindowInApp
//
//  Created by Johnny on 2020/6/16.
//  Copyright © 2020 Johnny. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

protocol MarginCalculationProtocol {
    func getMinLeftMargin(containerWidth: CGFloat, floatingWindowWidth: CGFloat) -> CGFloat
    func getMinTopMargin(containerHeight: CGFloat, floatingWindowHeight: CGFloat) -> CGFloat
    func getMaxLeftMargin(containerWidth: CGFloat, floatingWindowWidth: CGFloat) -> CGFloat
    func getMaxTopMargin(containerHeight: CGFloat, floatingWindowHeight: CGFloat) -> CGFloat
}

class FloatingWindowContainerView: UIView {
    
    var floatingWindow: UIView?
    
    var leftMarginConstraint: Constraint?
    var topMarginConstraint: Constraint?
    
    var marginCalculation: MarginCalculationProtocol?
    
    public init() {
        super.init(frame: CGRect.zero)
        self.initialize()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }

    public override func awakeFromNib() {
        super.awakeFromNib()
        self.initialize()
    }
    
    public func initialize() {
        floatingWindow = subviews.first
        guard let floatingWindow = floatingWindow else { return }
        floatingWindow.removeFromSuperview()
        self.addSubview(floatingWindow)
        floatingWindow.snp.makeConstraints{ [weak self] (make) in
            guard let self = self else { return }
            self.leftMarginConstraint = make.leftMargin.equalToSuperview().constraint
            self.topMarginConstraint = make.topMargin.equalToSuperview().constraint
        }
        
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(draggedView(_:)))
        floatingWindow.isUserInteractionEnabled = true
        self.clipsToBounds = true
        floatingWindow.addGestureRecognizer(panGesture!)
    }
    
    private var panGesture: UIPanGestureRecognizer?
    
    @objc func draggedView(_ sender:UIPanGestureRecognizer) {
        guard let floatingWindow = floatingWindow else { return }
        let translation = sender.translation(in: self)
        sender.setTranslation(CGPoint.zero, in: self)
        var newLeftMargin = floatingWindow.frame.origin.x + translation.x
        var newTopMargin = floatingWindow.frame.origin.y + translation.y
        
        let cal = marginCalculation ?? MarginCalculationToEdge()
        let minLeft = cal.getMinLeftMargin(
            containerWidth: self.frame.size.width,
            floatingWindowWidth: floatingWindow.frame.size.width
        )
        let minTop = cal.getMinTopMargin(
            containerHeight: self.frame.size.height,
            floatingWindowHeight: floatingWindow.frame.size.height
        )
        newLeftMargin =
            (newLeftMargin <= minLeft) ? minLeft : newLeftMargin
        newTopMargin =
            (newTopMargin <= minTop) ? minTop : newTopMargin
        let maxLeft = cal.getMaxLeftMargin(
            containerWidth: self.frame.size.width,
            floatingWindowWidth: floatingWindow.frame.size.width
        )
        let maxTop = cal.getMaxTopMargin(
            containerHeight: self.frame.size.height,
            floatingWindowHeight: floatingWindow.frame.size.height
        )
        newLeftMargin =
            (newLeftMargin >= maxLeft) ? maxLeft : newLeftMargin
        newTopMargin =
            (newTopMargin >= maxTop) ? maxTop : newTopMargin
        
        leftMarginConstraint?.update(offset: newLeftMargin)
        topMarginConstraint?.update(offset: newTopMargin)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    private func setupFloatingWindow() {
    }
    
    public func setFloatingWindowMargin(
        leftMargin: CGFloat, topMargin: CGFloat,
        animated: Bool = false, completeCallback: (() -> Void)? = nil) {
        if animated {
            UIView.animate(withDuration: 0.6, animations: {
                self.leftMarginConstraint?.update(offset: leftMargin)
                self.topMarginConstraint?.update(offset: topMargin)
                self.layoutIfNeeded()
            }) { _ in
                completeCallback?()
            }
        } else {
            self.leftMarginConstraint?.update(offset: leftMargin)
            self.topMarginConstraint?.update(offset: topMargin)
        }
    }
}

class MarginCalculationToEdge: MarginCalculationProtocol {
    func getMinLeftMargin(containerWidth: CGFloat, floatingWindowWidth: CGFloat) -> CGFloat {
        return 0
    }
    
    func getMinTopMargin(containerHeight: CGFloat, floatingWindowHeight: CGFloat) -> CGFloat {
        return 0
    }
    
    func getMaxLeftMargin(containerWidth: CGFloat, floatingWindowWidth: CGFloat) -> CGFloat {
        return containerWidth - floatingWindowWidth
    }
    
    func getMaxTopMargin(containerHeight: CGFloat, floatingWindowHeight: CGFloat) -> CGFloat {
        return containerHeight - floatingWindowHeight
    }
}
