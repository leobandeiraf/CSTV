import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
    
    func corner(radius: CGFloat, corners: UIRectCorner = .allCorners) {
        clipsToBounds = true
        layer.cornerRadius = radius
        var masked = CACornerMask()
        if corners.contains(.topLeft) { masked.insert(.layerMinXMinYCorner) }
        if corners.contains(.topRight) { masked.insert(.layerMaxXMinYCorner) }
        if corners.contains(.bottomLeft) { masked.insert(.layerMinXMaxYCorner) }
        if corners.contains(.bottomRight) { masked.insert(.layerMaxXMaxYCorner) }
        self.layer.maskedCorners = masked
    }
}
