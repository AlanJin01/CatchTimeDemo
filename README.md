# CatchTimeDemo

自己做的小实验，打开软件时能够与当前时间同步显示，点击按钮时能够截取时间并显示在灰色框中。

关键代码：

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

![image](https://github.com/Kimsswift/CatchTimeDemo/blob/master/images/catch1.png)

![image](https://github.com/Kimsswift/CatchTimeDemo/blob/master/images/catch2.png)
