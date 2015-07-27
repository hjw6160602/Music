//
//  Music.h
//  酷狗音乐
//
//  Created by SaiDicaprio on 15/7/22.
//  Copyright (c) 2015年 SaiDicaprio. All rights reserved.
//


#import <Foundation/Foundation.h>

@interface Music : NSObject
/**
 *  歌曲名字
 */
@property (copy, nonatomic) NSString *name;
/**
 *  歌曲大图
 */
@property (copy, nonatomic) NSString *icon;
/**
 *  歌曲的文件名
 */
@property (copy, nonatomic) NSString *filename;
/**
 *  歌词的文件名
 */
@property (copy, nonatomic) NSString *lrcname;
/**
 *  歌手
 */
@property (copy, nonatomic) NSString *singer;
/**
 *  歌手图标
 */
@property (copy, nonatomic) NSString *singerIcon;
@end
