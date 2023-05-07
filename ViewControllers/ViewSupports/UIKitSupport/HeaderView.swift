//import Foundation
//import UIKit
//
//class HeaderView: UIView {
//    
//    var title: String!
//    var descriptionText: String!
//    var iconName: String!
//    var invertColors: Bool!
//    
//    let PADDING: CGFloat = 30.0
//    let CIRCLEDIM: CGFloat = 60.0
//    var nameContainer: UIView!
//    var iconContainer: UIView!
//    var bottomLineView: UIView!
//    
//    init(title: String, descriptionText: String, iconName: String, invertColors: Bool) {
//        super.init(frame: .zero)
//        self.backgroundColor = UIColor.clear
//        self.title = title
//        self.descriptionText = descriptionText
//        //self.iconName = iconName
//        self.invertColors = invertColors
//        
//        self.setupNameView()
//        //self.setupIcon()
//        self.setupConstraints()
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    func setupNameView() {
//        self.nameContainer = UIView()
//        self.nameContainer.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(self.nameContainer)
//        
//        let activeLabel = UILabel()
//        activeLabel.text = self.descriptionText
//        activeLabel.translatesAutoresizingMaskIntoConstraints = false
//        activeLabel.textColor = UIColor.white
//        self.nameContainer.addSubview(activeLabel)
//        
//        let nameLabel = UILabel()
//        nameLabel.text = self.title
//        nameLabel.textColor = (self.invertColors == true) ? UIColor.white : UIColor.black
//        nameLabel.translatesAutoresizingMaskIntoConstraints = false
//        
//        let largeFont = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .largeTitle)
//        let boldFont = largeFont.withSymbolicTraits(.traitBold)
//        nameLabel.font = UIFont(descriptor: boldFont!, size: 0)
//        self.nameContainer.addSubview(nameLabel)
//        
//        activeLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3.0).isActive = true
//        activeLabel.leadingAnchor.constraint(equalTo: self.nameContainer.safeAreaLayoutGuide.leadingAnchor, constant: PADDING).isActive = true
//        activeLabel.bottomAnchor.constraint(equalTo: self.nameContainer.bottomAnchor, constant: -(PADDING + (CIRCLEDIM / 2) - 15)).isActive = true
//        
//        nameLabel.topAnchor.constraint(equalTo: self.nameContainer.topAnchor, constant: PADDING).isActive = true
//        nameLabel.leadingAnchor.constraint(equalTo: self.nameContainer.safeAreaLayoutGuide.leadingAnchor, constant: PADDING).isActive = true
//        
//        bottomLineView = UIView()
//        bottomLineView.backgroundColor = Colors.tableViewBackgroundColor.color
//        bottomLineView.translatesAutoresizingMaskIntoConstraints = false
//        self.addSubview(bottomLineView)
//        
//        nameContainer.backgroundColor = invertColors ? UIColor.clear : UIColor.white
//    }
//
////    func setupIcon() {
////        self.iconContainer = UIView()
////
////        self.iconContainer.layer.cornerRadius = CIRCLEDIM / 2
////        self.iconContainer.translatesAutoresizingMaskIntoConstraints = false
////        self.addSubview(iconContainer)
////
////        let iconView = UIImageView()
////        iconView.image = UIImage(named: self.iconName)?.withRenderingMode(.alwaysTemplate)
////        iconView.contentMode = .scaleAspectFit
////        iconView.translatesAutoresizingMaskIntoConstraints = false
////        self.iconContainer.addSubview(iconView)
////
////        let iconPadding: CGFloat = 5.0
////        iconView.topAnchor.constraint(equalTo: self.iconContainer.topAnchor, constant: iconPadding).isActive = true
////        iconView.leadingAnchor.constraint(equalTo: self.iconContainer.leadingAnchor, constant: iconPadding).isActive = true
////        iconView.trailingAnchor.constraint(equalTo: self.iconContainer.trailingAnchor, constant: -iconPadding).isActive = true
////        iconView.bottomAnchor.constraint(equalTo: self.iconContainer.bottomAnchor, constant: -iconPadding).isActive = true
////        iconContainer.backgroundColor = invertColors ? UIColor.white : UIColor.clear
////    }
////
////    override func tintColorDidChange() {
////        super.tintColorDidChange()
////        self.nameContainer.backgroundColor = invertColors ? UIColor.clear: UIColor.white
////        self.iconContainer.backgroundColor = invertColors ? UIColor.white : UIColor.clear
////    }
////
//    func setupConstraints() {
//
//        self.nameContainer.topAnchor.constraint(equalTo: self.topAnchor, constant: 20.0).isActive = true
//        self.nameContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        self.nameContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//
////        self.iconContainer.heightAnchor.constraint(equalToConstant: CIRCLEDIM).isActive = true
////        self.iconContainer.widthAnchor.constraint(equalToConstant: CIRCLEDIM).isActive = true
////        self.iconContainer.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: PADDING).isActive = true
////        self.iconContainer.topAnchor.constraint(equalTo: self.nameContainer.bottomAnchor, constant: -(CIRCLEDIM / 2)).isActive = true
////        self.iconContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0.0).isActive = true
//
//        bottomLineView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        bottomLineView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        bottomLineView.topAnchor.constraint(equalTo: self.nameContainer.bottomAnchor).isActive = true
//     //   bottomLineView.bottomAnchor.constraint(equalTo: self.iconContainer.bottomAnchor).isActive = true
//    }
//}
