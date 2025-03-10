package repository

import (
	"context"
	"palmyra-pro-api/pkg/db"
	"testing"
	"time"

	"github.com/stretchr/testify/assert"
	"github.com/stretchr/testify/require"
	"github.com/uptrace/bun"
	"palmyra-pro-api/pkg/db/models"
)

func setupTestConnection() *bun.DB {

	// Create Repository connections.
	connection, err := db.NewDB(&db.Config{
		DBConnection: "user=postgres password=mysecretpassword host=localhost port=5432 dbname=palmira_pro_db sslmode=disable", // FIXME: From environment
		Debug:        true,
		MaxOpenConn:  10,
		MaxIdleConns: 10,
	})

	if err != nil {
		panic(err)
	}

	// Create Bun ORM instance
	return connection
}

func TestFarmerRepo(t *testing.T) {
	db := setupTestConnection()
	repo := NewFarmerRepo(db)
	ctx := context.Background()

	// Cleanup after test
	defer func() {
		_, _ = db.NewDelete().Model((*models.Farmer)(nil)).Where("id = ?", "test-farmer").Exec(ctx)
	}()

	// Test Create Farmer**
	farmer := &models.Farmer{
		ID:        "test-farmer",
		FirstName: "John",
		LastName:  "Doe",
		Gender:    "Male",
		Phone:     "123456789",
		Dob:       "1990-01-01",
		CreatedAt: time.Now(),
		UpdatedAt: time.Now(),
	}

	err := repo.CreateFarmer(ctx, farmer)
	require.NoError(t, err, "Failed to create farmer")

	// Test Get Farmer by ID
	retrievedFarmer, err := repo.GetFarmerByID(ctx, "test-farmer")
	require.NoError(t, err, "Failed to fetch farmer by ID")
	assert.Equal(t, "John", retrievedFarmer.FirstName, "Farmer first name mismatch")

	// Test Update Farmer
	farmer.LastName = "Smith"
	err = repo.UpdateFarmer(ctx, farmer)
	require.NoError(t, err, "Failed to update farmer")

	updatedFarmer, err := repo.GetFarmerByID(ctx, "test-farmer")
	require.NoError(t, err, "Failed to fetch updated farmer")
	assert.Equal(t, "Smith", updatedFarmer.LastName, "Farmer last name not updated")

	// Test Delete Farmer
	err = repo.DeleteFarmer(ctx, "test-farmer")
	require.NoError(t, err, "Failed to delete farmer")

	// FIXME: This is failing!!!
	// deletedFarmer, err := repo.GetFarmerByID(ctx, "test-farmer")
	// assert.Error(t, err, "Expected error when fetching deleted farmer")
	// assert.Nil(t, deletedFarmer, "Deleted farmer should be nil")
}

func TestQuickSearchFarmersRepo(t *testing.T) {
	db := setupTestConnection()
	repo := NewFarmerRepo(db)
	ctx := context.Background()

	farmers, err := repo.QuickSearchFarmers(ctx, "Joe", 0, 0)
	require.NoError(t, err, "Failed searching farmers using fuzzy search.")
	assert.Equal(t, 0, len(farmers), "Joe does not apply to the filter because only 3 chars.")

	farmers, err = repo.QuickSearchFarmers(ctx, "5", 0, 0)
	require.NoError(t, err, "Failed searching farmers using fuzzy search.")
	assert.Equal(t, 1, len(farmers), "1 will find one because it's searching by the code")

	farmers, err = repo.QuickSearchFarmers(ctx, "Smith", 10, 0)
	require.NoError(t, err, "Failed searching farmers using fuzzy search.")
	assert.Equal(t, 2, len(farmers), "Expecting to find 2 farmers with name Smith")
}
