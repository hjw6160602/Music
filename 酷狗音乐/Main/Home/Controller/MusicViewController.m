//
//  MusicViewController.m
//  酷狗音乐
//
//  Created by SaiDicaprio on 15/7/22.
//  Copyright (c) 2015年 SaiDicaprio. All rights reserved.
//

#import "MusicViewController.h"
#import "PlayingViewController.h"
#import "HJWExtension.h"
#import "Music.h"
#import "MusicTool.h"
#import "MusicCell.h"

@interface MusicViewController ()
@property (nonatomic, strong) PlayingViewController *playingVc;
@end

@implementation MusicViewController

- (PlayingViewController *)playingVc
{
    if (!_playingVc) {
        self.playingVc = [[PlayingViewController alloc] init];
    }
    return _playingVc;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [MusicTool musics].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MusicCell *cell = [MusicCell cellWithTableView:tableView];
    cell.music = [MusicTool musics][indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.取消选中被点击的这行
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 2.设置正在播放的歌曲
    [MusicTool setPlayingMusic:[MusicTool musics][indexPath.row]];
    
    // 3.显示播放界面
    [self.playingVc show];
}
@end
