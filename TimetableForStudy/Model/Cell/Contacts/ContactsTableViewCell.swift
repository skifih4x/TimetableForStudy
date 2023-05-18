//
//  ContactsTableViewCell.swift
//  TimetableForStudy
//
//  Created by Артем Орлов on 18.05.2023.
//

import UIKit

final class ContactsTableViewCell: UITableViewCell {
    
    lazy var contactImageView: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(systemName: "array")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var phoneImageView: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(systemName: "phone.fill")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var mailImageView: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(systemName: "envelope.fill")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let nameLabel = UILabel(text: "Cruella De Vil", font: .avenirNext20())
    let phoneLabel = UILabel(text: "+7 999 999 99 99", font: .avenirNext14())
    let mailLabel = UILabel(text: "Cruella@mail.ru", font: .avenirNext14())
    
    lazy var stackView = UIStackView(
        arrangedSubviews: [phoneImageView, phoneLabel, mailImageView, mailLabel],
        axis: .horizontal,
        spacing: 3,
        distribution: .fillProportionally
    )
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        contactImageView.layer.cornerRadius = contactImageView.frame.height / 2
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        
        self.addSubview(contactImageView)
        NSLayoutConstraint.activate([
            contactImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 6),
            contactImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            contactImageView.widthAnchor.constraint(equalToConstant: 70),
            contactImageView.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        self.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            nameLabel.heightAnchor.constraint(equalToConstant: 21)
        ])
        

        self.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contactImageView.trailingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            stackView.heightAnchor.constraint(equalToConstant: 21)
        ])
    }
}


