//
//  ViewController.m
//  FlexDemo
//
//  Created by 瓦栏 on 2018/2/26.
//  Copyright © 2018年 Qingshan. All rights reserved.
//

#import "ViewController.h"
#import "QSTableViewCell.h"
#import "UIView+Yoga.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[QSTableViewCell class] forCellReuseIdentifier:@"QSTableViewCell"];
    
    self.tableView.estimatedRowHeight = 0;
    self.tableView.estimatedSectionFooterHeight = 0;
    self.tableView.estimatedSectionHeaderHeight = 0;
    
    self.navigationItem.title = @"朋友圈";
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    QSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QSTableViewCell" forIndexPath:indexPath];
    
    cell.headerImageView.image = [UIImage imageNamed:@"header"];
    cell.nameLabel.text = @"一个大大大大美女";
    cell.contentLabel.text = @"今天有小哥哥请我吃饭吗？😇今天有小哥哥请我吃饭吗？😇今天有小哥哥请我吃饭吗？😇今天有小哥哥请我吃饭吗？😇今天有小哥哥请我吃饭吗？😇今天有小哥哥请我吃饭吗？😇今天有小哥哥请我吃饭吗？😇";
    
    cell.imageNumber = 6;
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return  100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    QSTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    [cell layoutIfNeeded];
//    CGSize cellSize = [cell.contentView.yoga intrinsicSize];
    
    return 400;
}



@end
