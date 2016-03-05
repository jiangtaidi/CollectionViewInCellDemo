//
//  ViewController.m
//  CellqianruCollectionView
//
//  Created by jiangtd on 16/3/5.
//  Copyright © 2016年 jiangtd. All rights reserved.
//

#import "ViewController.h"
#import "CustumTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)NSMutableDictionary *hightDict;
@property(nonatomic,strong)UILabel *numLabel;
@property(nonatomic,strong)CADisplayLink *displayLink;

@property(nonatomic,assign)NSTimeInterval lastTime;
@property(nonatomic,assign)NSInteger count;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    
    _displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(displayAction:)];
    [_displayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
}

-(void)dealloc
{
    [_displayLink removeFromRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    _displayLink = nil;
}

-(void)setupUI
{
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_tableView];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [_tableView registerNib:[UINib nibWithNibName:@"CustumTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    _numLabel = [[UILabel alloc] initWithFrame:CGRectMake(200, 60, 100, 20)];
    _numLabel.text = @"60";
    _numLabel.textColor = [UIColor greenColor];
    [self.view addSubview:_numLabel];
}
                    
#pragma mark ============Action===============

-(void)displayAction:(id)sender
{
    if (_lastTime == 0) {
        _lastTime = _displayLink.timestamp;
        return;
    }
    
    _count++;
    NSTimeInterval delta = _displayLink.timestamp - _lastTime;
    if (delta < 1) return;
    _lastTime = _displayLink.timestamp;
    float fps = _count / delta;
    _count = 0;
    
    NSString *text = [[NSString alloc] initWithString:[NSString stringWithFormat:@"%d FPS", (int)round(fps)]];
    
    _numLabel.text = text;
}

#pragma mark ============Delegate==============

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 40;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    self.hightDict[@(indexPath.row)] = @([cell bindHightWithData:indexPath.row]);
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *hight = self.hightDict[@(indexPath.row)];
    return hight?[hight floatValue]:121;
}

#pragma mark ============GetMethod===============

-(NSMutableDictionary*)hightDict
{
    if (!_hightDict) {
        _hightDict = [NSMutableDictionary dictionary];
    }
    return _hightDict;
}
@end









