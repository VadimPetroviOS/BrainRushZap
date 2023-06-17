//
//  WinViewController.swift
//  BrainRushZap
//
//  Created by Вадим on 06.05.2023.
//

import UIKit

final class WinViewController: UIViewController {

    var language: String
    var soundPlaing: Bool
    var value: String
    var mainBG: String
    
    private var buttonPressCounter: Int = 0
    
    private let backGround: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let cloverBG: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Clover on the BG")
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
    
    private let repeatButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Repeat_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(repeatPressed), for: .touchUpInside)
        return button
    }()
    
    private let frameBalance: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Frame for balance")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var balance: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(soundPressed), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    private let stars: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Stars")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let win: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Win")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let wordsSupport: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCustomNavigation()
        setSubviews()
        setConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        backGround.image = UIImage(named: mainBG)
        balance.text = value
        setFont(balance, Constants.setSizeY(65.0), -2.0)
        setLanguage()
    }

    private func setCustomNavigation() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        customNavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 110))
        view.addSubview(customNavigationBar)
    }
    
    private func setSubviews() {
        view.addSubview(backGround)
        backGround.addSubview(cloverBG)
        view.addSubview(optionsButton)
        backGround.addSubview(additionalOptions)
        view.addSubview(sound)
        view.addSubview(repeatButton)
        backGround.addSubview(frameBalance)
        frameBalance.addSubview(balance)
        backGround.addSubview(stars)
        backGround.addSubview(win)
        backGround.addSubview(wordsSupport)

        
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backGround.topAnchor.constraint(equalTo: view.topAnchor),
            backGround.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backGround.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backGround.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            cloverBG.topAnchor.constraint(equalTo: backGround.topAnchor),
            cloverBG.leadingAnchor.constraint(equalTo: backGround.leadingAnchor),
            cloverBG.trailingAnchor.constraint(equalTo: backGround.trailingAnchor),
            cloverBG.bottomAnchor.constraint(equalTo: backGround.bottomAnchor),
            
            optionsButton.topAnchor.constraint(equalTo: backGround.topAnchor),
            optionsButton.leadingAnchor.constraint(equalTo: backGround.leadingAnchor),
            optionsButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(106)),
            optionsButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(100)),
            
            repeatButton.topAnchor.constraint(equalTo: backGround.topAnchor),
            repeatButton.trailingAnchor.constraint(equalTo: backGround.trailingAnchor),
            repeatButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(106)),
            repeatButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(100)),
            
            frameBalance.topAnchor.constraint(equalTo: optionsButton.bottomAnchor, constant: 10),
            frameBalance.centerXAnchor.constraint(equalTo: backGround.centerXAnchor),
            frameBalance.widthAnchor.constraint(equalToConstant: Constants.setSizeY(210)),
            frameBalance.heightAnchor.constraint(equalToConstant: Constants.setSizeY(70)),
            
            balance.centerXAnchor.constraint(equalTo: frameBalance.centerXAnchor),
            balance.centerYAnchor.constraint(equalTo: frameBalance.centerYAnchor),
            
            additionalOptions.topAnchor.constraint(equalTo: backGround.topAnchor),
            additionalOptions.leadingAnchor.constraint(equalTo: backGround.leadingAnchor),
            additionalOptions.widthAnchor.constraint(equalToConstant: Constants.setSizeY(83)),
            additionalOptions.heightAnchor.constraint(equalToConstant: Constants.setSizeY(175)),

            sound.topAnchor.constraint(equalTo: optionsButton.bottomAnchor, constant: Constants.setSizeY(7)),
            sound.centerXAnchor.constraint(equalTo: additionalOptions.centerXAnchor),
            sound.widthAnchor.constraint(equalToConstant: Constants.setSizeY(53)),
            sound.heightAnchor.constraint(equalToConstant: Constants.setSizeY(53)),
            
            stars.bottomAnchor.constraint(equalTo: frameBalance.topAnchor, constant: -20),
            stars.centerXAnchor.constraint(equalTo: frameBalance.centerXAnchor),
            stars.widthAnchor.constraint(equalToConstant: Constants.setSizeY(145)),
            stars.heightAnchor.constraint(equalToConstant: Constants.setSizeY(55)),
            
            win.topAnchor.constraint(equalTo: frameBalance.bottomAnchor, constant: 50),
            win.centerXAnchor.constraint(equalTo: backGround.centerXAnchor),
            win.widthAnchor.constraint(equalToConstant: Constants.setSizeY(330)),
            win.heightAnchor.constraint(equalToConstant: Constants.setSizeY(175)),
            
            wordsSupport.topAnchor.constraint(equalTo: win.bottomAnchor, constant: 30),
            wordsSupport.centerXAnchor.constraint(equalTo: backGround.centerXAnchor),
            wordsSupport.widthAnchor.constraint(equalToConstant: Constants.setSizeY(310)),
            wordsSupport.heightAnchor.constraint(equalToConstant: Constants.setSizeY(210)),
            
        ])
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
    
    
    @objc func optionsPressed() {
        if buttonPressCounter % 2 == 0 {
            additionalOptions.isHidden = false
            sound.isHidden = false
        } else {
            additionalOptions.isHidden = true
            sound.isHidden = true
        }
        buttonPressCounter += 1
        if soundPlaing { AudioPlayerManager.shared.playSoundEffect() }
        
    }
    
    @objc func repeatPressed() {
        self.view.window?.rootViewController = UINavigationController(rootViewController: GameViewController(
            language: language,
            soundPlaing: soundPlaing,
            value: value,
            mainBG: mainBG,
            lifeCount: 3,
            state: 0))
        settingsDidChange()
        if soundPlaing { AudioPlayerManager.shared.playSoundEffect() }
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
    
    init(language: String, soundPlaing: Bool, value: String, mainBG: String) {
        self.language = language
        self.soundPlaing = soundPlaing
        self.value = value
        self.mainBG = mainBG
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func settingsDidChange() {
        let defaults = UserDefaults.standard
        defaults.set(language, forKey: "language")
        defaults.set(soundPlaing, forKey: "soundPlaing")
        defaults.set(value, forKey: "value")
        defaults.set(mainBG, forKey: "mainBG")
        defaults.synchronize()
    }
    
    private func setLanguage() {
        if language == "en" {
            wordsSupport.image = UIImage(named: "Words of support_win")
        } else {
            wordsSupport.image = UIImage(named: "continue")
        }
    }
}



