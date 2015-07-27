//
//  MusicTool.h
//  酷狗音乐
//
//  Created by SaiDicaprio on 15/7/22.
//  Copyright (c) 2015年 SaiDicaprio. All rights reserved.
//
//  管理音乐数据（音乐模型）

#import <Foundation/Foundation.h>
@class Music;

@interface MusicTool : NSObject
/**
 *  返回所有的歌曲
 */
+ (NSArray *)musics;

/**
 *  返回正在播放的歌曲
 */
+ (Music *)playingMusic;
+ (void)setPlayingMusic:(Music *)playingMusic;

/**
 *  下一首歌曲
 */
+ (Music *)nextMusic;

/**
 *  上一首歌曲
 */
+ (Music *)previousMusic;
@end
