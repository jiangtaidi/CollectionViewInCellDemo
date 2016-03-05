//
//  CustumTableViewCell.m
//  CellqianruCollectionView
//
//  Created by jiangtd on 16/3/5.
//  Copyright © 2016年 jiangtd. All rights reserved.
//

#import "CustumTableViewCell.h"
#import "CustumCollectionViewCell.h"

@implementation CustumTableViewCell

- (void)awakeFromNib {
    
    _collectView.dataSource = self;
    _collectView.delegate = self;
    _collectView.backgroundColor = [UIColor whiteColor];
    [_collectView registerNib:[UINib nibWithNibName:@"CustumCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
}

-(CGFloat)bindHightWithData:(NSInteger)index
{
    _index = index + 1;
    [_collectView reloadData];
    _collectViewHightCos.constant = _collectView.collectionViewLayout.collectionViewContentSize.height;
    [self setNeedsUpdateConstraints];
    [self updateConstraintsIfNeeded];
    return 21 + _collectViewHightCos.constant;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _index ;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    return cell;
}
@end













