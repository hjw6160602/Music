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
    if (!playingMusic || ![[self musics] containsObject:playingMusic]) return;
    if (_playingMusic == playingMusic) return;
    
    _playingMusic = playingMusic;
}

/**
 *  下一首歌曲
 */
+ (Music *)nextMusic
{
    NSInteger nextIndex = 0;
    if (_playingMusic) {
        NSInteger playingIndex = [[self musics] indexOfObject:_playingMusic];
        nextIndex = playingIndex + 1;
        if (nextIndex >= [self musics].count) {
            nextIndex = 0;
        }
    }
    return [self musics][nextIndex];
}

/**
 *  上一首歌曲
 */
+ (Music *)previousMusic
{
    NSInteger previousIndex = 0;
    if (_playingMusic) {
        NSInteger playingIndex = [[self musics] indexOfObject:_playingMusic];
        previousIndex = playingIndex - 1;
        if (previousIndex < 0) {
            previousIndex = [self musics].count - 1;
        }
    }
    return [self musics][previousIndex];
}
@end
