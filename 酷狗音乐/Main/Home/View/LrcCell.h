//
//  LrcCell.h
//  02-黑马音乐
//
//  Created by apple on 14-8-8.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LrcLine;

@interface LrcCell : UITableViewCell
+ (instancetype)cellWithTableView:(UITableView *)tableView;
@property (nonatomic, strong) LrcLine *lrcLine;
@end
