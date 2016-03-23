//
//  ViewController.m
//  myTableView
//
//  Created by 向春晓 on 16/3/23.
//  Copyright © 2016年 Person. All rights reserved.
//
#import "Masonry.h"
#import "ViewController.h"
#import "MyHeadView.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic ,strong)UITableView *tableView;
@property (nonatomic, strong)UIButton *btnA;
@property (nonatomic, strong)UIButton *btnB;
@property (nonatomic, strong)UIButton *btnC;
@property (nonatomic, strong)UIButton *btnD;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
   
    
    self.tableView.delegate =self;
    self.tableView.dataSource =self;
    self.tableView.scrollEnabled = YES;
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.mas_equalTo(self.view);
    }];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    CGFloat w =self.view.bounds.size.width/4;
     self.tableView.tableHeaderView = headerView;
    for (int i =0 ; i<4; i ++) {
        UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(w*i,44, w, 44)];
        btn.backgroundColor  =[UIColor greenColor];
        
        [headerView addSubview:btn];
    }
    
    headerView.backgroundColor = [UIColor redColor];
  
    
    //foot CollectionView
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc]init];
    UICollectionView *collview = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) collectionViewLayout:flow];
    flow.itemSize =CGSizeMake(180, 150);
    flow.sectionHeadersPinToVisibleBounds = YES;
    collview.delegate =self;
    
    collview.scrollsToTop =YES;
    collview.dataSource =self;
    [collview registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellB"];
    [collview registerClass:[MyHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headView"];
    
    self.tableView.tableFooterView = collview;



 

}



#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %ld", indexPath.row];
    
    return cell;
}


//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForFooterInSection:(NSInteger)section
//{
//    return 44;
//}
#pragma mark - collectionView Delegate methods


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 100;
    
}



- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellB" forIndexPath:indexPath];
    
    cell.backgroundColor =[ UIColor blueColor];
    return cell;
    
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        MyHeadView *headview= [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headView" forIndexPath:indexPath];
        
    
        return headview;
    }
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(self.view.bounds.size.width, 60);
}

@end
