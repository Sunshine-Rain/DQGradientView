//
//  DQGradientView.swift
//  DQGradientView
//
//  Created by quan on 2021/5/10.
//

import UIKit
import CoreGraphics

@IBDesignable
open class DQGradientView: UIView {
    
    open var gradientLayer: CAGradientLayer = CAGradientLayer()
    
    open var type: CAGradientLayerType = .axial {
        didSet {
            gradientLayer.type = type
            layoutGradientLayer()
        }
    }
    
    @IBInspectable open var typeRawValue: String = CAGradientLayerType.axial.rawValue {
        didSet {
            type = CAGradientLayerType(rawValue: typeRawValue)
        }
    }
    
    @IBInspectable open var startPoint: CGPoint = CGPoint(x: 0.5, y: 0.5) {
        didSet {
            gradientLayer.startPoint = startPoint
            layoutGradientLayer()
        }
    }
    
    @IBInspectable open var endPoint: CGPoint = CGPoint(x: 1.0, y: 0.5) {
        didSet {
            gradientLayer.endPoint = endPoint
            layoutGradientLayer()
        }
    }
    
    @IBInspectable open var startColor: UIColor = UIColor.red {
        didSet {
            if colors.count > 0 { colors[0] = startColor.cgColor }
            else { colors.append(startColor.cgColor) }
        }
    }
    
    @IBInspectable open var endColor: UIColor = UIColor.green {
        didSet {
            if colors.count == 0 {
                colors.append(endColor.cgColor)
                colors.append(endColor.cgColor)
            }
            else if colors.count == 1 {
                colors.append(endColor.cgColor)
            }
            else {
                colors[colors.count-1] = endColor.cgColor
            }
        }
    }
    
    open var locations: [NSNumber]? {
        didSet {
            gradientLayer.locations = locations
            layoutGradientLayer()
        }
    }
    
    open var colors: [CGColor] = [] {
        didSet {
            layoutGradientLayer()
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        setupLayer()
        
    }
    
    init(_ frame: CGRect, type: CAGradientLayerType, colors: [CGColor], locations: [NSNumber]? = nil) {
        self.type = type
        self.locations = locations
        self.colors = colors
        
        super.init(frame: frame)
        setupLayer()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayer()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        setupLayer()
    }
    
    private func setupLayer() {
        gradientLayer.bounds = self.bounds
        gradientLayer.type = type
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.colors = colors
        gradientLayer.anchorPoint = CGPoint(x: 0, y: 0)
        if gradientLayer.superlayer == nil {
            layer.addSublayer(gradientLayer)
        }
    }
    
    private func layoutGradientLayer() {
        gradientLayer.setNeedsLayout()
    }
    
}
