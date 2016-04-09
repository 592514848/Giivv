//
//  BaseTableViewController.h
//  Giivv
//
//  Created by 熊梓君 on 16/4/10.
//  Copyright © 2016年 Xiong, Zijun. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseTableViewController : BaseViewController
@property(nonatomic, strong) UITableView *mainTableView;

/**
 *  update and create footerView
 */
- (void)updateRefreshFooterView;

/**
 *  The drop-down refresh the callback
 */
- (void)callbackForHeaderRefreshView;

/**
 *  Pull-up loads more callback
 */
- (void)callbackForFooterRefreshView;
@end
