//
//  ResultViewController.swift
//  RockPaperScissorsHW2
//
//  Created by zehra on 8.07.2023.
//

import UIKit

public enum Items: String {
    case rock
    case paper
    case scissors
}

public enum States: String {
    case pc
    case human
    case tie
}

protocol ScoresDelegate: AnyObject {
    func increaseHumanScore()
    func increasePCScore()
}

class ResultViewController: UIViewController {
    
    weak var delegate: ScoresDelegate?
    public var selectedItem: Items = .paper
    
    @IBOutlet weak var currentStatusLabel: UILabel!
    @IBOutlet weak var userDecision: UIImageView!
    @IBOutlet weak var computerDecision: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decision()
    }
    
    func decision() {
        let winner = winnerSide(pc: selectionPc())
        switch winner {
        case .pc:
            currentStatusLabel.text = "You Lost! 🤕"
            delegate?.increasePCScore()
        case .human:
            currentStatusLabel.text = "You Win! 🥳"
            delegate?.increaseHumanScore()
        case .tie:
            currentStatusLabel.text = "Tie! 🤔"
        }
    }
    
    func selectionPc() -> Items {//pc bu tanımladığımız enum değerler dışında değer seçemeyecek olup random seçim yapması sağlandı.
        let chose: [Items] = [.rock, .paper, .scissors]
        let pcDecision = chose.randomElement()!
        setPCDecisionImage(item: pcDecision)
        return pcDecision
    }
    
    func setPCDecisionImage(item: Items) {
        computerDecision.image = UIImage(named: item.rawValue)
        userDecision.image = UIImage(named: selectedItem.rawValue)
    }
    
    func winnerSide(pc: Items) -> States {//kazanan tarafa karar verebilmek için kullanıcıdan gelen değer ve pcnin random seçimine göre karşılaştırmalar yapıldı.
        switch selectedItem {
        case .rock:
            if pc == .paper {
                return .pc
            } else if pc == .scissors {
                return .human
            } else {
                return .tie
            }
        case .paper:
            if pc == .rock {
                return .human
            } else if pc == .scissors {
                return .pc
            } else {
                return .tie
            }
        case .scissors:
            if pc == .paper {
                return .human
            } else if pc == .rock {
                return .pc
            } else {
                return .tie
            }
        }
    }
}


