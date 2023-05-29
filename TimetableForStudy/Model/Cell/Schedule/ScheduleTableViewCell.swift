//
//  ScheduleTableViewCell.swift
//  TimetableForStudy
//
//  Created by Артем Орлов on 09.05.2023.
//

import UIKit

final class ScheduleTableViewCell: UITableViewCell {

    private let lessonName = UILabel(text: "", font: .avenirNextDemiBold20())
    private let teacherName = UILabel(text: "", font: .avenirNext20(), aligment: .right)
    private let lessonTime = UILabel(text: "", font: .avenirNextDemiBold20())
    private let typeLabel = UILabel(text: "Type:", font: .avenirNext14())
    private let lessonType = UILabel(text: "", font: .avenirNextDemiBold14())
    private let buildingLabel = UILabel(text: "Building:", font: .avenirNext14(), aligment: .right)
    private let lessonBuilding = UILabel(text: "", font: .avenirNextDemiBold14())
    private let audLabel = UILabel(text: "Audience:", font: .avenirNext14(), aligment: .right)
    private let lessonAud = UILabel(text: "", font: .avenirNextDemiBold14())
    
    private lazy var topStackView = UIStackView(
        arrangedSubviews: [lessonName, teacherName],
        axis: .horizontal,
        spacing: 10,
        distribution: .fillEqually
    )
    
    private lazy var bottomStackView = UIStackView(
        arrangedSubviews: [typeLabel, lessonType, buildingLabel, lessonBuilding, audLabel, lessonAud],
        axis: .horizontal,
        spacing: 10,
        distribution: .fillProportionally
    )
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(model: ScheduleModel) {
        
         let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        lessonName.text = model.scheduleName
        teacherName.text = model.scheduleTeacher
        lessonTime.text = dateFormatter.string(from: model.scheduleTime ?? Date())
        lessonType.text = model.scheduleType
        lessonBuilding.text = model.scheduleBuilding
        lessonAud.text = model.scheduleAudience
        backgroundColor = UIColor().colorFroxHex("\(model.scheduleColor)")
    }
    func setConstraints() {
        
        self.addSubview(topStackView)
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            topStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            topStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            topStackView.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        self.addSubview(lessonTime)
        NSLayoutConstraint.activate([
            lessonTime.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            lessonTime.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            lessonTime.widthAnchor.constraint(equalToConstant: 100),
            lessonTime.heightAnchor.constraint(equalToConstant: 25)
        ])
        
        self.addSubview(bottomStackView)
        NSLayoutConstraint.activate([
            bottomStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            bottomStackView.leadingAnchor.constraint(equalTo: lessonTime.trailingAnchor, constant: 5),
            bottomStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            bottomStackView.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
