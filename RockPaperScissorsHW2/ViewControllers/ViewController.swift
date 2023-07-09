//
//  ViewController.swift
//  RockPaperScissorsHW2
//
//  Created by zehra on 8.07.2023.
//

import UIKit

class ViewController: UIViewController, ScoresDelegate {
    
    public var pcScore: Int = 0
    public var humanScore: Int = 0
    public var pcText = "PC Score: 0"
    public var humanText = "Human Score: 0"
    @IBOutlet weak var humanScoreLabel: UITextField!
    @IBOutlet weak var pcScoreLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let arrrivedVC = segue.destination as! ResultViewController
        if segue.identifier == "rockSegue" {
            arrrivedVC.selectedItem = .rock
            
        } else if segue.identifier == "paperSegue" {
            arrrivedVC.selectedItem = .paper
            
        } else if segue.identifier == "scissorsSegue" {
            arrrivedVC.selectedItem = .scissors
        }
        arrrivedVC.delegate = self
    }
    
    func increaseHumanScore() {
        humanScore += 1
        humanText = "Human Score: \(humanScore)"
        setScoreLabels()
    }
    
    func increasePCScore() {
        pcScore += 1
        pcText = "PC Score: \(pcScore)"
        setScoreLabels()
    }
    
    func setScoreLabels() {
        humanScoreLabel.text = humanText
        pcScoreLabel.text = pcText
    }

    @IBAction func resetScore(_ sender: Any) {
        pcScore = 0
        pcText = "PC Score: \(pcScore)"
        humanScore = 0
        humanText = "Human Score: \(humanScore)"
        setScoreLabels()
    }
}

