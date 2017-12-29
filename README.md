# collectionview-demo
测试collectionview性能

页面有33*50以上cell时，页面会非常非常卡，FPS 20以下

目前试过

1.UILabel换成CATextLayer

2.重写drawRect来画NSString

3.YYText异步绘制


效果都不理想。
