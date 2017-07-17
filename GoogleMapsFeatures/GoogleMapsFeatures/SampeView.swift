//
//  SampeView.swift
//  UIAnimation
//
//  Created by ayako_sayama on 2017-07-07.
//  Copyright © 2017 ayako_sayama. All rights reserved.
//

import UIKit

class SampleView: UIView {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var placeID: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame:frame )
        loadXibView()

    }
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            loadXibView()
        }
    
        func loadXibView() {
            let view = Bundle.main.loadNibNamed("SampleView", owner: self, options: nil)?.first as! UIView
            view.frame = self.bounds
            label.text = "Hi my name is jo"
            self.addSubview(view)
        }
}
