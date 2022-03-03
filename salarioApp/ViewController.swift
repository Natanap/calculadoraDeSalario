//
//  ViewController.swift
//  salarioApp
//
//  Created by Natanael Alves Pereira on 22/02/22.
//

import UIKit

class ViewController: UIViewController {

    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nomeDoFuncionarioTextField: UITextField!
    @IBOutlet weak var salarioTextField: UITextField!
    @IBOutlet weak var profissãoTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: Button calcular
    @IBAction func calcularButton(_ sender: Any) {
        // MARK: Variaveis
        
        var funcionario: String = " "
        var salarioLiquido: Double = 0.0
        // MARK: Conversão
        
        guard let salario = Double(salarioTextField?.text ?? "0") else {erro(); return}
        guard let profissão = Int(profissãoTextField?.text ?? " ") else {alerta()
            return}
        if profissão <= 0 {
            alerta()
        }
        
        if salario == 0 {
            erro()
        }
    
        // MARK: Funcões
        
        func alerta(){
            
            let alerta = UIAlertController(title: nil, message: "Por favor insira a profissão correta", preferredStyle: .alert)
            let botaoCancelar = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alerta.addAction(botaoCancelar)
            present(alerta, animated: true, completion: nil)
        }
        
        func erro(){
            
            let alerta = UIAlertController(title: nil, message: "Por favor insira o salário correto", preferredStyle: .alert)
            let botaoCancelar = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alerta.addAction(botaoCancelar)
            present(alerta, animated: true, completion: nil)
        }
        
        func resultado(){

            if nomeDoFuncionarioTextField.text == ""{
                funcionario = "O funcionário não especificado recebe:"
            } else{
                funcionario = "O funcionário \(nomeDoFuncionarioTextField.text ?? " ") recebe:"
            }
            
            let profissaoEx = profissãoTextField.text
            var prof = ""
            
            if profissaoEx == "1" {
                prof = "Desenvolvedor"
            }
            if profissaoEx == "2" {
                prof = "DBA ou Tester"
            }
            if profissaoEx == "3" {
                prof = "Gerente"
            }
            
            let alerta = UIAlertController(title: nil, message: "\(funcionario) R$ \(salarioLiquido) exercendo a profissão de \(prof)", preferredStyle: .alert)
            let botaoCancelar = UIAlertAction(title: "OK", style: .cancel, handler: nil)

            alerta.addAction(botaoCancelar)
            present(alerta, animated: true, completion: nil)
        }

        // MARK: Verificacões
      
        if profissão <= 3{
            if profissãoTextField.text == "1"{
                if salario  > 3000 {
                    salarioLiquido = salario - (salario * 20) / 100
                    resultado()
                } else {
                    salarioLiquido = salario - (salario * 10) / 100
                    resultado()
                }
            }
            if profissãoTextField.text == "2"{
                if salario  > 2500 {
                    salarioLiquido = salario - (salario * 25) / 100
                    resultado()
                } else {
                    salarioLiquido = salario - (salario * 15) / 100
                    resultado()
                }
            }
            if profissãoTextField.text == "3"{
                if salario > 7000 {
                    salarioLiquido = salario - (salario * 23) / 100
                    resultado()
                } else {
                    salarioLiquido = salario - (salario * 18) / 100
                    resultado()
                }
            }
        }else if profissão > 3 || profissão < 1{
            alerta()
            return
        }
    }
}

/*
 •Desenvolvedores possuem 20% de desconto caso seu salário seja maior do que R$ 3000,00. Casocontrário o desconto é de 10%. •DBA e testadores possuem desconto de 25% se seus salários forem maiores doque R$ 2500,00. Caso contrário, 15%.•Gerentes possuem 23% de desconto caso seu salário seja maior do que R$7000,00. Caso contrário o desconto é de 18%.
 */
