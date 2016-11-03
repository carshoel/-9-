//
//  AEIconView.h
//  微信群9宫格头像
//
//  Created by carshoel on 16/11/3.
//  Copyright © 2016年 carshoel. All rights reserved.
//  仿微信群9宫格头像

#import <UIKit/UIKit.h>

@interface AEIconView : UIView

/**图片的url数组*/
@property (nonatomic, strong)NSArray <NSString *>*images;

/**只传一张图*/
@property (nonatomic, strong)UIImage *image;

@end
