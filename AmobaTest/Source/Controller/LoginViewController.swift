//
//  LoginViewController.swift
//  AmobaTest
//
//  Created by Jorge Vásquez on 27/02/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let viewModel = APIViewModel()
    
    // en el log out
    //let keychain = KeychainHelper()
    //keychain.delete(.token)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let keychainHelper = KeychainHelper()
        print("Token en keychain: \(keychainHelper.get(.token) ?? "")")
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureElements()
    }
    
    func configureElements() {
        
        titleLabel.font = CustomFont.setFontBebasNeue(fontSize: 36)
        emailTextField.text = "pruebas@amobasoftware.com"
        passwordTextField.text = "123456"
        
        loginButton.layer.cornerRadius = loginButton.bounds.width * 0.1
        
        emailTextField.layer.cornerRadius = emailTextField.bounds.width * 0.1
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        
        passwordTextField.layer.cornerRadius = passwordTextField.bounds.width * 0.1
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    
    @IBAction func loginButtom(_ sender: Any) {
        guard let userName = emailTextField.text, !userName.isEmpty,
              let password = passwordTextField.text, !password.isEmpty  else { return }
        
        login(userName: userName, password: password)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let secondVC: PatientListViewController = segue.destination as? PatientListViewController,
           let doctor = sender as? Doctor {
            secondVC.doctor = doctor
        }
    }
    
    private func login(userName: String, password: String) {
        let service = APIService.auth(userName: userName, password: password)
        
        viewModel.auth(service) { [weak self] result in
            switch result {
            case let .success(responseToken):
                print("Token: \(responseToken.token)")
                let keychainHelper = KeychainHelper()
                keychainHelper.add(value: responseToken.token, key: .token)
                self?.getPatients(doctorId: 1, companyId: 1)
            case let .failure(error): print("error en la peticion: \(error)")
            }
        }
    }
    
    private func getPatients(doctorId: Int , companyId: Int) {
        let service = APIService.getAllPatients(doctorId: doctorId, companyId: companyId)
        
        viewModel.getAllPatients(service) { [weak self] result in
            switch result {
            case let .success(response):
                print("tengo todos los patients que son \(response.count)")
                let patients = response.map { $0.person }
                let doctor = Doctor(doctorId: doctorId, companyId: companyId, patients: response.map ({ $0.person }))
                
                self?.performSegue(withIdentifier: "showPatients", sender: doctor)
            case let .failure(error): print("error en la peticion: \(error)")
            }
        }
    }
}

