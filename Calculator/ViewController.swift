//
//  ViewController.swift
//  Calculator
//
//  Created by yuki takei on 2015/06/14.
//  Copyright (c) 2015年 yuki takei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet  var label: UILabel!
    @IBOutlet  var plusB:UIButton!  
    @IBOutlet  var minusB:UIButton!
    @IBOutlet  var multiplyB:UIButton!
    @IBOutlet  var divideB:UIButton!
    var num:Int=0;
    var num2:Int=0;
    var ans:Int=0;
    var operation=0;
    var flag=0;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //数字の選択
    @IBAction func selectNumber(sender: UIButton) {
        var i:Int
        
        // 0〜9のボタンにそれぞれtagで番号振り
        for (i=1;i<=10;i++){
            if sender.tag == i{
                if i==10{         //0
                    num=num*10;
                    label.text=String(num);
                }else{            //1〜9
                    num=num*10+i;
                    label.text=String(num);
                }
            }
        }
    }
    
    //演算記号
    @IBAction func selectCalc(sender:UIButton){
    
        operation=sender.tag%10
        if flag == 0 {
            num2=num;
            num=0;
        }else if flag == 1{
           // num2=ans
            num=0;
        }
        
        label.text=String(num);
        sender.setTitleColor(UIColor.redColor(),forState: .Normal);
        flag=1;
    }
/*
    
    //和
    @IBAction func plus(sender:UIButton){
        operation=1;
        num2=num;
        num=0;
        label.text=String(num);
        sender.setTitleColor(UIColor.redColor(),forState: .Normal);
    }
    
    //差
    @IBAction func minus(sender:UIButton){
        operation=2;
        num2=num;
        num=0;
        label.text=String(num);
        sender.setTitleColor(UIColor.redColor(),forState: .Normal);
    }

    //積
    @IBAction func multiply(sender:UIButton){
        operation=3;
        num2=num;
        num=0;
        label.text=String(num);
        sender.setTitleColor(UIColor.redColor(),forState: .Normal);
    }

    //商
    @IBAction func divide(sender:UIButton){
        operation=4;
        num2=num;
        num=0;
        label.text=String(num);
        sender.setTitleColor(UIColor.redColor(),forState: .Normal);
    }
  */
    //イコール
    @IBAction func equal(){
        
    
        if operation != 0 {
            if operation==1 {
                num2=num2+num;
            }else if operation==2{
                num2=num2-num;
            }else if operation==3{
                num2=num2*num;
            }else if operation==4{
                num2=num2/num;
            }
           // ans=num2;
            label.text=String(num2);
            num=0;
            operation=0;
        }
        
        colorReset();


    }

    //Clear
    @IBAction func clear(){
        ans=0;
        num=0;
        operation=0;
        label.text=String(0);
        flag=0;
    }
    
    //四則演算ボタンの色変化
    func colorReset(){
        plusB.setTitleColor(UIColor.blueColor(),forState: .Normal);
        minusB.setTitleColor(UIColor.blueColor(),forState: .Normal);
        multiplyB.setTitleColor(UIColor.blueColor(),forState: .Normal);
        divideB.setTitleColor(UIColor.blueColor(),forState: .Normal);
        
    }
}

