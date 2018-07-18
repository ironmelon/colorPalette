//
//  ViewController.swift
//  colorPalette
//
//  Created by Oleg Dynnikov on 7/18/18.
//  Copyright © 2018 Oleg Dynnikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redColorValueLabel: UILabel!
    @IBOutlet weak var greenColorValueLabel: UILabel!
    @IBOutlet weak var blueColorValueLabel: UILabel!
    @IBOutlet weak var paletteView: UIView!
    @IBOutlet weak var redSliderValueLabel: UISlider!
    @IBOutlet weak var greenSliderValueLabel: UISlider!
    @IBOutlet weak var blueSliderValueLabel: UISlider!

    let defaultMinValue: Float = 0.0
    let defaultMaxValue: Float = 255.0

    override func viewDidLoad() {
        super.viewDidLoad()
        redColorValueLabel.text = "\(Int(redSliderValueLabel.value))"
        greenColorValueLabel.text = "\(Int(greenSliderValueLabel.value))"
        blueColorValueLabel.text = "\(Int(blueSliderValueLabel.value))"
        changedColor()
    }

    @IBAction func minPaletteValueButton(_ sender: Any) {
        addedValueLabel(value: defaultMinValue)
        changedColor()
    }

    @IBAction func mediumPaletteValueButton(_ sender: Any) {
        addedValueLabel(value: (defaultMaxValue - defaultMinValue) / 2 + defaultMinValue)
        changedColor()
    }

    @IBAction func maxPaletteValueButton(_ sender: Any) {
        addedValueLabel(value: defaultMaxValue)
        changedColor()
    }

    @IBAction func redChangedSlider(_ sender: Any) {
        changedColor()
    }

    @IBAction func greenChangedSlider(_ sender: Any) {
        changedColor()
    }

    @IBAction func blueChangedSlider(_ sender: Any) {
        changedColor()
    }

    func changedColor() {
        paletteView.backgroundColor = UIColor(red: CGFloat(redSliderValueLabel.value / 255.0), green: CGFloat(greenSliderValueLabel.value / 255.0), blue: CGFloat(blueSliderValueLabel.value / 255.0), alpha: 1.0)
        redColorValueLabel.text = "\(Int(redSliderValueLabel.value))"
        greenColorValueLabel.text = "\(Int(greenSliderValueLabel.value))"
        blueColorValueLabel.text = "\(Int(blueSliderValueLabel.value))"
    }

    func addedValueLabel(value: Float) {
        redSliderValueLabel.value = value
        greenSliderValueLabel.value = value
        blueSliderValueLabel.value = value
    }
}

