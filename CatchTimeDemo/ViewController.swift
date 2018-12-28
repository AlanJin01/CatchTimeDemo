//
//  ViewController.swift
//  CatchTimeDemo
//
//  Created by J K on 2018/12/29.
//  Copyright © 2018 Kims. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var timer: Timer!
    private var dateLabel: UILabel!
    private var timeLabel: UILabel!
    
    private var date: Date!
    
    private var dateString: String!
    private var timeString: String!
    
    private var catchLabel: UILabel!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.black
        
        //获取当前时间
        date = Date()
        
        //年月日格式
        let format1 = DateFormatter()
        format1.dateFormat = "yyyy/MM/dd"
        dateString = format1.string(from: date)
        
        //时间格式
        let format2 = DateFormatter()
        format2.dateFormat = "HH:mm:ss"
        timeString = format2.string(from: date)
        
        //显示实时日期
        dateLabel = UILabel(frame: CGRect(x: 30, y: 100, width: self.view.bounds.width, height: 50))
        dateLabel.center = CGPoint(x: self.view.center.x, y: 80)
        dateLabel.text = dateString
        dateLabel.textColor = UIColor.white
        dateLabel.textAlignment = NSTextAlignment.center
        dateLabel.font = UIFont.systemFont(ofSize: 18)
        self.view.addSubview(dateLabel)
        
        //显示实时时间
        timeLabel = UILabel(frame: CGRect(x: 30, y: 100, width: self.view.bounds.width, height: 80))
        timeLabel.center = CGPoint(x: self.view.center.x, y: 150)
        timeLabel.text = timeString
        timeLabel.textColor = UIColor.white
        timeLabel.textAlignment = NSTextAlignment.center
        timeLabel.font = UIFont.boldSystemFont(ofSize: 24)
        self.view.addSubview(timeLabel)
        
        //截取按钮
        let btn = UIButton(frame: CGRect(x: 30, y: 100, width: 130, height: 50))
        btn.center = CGPoint(x: self.view.center.x, y: self.view.center.y + 140)
        btn.backgroundColor = #colorLiteral(red: 1, green: 0.5891844582, blue: 0.4990172037, alpha: 1)
        btn.setTitle("Catch", for: .normal)
        btn.layer.cornerRadius = 16.0
        btn.addTarget(self, action: #selector(ViewController.catchTime), for: .touchUpInside)
        self.view.addSubview(btn)
        
        catchLabel = UILabel(frame: CGRect(x: 30, y: 100, width: self.view.bounds.width - 80, height: 50))
        catchLabel.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
        catchLabel.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        catchLabel.text = ""
        catchLabel.textColor = UIColor.white
        catchLabel.textAlignment = NSTextAlignment.center
        catchLabel.font = UIFont.boldSystemFont(ofSize: 23)
        self.view.addSubview(catchLabel)
        
        //定时器，用来实时更想时间
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(ViewController.currentTime), userInfo: nil, repeats: true)
    }
    
    //实时更新
    @objc func currentTime() {
        date = Date()
        
        let format1 = DateFormatter()
        format1.dateFormat = "yyyy/MM/dd"
        dateString = format1.string(from: date)
        dateLabel.text = dateString

        let format2 = DateFormatter()
        format2.dateFormat = "HH:mm:ss"
        timeString = format2.string(from: date)
        timeLabel.text = timeString
    }
    
    //截取
    @objc func catchTime() {
        catchLabel.text = timeLabel.text
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }

}

