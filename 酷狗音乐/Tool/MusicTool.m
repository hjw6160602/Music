//
//  MusicTool.m
//  酷狗音乐
//
//  Created by SaiDicaprio on 15/7/22.
//  Copyright (c) 2015年 SaiDicaprio. All rights reserved.
//

#import "MusicTool.h"
#import "Music.h"
#import "HJWExtension.h"

@implementation MusicTool
static NSArray *_musics;
static Music *_playingMusic;

/**
 *  返回所有的歌曲
 */
+ (NSArray *)musics
{
    if (!_musics) {
        _musics = [Music objectArrayWithFilename:@"Musics.plist"];
    }
    return _musics;
}

/**
 *  返回正在播放的歌曲
 */
+ (Music *)playingMusic
{
    return _playingMusic;
}

+ (void)setPlayingMusic:(Music *)playingMusic
{
    //无效的音频文件
    if (!playingMusic || ![[self musics] containsObject:playingMusic]) return;
    //传入音乐正在播放
    if (_playingMusic == playingMusic) return;
    
    _playingMusic = playingMusic;
}

/**
 *  下一首歌曲
 */
+ (Music *)nextMusic
{
    NSInteger nextIndex = 0;
    //数组索引检索对象不能为空
    if (_playingMusic) {
        //获取当前正在播放的音乐的索引
        NSInteger playingIndex = [[self musics] indexOfObject:_playingMusic];
        //下一首音乐的索引为当前播放音乐索引+1
        nextIndex = playingIndex + 1;
        //防止下一首音乐索引越界
        if (nextIndex >= [self musics].count) {
            nextIndex = 0;
        }
    }
    //根据下一首音乐的索引返回下一首音乐对象
    return [self musics][nextIndex];
}

/**
 *  上一首歌曲
 */
+ (Music *)previousMusic
{
    NSInteger previousIndex = 0;
    //数组索引检索对象不能为空
    if (_playingMusic) {
        //获取当前正在播放的音乐的索引
        NSInteger playingIndex = [[self musics] indexOfObject:_playingMusic];
        //上一首音乐的索引为当前播放音乐索引-1
        previousIndex = playingIndex - 1;
        //防止上一首音乐索引越界
        if (previousIndex < 0) {
            previousIndex = [self musics].count - 1;
        }
    }
    //根据上一首音乐的索引返回下一首音乐对象
    return [self musics][previousIndex];
}
@end
