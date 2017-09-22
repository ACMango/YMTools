//
//  RootViewController.m
//  YMTools
//
//  Created by dazhi on 2017/9/22.
//  Copyright © 2017年 yanming. All rights reserved.
//

#import "RootViewController.h"
#import "AudioPlayerVC.h"

@interface RootViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UIStoryboard *_mainSB;
}

@property (strong, nonatomic) NSArray *dataArray;

@end

@implementation RootViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    _dataArray = @[@"音频播放"];
    _mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
}

#pragma mark - tableView Delegate && DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID forIndexPath:indexPath];
    cell.textLabel.text = _dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0: // 音频播放
        {
            AudioPlayerVC *nextVC = [_mainSB instantiateViewControllerWithIdentifier:@"AudioPlayerVC"];
            [self.navigationController pushViewController:nextVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - Other Mehtods
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
