//
//  ViewController.swift
//  CalculatoriPhone
//
//  Created by azinavi on 28/12/23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var resultlabel = UILabel()
    var stackView1 = UIStackView()
    var stackView2 = UIStackView()
    var stackView3 = UIStackView()
    var stackView4 = UIStackView()
    var stackView5 = UIStackView()
    
    var defalutValue = "0"
    var operationVal: String?
    var innerNum1: String?
    var innerNum2: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        superViewSetup()
        resultLabelSetup()
        stackView1Setup()
        stackView2Setup()
        stackView3Setup()
        stackView4Setup()
        stackView5Setup()
        
    }
    
    //MARK: Result Label
    func resultLabelSetup() {
        view.addSubview(resultlabel)
        resultlabel.text = defalutValue
        resultlabel.textColor = .white
        resultlabel.textAlignment = .right
        resultlabel.font = UIFont.systemFont(ofSize: 80)
        resultlabel.adjustsFontSizeToFitWidth = true
        resultlabel.minimumScaleFactor = 0.1
        
        resultlabel.snp.makeConstraints{ (make) in
            make.bottom.equalTo(-560)
            make.right.equalTo(-40)
            make.left.equalTo(35)
            make.height.equalTo(90)
        }
    }

    //MARK: StackView1
    func stackView1Setup() {
        view.addSubview(stackView1)
        
        stackView1.backgroundColor = .black
        stackView1.axis = .horizontal
        stackView1.alignment = .center
        stackView1.spacing = 20
        stackView1.distribution = .fill
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonZero = UIButton()
        buttonZero.backgroundColor = .darkGray
        buttonZero.setTitle("0", for: .normal)
        buttonZero.setTitleColor(.white, for: .normal)
        buttonZero.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        buttonZero.titleLabel?.textAlignment = .left
        buttonZero.layer.cornerRadius = 40
        buttonZero.snp.makeConstraints{ (make) in
            make.width.equalTo(180)
            make.height.equalTo(80)
        }
        buttonZero.addTarget(self, action: #selector(tapButtonZero), for: .touchUpInside)
        
        let buttonComma = UIButton()
        buttonComma.backgroundColor = .darkGray
        buttonComma.setTitle(",", for: .normal)
        buttonComma.setTitleColor(.white, for: .normal)
        buttonComma.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        buttonComma.layer.cornerRadius = 40
        buttonComma.snp.makeConstraints{ (make) in
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        buttonComma.addTarget(self, action: #selector(tapButtonComma), for: .touchUpInside)

        let buttonEqual = UIButton()
        buttonEqual.backgroundColor = .systemOrange
        buttonEqual.setTitle("=", for: .normal)
        buttonEqual.setTitleColor(.white, for: .normal)
        buttonEqual.titleLabel?.font = UIFont.systemFont(ofSize: 45)
        buttonEqual.layer.cornerRadius = 40
        buttonEqual.snp.makeConstraints{ (make) in
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        
        stackView1.addArrangedSubview(buttonZero)
        stackView1.addArrangedSubview(buttonComma)
        stackView1.addArrangedSubview(buttonEqual)
        
        stackView1.snp.makeConstraints { (make) in
            make.height.equalTo(80)
            make.bottom.equalTo(-80)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
        
        buttonEqual.addTarget(self, action: #selector(equalOperation), for: .touchUpInside)
    }
    @objc func tapButtonZero() {
        var text = resultlabel.text
        text = "0"
        if (resultlabel.text != "0") {
            text = self.resultlabel.text! + text!
        } else {
            resultlabel.text = text
        }
        self.resultlabel.text = text
    }
    @objc func tapButtonComma() {
        resultlabel.text! += "."
    }
    @objc func equalOperation() {
        switch operationVal {
        case "+":
            let resultDouble: Double?
                let unwrapVal1 = Double(innerNum1!)
                let unwrapVal2 = Double(resultlabel.text!)
                resultDouble = unwrapVal1! + unwrapVal2!
                resultlabel.text = String(resultDouble!)
        case "-":
            let resultDouble: Double?
            let unwrapVal1 = Double(innerNum1!)
            let unwrapVal2 = Double(resultlabel.text!)
            resultDouble = unwrapVal1! - unwrapVal2!
            resultlabel.text = String(resultDouble!)
        case "x":
            let result: Double?
            let unwrapVal1 = Double(innerNum1!)
            let unwrapVal2 = Double(resultlabel.text!)
            result = unwrapVal1! * unwrapVal2!
            resultlabel.text = String(result!)
        case "/":
            let result: Double?
            let unwrapVal1 = Double(innerNum1!)
            let unwrapVal2 = Double(resultlabel.text!)
            result = unwrapVal1! / unwrapVal2!
            let resultDouble = String(result!)
            resultlabel.text = String(resultDouble)
        default:
            break
        }
    }
    
    //MARK: StackView2
    func stackView2Setup() {
        view.addSubview(stackView2)
        
        stackView2.backgroundColor = .black
        stackView2.axis = .horizontal
        stackView2.alignment = .center
        stackView2.spacing = 20
        stackView2.distribution = .fillEqually
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        
        let button1 = UIButton()
        button1.backgroundColor = .darkGray
        button1.setTitle("1", for: .normal)
        button1.setTitleColor(.white, for: .normal)
        button1.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button1.layer.cornerRadius = 40
        button1.snp.makeConstraints{ (make) in
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        button1.addTarget(self, action: #selector(tapButton1), for: .touchUpInside)
        
        let button2 = UIButton()
        button2.backgroundColor = .darkGray
        button2.setTitle("2", for: .normal)
        button2.setTitleColor(.white, for: .normal)
        button2.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button2.layer.cornerRadius = 40
        button2.snp.makeConstraints{ (make) in
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        button2.addTarget(self, action: #selector(tapButton2), for: .touchUpInside)

        let button3 = UIButton()
        button3.backgroundColor = .darkGray
        button3.setTitle("3", for: .normal)
        button3.setTitleColor(.white, for: .normal)
        button3.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button3.layer.cornerRadius = 40
        button3.snp.makeConstraints{ (make) in
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        button3.addTarget(self, action: #selector(tapButton3), for: .touchUpInside)

        let buttonPlus = UIButton()
        buttonPlus.backgroundColor = .systemOrange
        buttonPlus.setTitle("+", for: .normal)
        buttonPlus.setTitleColor(.white, for: .normal)
        buttonPlus.titleLabel?.font = UIFont.systemFont(ofSize: 45)
        buttonPlus.layer.cornerRadius = 40
        buttonPlus.snp.makeConstraints{ (make) in
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        
        stackView2.addArrangedSubview(button1)
        stackView2.addArrangedSubview(button2)
        stackView2.addArrangedSubview(button3)
        stackView2.addArrangedSubview(buttonPlus)
        
        stackView2.snp.makeConstraints { (make) in
            make.height.equalTo(80)
            make.bottom.equalTo(-175)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
        
        buttonPlus.addTarget(self, action: #selector(plusOperation), for: .touchUpInside)
    }
    
    @objc func tapButton1() {
        var text = resultlabel.text
        text = "1"
        if (resultlabel.text != "0") {
            text = self.resultlabel.text! + text!
        } else {
            resultlabel.text = text
        }
        self.resultlabel.text = text
    }
    @objc func tapButton2() {
        var text = resultlabel.text
        text = "2"
        if (resultlabel.text != "0") {
            text = self.resultlabel.text! + text!
        } else {
            resultlabel.text = text
        }
        self.resultlabel.text = text
    }
    @objc func tapButton3() {
        var text = resultlabel.text
        text = "3"
        if (resultlabel.text != "0") {
            text = self.resultlabel.text! + text!
        } else {
            resultlabel.text = text
        }
        self.resultlabel.text = text
    }
    
    @objc func plusOperation() {
        if (resultlabel.text != "0") {
            innerNum1 = resultlabel.text
            operationVal = "+"
            resultlabel.text = defalutValue
        }
    }
    
    
    
    
    //MARK: StackView3
    func stackView3Setup() {
        view.addSubview(stackView3)
        
        stackView3.backgroundColor = .black
        stackView3.axis = .horizontal
        stackView3.alignment = .center
        stackView3.distribution = .fillEqually
        stackView3.spacing = 20
        stackView3.translatesAutoresizingMaskIntoConstraints = false
        
        let button4 = UIButton()
        button4.backgroundColor = .darkGray
        button4.setTitle("4", for: .normal)
        button4.setTitleColor(.white, for: .normal)
        button4.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button4.titleLabel?.textAlignment = .left
        button4.layer.cornerRadius = 40
        button4.snp.makeConstraints{ (make) in
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        button4.addTarget(self, action: #selector(tapButton4), for: .touchUpInside)
        
        let button5 = UIButton()
        button5.backgroundColor = .darkGray
        button5.setTitle("5", for: .normal)
        button5.setTitleColor(.white, for: .normal)
        button5.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button5.layer.cornerRadius = 40
        button5.snp.makeConstraints{ (make) in
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        button5.addTarget(self, action: #selector(tapButton5), for: .touchUpInside)

        let button6 = UIButton()
        button6.backgroundColor = .darkGray
        button6.setTitle("6", for: .normal)
        button6.setTitleColor(.white, for: .normal)
        button6.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button6.layer.cornerRadius = 40
        button6.snp.makeConstraints{ (make) in
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        button6.addTarget(self, action: #selector(tapButton6), for: .touchUpInside)
        
        let buttonMinus = UIButton()
        buttonMinus.backgroundColor = .systemOrange
        buttonMinus.setTitle("-", for: .normal)
        buttonMinus.setTitleColor(.white, for: .normal)
        buttonMinus.titleLabel?.font = UIFont.systemFont(ofSize: 45)
        buttonMinus.layer.cornerRadius = 40
        buttonMinus.snp.makeConstraints{ (make) in
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        buttonMinus.addTarget(self, action: #selector(minusOperation), for: .touchUpInside)
        
        stackView3.addArrangedSubview(button4)
        stackView3.addArrangedSubview(button5)
        stackView3.addArrangedSubview(button6)
        stackView3.addArrangedSubview(buttonMinus)
        
        stackView3.snp.makeConstraints { (make) in
            make.height.equalTo(80)
            make.bottom.equalTo(-270)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
    }
    
    @objc func tapButton4() {
        var text = resultlabel.text
        text = "4"
        if (resultlabel.text != "0") {
            text = self.resultlabel.text! + text!
        } else {
            resultlabel.text = text
        }
        self.resultlabel.text = text
    }
    @objc func tapButton5() {
        var text = resultlabel.text
        text = "5"
        if (resultlabel.text != "0") {
            text = self.resultlabel.text! + text!
        } else {
            resultlabel.text = text
        }
        self.resultlabel.text = text
    }
    @objc func tapButton6() {
        var text = resultlabel.text
        text = "6"
        if (resultlabel.text != "0") {
            text = self.resultlabel.text! + text!
        } else {
            resultlabel.text = text
        }
        self.resultlabel.text = text
    }
    @objc func minusOperation() {
        if (resultlabel.text != "0") {
            innerNum1 = resultlabel.text
            operationVal = "-"
            resultlabel.text = defalutValue
        }
    }
    //MARK: StackView4
    func stackView4Setup() {
        view.addSubview(stackView4)
        
        stackView4.backgroundColor = .black
        stackView4.axis = .horizontal
        stackView4.alignment = .center
        stackView4.spacing = 20
        stackView4.distribution = .fillEqually
        stackView4.translatesAutoresizingMaskIntoConstraints = false
        
        let button7 = UIButton()
        button7.backgroundColor = .darkGray
        button7.setTitle("7", for: .normal)
        button7.setTitleColor(.white, for: .normal)
        button7.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button7.layer.cornerRadius = 40
        button7.snp.makeConstraints{ (make) in
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        button7.addTarget(self, action: #selector(tapButton7), for: .touchUpInside)
        
        let button8 = UIButton()
        button8.backgroundColor = .darkGray
        button8.setTitle("8", for: .normal)
        button8.setTitleColor(.white, for: .normal)
        button8.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button8.layer.cornerRadius = 40
        button8.snp.makeConstraints{ (make) in
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        button8.addTarget(self, action: #selector(tapButton8), for: .touchUpInside)

        let button9 = UIButton()
        button9.backgroundColor = .darkGray
        button9.setTitle("9", for: .normal)
        button9.setTitleColor(.white, for: .normal)
        button9.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        button9.layer.cornerRadius = 40
        button9.snp.makeConstraints{ (make) in
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        button9.addTarget(self, action: #selector(tapButton9), for: .touchUpInside)

        let buttonMultiply = UIButton()
        buttonMultiply.backgroundColor = .systemOrange
        buttonMultiply.setTitle("x", for: .normal)
        buttonMultiply.setTitleColor(.white, for: .normal)
        buttonMultiply.titleLabel?.font = UIFont.systemFont(ofSize: 45)
        buttonMultiply.titleLabel?.textAlignment = .center
        buttonMultiply.layer.cornerRadius = 40
        buttonMultiply.snp.makeConstraints{ (make) in
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        buttonMultiply.addTarget(self, action: #selector(multiplyOperation), for: .touchUpInside)
        
        stackView4.addArrangedSubview(button7)
        stackView4.addArrangedSubview(button8)
        stackView4.addArrangedSubview(button9)
        stackView4.addArrangedSubview(buttonMultiply)
        
        stackView4.snp.makeConstraints { (make) in
            make.height.equalTo(80)
            make.bottom.equalTo(-365)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
    }
    @objc func tapButton7() {
        var text = resultlabel.text
        text = "7"
        if (resultlabel.text != "0") {
            text = self.resultlabel.text! + text!
        } else {
            resultlabel.text = text
        }
        self.resultlabel.text = text
    }
    @objc func tapButton8() {
        var text = resultlabel.text
        text = "8"
        if (resultlabel.text != "0") {
            text = self.resultlabel.text! + text!
        } else {
            resultlabel.text = text
        }
        self.resultlabel.text = text
    }
    @objc func tapButton9() {
        var text = resultlabel.text
        text = "9"
        if (resultlabel.text != "0") {
            text = self.resultlabel.text! + text!
        } else {
            resultlabel.text = text
        }
        self.resultlabel.text = text
    }
    @objc func multiplyOperation() {
        if (resultlabel.text != "0") {
            innerNum1 = resultlabel.text
            operationVal = "x"
            resultlabel.text = defalutValue
        }
    }

    
    //MARK: StackView5
    func stackView5Setup() {
        view.addSubview(stackView5)
        
        stackView5.backgroundColor = .black
        stackView5.axis = .horizontal
        stackView5.alignment = .center
        stackView5.spacing = 20
        stackView5.distribution = .fillEqually
        stackView5.translatesAutoresizingMaskIntoConstraints = false
        
        let buttonClear = UIButton()
        buttonClear.backgroundColor = .lightGray
        buttonClear.setTitle("AC", for: .normal)
        buttonClear.setTitleColor(.black, for: .normal)
        buttonClear.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        buttonClear.layer.cornerRadius = 40
        buttonClear.snp.makeConstraints{ (make) in
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        buttonClear.addTarget(self, action: #selector(tapButtonClear), for: .touchUpInside)
        
        let buttonChangeIncrement = UIButton()
        buttonChangeIncrement.backgroundColor = .lightGray
        buttonChangeIncrement.setTitle("+/-", for: .normal)
        buttonChangeIncrement.setTitleColor(.black, for: .normal)
        buttonChangeIncrement.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        buttonChangeIncrement.layer.cornerRadius = 40
        buttonChangeIncrement.snp.makeConstraints{ (make) in
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        buttonChangeIncrement.addTarget(self, action: #selector(tapButtonChangeIncrement), for: .touchUpInside)

        let buttonPerсent = UIButton()
        buttonPerсent.backgroundColor = .lightGray
        buttonPerсent.setTitle("%", for: .normal)
        buttonPerсent.setTitleColor(.black, for: .normal)
        buttonPerсent.titleLabel?.font = UIFont.systemFont(ofSize: 35)
        buttonPerсent.layer.cornerRadius = 40
        buttonPerсent.snp.makeConstraints{ (make) in
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        buttonPerсent.addTarget(self, action: #selector(percentOperation), for: .touchUpInside)

        let buttonDivide = UIButton()
        buttonDivide.backgroundColor = .systemOrange
        buttonDivide.setTitle("÷", for: .normal)
        buttonDivide.setTitleColor(.white, for: .normal)
        buttonDivide.titleLabel?.font = UIFont.systemFont(ofSize: 45)
        buttonDivide.layer.cornerRadius = 40
        buttonDivide.snp.makeConstraints{ (make) in
            make.width.equalTo(80)
            make.height.equalTo(80)
        }
        buttonDivide.addTarget(self, action: #selector(divideOperation), for: .touchUpInside)
        
        stackView5.addArrangedSubview(buttonClear)
        stackView5.addArrangedSubview(buttonChangeIncrement)
        stackView5.addArrangedSubview(buttonPerсent)
        stackView5.addArrangedSubview(buttonDivide)
        
        stackView5.snp.makeConstraints { (make) in
            make.height.equalTo(80)
            make.bottom.equalTo(-460)
            make.leading.equalTo(20)
            make.trailing.equalTo(-20)
        }
    }
    @objc func tapButtonClear() {
        resultlabel.text = defalutValue
    }
    @objc func tapButtonChangeIncrement() {
        if resultlabel.text!.contains("-") {
            var tempValue: String = resultlabel.text!.replacingOccurrences(of: "-", with: "")
            resultlabel.text = tempValue
        } else {
            var value: String = "-" + resultlabel.text!
            resultlabel.text = value        }
        
    }
    @objc func divideOperation() {
        if (resultlabel.text != "0") {
            innerNum1 = resultlabel.text
            operationVal = "/"
            resultlabel.text = defalutValue
        }
    }
    @objc func percentOperation() {
        let result: Double?
        let unwrapValue = Double(resultlabel.text!)
        result = unwrapValue! / 100
        let finallyResult = String(result!)
        resultlabel.text = finallyResult
    }

    func superViewSetup() {
        view.backgroundColor = .black
    }


}

