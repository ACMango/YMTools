//
//  AudioPlayerVC.m
//  YMTools
//
//  Created by dazhi on 2017/9/22.
//  Copyright © 2017年 yanming. All rights reserved.
//

#import "AudioPlayerVC.h"
#import "FSAudioStream.h"
#import "FSAudioController.h"
#import "WJNetAudioPlayer.h"


@interface AudioPlayerVC (){
    NSTimer *_progressUpdateTimer;
}
@property (weak, nonatomic) IBOutlet UILabel *progressL;
@property (nonatomic,strong) WJNetAudioPlayer *netPlayer;
@property (nonatomic,strong) FSAudioController *audioController;//控制

@end

@implementation AudioPlayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    __weak typeof(self) weakSelf = self;
    [self.netPlayer setProgressBlock:^(CGFloat f, NSString *loadTime, NSString *totalTime) {
        
        NSLog(@"%f ---- %@/%@",f,loadTime,totalTime);
        weakSelf.progressL.text = [NSString stringWithFormat:@"唱到百分之%.2f", f];
    }];
}


-(NSURL *)getNetworkUrl{
    NSString *urlStr=@"http://mp3tuijian.9ku.com/tuijian/2015/07-06/665486.mp3";
    NSURL *url=[NSURL URLWithString:urlStr];
    return url;
}

- (WJNetAudioPlayer *)netPlayer {
    if (!_netPlayer) {
        _netPlayer = [[WJNetAudioPlayer alloc]initWithUrl:[self getNetworkUrl]];
    }
    return _netPlayer;
}

- (IBAction)player:(id)sender {
    [self.netPlayer play];
}

- (IBAction)pause:(id)sender {
    [self.netPlayer pause];
}
- (IBAction)changeGe:(id)sender {
    [self.netPlayer stop];
    _netPlayer = [[WJNetAudioPlayer alloc]initWithUrl:[NSURL URLWithString:@"http://up.mcyt.net/md5/53/NDQzNjAz_Qq4329912.mp3"]];
    [self.netPlayer play];
}

///**
// *  创建FSAudioStream对象
// *
// *  @return FSAudioStream对象
// */
//-(FSAudioStream *)audioStream{
//    if (!_audioStream) {
//        NSURL *url=[self getNetworkUrl];
//        //创建FSAudioStream对象
//        _audioStream=[[FSAudioStream alloc]initWithUrl:url];
//        _audioStream.onFailure=^(FSAudioStreamError error,NSString *description){
//            NSLog(@"播放过程中发生错误，错误信息：%@",description);
//        };
//        _audioStream.onCompletion=^(){
//            NSLog(@"播放完成!");
//        };
//        [_audioStream setVolume:0.5];//设置声音
//    }
//    return _audioStream;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
