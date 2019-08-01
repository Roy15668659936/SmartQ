//
//  ConfirmHeaderView.swift
//  Confirmation
//
//  Created by Roy on 2019/5/19.
//  Copyright © 2019 Roy. All rights reserved.
//

import UIKit

class TicketConfirmView: UIView {
    
    override func draw(_ rect: CGRect) {
        
        super.draw(rect)
        
        let bezierPath = UIBezierPath()
        
        let drawingRect = self.bounds.insetBy(dx: self.bounds.size.width * 0, dy: self.bounds.size.height * 0)
        let topLeft1 = CGPoint(x:drawingRect.minX, y: drawingRect.minY + 30)
        let topLeft2 = CGPoint(x:drawingRect.minX + 30, y: drawingRect.minY)
        let topLeftCenter = CGPoint(x:drawingRect.minX, y: drawingRect.minY)
        let topRight1 = CGPoint(x:drawingRect.maxX - 30, y:drawingRect.minY)
        let topRight2 = CGPoint(x:drawingRect.maxX, y:drawingRect.minY + 30)
        let topRightCenter = CGPoint(x:drawingRect.maxX, y: drawingRect.minY)
        let middleLeft1 = CGPoint(x:drawingRect.minX, y:drawingRect.maxY * 0.4)
        let middleLeft2 = CGPoint(x:drawingRect.minX + 20, y:drawingRect.maxY * 0.4 + 10)
        let middleLeft3 = CGPoint(x:drawingRect.minX, y:drawingRect.maxY * 0.4 + 20)
        let middleLeftCenter1 = CGPoint(x:drawingRect.minX + 15, y:drawingRect.maxY * 0.4)
        let middleLeftCenter2 = CGPoint(x:drawingRect.minX + 15, y:drawingRect.maxY * 0.4 + 20)
        let middleRight1 = CGPoint(x:drawingRect.maxX, y:drawingRect.maxY * 0.4)
        let middleRight2 = CGPoint(x:drawingRect.maxX - 20, y:drawingRect.maxY * 0.4 + 10)
        let middleRight3 = CGPoint(x:drawingRect.maxX, y:drawingRect.maxY * 0.4 + 20)
        let middleRightCenter1 = CGPoint(x:drawingRect.maxX - 15, y:drawingRect.maxY * 0.4)
        let middleRightCenter2 = CGPoint(x:drawingRect.maxX - 15, y:drawingRect.maxY * 0.4 + 20)
        let bottomLeft1 = CGPoint(x:drawingRect.minX, y:drawingRect.maxY - 30)
        let bottomLeft2 = CGPoint(x:drawingRect.minX + 30, y:drawingRect.maxY)
        let bottomLeftCenter = CGPoint(x:drawingRect.minX, y: drawingRect.maxY)
        let bottomRight1 = CGPoint(x:drawingRect.maxX, y:drawingRect.maxY - 30)
        let bottomRight2 = CGPoint(x:drawingRect.maxX - 30, y:drawingRect.maxY)
        let bottomRightCenter = CGPoint(x:drawingRect.maxX, y: drawingRect.maxY)
        
        bezierPath.move(to: topLeft1)
        bezierPath.addCurve(to: topLeft2, controlPoint1: topLeftCenter, controlPoint2: topLeftCenter)
        bezierPath.addLine(to: topRight1)
        bezierPath.addCurve(to: topRight2, controlPoint1: topRightCenter, controlPoint2: topRightCenter)
        bezierPath.addLine(to: middleRight1)
        bezierPath.addCurve(to: middleRight2, controlPoint1: middleRightCenter1, controlPoint2: middleRightCenter1)
        bezierPath.addCurve(to: middleRight3, controlPoint1: middleRightCenter2, controlPoint2: middleRightCenter2)
        bezierPath.addLine(to: bottomRight1)
        bezierPath.addCurve(to: bottomRight2, controlPoint1: bottomRightCenter, controlPoint2: bottomRightCenter)
        bezierPath.addLine(to: bottomLeft2)
        bezierPath.addCurve(to: bottomLeft1, controlPoint1: bottomLeftCenter, controlPoint2: bottomLeftCenter)
        bezierPath.addLine(to: middleLeft3)
        bezierPath.addCurve(to: middleLeft2, controlPoint1: middleLeftCenter2, controlPoint2: middleLeftCenter2)
        bezierPath.addCurve(to: middleLeft1, controlPoint1: middleLeftCenter1, controlPoint2: middleLeftCenter1)
        bezierPath.addLine(to: topLeft1)
        bezierPath.close()
        UIColor.white.setFill()
        UIColor.blue.setStroke()
        bezierPath.fill()
        guard let context2 = UIGraphicsGetCurrentContext() else {
            return
        }
        let path = CGMutablePath()
        path.move(to: CGPoint(x:drawingRect.minX , y:drawingRect.maxY * 0.4 + 10))
        path.addLine(to: CGPoint(x:drawingRect.maxX , y:drawingRect.maxY * 0.4 + 10))
        context2.addPath(path)
        let lineColor  = UIColor.init(red: 226.0/255, green: 227.0/255, blue: 228.0/255, alpha: 1.0)
        context2.setStrokeColor(lineColor.cgColor)
        context2.setLineWidth(2)
        let lengthLine: [CGFloat] = [15,4]
        context2.setLineDash(phase: 0, lengths: lengthLine)
        context2.strokePath()
    }
}


