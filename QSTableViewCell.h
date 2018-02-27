//
//  QSTableViewCell.h
//  FlexDemo
//
//  Created by 瓦栏 on 2018/2/26.
//  Copyright © 2018年 Qingshan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QSTableViewCell : UITableViewCell
@property(nonatomic, strong) UIImageView *headerImageView;
@property(nonatomic, strong) UILabel *nameLabel;
@property(nonatomic, strong) UILabel *contentLabel;

@property(nonatomic, assign) NSInteger imageNumber;

@property(nonatomic, strong) UIView *backView;

@property(nonatomic, strong) UIView *imageBackView;

@end
