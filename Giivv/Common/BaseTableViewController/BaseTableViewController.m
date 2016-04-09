//
//  BaseTableViewController.m
//  Giivv
//
//  Created by 熊梓君 on 16/4/10.
//  Copyright © 2016年 Xiong, Zijun. All rights reserved.
//

#import "BaseTableViewController.h"
#import "EGORefreshTableHeaderView.h"
#import "EGORefreshTableFooterView.h"

@interface BaseTableViewController()<EGORefreshTableDelegate, UIScrollViewDelegate, UITableViewDataSource, UITableViewDelegate>
@property(nonatomic, assign) BOOL reloading;
@property(nonatomic, strong) EGORefreshTableHeaderView *refreshHeaderView;
@property(nonatomic, strong) EGORefreshTableFooterView *refreshFooterView;
@end

@implementation BaseTableViewController
#pragma mark - getters and setters
- (EGORefreshTableHeaderView *)refreshHeaderView{
    if(!_refreshHeaderView){
        _refreshHeaderView = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f , -self.mainTableView.height, self.mainTableView.width, self.mainTableView.height)];
        _refreshHeaderView.delegate = self;
    }
    return _refreshHeaderView;
}

- (UITableView *)mainTableView{
    if(!_mainTableView){
        _mainTableView = [[UITableView alloc] initWithFrame: CGRectMake(0.0f, 0.0f, SCREEN_WIDTH, CONTENT_HEIGHT)];
        [_mainTableView setShowsVerticalScrollIndicator: NO];
        [_mainTableView setDelegate: self];
        [_mainTableView setDataSource: self];
        [self.mainTableView addSubview: self.refreshHeaderView];
        [self.refreshHeaderView refreshLastUpdatedDate];
    }
    return _mainTableView;
}

#pragma mark - load
- (void)viewDidLoad{
    [super viewDidLoad];
    [self.view addSubview: self.mainTableView];
}

#pragma mark - update and create footerView
-(void)updateRefreshFooterView{
    CGFloat height = MAX(self.mainTableView.contentSize.height, self.mainTableView.height);
    if (_refreshFooterView && [_refreshFooterView superview]){
        _refreshFooterView.frame = CGRectMake(0.0f, height, self.mainTableView.width, SCREEN_HEIGHT);
    }
    else{
        _refreshFooterView = [[EGORefreshTableFooterView alloc] initWithFrame:
                              CGRectMake(0.0f, height, self.mainTableView.width, SCREEN_HEIGHT)];
    }
    _refreshFooterView.delegate = self;
    [self.mainTableView addSubview:_refreshFooterView];
    [_refreshFooterView refreshLastUpdatedDate];
    _reloading = NO;
}

#pragma mark - tableView datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

#pragma mark - UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == self.mainTableView)
    {
        if (_refreshHeaderView)
        {
            [_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
        }
        if (_refreshFooterView)
        {
            [_refreshFooterView egoRefreshScrollViewDidScroll:scrollView];
        }
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    if (scrollView == self.mainTableView)
    {
        if (_refreshHeaderView)
        {
            [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
        }
        if (_refreshFooterView)
        {
            [_refreshFooterView egoRefreshScrollViewDidEndDragging:scrollView];
        }
    }
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    if (scrollView == self.mainTableView)
    {
        if (_refreshHeaderView)
        {
            [_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
        }
        if (_refreshFooterView)
        {
            [_refreshFooterView egoRefreshScrollViewDidEndDragging:scrollView];
        }
    }
}

#pragma mark -
#pragma mark EGORefreshTable Delegate
- (void)egoRefreshTableDidTriggerRefresh:(EGORefreshPos)aRefreshPos{
    if (aRefreshPos == EGORefreshHeader){
        [self callbackForHeaderRefreshView];
    }
    else if(aRefreshPos == EGORefreshFooter){
        [self callbackForFooterRefreshView];
    }
    [self performSelector:@selector(finishReloadingData) withObject:nil afterDelay: 1.0f];
}

- (BOOL)egoRefreshTableDataSourceIsLoading:(UIView*)view{
    return _reloading;
}

- (NSDate*)egoRefreshTableDataSourceLastUpdated:(UIView*)view{
    return [NSDate date];
}


#pragma mark - The data load method
- (void)finishReloadingData{
    _reloading = NO;
    if (_refreshHeaderView) {
        [_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading: self.mainTableView];
    }
    if (_refreshFooterView) {
        [_refreshFooterView egoRefreshScrollViewDataSourceDidFinishedLoading: self.mainTableView];
    }
}

#pragma mark - public method
- (void)callbackForHeaderRefreshView{}

- (void)callbackForFooterRefreshView{}

#pragma mark - dealloc
- (void)dealloc{
}
@end
