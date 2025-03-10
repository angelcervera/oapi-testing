package repository

import (
	"context"
	"github.com/uptrace/bun"
	"palmyra-pro-api/pkg/db/models"
)

type farmerRepo struct {
	db *bun.DB
}

func NewFarmerRepo(db *bun.DB) FarmerRepo {
	return &farmerRepo{
		db: db,
	}
}

func (r *farmerRepo) CreateFarmer(ctx context.Context, farmer *models.Farmer) error {
	_, err := r.db.NewInsert().Model(farmer).Exec(ctx)
	return err
}

func (r *farmerRepo) GetFarmerByID(ctx context.Context, id string) (*models.Farmer, error) {
	farmer := new(models.Farmer)
	err := r.db.NewSelect().Model(farmer).Where("id = ?", id).Scan(ctx)
	return farmer, err
}

func (r *farmerRepo) UpdateFarmer(ctx context.Context, farmer *models.Farmer) error {
	_, err := r.db.NewUpdate().Model(farmer).Where("id = ?", farmer.ID).Exec(ctx)
	return err
}

func (r *farmerRepo) DeleteFarmer(ctx context.Context, id string) error {
	_, err := r.db.NewDelete().Model((*models.Farmer)(nil)).Where("id = ?", id).Exec(ctx)
	return err
}

func (r *farmerRepo) QuickSearchFarmers(ctx context.Context, fuzzyFilter string, limit, offset int) ([]*models.FarmerQuickSearch, error) {
	var err error
	var farmers []*models.FarmerQuickSearch

	// rawQuery := r.db.NewRaw(
	// 	`
	// select
	//     *,
	//     farm.id as farmId, farm.name as farmName,
	//     role.id as roleId, role."displayName" as roleDisplayName
	// from farmer
	//     left join farm on farm.id = farmer."farmId"
	//     left join role on farmer."roleId" = role.id
	// 	where 1=1
	// `,
	// )

	query := r.db.NewSelect().
		Model(&farmers).
		// FIXME: WTF!!! Don't use upper case in databases!!!! https://wiki.postgresql.org/wiki/Don't_Do_This#Don.27t_use_upper_case_table_or_column_names
		ColumnExpr(`farmer_quick_search.*, farm.id AS "farmId", farm.name AS "farmName", role.id AS "roleId", role."displayName" AS "roleDisplayName"`).
		Join(`left join farm on farm.id = farmer_quick_search."farmId"`).
		Join(`left join role ON farmer_quick_search."roleId" = role.id`)

	// FIXME: Use a real fuzzy search solution.
	if len(fuzzyFilter) > 4 {
		query = query.WhereOr(`"firstName" || ' ' || "lastName" ILIKE ? OR farmer_quick_search.id = ?`, "%"+fuzzyFilter+"%", fuzzyFilter)
	} else if len(fuzzyFilter) <= 4 {
		query = query.WhereOr("farmer_quick_search.id = ?", fuzzyFilter)
	}

	if limit > 0 {
		query = query.Limit(limit)
	}

	if offset > 0 {
		query = query.Offset(offset)
	}

	err = query.Scan(ctx, &farmers)

	return farmers, err
}

func (r *farmerRepo) ListFarmers(ctx context.Context, fuzzyFilter string, filter map[string]interface{}, limit, offset int) ([]*models.Farmer, error) {
	var farmers []*models.Farmer
	query := r.db.NewSelect().Model(&farmers)

	// Apply filters
	for key, value := range filter {
		query = query.Where("? = ?", bun.Ident(key), value)
	}

	// FIXME: Use a real fuzzy search solution.
	if len(fuzzyFilter) > 4 {
		query = query.Where(`"firstName" || ' ' || "lastName" ILIKE ?`, fuzzyFilter)
	}

	// Apply pagination
	query = query.Limit(limit).Offset(offset)

	err := query.Scan(ctx)
	return farmers, err
}
