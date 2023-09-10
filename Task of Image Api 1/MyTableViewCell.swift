//
//  MyTableViewCell.swift
//  Task of Image Api 1
//
//  Created by Naved Khan on 12/05/23.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var viewInnerCell: UIView!
    @IBOutlet weak var myImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
//        label3.sizeToFit()
      
        myImage.layer.cornerRadius = 10
        viewInnerCell.layer.cornerRadius = 15
//        viewInnerCell.dropShadow()
      
        // Initialization code
    }

    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label1: UILabel!
  
    @IBOutlet weak var imageIcon: UIImageView!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    
    override func layoutSubviews() {
        superview?.layoutSubviews()
//        DispatchQueue.main.async { [self] in
////            viewInnerCell.dropShadow(color: .black, opacity: 2, offSet: CGSize(width: -1, height: 1), radius: 15, scale: true)
//           
////            viewInnerCell.dropShadow()
//        }
        
    }
}

extension UIView {
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = .zero
        layer.shadowRadius = 10
        
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    func dropShadow(color: UIColor, opacity: Float = 0.2, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius

        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
      }
} 
