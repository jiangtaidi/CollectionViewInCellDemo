//
//  CustumTableViewCell.h
//  CellqianruCollectionView
//
//  Created by jiangtd on 16/3/5.
//  Copyright © 2016年 jiangtd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustumTableViewCell : UITableViewCell<UICollectionViewDataSource,UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *collectViewHightCos;
@property(nonatomic,assign)NSInteger index;

-(CGFloat)bindHightWithData:(NSInteger)index;

@end
