//
//  StartingViewController.swift
//  WBooks
//
//  Created by c.betancourt on 14/08/21.
//

import UIKit

class StartingViewController: UIViewController {
    
    let headerImage: UIImageView = UIImageView()
    let logoImage: UIImageView = UIImageView()
    let infoStackViewVertical:UIStackView = UIStackView()
    let titleLabel: UILabel = UILabel()
    let subTitleLabel: UILabel = UILabel()
    let textFieldsStackViewVertical: UIStackView = UIStackView()
    let usernameTextfield: CustomTextfield = CustomTextfield()
    let passwordTextfield: CustomTextfield = CustomTextfield()
    let imagePasswordTextfield: UIImageView = UIImageView()
    let signInButton: UIButton = UIButton()
    
    var isIconSelected = false
    
    struct Constants {
        static let passwordIconSelected = UIImage(named: "eye_open")
        static let passwordIconUnSelected = UIImage(named: "eye_close")
        static let imageBackgroundHeader = UIImage(named: "bc_nav_bar")
        static let imageLogoWBooks = UIImage(named: "logo")
    }
    
    init() {
        super.init(nibName: "StartingViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        createHeader()
        createLogo()
        showTitleLabel()
        showSubtibleLabel()
        createStackView()
        createUsernameTextfied()
        createPasswordTextfied()
        createStackview()
        createSignInButton()
        toggleShowHiddenPassword()
    }
    
    func createHeader() {
        view.addSubview(headerImage)
        headerImage.image = Constants.imageBackgroundHeader
        headerImage.contentMode = .scaleAspectFill
        headerImage.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            headerImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            headerImage.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            headerImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            headerImage.heightAnchor.constraint(equalToConstant: 160)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func createLogo() {
        view.addSubview(logoImage)
        logoImage.image = Constants.imageLogoWBooks
        logoImage.contentMode = .scaleAspectFit
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            logoImage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            logoImage.widthAnchor.constraint(equalToConstant: 100),
            logoImage.heightAnchor.constraint(equalToConstant: 80)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func createStackView() {
        view.addSubview(infoStackViewVertical)
        infoStackViewVertical.axis = .vertical
        infoStackViewVertical.spacing = 40
        infoStackViewVertical.distribution = .fillProportionally
        infoStackViewVertical.addArrangedSubview(titleLabel)
        infoStackViewVertical.addArrangedSubview(subTitleLabel)
        infoStackViewVertical.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            infoStackViewVertical.topAnchor.constraint(equalTo:  headerImage.bottomAnchor, constant: 80),
            infoStackViewVertical.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            infoStackViewVertical.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            infoStackViewVertical.heightAnchor.constraint(equalToConstant: 120)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func showTitleLabel() {
        titleLabel.textAlignment = NSTextAlignment.left
        titleLabel.text = "Hello Reader!"
        titleLabel.font = UIFont.systemFont(ofSize: 26.0, weight: .bold)
        view.addSubview(titleLabel)
    }
    
    func showSubtibleLabel() {
        subTitleLabel.textAlignment = NSTextAlignment.left
        subTitleLabel.numberOfLines = 2
        subTitleLabel.text = "Please Enter your Information Below to Sign In"
        view.addSubview(subTitleLabel)
    }
    
    func createStackview() {
        view.addSubview(textFieldsStackViewVertical)
        textFieldsStackViewVertical.axis = .vertical
        textFieldsStackViewVertical.spacing = 1
        textFieldsStackViewVertical.distribution = .equalCentering
        textFieldsStackViewVertical.addArrangedSubview(usernameTextfield)
        textFieldsStackViewVertical.addArrangedSubview(passwordTextfield)
        textFieldsStackViewVertical.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            textFieldsStackViewVertical
                .topAnchor
                .constraint(equalTo:  infoStackViewVertical.bottomAnchor,
                            constant: 10),
            textFieldsStackViewVertical
                .rightAnchor
                .constraint(equalTo: view.rightAnchor,
                            constant: -50),
            textFieldsStackViewVertical
                .leftAnchor
                .constraint(equalTo: view.leftAnchor,
                            constant: 50),
            textFieldsStackViewVertical
                .heightAnchor
                .constraint(equalToConstant: 120)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    
    func createUsernameTextfied() {
        usernameTextfield.placeholder = "Username"
        usernameTextfield.translatesAutoresizingMaskIntoConstraints = false
        
        let contraints = [
            usernameTextfield.widthAnchor.constraint(equalToConstant: 40),
            usernameTextfield.heightAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(contraints)
    }
    
    func createPasswordTextfied() {
        passwordTextfield.placeholder = "Password"
        passwordTextfield.translatesAutoresizingMaskIntoConstraints = false
        passwordTextfield.isSecureTextEntry = true
        let contraints = [
            passwordTextfield.widthAnchor.constraint(equalToConstant: 40),
            passwordTextfield.heightAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(contraints)
    }
    
    func createSignInButton() {
        view.addSubview(signInButton)
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.backgroundColor = GlobaConstants.mainColor
        signInButton.layer.cornerRadius = 25
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        let constrains = [
            signInButton.topAnchor.constraint(equalTo: textFieldsStackViewVertical.bottomAnchor, constant: 30),
            signInButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            signInButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -50),
            signInButton.heightAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(constrains)
        
        signInButton.addTarget(self, action: #selector(pressed), for: .touchUpInside)
    }
    
    func toggleShowHiddenPassword() {
        imagePasswordTextfield.image = Constants.passwordIconUnSelected
        
        let contentView = UIView()
        contentView.addSubview(imagePasswordTextfield)
        
        contentView.frame = CGRect(x: 0, y: 0, width: 25, height: 30)
        
        imagePasswordTextfield.frame = CGRect(x: -10, y: 0, width: 25, height: 30)
        
        passwordTextfield.rightView = contentView
        passwordTextfield.rightViewMode = .always
        
        let tapGestureRecognizer =  UITapGestureRecognizer(target: self , action: #selector(imageTapped(tapGestureRecognizer:)))
        imagePasswordTextfield.isUserInteractionEnabled = true
        imagePasswordTextfield.addGestureRecognizer(tapGestureRecognizer)
    }
    
    // MARK: Actions
    
    @objc func imageTapped(tapGestureRecognizer:UITapGestureRecognizer) {
        
        isIconSelected = !isIconSelected
        imagePasswordTextfield.image = isIconSelected ? Constants.passwordIconSelected : Constants.passwordIconUnSelected
        passwordTextfield.isSecureTextEntry = !isIconSelected
    }
    
    @objc func pressed() {
        print("Welcome Reader!")
    }
}
