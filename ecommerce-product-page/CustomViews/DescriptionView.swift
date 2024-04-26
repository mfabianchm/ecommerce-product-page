//
//  DescriptionView.swift
//  ecommerce-product-page
//
//  Created by Marcos Fabian Chong Megchun on 18/04/24.
//

import UIKit

class DescriptionView: UIView {
    
    let brandLabel = TextView(title: "SNEAKER COMAPNY", size: 16, color: "Orange", fontType: "KumbhSans-Bold")
    let titleProductLabel = TextView(title: "Fall Limited Edition Sneakers", size: 25, color: "Very-Dark-Blue", fontType: "KumbhSans-Bold")
    let descriptionLabel = TextView(title: "These low-profile sneakers are your perfect casual wear companion. Featuring a durable rubber outer sole, they'll withstand everything the weather can offer.", size: 16, color: "Dark-grayish-Blue", fontType: "KumbhSans-Regular")
    
    let priceViewContainer = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        brandLabel.translatesAutoresizingMaskIntoConstraints = false
        titleProductLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        priceViewContainer.translatesAutoresizingMaskIntoConstraints = false
        
        configurePriceContainerView()
        titleProductLabel.numberOfLines = 2
        descriptionLabel.numberOfLines = 4
        
        addSubview(priceViewContainer)
        addSubview(brandLabel)
        addSubview(titleProductLabel)
        addSubview(descriptionLabel)
        
        NSLayoutConstraint.activate([
            brandLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            brandLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            brandLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            titleProductLabel.topAnchor.constraint(equalTo: brandLabel.bottomAnchor, constant: 10),
            titleProductLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            titleProductLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleProductLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            priceViewContainer.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 30),
            priceViewContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            priceViewContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
        ])
    }
    
    func configurePriceContainerView() {
        let priceLabel = TextView(title: "$125.00", size: 25, color: "Very-Dark-Blue", fontType: "KumbhSans-Bold")
        let discountLabel = TextView(title: "50%", size: 18, color: "Orange", fontType: "KumbhSans-Bold")
        let discountPrice = TextView(title: "$250.00", size: 18, color: "Grayish-Blue", fontType: "KumbhSans-Bold")
        
        discountLabel.backgroundColor = UIColor(named: "Pale-Orange")
        discountLabel.layer.cornerRadius = 7
        discountLabel.layer.masksToBounds = true
        discountLabel.textAlignment = .center
        
        discountPrice.addStrikethrough(.single, strikethroughColor: UIColor(named: "Grayish-Blue"))
        
        priceViewContainer.addSubview(priceLabel)
        priceViewContainer.addSubview(discountLabel)
        priceViewContainer.addSubview(discountPrice)
        
        NSLayoutConstraint.activate([
            priceLabel.centerYAnchor.constraint(equalTo: priceViewContainer.centerYAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: priceViewContainer.leadingAnchor),
            
            discountLabel.centerYAnchor.constraint(equalTo: priceViewContainer.centerYAnchor),
            discountLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 20),
            discountLabel.widthAnchor.constraint(equalToConstant: 50),
            discountLabel.heightAnchor.constraint(equalToConstant: 35),
            
            discountPrice.centerYAnchor.constraint(equalTo: priceViewContainer.centerYAnchor),
            discountPrice.trailingAnchor.constraint(equalTo: priceViewContainer.trailingAnchor)
        ])
    }
    

}

extension UILabel {
    func addStrikethrough(_ strikethroughStyle: NSUnderlineStyle, strikethroughColor: UIColor?) {
        guard let labelText = text, strikethroughColor != nil else { return }
        
        let attributedText = NSMutableAttributedString(string: labelText)

        attributedText.addAttribute(NSAttributedString.Key.strikethroughStyle, value: strikethroughStyle.rawValue, range: NSMakeRange(0, attributedText.length))
        attributedText.addAttribute(NSAttributedString.Key.strikethroughColor, value: strikethroughColor!, range: NSMakeRange(0, attributedText.length))
        self.attributedText = attributedText
    }
}
