//
//  GameViewController.swift
//  BrainRushZap
//
//  Created by Вадим on 02.05.2023.
//

import UIKit

class GameViewController: UIViewController {

    var language: String
    var soundPlaing: Bool
    var value: String
    var mainBG: String
    var lifeCount: Int
    var state: Int
    
    let defaults = UserDefaults.standard
    var timer: Timer?
    private var buttonPressCounter: Int = 0
    private var result = 0
    private var noMusicCounter: Int = 0
    
    private let backGround: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Main BG")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var customNavigationBar = UINavigationBar()
    
    private let optionsButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Options_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(optionsPressed), for: .touchUpInside)
        return button
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Close_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(cancelPressed), for: .touchUpInside)
        return button
    }()
    
    private let miniWheelElement: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Tier 1 wheel element")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let midleWheelElement: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Tier 2 wheel element")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let bigWheelElement: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Tier 3 wheel element")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let miniCircle: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Tier 1 wheel")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let middleCircle: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Tier 2 wheel")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let bigCircle: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Tier 3 wheel")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let wheelElement: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Loading wheel element"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(wheelElementPressed), for: .touchUpInside)
        return button
    }()
    
    private let additionalOptions: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Additional options")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        return imageView
    }()
    
    private let sound: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "With sound_btn"), for: .normal)
        button.addTarget(self, action: #selector(soundPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()
    
    private let firstAnswer: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Possible answer_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(firstAnswerPressed), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    private let firstAnswerLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let secondAnswer: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Possible answer_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(secondAnswerPressed), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    private let secondAnswerLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let thirdAnswer: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Possible answer_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(thirdAnswerPressed), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    private let thirdAnswerLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let fourthAnswer: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Possible answer_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(fourthAnswerPressed), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    private let fourthAnswerLabel: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let levelButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "1 level_btn"), for: .normal)
        button.addTarget(self, action: #selector(oneLevelPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 0
        return button
    }()
    
    private let leftMiniNumber: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let rightMiniNumber: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let leftMidleNumber: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let rightMidleNumber: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let leftBigNumber: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let rightBigNumber: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let sign: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.text = ""
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let frameLives: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Frame for lives")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let leftLife: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Life")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let midleLife: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Life")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let rightLife: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Life")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "TIMER: 03:00"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let incomeLabel: UILabel = {
        let label = UILabel()
        label.text = "POINTS: 10"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setcustomNavigation()
        setSubviews()
        setConstraints()
        setLife()
        stateCircle()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        customizeInterface()
        setFont(leftMiniNumber, Constants.setSizeY(45.0), -2.0)
        rightMiniNumber.text = rightMiniNumber.text
        setFont(rightMiniNumber, Constants.setSizeY(45.0), -2.0)
        setFont(leftMidleNumber, Constants.setSizeY(45.0), -2.0)
        setFont(rightMidleNumber, Constants.setSizeY(45.0), -2.0)
        setFont(leftBigNumber, Constants.setSizeY(45.0), -2.0)
        setFont(rightBigNumber, Constants.setSizeY(45.0), -2.0)
        setFont(sign, Constants.setSizeY(65.0), -2.0)
        setFont(firstAnswerLabel, Constants.setSizeY(45.0), -2.0)
        setFont(secondAnswerLabel, Constants.setSizeY(45.0), -2.0)
        setFont(thirdAnswerLabel, Constants.setSizeY(45.0), -2.0)
        setFont(fourthAnswerLabel, Constants.setSizeY(45.0), -2.0)
        setFont(timerLabel, Constants.setSizeY(32.0), 0)
        setFont(incomeLabel, Constants.setSizeY(32.0), 0)
        
        if levelButton.tag == 0 {
            shadowRadius(true, miniCircle, Constants.setSizeX(175/2))
            shadowRadius(false, middleCircle, Constants.setSizeX(265/2))
            shadowRadius(false, bigCircle, Constants.setSizeX(345/2))
        } else if levelButton.tag == 1 {
            shadowRadius(false, miniCircle, Constants.setSizeX(175/2))
            shadowRadius(true, middleCircle, Constants.setSizeX(265/2))
            shadowRadius(false, bigCircle, Constants.setSizeX(345/2))
        } else if levelButton.tag == 2 {
            shadowRadius(false, miniCircle, Constants.setSizeX(175/2))
            shadowRadius(false, middleCircle, Constants.setSizeX(265/2))
            shadowRadius(true, bigCircle, Constants.setSizeX(345/2))
        }
        
    }

    private func shadowRadius(_ on: Bool ,_ imageView: UIImageView,_ radius: Double) {
        if on {
            imageView.layer.shadowColor = UIColor.white.cgColor
            imageView.layer.shadowRadius = 10
            imageView.layer.shadowOpacity = 1
            imageView.layer.shadowOffset = CGSize.zero
            imageView.layer.shadowPath = UIBezierPath(roundedRect: imageView.bounds.insetBy(dx: -15, dy: -15), cornerRadius: imageView.layer.cornerRadius).cgPath
            imageView.layer.cornerRadius = radius
        } else {
            imageView.layer.shadowRadius = 0
            imageView.layer.shadowOpacity = 0
            imageView.layer.shadowOffset = CGSize.zero
            imageView.layer.shadowPath = UIBezierPath(roundedRect: imageView.bounds.insetBy(dx: 0, dy: 0), cornerRadius: imageView.layer.cornerRadius).cgPath
            imageView.layer.cornerRadius = radius
        }
        
    }
    
    private func setLife() {
        if lifeCount == 3 {
            leftLife.image = UIImage(named: "Life")
            midleLife.image = UIImage(named: "Life")
            rightLife.image = UIImage(named: "Life")
        } else if lifeCount == 2 {
            leftLife.image = UIImage(named: "Lost life")
            midleLife.image = UIImage(named: "Life")
            rightLife.image = UIImage(named: "Life")
        } else if lifeCount == 1 {
            leftLife.image = UIImage(named: "Lost life")
            midleLife.image = UIImage(named: "Lost life")
            rightLife.image = UIImage(named: "Life")
        }
    }
    
    private func setcustomNavigation() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        customNavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 110))
        view.addSubview(customNavigationBar)
    }
    
    private func setSubviews() {
        view.addSubview(backGround)
        view.addSubview(optionsButton)
        backGround.addSubview(additionalOptions)
        view.addSubview(sound)
        view.addSubview(miniWheelElement)
        view.addSubview(midleWheelElement)
        view.addSubview(bigWheelElement)
        view.addSubview(wheelElement)
        view.addSubview(firstAnswer)
        view.addSubview(secondAnswer)
        view.addSubview(thirdAnswer)
        view.addSubview(fourthAnswer)
        view.addSubview(levelButton)
        firstAnswer.addSubview(firstAnswerLabel)
        secondAnswer.addSubview(secondAnswerLabel)
        thirdAnswer.addSubview(thirdAnswerLabel)
        fourthAnswer.addSubview(fourthAnswerLabel)
        
        view.addSubview(cancelButton)
        backGround.addSubview(bigCircle)
        backGround.addSubview(middleCircle)
        backGround.addSubview(miniCircle)
        backGround.addSubview(leftMiniNumber)
        backGround.addSubview(rightMiniNumber)
        backGround.addSubview(leftMidleNumber)
        backGround.addSubview(rightMidleNumber)
        backGround.addSubview(leftBigNumber)
        backGround.addSubview(rightBigNumber)
        view.addSubview(sign)
        backGround.addSubview(frameLives)
        frameLives.addSubview(leftLife)
        frameLives.addSubview(midleLife)
        frameLives.addSubview(rightLife)
        backGround.addSubview(timerLabel)
        backGround.addSubview(incomeLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backGround.topAnchor.constraint(equalTo: view.topAnchor),
            backGround.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backGround.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backGround.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            optionsButton.topAnchor.constraint(equalTo: backGround.topAnchor),
            optionsButton.leadingAnchor.constraint(equalTo: backGround.leadingAnchor),
            optionsButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(106)),
            optionsButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(100)),
            
            cancelButton.topAnchor.constraint(equalTo: backGround.topAnchor),
            cancelButton.trailingAnchor.constraint(equalTo: backGround.trailingAnchor),
            cancelButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(106)),
            cancelButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(100)),
            
            additionalOptions.topAnchor.constraint(equalTo: backGround.topAnchor),
            additionalOptions.leadingAnchor.constraint(equalTo: backGround.leadingAnchor),
            additionalOptions.widthAnchor.constraint(equalToConstant: Constants.setSizeY(83)),
            additionalOptions.heightAnchor.constraint(equalToConstant: Constants.setSizeY(175)),

            sound.topAnchor.constraint(equalTo: optionsButton.bottomAnchor, constant: Constants.setSizeY(7)),
            sound.centerXAnchor.constraint(equalTo: additionalOptions.centerXAnchor),
            sound.widthAnchor.constraint(equalToConstant: Constants.setSizeY(53)),
            sound.heightAnchor.constraint(equalToConstant: Constants.setSizeY(53)),
            
            firstAnswer.topAnchor.constraint(equalTo: bigCircle.bottomAnchor, constant: Constants.setSizeY(10)),
            firstAnswer.centerXAnchor.constraint(equalTo: backGround.centerXAnchor, constant: Constants.setSizeY(-100)),
            firstAnswer.widthAnchor.constraint(equalToConstant: Constants.setSizeY(165)),
            firstAnswer.heightAnchor.constraint(equalToConstant: Constants.setSizeY(75)),
            firstAnswerLabel.centerXAnchor.constraint(equalTo: firstAnswer.centerXAnchor),
            firstAnswerLabel.centerYAnchor.constraint(equalTo: firstAnswer.centerYAnchor),
            
            secondAnswer.topAnchor.constraint(equalTo: bigCircle.bottomAnchor, constant: Constants.setSizeY(10)),
            secondAnswer.centerXAnchor.constraint(equalTo: backGround.centerXAnchor, constant: Constants.setSizeY(100)),
            secondAnswer.widthAnchor.constraint(equalToConstant: Constants.setSizeY(165)),
            secondAnswer.heightAnchor.constraint(equalToConstant: Constants.setSizeY(75)),
            secondAnswerLabel.centerXAnchor.constraint(equalTo: secondAnswer.centerXAnchor),
            secondAnswerLabel.centerYAnchor.constraint(equalTo: secondAnswer.centerYAnchor),
            
            thirdAnswer.topAnchor.constraint(equalTo: firstAnswer.bottomAnchor, constant: Constants.setSizeY(25)),
            thirdAnswer.centerXAnchor.constraint(equalTo: firstAnswer.centerXAnchor),
            thirdAnswer.widthAnchor.constraint(equalToConstant: Constants.setSizeY(165)),
            thirdAnswer.heightAnchor.constraint(equalToConstant: Constants.setSizeY(75)),
            thirdAnswerLabel.centerXAnchor.constraint(equalTo: thirdAnswer.centerXAnchor),
            thirdAnswerLabel.centerYAnchor.constraint(equalTo: thirdAnswer.centerYAnchor),
            
            fourthAnswer.topAnchor.constraint(equalTo: secondAnswer.bottomAnchor, constant: Constants.setSizeY(25)),
            fourthAnswer.centerXAnchor.constraint(equalTo: secondAnswer.centerXAnchor),
            fourthAnswer.widthAnchor.constraint(equalToConstant: Constants.setSizeY(165)),
            fourthAnswer.heightAnchor.constraint(equalToConstant: Constants.setSizeY(75)),
            fourthAnswerLabel.centerXAnchor.constraint(equalTo: fourthAnswer.centerXAnchor),
            fourthAnswerLabel.centerYAnchor.constraint(equalTo: fourthAnswer.centerYAnchor),
            
            levelButton.topAnchor.constraint(equalTo: frameLives.bottomAnchor, constant: 10),
            levelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            levelButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(200)),
            levelButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(70)),
            
            leftMiniNumber.centerXAnchor.constraint(equalTo: bigCircle.centerXAnchor, constant: Constants.setSizeY(-63)),
            leftMiniNumber.centerYAnchor.constraint(equalTo: bigCircle.centerYAnchor),
            rightMiniNumber.centerXAnchor.constraint(equalTo: bigCircle.centerXAnchor, constant: Constants.setSizeY(63)),
            rightMiniNumber.centerYAnchor.constraint(equalTo: bigCircle.centerYAnchor),
            leftMidleNumber.centerXAnchor.constraint(equalTo: bigCircle.centerXAnchor, constant: Constants.setSizeY(-110)),
            leftMidleNumber.centerYAnchor.constraint(equalTo: bigCircle.centerYAnchor),
            rightMidleNumber.centerXAnchor.constraint(equalTo: bigCircle.centerXAnchor, constant: Constants.setSizeY(110)),
            rightMidleNumber.centerYAnchor.constraint(equalTo: bigCircle.centerYAnchor),
            leftBigNumber.centerXAnchor.constraint(equalTo: bigCircle.centerXAnchor, constant: Constants.setSizeY(-150)),
            leftBigNumber.centerYAnchor.constraint(equalTo: bigCircle.centerYAnchor),
            rightBigNumber.centerXAnchor.constraint(equalTo: bigCircle.centerXAnchor, constant: Constants.setSizeY(150)),
            rightBigNumber.centerYAnchor.constraint(equalTo: bigCircle.centerYAnchor),
            sign.centerXAnchor.constraint(equalTo: bigCircle.centerXAnchor),
            sign.centerYAnchor.constraint(equalTo: bigCircle.centerYAnchor),
            
            frameLives.topAnchor.constraint(equalTo: backGround.topAnchor),
            frameLives.centerXAnchor.constraint(equalTo: backGround.centerXAnchor),
            frameLives.widthAnchor.constraint(equalToConstant: Constants.setSizeX(285)),
            frameLives.heightAnchor.constraint(equalToConstant: Constants.setSizeY(100)),
            
            midleLife.centerYAnchor.constraint(equalTo: frameLives.centerYAnchor, constant: Constants.setSizeZ(1)),
            midleLife.centerXAnchor.constraint(equalTo: frameLives.centerXAnchor),
            midleLife.widthAnchor.constraint(equalToConstant: Constants.setSizeY(50)),
            midleLife.heightAnchor.constraint(equalToConstant: Constants.setSizeY(48)),
            
            leftLife.centerYAnchor.constraint(equalTo: midleLife.centerYAnchor),
            leftLife.centerXAnchor.constraint(equalTo: midleLife.centerXAnchor, constant: Constants.setSizeY(75)),
            leftLife.widthAnchor.constraint(equalToConstant: Constants.setSizeY(50)),
            leftLife.heightAnchor.constraint(equalToConstant: Constants.setSizeY(48)),
            
            rightLife.centerYAnchor.constraint(equalTo: midleLife.centerYAnchor),
            rightLife.centerXAnchor.constraint(equalTo: midleLife.centerXAnchor, constant: Constants.setSizeY(-75)),
            rightLife.widthAnchor.constraint(equalToConstant: Constants.setSizeY(50)),
            rightLife.heightAnchor.constraint(equalToConstant: Constants.setSizeY(48)),
            
            timerLabel.centerXAnchor.constraint(equalTo: backGround.centerXAnchor, constant: Constants.setSizeX(-110)),
            timerLabel.topAnchor.constraint(equalTo: levelButton.bottomAnchor, constant: 10),
            incomeLabel.centerXAnchor.constraint(equalTo: backGround.centerXAnchor, constant: Constants.setSizeX(110)),
            incomeLabel.topAnchor.constraint(equalTo: levelButton.bottomAnchor, constant: 10),
            
            bigCircle.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: 10),
            bigCircle.centerXAnchor.constraint(equalTo: levelButton.centerXAnchor),
            bigCircle.widthAnchor.constraint(equalToConstant: Constants.setSizeY(345)),
            bigCircle.heightAnchor.constraint(equalToConstant: Constants.setSizeY(345)),
            
            miniCircle.centerXAnchor.constraint(equalTo: bigCircle.centerXAnchor),
            miniCircle.centerYAnchor.constraint(equalTo: bigCircle.centerYAnchor),
            miniCircle.widthAnchor.constraint(equalToConstant: Constants.setSizeY(175)),
            miniCircle.heightAnchor.constraint(equalToConstant: Constants.setSizeY(175)),
            
            middleCircle.centerXAnchor.constraint(equalTo: bigCircle.centerXAnchor),
            middleCircle.centerYAnchor.constraint(equalTo: bigCircle.centerYAnchor),
            middleCircle.widthAnchor.constraint(equalToConstant: Constants.setSizeY(265)),
            middleCircle.heightAnchor.constraint(equalToConstant: Constants.setSizeY(265)),
            
            bigWheelElement.centerXAnchor.constraint(equalTo: bigCircle.centerXAnchor),
            bigWheelElement.centerYAnchor.constraint(equalTo: bigCircle.centerYAnchor),
            bigWheelElement.widthAnchor.constraint(equalToConstant: Constants.setSizeY(365)),
            bigWheelElement.heightAnchor.constraint(equalToConstant: Constants.setSizeY(110)),
            
            miniCircle.centerXAnchor.constraint(equalTo: bigCircle.centerXAnchor),
            miniCircle.centerYAnchor.constraint(equalTo: bigCircle.centerYAnchor),
            miniCircle.widthAnchor.constraint(equalToConstant: Constants.setSizeY(175)),
            miniCircle.heightAnchor.constraint(equalToConstant: Constants.setSizeY(175)),
            
            middleCircle.centerXAnchor.constraint(equalTo: bigCircle.centerXAnchor),
            middleCircle.centerYAnchor.constraint(equalTo: bigCircle.centerYAnchor),
            middleCircle.widthAnchor.constraint(equalToConstant: Constants.setSizeY(265)),
            middleCircle.heightAnchor.constraint(equalToConstant: Constants.setSizeY(265)),
            
            wheelElement.centerXAnchor.constraint(equalTo: bigCircle.centerXAnchor),
            wheelElement.centerYAnchor.constraint(equalTo: bigCircle.centerYAnchor),
            wheelElement.widthAnchor.constraint(equalToConstant: Constants.setSizeY(110)),
            wheelElement.heightAnchor.constraint(equalToConstant: Constants.setSizeY(110)),
            
            miniWheelElement.centerXAnchor.constraint(equalTo: bigCircle.centerXAnchor),
            miniWheelElement.centerYAnchor.constraint(equalTo: bigCircle.centerYAnchor),
            miniWheelElement.widthAnchor.constraint(equalToConstant: Constants.setSizeY(195)),
            miniWheelElement.heightAnchor.constraint(equalToConstant: Constants.setSizeY(110)),
            
            midleWheelElement.centerXAnchor.constraint(equalTo: bigCircle.centerXAnchor),
            midleWheelElement.centerYAnchor.constraint(equalTo: bigCircle.centerYAnchor),
            midleWheelElement.widthAnchor.constraint(equalToConstant: Constants.setSizeY(285)),
            midleWheelElement.heightAnchor.constraint(equalToConstant: Constants.setSizeY(110)),
            
        ])
    }

    @objc func soundPressed() {
        if soundPlaing {
            soundPlaing = false
            sound.setBackgroundImage(UIImage(named: "Soundless_btn"), for: .normal)
            AudioPlayerManager.shared.pause()
        } else {
            soundPlaing = true
            sound.setBackgroundImage(UIImage(named: "With sound_btn"), for: .normal)
            AudioPlayerManager.shared.play()
        }
        if soundPlaing { AudioPlayerManager.shared.playSoundEffect() }
    }
    
    @objc func optionsPressed() {
        if soundPlaing { AudioPlayerManager.shared.playSoundEffect() }
        if buttonPressCounter % 2 == 0 {
            additionalOptions.isHidden = false
            sound.isHidden = false
        } else {
            additionalOptions.isHidden = true
            sound.isHidden = true
        }
        buttonPressCounter += 1
    }
    
    @objc func cancelPressed() {
        if soundPlaing { AudioPlayerManager.shared.playSoundEffect() }
        self.view.window?.rootViewController = UINavigationController(rootViewController: LetsWinViewController(
            language: language,
            soundPlaing: soundPlaing,
            value: value,
            mainBG: mainBG))
    }
    
    @objc func oneLevelPressed() {
        if soundPlaing { AudioPlayerManager.shared.playSoundEffect() }
        if levelButton.tag == 0 {
            levelButton.setBackgroundImage(UIImage(named: "2 level_btn"), for: .normal)
            
            timerLabel.text = "TIMER 05:00"
            incomeLabel.text = "POINTS: 50"
            
            miniWheelElement.isHidden = true
            midleWheelElement.isHidden = false
            bigWheelElement.isHidden = true
            
            levelButton.tag = 1
        } else if levelButton.tag == 1 {
            levelButton.setBackgroundImage(UIImage(named: "3 level_btn"), for: .normal)
            
            timerLabel.text = "TIMER 10:00"
            incomeLabel.text = "POINTS: 100"
            
            miniWheelElement.isHidden = true
            midleWheelElement.isHidden = true
            bigWheelElement.isHidden = false
            
            levelButton.tag = 2
        } else if levelButton.tag == 2 {
            levelButton.setBackgroundImage(UIImage(named: "1 level_btn"), for: .normal)
            
            timerLabel.text = "TIMER 03:00"
            incomeLabel.text = "POINTS: 10"
            
            miniWheelElement.isHidden = false
            midleWheelElement.isHidden = true
            bigWheelElement.isHidden = true
            
            levelButton.tag = 0
        }
    }
    
    @objc private func wheelElementPressed() {
        cancelButton.isEnabled = false
        levelButton.isEnabled = false
        if soundPlaing { AudioPlayerManager.shared.playSoundEffect() }
        wheelElement.isHidden = true
        
        if levelButton.tag == 0 {
            self.state = 0
            // вращение колеса
            rotationAnimation(miniCircle, 1.92)
            if soundPlaing { AudioPlayerManager.shared.playvzux() }
            // логика создания чисел
            var leftNumber = Int(arc4random_uniform(10))
            var rightNumber = mirrorNumber(leftNumber)
            if leftNumber == 5 {
                leftNumber = Int(arc4random_uniform(5))
                rightNumber = mirrorNumber(leftNumber)
            }
            
            leftMiniNumber.text = String(leftNumber)
            rightMiniNumber.text = String(rightNumber)
            
            if leftNumber % rightNumber == 0 {
                sign.text = "/"
            } else {
                sign.text = ["+", "-", "*"].randomElement()!
            }
            
            
            switch sign.text {
            case "+": result = leftNumber + rightNumber
            case "-": result = leftNumber - rightNumber
            case "*": result = leftNumber * rightNumber
            default: result = leftNumber / rightNumber
            }
            
            //отображение чисел
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.25) { [self] in
                if soundPlaing { AudioPlayerManager.shared.playAppearance() }
                leftMiniNumber.isHidden = false
                rightMiniNumber.isHidden = false
                sign.isHidden = false
                
                let label = [firstAnswerLabel, secondAnswerLabel, thirdAnswerLabel, fourthAnswerLabel].randomElement()!
                label.text = String(result)
                label.tag = 8
                
                var numberOne = 0
                var numberTwo = 0
                var numberThree = 0
                var nnumber = 0
                var count = 0
                for i in [firstAnswerLabel, secondAnswerLabel, thirdAnswerLabel, fourthAnswerLabel] {
                    if i != label {
                        nnumber = randomix(result)
                        
                        if count == 0 {
                            numberOne = nnumber
                            i.text = String(numberOne)
                            i.isHidden = false
                            count += 1
                        } else if count == 1 {
                            numberTwo = nnumber
                            if numberOne == numberTwo {
                                numberTwo -= 2
                            }
                            i.text = String(numberTwo)
                            i.isHidden = false
                            count += 1
                        } else if count == 2 {
                            numberThree = nnumber
                            if numberThree == numberTwo || numberThree == numberOne {
                                numberThree -= 1
                            }
                            i.text = String(numberThree)
                            i.isHidden = false
                            count = 0
                        }
                        
                        
                    }
                }
                label.isHidden = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 1)  {
                    if soundPlaing { AudioPlayerManager.shared.playTik() }
                    startTimer(seconds: 3)
                }
                if self.lifeCount == 1 {
                    self.value = String(Int(self.value)! - 10)
                }
                firstAnswer.isHidden = false
                secondAnswer.isHidden = false
                thirdAnswer.isHidden = false
                fourthAnswer.isHidden = false
            }
            
        } else if levelButton.tag == 1 {
            self.state = 1
            rotationAnimation(miniCircle, 1.92)
            if soundPlaing { AudioPlayerManager.shared.playvzux() }
            var leftNumber = Int(arc4random_uniform(10))
            var rightNumber = mirrorNumber(leftNumber)
            if leftNumber == 5 {
                leftNumber = Int(arc4random_uniform(5))
                rightNumber = mirrorNumber(leftNumber)
            }
            leftMiniNumber.text = String(leftNumber)
            rightMiniNumber.text = String(rightNumber)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) { [self] in
                if soundPlaing { AudioPlayerManager.shared.playAppearance() }
                leftMiniNumber.isHidden = false
                rightMiniNumber.isHidden = false
                
                rotationAnimation(middleCircle, 1.92)
                if soundPlaing { AudioPlayerManager.shared.playvzux() }
                var leftLeftNumber = Int(arc4random_uniform(10))
                var rightRightNumber = mirrorNumber(leftNumber)
                leftMidleNumber.text = String(leftLeftNumber)
                rightMidleNumber.text = String(rightRightNumber)
                
                var numberL = Int("\(leftLeftNumber)\(leftNumber)")!
                var numberR = Int("\(rightRightNumber)\(rightNumber)")!
                
                if numberL % numberR == 0 {
                    sign.text = "/"
                } else {
                    sign.text = ["+", "-", "*"].randomElement()!
                }
                
                
                switch sign.text {
                case "+": result = numberL + numberR
                case "-": result = numberL - numberR
                case "*": result = numberL * numberR
                default: result = numberL / numberR
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.25) { [self] in
                    if soundPlaing { AudioPlayerManager.shared.playAppearance() }
                    leftMidleNumber.isHidden = false
                    rightMidleNumber.isHidden = false
                    sign.isHidden = false
                    
                    let label = [firstAnswerLabel, secondAnswerLabel, thirdAnswerLabel, fourthAnswerLabel].randomElement()!
                    label.text = String(result)
                    label.tag = 8
                    
                    var numberOne = 0
                    var numberTwo = 0
                    var numberThree = 0
                    var nnumber = 0
                    var count = 0
                    for i in [firstAnswerLabel, secondAnswerLabel, thirdAnswerLabel, fourthAnswerLabel] {
                        if i != label {
                            nnumber = randomix(result)
                            
                            if count == 0 {
                                numberOne = nnumber
                                i.text = String(numberOne)
                                i.isHidden = false
                                count += 1
                            } else if count == 1 {
                                numberTwo = nnumber
                                if numberOne == numberTwo {
                                    numberTwo -= 2
                                }
                                i.text = String(numberTwo)
                                i.isHidden = false
                                count += 1
                            } else if count == 2 {
                                numberThree = nnumber
                                if numberThree == numberTwo || numberThree == numberOne {
                                    numberThree = numberTwo + numberOne
                                }
                                i.text = String(numberThree)
                                i.isHidden = false
                                count = 0
                            }
                            
                            
                        }
                    }
                    label.isHidden = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1)  {
                        if soundPlaing { AudioPlayerManager.shared.playTik() }
                        startTimer(seconds: 5)
                    }
                    if self.lifeCount == 1 {
                        self.value = String(Int(self.value)! - 50)
                    }
                    firstAnswer.isHidden = false
                    secondAnswer.isHidden = false
                    thirdAnswer.isHidden = false
                    fourthAnswer.isHidden = false
                }
            }
            
            
        } else if levelButton.tag == 2 {
            self.state = 2
            var leftLeftNumber = 0
            var rightRightNumber = 0
            rotationAnimation(miniCircle, 1.92)
            if soundPlaing { AudioPlayerManager.shared.playvzux() }
            var leftNumber = Int(arc4random_uniform(10))
            var rightNumber = mirrorNumber(leftNumber)
            if leftNumber == 5 {
                leftNumber = Int(arc4random_uniform(5))
                rightNumber = mirrorNumber(leftNumber)
            }
            leftMiniNumber.text = String(leftNumber)
            rightMiniNumber.text = String(rightNumber)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) { [self] in
                if soundPlaing { AudioPlayerManager.shared.playAppearance() }
                leftMiniNumber.isHidden = false
                rightMiniNumber.isHidden = false
                
                rotationAnimation(middleCircle, 1.92)
                if soundPlaing { AudioPlayerManager.shared.playvzux() }
                leftLeftNumber = Int(arc4random_uniform(10))
                rightRightNumber = mirrorNumber(leftNumber)
                leftMidleNumber.text = String(leftLeftNumber)
                rightMidleNumber.text = String(rightRightNumber)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [self] in
                if soundPlaing { AudioPlayerManager.shared.playAppearance() }
                leftMidleNumber.isHidden = false
                rightMidleNumber.isHidden = false
                
                rotationAnimation(bigCircle, 1.92)
                if soundPlaing { AudioPlayerManager.shared.playvzux() }
                var leftLeftLeftNumber = Int(arc4random_uniform(10))
                var rightRightRightNumber = mirrorNumber(leftNumber)
                leftBigNumber.text = String(leftLeftLeftNumber)
                rightBigNumber.text = String(rightRightRightNumber)
                
                var numberL = Int("\(leftLeftLeftNumber)\(leftLeftNumber)\(leftNumber)")!
                var numberR = Int("\(rightRightRightNumber)\(rightRightNumber)\(rightNumber)")!
                
                if numberL % numberR == 0 {
                    sign.text = "/"
                } else {
                    sign.text = ["+", "-"].randomElement()!
                }
                
                
                switch sign.text {
                case "+": result = numberL + numberR
                case "-": result = numberL - numberR
                default: result = numberL / numberR
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.25) { [self] in
                    if soundPlaing { AudioPlayerManager.shared.playAppearance() }
                    leftBigNumber.isHidden = false
                    rightBigNumber.isHidden = false
                    sign.isHidden = false
                    
                    let label = [firstAnswerLabel, secondAnswerLabel, thirdAnswerLabel, fourthAnswerLabel].randomElement()!
                    label.text = String(result)
                    label.tag = 8
                    
                    var numberOne = 0
                    var numberTwo = 0
                    var numberThree = 0
                    var nnumber = 0
                    var count = 0
                    for i in [firstAnswerLabel, secondAnswerLabel, thirdAnswerLabel, fourthAnswerLabel] {
                        if i != label {
                            nnumber = randomix(result)
                            
                            if count == 0 {
                                numberOne = nnumber
                                i.text = String(numberOne)
                                i.isHidden = false
                                count += 1
                            } else if count == 1 {
                                numberTwo = nnumber
                                if numberOne == numberTwo {
                                    numberTwo -= 2
                                }
                                i.text = String(numberTwo)
                                i.isHidden = false
                                count += 1
                            } else if count == 2 {
                                numberThree = nnumber
                                if numberThree == numberTwo || numberThree == numberOne {
                                    numberThree -= 1
                                }
                                i.text = String(numberThree)
                                i.isHidden = false
                                count = 0
                            }
                            
                            
                        }
                    }
                    label.isHidden = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1)  {
                        if soundPlaing { AudioPlayerManager.shared.playTik() }
                        startTimer(seconds: 10)
                    }
                    if self.lifeCount == 1 {
                        self.value = String(Int(self.value)! - 100)
                    }
                    firstAnswer.isHidden = false
                    secondAnswer.isHidden = false
                    thirdAnswer.isHidden = false
                    fourthAnswer.isHidden = false
                }
            }
        }
    }
    
    @objc private func firstAnswerPressed() {
        valueLogic(firstAnswerLabel)
    }
    
    @objc private func secondAnswerPressed() {
        valueLogic(secondAnswerLabel)
    }
    
    @objc private func thirdAnswerPressed() {
        valueLogic(thirdAnswerLabel)
    }
    
    @objc private func fourthAnswerPressed() {
        valueLogic(fourthAnswerLabel)
    }
    
    init(language: String, soundPlaing: Bool, value: String, mainBG: String, lifeCount: Int, state: Int) {
        self.language = language
        self.soundPlaing = soundPlaing
        self.value = value
        self.mainBG = mainBG
        self.lifeCount = lifeCount
        self.state = state
        super.init(nibName: nil, bundle: nil)
    }
                        
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    fileprivate func rotationAnimation(_ imageView: UIImageView, _ delay: Double) {
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        // задаем параметры анимации
        rotationAnimation.toValue = NSNumber(value: Double.pi * 2.0)
        rotationAnimation.duration = 2.0
        rotationAnimation.isCumulative = true
        rotationAnimation.repeatCount = Float.greatestFiniteMagnitude
        
        // добавляем анимацию на картинку
        imageView.layer.add(rotationAnimation, forKey: "rotationAnimation")
        
        // остановка анимации
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            let currentSpeed = imageView.layer.speed
            if currentSpeed != 0.0 {
                let currentAngle = imageView.layer.presentation()?.value(forKeyPath: "transform.rotation.z") as? NSNumber
                imageView.layer.speed = 0.0
                if let currentAngle = currentAngle {
                    let endValue = currentAngle.doubleValue.truncatingRemainder(dividingBy: Double.pi * 2)
                    let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
                    rotateAnimation.fromValue = endValue
                    rotateAnimation.toValue = NSNumber(value: 0.0)
                    rotateAnimation.duration = 1.0
                    imageView.layer.add(rotateAnimation, forKey: "rotateAnimation")
                }
            }
        }
    }
     
    private func setFont(_ label: UILabel, _ size: Double, _ border: Double) {
        label.font = UIFont(name: "PassionOne-Regular", size: size)
        ?? .systemFont(ofSize: size, weight: .bold)

        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            .strokeColor : UIColor.black,
            .strokeWidth : border,
            .foregroundColor : UIColor.white
        ]
        let myAttributedString = NSAttributedString(string: label.text!, attributes: strokeTextAttributes)
        label.attributedText = myAttributedString
    }
    
    private func showNumbers(_ leftNumber: UILabel, _ rightNumber: UILabel) {
        
    }
    
    private func mirrorNumber(_ number: Int) -> Int {
        switch number {
        case 0: return 5
        case 1: return 6
        case 2: return 7
        case 3: return 8
        case 4: return 9
        case 5: return 0
        case 6: return 1
        case 7: return 2
        case 8: return 3
        case 9: return 4
        default: return 0
        }
    }
    
    private func randomix(_ result: Int) -> Int {
        var number = 0
        if result > 0 {
            number = Int.random(in: 0 ... result - 1)
        } else if result == 0 {
            number = 0
        } else {
            number = Int.random(in: result + 1 ... 0)
        }
        
        return [number + result, number + result + 1, number + result - 1].randomElement()!
    }
    
    func startTimer(seconds: Int) {
        var timeRemaining = seconds
        let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            timeRemaining -= 1
            
            if timeRemaining == 0 {
                timer.invalidate()
                self.timerLabel.text! = "TIMER: 0\(timeRemaining):00"
                AudioPlayerManager.shared.stopTik()
                
                if self.noMusicCounter == 0 {
                    if self.soundPlaing { AudioPlayerManager.shared.playtimeOut() }
                }
                if self.lifeCount == 1 {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.view.window?.rootViewController = UINavigationController(rootViewController: LoseViewController(
                            language: self.language,
                            soundPlaing: self.soundPlaing,
                            value: self.value,
                            mainBG: self.mainBG))
                    }
                } else {
                    self.lifeCount -= 1
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.view.window?.rootViewController = UINavigationController(rootViewController: GameViewController(
                            language: self.language,
                            soundPlaing: self.soundPlaing,
                            value: self.value,
                            mainBG: self.mainBG,
                            lifeCount: self.lifeCount,
                            state: self.state))
                    }
                }
                
            } else {
                self.timerLabel.text! = "TIMER: 0\(timeRemaining):00"
            }
        }
        
        RunLoop.current.add(timer, forMode: .common)
    }
    
    private func increaseValue() {
        if levelButton.tag == 0 {
            self.value = String(Int(self.value)! + 10)
        } else if levelButton.tag == 1 {
            self.value = String(Int(self.value)! + 50)
        } else if levelButton.tag == 2 {
            self.value = String(Int(self.value)! + 100)
        }
    }
    
    private func decreaseValue() {
        if levelButton.tag == 0 {
            self.value = String(Int(self.value)! - 10)
        } else if levelButton.tag == 1 {
            self.value = String(Int(self.value)! - 50)
        } else if levelButton.tag == 2 {
            self.value = String(Int(self.value)! - 100)
        }
    }
    
    private func valueLogic(_ label: UILabel) {
        AudioPlayerManager.shared.stopTik()
        self.noMusicCounter = 1
        if label.text == String(result) {
            if soundPlaing { AudioPlayerManager.shared.playcorrectСhoice() }
            increaseValue()
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.view.window?.rootViewController = UINavigationController(rootViewController: WinViewController(
                    language: self.language,
                    soundPlaing: self.soundPlaing,
                    value: self.value,
                    mainBG: self.mainBG))
            }
        } else {
            if soundPlaing { AudioPlayerManager.shared.playcorrectСhoice() }
            if lifeCount == 1 {
//                decreaseValue()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.view.window?.rootViewController = UINavigationController(rootViewController: LoseViewController(
                        language: self.language,
                        soundPlaing: self.soundPlaing,
                        value: self.value,
                        mainBG: self.mainBG))
                    
                }
            } else {
                self.lifeCount -= 1
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self.view.window?.rootViewController = UINavigationController(rootViewController: GameViewController(
                        language: self.language,
                        soundPlaing: self.soundPlaing,
                        value: self.value,
                        mainBG: self.mainBG,
                        lifeCount: self.lifeCount,
                        state: self.state))
            }
            }
        }
    }
    
    private func customizeInterface() {
        switch mainBG {
        case "BG_Blue theme":
            self.backGround.image = UIImage(named: mainBG)
            self.miniCircle.image = UIImage(named: "Blue tier 1 wheel")
            self.middleCircle.image = UIImage(named: "Blue tier 2 wheel")
            self.bigCircle.image = UIImage(named: "Blue tier 3 wheel")
            self.miniWheelElement.image = UIImage(named: "Blue tier 1 wheel element")
            self.midleWheelElement.image = UIImage(named: "Blue tier 2 wheel element")
            self.bigWheelElement.image = UIImage(named: "Blue tier 3 wheel element")
        case "BG_Red theme":
            self.backGround.image = UIImage(named: mainBG)
            self.miniCircle.image = UIImage(named: "Red tier 1 wheel")
            self.middleCircle.image = UIImage(named: "Red tier 2 wheel")
            self.bigCircle.image = UIImage(named: "Red tier 3 wheel")
            self.miniWheelElement.image = UIImage(named: "Red tier 1 wheel element")
            self.midleWheelElement.image = UIImage(named: "Red tier 2 wheel element")
            self.bigWheelElement.image = UIImage(named: "Red tier 3 wheel element")
        case "BG_Yellow theme":
            self.backGround.image = UIImage(named: mainBG)
            self.miniCircle.image = UIImage(named: "Yellow tier 1 wheel")
            self.middleCircle.image = UIImage(named: "Yellow tier 2 wheel")
            self.bigCircle.image = UIImage(named: "Yellow tier 3 wheel")
            self.miniWheelElement.image = UIImage(named: "Yellow tier 1 wheel element")
            self.midleWheelElement.image = UIImage(named: "Yellow tier 2 wheel element")
            self.bigWheelElement.image = UIImage(named: "Yellow tier 3 wheel element")
        case "BG_Blue-green theme":
            self.backGround.image = UIImage(named: mainBG)
            self.miniCircle.image = UIImage(named: "Blue-green tier 1 wheel")
            self.middleCircle.image = UIImage(named: "Blue-green tier 2 wheel")
            self.bigCircle.image = UIImage(named: "Blue-green tier 3 wheel")
            self.miniWheelElement.image = UIImage(named: "Blue-green tier 1 wheel element")
            self.midleWheelElement.image = UIImage(named: "Blue-green tier 2 wheel element")
            self.bigWheelElement.image = UIImage(named: "Blue-green tier 3 wheel element")
        case "BG_Yellow-red theme":
            self.backGround.image = UIImage(named: mainBG)
            self.miniCircle.image = UIImage(named: "Yellow-red tier 1 wheel")
            self.middleCircle.image = UIImage(named: "Yellow-red tier 2 wheel")
            self.bigCircle.image = UIImage(named: "Yellow-red tier 3 wheel")
            self.miniWheelElement.image = UIImage(named: "Yellow-red tier 1 wheel element")
            self.midleWheelElement.image = UIImage(named: "Yellow-red tier 2 wheel element")
            self.bigWheelElement.image = UIImage(named: "Yellow-red tier 3 wheel element")
        default:
            self.backGround.image = UIImage(named: mainBG)
            self.miniCircle.image = UIImage(named: "Tier 1 wheel")
            self.middleCircle.image = UIImage(named: "Tier 2 wheel")
            self.bigCircle.image = UIImage(named: "Tier 3 wheel")
            self.miniWheelElement.image = UIImage(named: "Tier 1 wheel element")
            self.midleWheelElement.image = UIImage(named: "Tier 2 wheel element")
            self.bigWheelElement.image = UIImage(named: "Tier 3 wheel element")
        }
    }
    
    private func stateCircle() {
        if state == 0 {
            levelButton.tag = 0
            levelButton.setBackgroundImage(UIImage(named: "1 level_btn"), for: .normal)
            timerLabel.text = "TIMER: 03:00"
            incomeLabel.text = "POINTS: 10"
            miniWheelElement.isHidden = false
            midleWheelElement.isHidden = true
            bigWheelElement.isHidden = true
        } else if state == 1 {
            levelButton.tag = 1
            levelButton.setBackgroundImage(UIImage(named: "2 level_btn"), for: .normal)
            timerLabel.text = "TIMER: 05:00"
            incomeLabel.text = "POINTS: 50"
            miniWheelElement.isHidden = true
            midleWheelElement.isHidden = false
            bigWheelElement.isHidden = true
        } else {
            levelButton.tag = 2
            levelButton.setBackgroundImage(UIImage(named: "3 level_btn"), for: .normal)
            timerLabel.text = "TIMER: 10:00"
            incomeLabel.text = "POINTS: 100"
            miniWheelElement.isHidden = true
            midleWheelElement.isHidden = true
            bigWheelElement.isHidden = false
        }
    }
}


