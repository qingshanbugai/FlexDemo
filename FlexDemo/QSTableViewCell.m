//
//  QSTableViewCell.m
//  FlexDemo
//
//  Created by 瓦栏 on 2018/2/26.
//  Copyright © 2018年 Qingshan. All rights reserved.
//

#import "QSTableViewCell.h"
#import "UIView+Yoga.h"

#define imageSpace 3
#define contentSpace 10
#define headerImageWidth 80

@interface QSTableViewCell()



@end

@implementation QSTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code

}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.contentView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;//开启flex布局
        layout.flexDirection = YGFlexDirectionRow;//横向布局
        
    }];
    
    [self.headerImageView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        
        layout.width = YGPointValue(headerImageWidth);
        layout.height = YGPointValue(headerImageWidth);
        layout.marginTop = YGPointValue(contentSpace);
        layout.marginLeft = YGPointValue(contentSpace);
        
    }];

    self.headerImageView.layer.cornerRadius = headerImageWidth/2;
    self.headerImageView.layer.masksToBounds = YES;
    
    [self.contentView addSubview:self.headerImageView];
    
    [self.backView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionColumn;//纵向布局
        layout.width = YGPointValue(self.contentView.frame.size.width - headerImageWidth - contentSpace);
        layout.paddingLeft = YGPointValue(contentSpace);
        layout.paddingRight = YGPointValue(contentSpace);
        
    }];
    
    [self.contentView addSubview:self.backView];
    
    [self.nameLabel configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.marginTop = YGPointValue(contentSpace);
        
    }];
    self.nameLabel.font = [UIFont systemFontOfSize:20 weight:20];
    
    [self.backView addSubview:self.nameLabel];
    
    
    [self.contentLabel configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.marginTop = YGPointValue(contentSpace);
        
    }];
    self.contentLabel.numberOfLines = 0;
    
    [self.backView addSubview:self.contentLabel];
    [self.backView addSubview:self.imageBackView];

    [self.contentView.yoga applyLayoutPreservingOrigin:YES];//从{0, 0}开始布局

}

-(void)setImageNumber:(NSInteger)imageNumber{
    
    _imageNumber = imageNumber;
    
    for (UIView *view in self.imageBackView.subviews) {
        [view removeFromSuperview];
    }
    
    [self.imageBackView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
        layout.isEnabled = YES;
        layout.flexDirection = YGFlexDirectionRow;
        layout.flexWrap = YGWrapWrap;
        layout.alignItems = YGAlignFlexStart;
        layout.marginTop = YGPointValue(contentSpace);
    }];
    
    for (NSInteger i = 0; i < imageNumber; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"header"]];
        [imageView configureLayoutWithBlock:^(YGLayout * _Nonnull layout) {
            layout.isEnabled = YES;
            layout.margin = YGPointValue(imageSpace);
            layout.width = layout.height = YGPointValue((self.contentView.frame.size.width - headerImageWidth - contentSpace - imageSpace*4 - contentSpace*3)/3);
        }];
        
        [self.imageBackView addSubview:imageView];
        
    }
    
   
    
}
- (UIImageView *)headerImageView {
    if (!_headerImageView) {
        _headerImageView = [[UIImageView alloc] init];
    }
    return _headerImageView;
}
- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
    }
    return _nameLabel;
}
- (UIView *)imageBackView {
    if (!_imageBackView) {
        _imageBackView = [[UIView alloc] init];
    }
    return _imageBackView;
}

- (UILabel *)contentLabel {
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
    }
    return _contentLabel;
}


- (UIView *)backView {
    if (!_backView) {
        _backView = [[UIView alloc] init];
    }
    return _backView;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end

