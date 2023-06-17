//
//  StoreView.swift
//  BrainRushZap
//
//  Created by Вадим on 03.05.2023.
//

import UIKit

class StoreCell: UICollectionViewCell {
    
    private var buttonPressCounter: Int = 0
    let defaults = UserDefaults.standard
    
    var storeData: StoreData? {
        didSet {
            guard let unwrappedstoreData = storeData else {return}
            setBackGround.image = UIImage(named: unwrappedstoreData.backGround)
            customizeInterface()
            buyLabel.text = unwrappedstoreData.nameButton
            
            setLanguage()
            if buyLabel.text == "GREEN-BLUE-300" || buyLabel.text == "YELLOW-RED-500" ||
                buyLabel.text == "VERDE-AZUL-300" || buyLabel.text == "VERMELHO-100" || buyLabel.text == "AMARELO-50"{
                setFont(buyLabel, Constants.setSizeY(48.0), 0.0)
            } else if buyLabel.text == "AMARELO-VERMELHO-500"{
                setFont(buyLabel, Constants.setSizeY(30.0), 0.0)
            } else {
                setFont(buyLabel, Constants.setSizeY(65.0), 0.0)
            }
        }
    }
    
    var language: String?
    var soundPlaing: Bool?
    var mainBG: String?
    var value: String? {
        didSet {
            let savedValue = defaults.object(forKey: "value") as? String
            balance.text = savedValue
            setFont(balance, Constants.setSizeY(65.0), -2.0)
        }
    }
    
    private let imageContainerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let setBackGround: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
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
    
    private let wheelElement: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let miniCircle: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let middleCircle: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let bigCircle: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let buyButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Let's win_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buyButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private let buyLabel: UILabel = {
        let label = UILabel()
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
    
    private let overView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white.withAlphaComponent(0.8)
        view.isHidden = true
        return view
    }()
    
    private let applyTheme: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Apply theme_pop-up")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        return imageView
    }()
    
    private let applyLabel: UILabel = {
        let label = UILabel()
        label.text = "APPLY?"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    private let applyYes: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "Yes_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(applyYesPressed), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    private let applyNo: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "No_btn"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(applyNoPressed), for: .touchUpInside)
        button.isHidden = true
        return button
    }()
    
    private let wrongBuyLabel: UILabel = {
        let label = UILabel()
        label.text = "You need credits"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubView()
        setConstraints()
        setFont(applyLabel, Constants.setSizeY(65.0), 0)
        setFont(wrongBuyLabel, Constants.setSizeY(25.0), 0)
        setFont(balance, Constants.setSizeY(65.0), -2.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setFont(_ label: UILabel, _ size: Double, _ border: Double) {
        label.font = UIFont(name: "PassionOne-Regular", size: size)
        ?? .systemFont(ofSize: size, weight: .bold)

        let strokeTextAttributes: [NSAttributedString.Key: Any] = [
            .strokeColor : UIColor.black,
            .strokeWidth : border,
            .foregroundColor : UIColor.white
        ]
        if let labelText = label.text {
            let myAttributedString = NSAttributedString(string: labelText, attributes: strokeTextAttributes)
            label.attributedText = myAttributedString
        }
    }
    
    private func setSubView() {
        self.addSubview(imageContainerView)
        self.addSubview(setBackGround)
        self.addSubview(optionsButton)
        self.addSubview(cancelButton)
        setBackGround.addSubview(additionalOptions)
        self.addSubview(sound)
        setBackGround.addSubview(frameBalance)
        frameBalance.addSubview(balance)
        setBackGround.addSubview(bigCircle)
        setBackGround.addSubview(middleCircle)
        setBackGround.addSubview(miniCircle)
        setBackGround.addSubview(wheelElement)
        self.addSubview(buyButton)
        buyButton.addSubview(buyLabel)
        self.addSubview(overView)
        self.addSubview(applyTheme)
        applyTheme.addSubview(applyLabel)
        self.addSubview(applyYes)
        self.addSubview(applyNo)
        setBackGround.addSubview(wrongBuyLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageContainerView.topAnchor.constraint(equalTo: self.topAnchor, constant: -13),
            imageContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            imageContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            imageContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            setBackGround.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
            setBackGround.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor),
            setBackGround.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor),
            setBackGround.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor),
            
            optionsButton.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
            optionsButton.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor),
            optionsButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(106)),
            optionsButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(100)),
            
            cancelButton.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
            cancelButton.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor),
            cancelButton.widthAnchor.constraint(equalToConstant: Constants.setSizeY(106)),
            cancelButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(100)),
            
            frameBalance.topAnchor.constraint(equalTo: optionsButton.bottomAnchor, constant: 10),
            frameBalance.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor),
            frameBalance.widthAnchor.constraint(equalToConstant: Constants.setSizeX(210)),
            frameBalance.heightAnchor.constraint(equalToConstant: Constants.setSizeY(70)),
            
            balance.centerXAnchor.constraint(equalTo: frameBalance.centerXAnchor),
            balance.centerYAnchor.constraint(equalTo: frameBalance.centerYAnchor),
            
            wheelElement.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor),
            wheelElement.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor),
            wheelElement.widthAnchor.constraint(equalToConstant: Constants.setSizeY(365)),
            wheelElement.heightAnchor.constraint(equalToConstant: Constants.setSizeY(110)),
            
            miniCircle.centerXAnchor.constraint(equalTo: wheelElement.centerXAnchor),
            miniCircle.centerYAnchor.constraint(equalTo: wheelElement.centerYAnchor),
            miniCircle.widthAnchor.constraint(equalToConstant: Constants.setSizeY(175)),
            miniCircle.heightAnchor.constraint(equalToConstant: Constants.setSizeY(175)),
            
            middleCircle.centerXAnchor.constraint(equalTo: wheelElement.centerXAnchor),
            middleCircle.centerYAnchor.constraint(equalTo: wheelElement.centerYAnchor),
            middleCircle.widthAnchor.constraint(equalToConstant: Constants.setSizeY(265)),
            middleCircle.heightAnchor.constraint(equalToConstant: Constants.setSizeY(265)),
            
            bigCircle.centerXAnchor.constraint(equalTo: wheelElement.centerXAnchor),
            bigCircle.centerYAnchor.constraint(equalTo: wheelElement.centerYAnchor),
            bigCircle.widthAnchor.constraint(equalToConstant: Constants.setSizeY(345)),
            bigCircle.heightAnchor.constraint(equalToConstant: Constants.setSizeY(345)),
            
            buyButton.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor),
            buyButton.topAnchor.constraint(equalTo: bigCircle.bottomAnchor, constant: Constants.setSizeY(60)),
            buyButton.widthAnchor.constraint(equalToConstant: Constants.setSizeX(325)),
            buyButton.heightAnchor.constraint(equalToConstant: Constants.setSizeY(105)),
            buyLabel.centerXAnchor.constraint(equalTo: buyButton.centerXAnchor),
            buyLabel.centerYAnchor.constraint(equalTo: buyButton.centerYAnchor),
            
            additionalOptions.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
            additionalOptions.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor),
            additionalOptions.widthAnchor.constraint(equalToConstant: Constants.setSizeY(83)),
            additionalOptions.heightAnchor.constraint(equalToConstant: Constants.setSizeY(175)),

            sound.topAnchor.constraint(equalTo: optionsButton.bottomAnchor, constant: Constants.setSizeY(7)),
            sound.centerXAnchor.constraint(equalTo: additionalOptions.centerXAnchor),
            sound.widthAnchor.constraint(equalToConstant: Constants.setSizeY(53)),
            sound.heightAnchor.constraint(equalToConstant: Constants.setSizeY(53)),
            
            overView.topAnchor.constraint(equalTo: imageContainerView.topAnchor),
            overView.leadingAnchor.constraint(equalTo: imageContainerView.leadingAnchor),
            overView.trailingAnchor.constraint(equalTo: imageContainerView.trailingAnchor),
            overView.bottomAnchor.constraint(equalTo: imageContainerView.bottomAnchor),
            
            applyTheme.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor),
            applyTheme.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor),
            applyTheme.widthAnchor.constraint(equalToConstant: Constants.setSizeY(325)),
            applyTheme.heightAnchor.constraint(equalToConstant: Constants.setSizeY(190)),
            applyLabel.centerXAnchor.constraint(equalTo: applyTheme.centerXAnchor),
            applyLabel.topAnchor.constraint(equalTo: applyTheme.topAnchor, constant: Constants.setSizeY(7)),
            
            applyYes.centerXAnchor.constraint(equalTo: applyTheme.centerXAnchor, constant: Constants.setSizeY(-75)),
            applyYes.topAnchor.constraint(equalTo: applyLabel.bottomAnchor, constant: Constants.setSizeY(7)),
            applyYes.widthAnchor.constraint(equalToConstant: Constants.setSizeY(130)),
            applyYes.heightAnchor.constraint(equalToConstant: Constants.setSizeY(75)),
            
            applyNo.centerXAnchor.constraint(equalTo: applyTheme.centerXAnchor, constant: Constants.setSizeY(75)),
            applyNo.topAnchor.constraint(equalTo: applyLabel.bottomAnchor, constant: Constants.setSizeY(7)),
            applyNo.widthAnchor.constraint(equalToConstant: Constants.setSizeY(130)),
            applyNo.heightAnchor.constraint(equalToConstant: Constants.setSizeY(75)),
            
            wrongBuyLabel.bottomAnchor.constraint(equalTo: buyButton.topAnchor, constant: Constants.setSizeY(-15)),
            wrongBuyLabel.centerXAnchor.constraint(equalTo: applyTheme.centerXAnchor),
        ])
    }
    
    @objc func cancelPressed() {
        if soundPlaing! { AudioPlayerManager.shared.playSoundEffect() }
        self.window?.rootViewController = UINavigationController(rootViewController: LetsWinViewController(
            language: language!,
            soundPlaing: soundPlaing!,
            value: (defaults.object(forKey: "value") as? String)!,
            mainBG: mainBG!))
        settingsDidChange()
    }
    
    @objc func optionsPressed() {
        if soundPlaing! { AudioPlayerManager.shared.playSoundEffect() }
        if buttonPressCounter % 2 == 0 {
            additionalOptions.isHidden = false
            sound.isHidden = false
        } else {
            additionalOptions.isHidden = true
            sound.isHidden = true
        }
        buttonPressCounter += 1
    }
    
    @objc func soundPressed() {
        if soundPlaing! {
            soundPlaing = false
            sound.setBackgroundImage(UIImage(named: "Soundless_btn"), for: .normal)
            AudioPlayerManager.shared.pause()
        } else {
            soundPlaing = true
            sound.setBackgroundImage(UIImage(named: "With sound_btn"), for: .normal)
            AudioPlayerManager.shared.play()
        }
        if soundPlaing! { AudioPlayerManager.shared.playSoundEffect() }
    }
    
    @objc func applyNoPressed() {
        if soundPlaing! { AudioPlayerManager.shared.playSoundEffect() }
        overView.isHidden = true
        applyTheme.isHidden = true
        applyLabel.isHidden = true
        applyYes.isHidden = true
        applyNo.isHidden = true
        if let collectionView = self.superview as? UICollectionView {
            collectionView.isScrollEnabled = true
        }
        settingsDidChange()
    }
    
    @objc func applyYesPressed() {
        if soundPlaing! { AudioPlayerManager.shared.playSoundEffect() }
        switch setBackGround.image {
        case UIImage(named: "BG_Blue theme"):
            mainBG = "BG_Blue theme"
            
            if defaults.object(forKey: "BLUE") as? String == "BLUE-10" {
                balance.text = String(Int(balance.text!)! - 10)
                balance.text = String(Int(value!)! - 10)
            } else {
                balance.text = String(Int(balance.text!)!)
                balance.text = String(Int(value!)!)
            }
            let defaults = UserDefaults.standard
            DispatchQueue.main.async { [self] in
                defaults.set(balance.text!, forKey: "value")
                defaults.synchronize()
            }
            
            defaults.set("BLUE", forKey: "BLUE")
        case UIImage(named: "BG_Yellow theme"):
            mainBG = "BG_Yellow theme"
            
            if defaults.object(forKey: "YELLOW") as? String == "YELLOW-50" {
                balance.text = String(Int(balance.text!)! - 50)
                balance.text = String(Int(value!)! - 50)
            } else {
                balance.text = String(Int(balance.text!)!)
                balance.text = String(Int(value!)!)
            }
            let defaults = UserDefaults.standard
            DispatchQueue.main.async { [self] in
                defaults.set(balance.text!, forKey: "value")
                defaults.synchronize()
            }
            
            defaults.set("YELLOW", forKey: "YELLOW")
        case UIImage(named: "BG_Red theme"):
            mainBG = "BG_Red theme"
            
            if defaults.object(forKey: "RED") as? String == "RED-100" {
                balance.text = String(Int(balance.text!)! - 100)
                balance.text = String(Int(value!)! - 100)
            } else {
                balance.text = String(Int(balance.text!)!)
                balance.text = String(Int(value!)!)
            }
            let defaults = UserDefaults.standard
            DispatchQueue.main.async { [self] in
                defaults.set(balance.text!, forKey: "value")
                defaults.synchronize()
            }
            
            defaults.set("RED", forKey: "RED")
        case UIImage(named: "BG_Blue-green theme"):
            mainBG = "BG_Blue-green theme"
            
            if defaults.object(forKey: "GREEN-BLUE") as? String == "GREEN-BLUE-300" {
                balance.text = String(Int(balance.text!)! - 300)
                balance.text = String(Int(value!)! - 300)
            } else {
                balance.text = String(Int(balance.text!)!)
                balance.text = String(Int(value!)!)
            }
            let defaults = UserDefaults.standard
            DispatchQueue.main.async { [self] in
                defaults.set(balance.text!, forKey: "value")
                defaults.synchronize()
            }
            
            defaults.set("GREEN-BLUE", forKey: "GREEN-BLUE")
        case UIImage(named: "BG_Yellow-red theme"):
            mainBG = "BG_Yellow-red theme"
            
            if defaults.object(forKey: "YELLOW-RED") as? String == "YELLOW-RED-500" {
                balance.text = String(Int(balance.text!)! - 500)
                balance.text = String(Int(value!)! - 500)
            } else {
                balance.text = String(Int(balance.text!)!)
                balance.text = String(Int(value!)!)
            }
            let defaults = UserDefaults.standard
            DispatchQueue.main.async { [self] in
                defaults.set(balance.text!, forKey: "value")
                defaults.synchronize()
            }
            
            defaults.set("YELLOW-RED", forKey: "YELLOW-RED")
        default:
            mainBG = "Main BG"
            
            balance.text = String(Int(balance.text!)!)
            balance.text = String(Int(value!)!)
            let defaults = UserDefaults.standard
            DispatchQueue.main.async { [self] in
                defaults.set(balance.text!, forKey: "value")
                defaults.synchronize()
            }
            
            defaults.set("GREEN", forKey: "GREEN")
        }
        
        self.window?.rootViewController = UINavigationController(rootViewController: LetsWinViewController(
            language: language!,
            soundPlaing: soundPlaing!,
            value: balance.text!,
            mainBG: mainBG!))
        settingsDidChange()
    }
    
    @objc func buyButtonPressed() {
        if soundPlaing! { AudioPlayerManager.shared.playSoundEffect() }
        switch setBackGround.image {
        case UIImage(named: "BG_Blue theme"):
            if defaults.object(forKey: "BLUE") as? String == "BLUE-10" {
                if Int(balance.text!)! - 10 < 0 {
                    wrongBuyLabel.isHidden = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.wrongBuyLabel.isHidden = true
                    }
                    overView.isHidden = true
                    applyTheme.isHidden = true
                    applyLabel.isHidden = true
                    applyYes.isHidden = true
                    applyNo.isHidden = true
                } else {
                    overView.isHidden = false
                    applyTheme.isHidden = false
                    applyLabel.isHidden = false
                    applyYes.isHidden = false
                    applyNo.isHidden = false
                    if let collectionView = self.superview as? UICollectionView {
                        collectionView.isScrollEnabled = false
                    }
                }
            } else {
                overView.isHidden = false
                applyTheme.isHidden = false
                applyLabel.isHidden = false
                applyYes.isHidden = false
                applyNo.isHidden = false
                if let collectionView = self.superview as? UICollectionView {
                    collectionView.isScrollEnabled = false
                }
            }
        case UIImage(named: "BG_Yellow theme"):
            if defaults.object(forKey: "YELLOW") as? String == "YELLOW-50" {
                if Int(balance.text!)! - 50 < 0 {
                    wrongBuyLabel.isHidden = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.wrongBuyLabel.isHidden = true
                    }
                    overView.isHidden = true
                    applyTheme.isHidden = true
                    applyLabel.isHidden = true
                    applyYes.isHidden = true
                    applyNo.isHidden = true
                } else {
                    overView.isHidden = false
                    applyTheme.isHidden = false
                    applyLabel.isHidden = false
                    applyYes.isHidden = false
                    applyNo.isHidden = false
                    if let collectionView = self.superview as? UICollectionView {
                        collectionView.isScrollEnabled = false
                    }
                }
            } else {
                overView.isHidden = false
                applyTheme.isHidden = false
                applyLabel.isHidden = false
                applyYes.isHidden = false
                applyNo.isHidden = false
                if let collectionView = self.superview as? UICollectionView {
                    collectionView.isScrollEnabled = false
                }
            }
        case UIImage(named: "BG_Red theme"):
            if defaults.object(forKey: "RED") as? String == "RED-100" {
                if Int(balance.text!)! - 100 < 0 {
                    wrongBuyLabel.isHidden = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.wrongBuyLabel.isHidden = true
                    }
                    overView.isHidden = true
                    applyTheme.isHidden = true
                    applyLabel.isHidden = true
                    applyYes.isHidden = true
                    applyNo.isHidden = true
                } else {
                    overView.isHidden = false
                    applyTheme.isHidden = false
                    applyLabel.isHidden = false
                    applyYes.isHidden = false
                    applyNo.isHidden = false
                    if let collectionView = self.superview as? UICollectionView {
                        collectionView.isScrollEnabled = false
                    }
                }
            } else {
                overView.isHidden = false
                applyTheme.isHidden = false
                applyLabel.isHidden = false
                applyYes.isHidden = false
                applyNo.isHidden = false
                if let collectionView = self.superview as? UICollectionView {
                    collectionView.isScrollEnabled = false
                }
            }
        case UIImage(named: "BG_Blue-green theme"):
            
            if defaults.object(forKey: "GREEN-BLUE") as? String == "GREEN-BLUE-300" {
                if Int(balance.text!)! - 300 < 0 {
                    wrongBuyLabel.isHidden = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.wrongBuyLabel.isHidden = true
                    }
                    overView.isHidden = true
                    applyTheme.isHidden = true
                    applyLabel.isHidden = true
                    applyYes.isHidden = true
                    applyNo.isHidden = true
                } else {
                    overView.isHidden = false
                    applyTheme.isHidden = false
                    applyLabel.isHidden = false
                    applyYes.isHidden = false
                    applyNo.isHidden = false
                    if let collectionView = self.superview as? UICollectionView {
                        collectionView.isScrollEnabled = false
                    }
                }
            } else {
                overView.isHidden = false
                applyTheme.isHidden = false
                applyLabel.isHidden = false
                applyYes.isHidden = false
                applyNo.isHidden = false
                if let collectionView = self.superview as? UICollectionView {
                    collectionView.isScrollEnabled = false
                }
            }
            
            
            
        case UIImage(named: "BG_Yellow-red theme"):
            if defaults.object(forKey: "YELLOW-RED") as? String == "YELLOW-RED-500" {
                if Int(balance.text!)! - 500 < 0 {
                    wrongBuyLabel.isHidden = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        self.wrongBuyLabel.isHidden = true
                    }
                    overView.isHidden = true
                    applyTheme.isHidden = true
                    applyLabel.isHidden = true
                    applyYes.isHidden = true
                    applyNo.isHidden = true
                } else {
                    overView.isHidden = false
                    applyTheme.isHidden = false
                    applyLabel.isHidden = false
                    applyYes.isHidden = false
                    applyNo.isHidden = false
                    if let collectionView = self.superview as? UICollectionView {
                        collectionView.isScrollEnabled = false
                    }
                }
            } else {
                overView.isHidden = false
                applyTheme.isHidden = false
                applyLabel.isHidden = false
                applyYes.isHidden = false
                applyNo.isHidden = false
                if let collectionView = self.superview as? UICollectionView {
                    collectionView.isScrollEnabled = false
                }
            }
        default:
            overView.isHidden = false
            applyTheme.isHidden = false
            applyLabel.isHidden = false
            applyYes.isHidden = false
            applyNo.isHidden = false
            
            if let collectionView = self.superview as? UICollectionView {
                collectionView.isScrollEnabled = false
            }
        }
        
    }
    
    private func customizeInterface() {
        switch setBackGround.image {
        case UIImage(named: "BG_Blue theme"):
            self.miniCircle.image = UIImage(named: "Blue tier 1 wheel")
            self.middleCircle.image = UIImage(named: "Blue tier 2 wheel")
            self.bigCircle.image = UIImage(named: "Blue tier 3 wheel")
            self.wheelElement.image = UIImage(named: "Blue tier 3 wheel element")
        case UIImage(named: "BG_Red theme"):
            self.miniCircle.image = UIImage(named: "Red tier 1 wheel")
            self.middleCircle.image = UIImage(named: "Red tier 2 wheel")
            self.bigCircle.image = UIImage(named: "Red tier 3 wheel")
            self.wheelElement.image = UIImage(named: "Red tier 3 wheel element")
        case UIImage(named: "BG_Yellow theme"):
            self.miniCircle.image = UIImage(named: "Yellow tier 1 wheel")
            self.middleCircle.image = UIImage(named: "Yellow tier 2 wheel")
            self.bigCircle.image = UIImage(named: "Yellow tier 3 wheel")
            self.wheelElement.image = UIImage(named: "Yellow tier 3 wheel element")
        case UIImage(named: "BG_Blue-green theme"):
            self.miniCircle.image = UIImage(named: "Blue-green tier 1 wheel")
            self.middleCircle.image = UIImage(named: "Blue-green tier 2 wheel")
            self.bigCircle.image = UIImage(named: "Blue-green tier 3 wheel")
            self.wheelElement.image = UIImage(named: "Blue-green tier 3 wheel element")
        case UIImage(named: "BG_Yellow-red theme"):
            self.miniCircle.image = UIImage(named: "Yellow-red tier 1 wheel")
            self.middleCircle.image = UIImage(named: "Yellow-red tier 2 wheel")
            self.bigCircle.image = UIImage(named: "Yellow-red tier 3 wheel")
            self.wheelElement.image = UIImage(named: "Yellow-red tier 3 wheel element")
        default:
            self.miniCircle.image = UIImage(named: "Tier 1 wheel")
            self.middleCircle.image = UIImage(named: "Tier 2 wheel")
            self.bigCircle.image = UIImage(named: "Tier 3 wheel")
            self.wheelElement.image = UIImage(named: "Tier 3 wheel element")
        }
    }
    
    private func setLanguage() {
        
        if language == "po" {
            
            switch buyLabel.text {
            case "GREEN-0":
                buyLabel.text = "VERDE-0"
            case "GREEN":
                buyLabel.text = "VERDE"
            case "BLUE-10":
                buyLabel.text = "AZUL-10"
            case "BLUE":
                buyLabel.text = "AZUL"
            case "YELLOW-50":
                buyLabel.text = "AMARELO-50"
            case "YELLOW":
                buyLabel.text = "AMARELO"
            case "RED-100":
                buyLabel.text = "VERMELHO-100"
            case "RED":
                buyLabel.text = "VERMELHO"
            case "GREEN-BLUE-300":
                buyLabel.text = "VERDE-AZUL-300"
            case "GREEN-BLUE":
                buyLabel.text = "VERDE-AZUL"
            case "YELLOW-RED-500":
                buyLabel.text = "AMARELO-VERMELHO-500"
            default :
                buyLabel.text = "AMARELO-VERMELHO"
            }
            
        } else {
            
            
            switch buyLabel.text {
            case "GREEN-0":
                buyLabel.text = "GREEN-0"
            case "GREEN":
                buyLabel.text = "GREEN"
            case "BLUE-10":
                buyLabel.text = "BLUE-10"
            case "BLUE":
                buyLabel.text = "BLUE"
            case "YELLOW-50":
                buyLabel.text = "YELLOW-50"
            case "YELLOW":
                buyLabel.text = "YELLOW"
            case "RED-100":
                buyLabel.text = "RED-100"
            case "RED":
                buyLabel.text = "RED"
            case "GREEN-BLUE-300":
                buyLabel.text = "GREEN-BLUE-300"
            case "GREEN-BLUE":
                buyLabel.text = "GREEN-BLUE"
            case "YELLOW-RED-500":
                buyLabel.text = "YELLOW-RED-500"
            default :
                buyLabel.text = "YELLOW-RED"
            }
        }
    }
    private func settingsDidChange() {
        let defaults = UserDefaults.standard
        defaults.set(language, forKey: "language")
        defaults.set(soundPlaing, forKey: "soundPlaing")
        defaults.set(value, forKey: "value")
        defaults.set(mainBG, forKey: "mainBG")
        defaults.synchronize()
    }
}


