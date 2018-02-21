//
//  Cells.swift
//  SpreadsheetView
//
//  Created by Kishikawa Katsumi on 5/11/17.
//  Copyright © 2017 Kishikawa Katsumi. All rights reserved.
//

import UIKit
import SpreadsheetView

class HourCell: Cell {
    let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        label.frame = bounds

        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        label.backgroundColor = UIColor(red: 0.220, green: 0.471, blue: 0.871, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 2

        addSubview(label)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class ChannelCell: Cell {
    let label = UILabel()

    var channel = "" {
        didSet {
            label.text = String(channel)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        label.frame = bounds
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        label.backgroundColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.numberOfLines = 2

        addSubview(label)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class SlotCell: Cell {
    @IBOutlet private weak var minutesLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var tableHighlightLabel: UILabel!

    var minutes = 0 {
        didSet {
            minutesLabel.text = String(format: "%02d", minutes)
        }
    }
    var title = "" {
        didSet {
            titleLabel.text = title
        }
    }
    var tableHighlight = "" {
        didSet {
            tableHighlightLabel.text = tableHighlight
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class BlankCell: Cell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 0.9, alpha: 1)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class TestCell: Cell {
    
    var hasSingles = false
    var hasMultis = false
    var hasBigs = false
    private var padding: CGFloat = 10
    private var colors = [UIColor]()
    private var stackView = UIStackView()
    private var elementWidth: CGFloat = 30
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.colors = [#colorLiteral(red: 0.9681029916, green: 0.2753617167, blue: 0.2613036036, alpha: 1), #colorLiteral(red: 0.4462391734, green: 0.8278793693, blue: 0.6940680742, alpha: 1), #colorLiteral(red: 0.9499815106, green: 0.7134179473, blue: 0.3306536674, alpha: 1)]
        addViews()
    }
    
    private func addViews() {
        self.stackView = UIStackView()
        self.stackView.axis = .horizontal
        self.stackView.alignment = .center
        self.stackView.distribution = .equalCentering
        self.stackView.spacing = padding
        self.stackView.layoutMargins = UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
        self.stackView.isLayoutMarginsRelativeArrangement = true
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        
        for i in 0..<3 {
            let view = UIView()
            let color = self.colors[i]
            view.widthAnchor.constraint(equalToConstant: self.elementWidth).isActive = true
            view.heightAnchor.constraint(equalToConstant: self.elementWidth).isActive = true
            view.backgroundColor = color
            view.layer.cornerRadius = self.elementWidth / 2
            view.clipsToBounds = true
            self.stackView.addArrangedSubview(view)
            if i == 0 {
                view.alpha = self.hasSingles ? 1 : 0
            }
            else if i == 1 {
                view.alpha = self.hasMultis ? 1 : 0
            }
            else {
                view.alpha = self.hasBigs ? 1 : 0
            }
        }
        
        self.addSubview(self.stackView)
        self.stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
}
