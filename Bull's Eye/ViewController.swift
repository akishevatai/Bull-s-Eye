//
//  ViewController.swift
//  Bull's Eye
//
//  Created by Atai Akishev on 8/11/20.
//  Copyright © 2020 Atai Akishev. All rights reserved.
//
// Vy na pryamuiu s labels or button ne mojete rabotat

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider! // weak allows us avoid memory leak;- means that we are that there  IS an element.
    @IBOutlet weak var targetLabel: UILabel! // random label
    @IBOutlet weak var scoreLabel: UILabel! // score
    @IBOutlet weak var roundlabel: UILabel!  // round
          
    var  currentValue: Int = 0  // current of a Slider (helps track value of the slider)
    var targetValue: Int = 0   //  random number
    var totalScore: Int = 0   //   total score
    var round: Int = 0        // round

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let thumbImage = UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImage, for: .normal)
        let thumbImageHighlited = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlited, for: .highlighted)
        
        let inset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        
        let trackLeftImageResizable = trackLeftImage.resizableImage(withCapInsets: inset)
        
        slider.setMinimumTrackImage(trackLeftImageResizable, for: .normal)
        
         let trackRightImage = UIImage(named: "SliderTrackRight")!
         let trackRightImageResizable = trackRightImage.resizableImage(withCapInsets: inset)
        
        slider.setMaximumTrackImage(trackRightImageResizable, for: .normal)
        startOver()
    }
    
       func startNewRound() {
           round += 1                               // each round, value will increase to 1
           targetValue = Int.random(in: 1...100)
           currentValue = 50                      // each round slider has to be in the middle
           slider.value = Float(currentValue)
           updatelabels()// each round slider has to be in the middle
       }
    
       func updatelabels(){
           targetLabel.text = String(targetValue)
           scoreLabel.text = String(totalScore)
           roundlabel.text = String(round)
           
           
       }
    
       @IBAction func startOver(){
           round = 0
           totalScore = 0
           startNewRound()
           
       }
        @IBAction func sliderMove(_ slider: UISlider){  // func that tracks the  movements of the                                                                                          sliders
                                                              // func will work when we move the slider
        currentValue = lroundf(slider.value)                 // my v current value budem peredovat znachenie                                                 slaidera kogda ona budet dvigatsya
    }
   
    
    
    
    @IBAction func showAlerts() { // creating object alert to show alert window
       let difference = abs(targetValue - currentValue)
       
        var points = 100 - difference
        
        var title: String = ""
        if difference == 0 {
            title = "Perfect!"
            points += 100
            
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty Good!"
        } else {
            title = "Not even close"
        }
      
       totalScore += points
        let message = "You scored \(points) points."
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        // button ok to dismiss alert window 
        let action = UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.startNewRound()  // after clicking ok , new round has to start
        })
        
        
       
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func info() {
        
    }

}


