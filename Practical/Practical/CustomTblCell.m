//
//  CustomTblCell.m
//  Practical
//
//  Created by Ila Panchal on 07/07/21.
//

#import "CustomTblCell.h"

@implementation CustomTblCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - Delegate Methods
#pragma mark CollectionView DataSource & Delegate
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_arrUserItemData count];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize cellsize = CGSizeMake(0, 0);
    
    if(((_arrUserItemData.count)%2) == 0){
        cellsize = CGSizeMake(((self.contentView.frame.size.width)-40)/2, ((self.contentView.frame.size.width)-40)/2);
    }else {
        if(indexPath.item == 0) {
            cellsize = CGSizeMake(((self.contentView.frame.size.width)-20), ((self.frame.size.width)-20));
        }else {
            cellsize = CGSizeMake(((self.contentView.frame.size.width)-40)/2, ((self.contentView.frame.size.width)-40)/2);
        }
    }
   
    return cellsize;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {

   CustomCollectionCell *cell = [collectionView   dequeueReusableCellWithReuseIdentifier:@"CustomCollectionCell" forIndexPath:indexPath];
    
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString:[_arrUserItemData objectAtIndex:indexPath.item]]];
    cell.imgViewItem.image = [UIImage imageWithData: imageData];
    
    return cell;
}


@end
