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

    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!

    let defaultMinColorValue: Float = 0
    let defaultMaxColorValue: Float = 255
    var defaultMediumColorValue: Float {
        return (defaultMaxColorValue - defaultMinColorValue) / 2 + defaultMinColorValue
    }
    var slidersArray: [UISlider] {
        return [redSlider, greenSlider, blueSlider]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetupForSliders()
        updateColorView()
    }

    @IBAction func minPaletteValueButton(_ sender: Any) {
        updateSlidersValue(defaultMinColorValue)
        updateSlidersLabels()
        updateColorView()
    }

    @IBAction func mediumPaletteValueButton(_ sender: Any) {
        updateSlidersValue(defaultMediumColorValue)
        updateSlidersLabels()
        updateColorView()
    }

    @IBAction func maxPaletteValueButton(_ sender: Any) {
        updateSlidersValue(defaultMaxColorValue)
        updateSlidersLabels()
        updateColorView()
    }

    @IBAction func redChangedSlider(_ sender: Any) {
        updateSlidersLabels()
        updateColorView()
    }

    @IBAction func greenChangedSlider(_ sender: Any) {
        updateSlidersLabels()
        updateColorView()
    }

    @IBAction func blueChangedSlider(_ sender: Any) {
        updateSlidersLabels()
        updateColorView()
    }

    func updateColorView() {
        let redValue   = CGFloat(redSlider.value / defaultMaxColorValue)
        let greenValue = CGFloat(greenSlider.value / defaultMaxColorValue)
        let blueValue  = CGFloat(blueSlider.value / defaultMaxColorValue)
        paletteView.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
    }

    func updateSlidersLabels() {
        redColorValueLabel.text = "\(Int(redSlider.value))"
        greenColorValueLabel.text = "\(Int(greenSlider.value))"
        blueColorValueLabel.text = "\(Int(blueSlider.value))"
    }

    func updateSlidersValue(_ value: Float) {
        for slider in slidersArray {
            slider.value = value
        }
    }

    func setupBoundaryValue(for slider: UISlider) {
        slider.minimumValue = defaultMinColorValue
        slider.maximumValue = defaultMaxColorValue
    }

    func initialSetupForSliders() {
        for slider in slidersArray {
            setupBoundaryValue(for: slider)
        }
        updateSlidersValue(defaultMediumColorValue)
        updateSlidersLabels()
    }
}

