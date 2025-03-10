package api

import (
	"context"
	openapi_types "github.com/oapi-codegen/runtime/types"
	"github.com/spf13/cast"
	"time"
)

// Search farmers
// (GET /farmers/search)
func (s Server) SearchFarmers(ctx context.Context, request SearchFarmersRequestObject) (SearchFarmersResponseObject, error) {

	pageSize := cast.ToInt(request.Params.PageSize)
	if pageSize == 0 {
		pageSize = 10
	}
	farmers, err := s.FarmerRepo.QuickSearchFarmers(
		ctx,
		cast.ToString(request.Params.Query),
		pageSize,
		cast.ToInt(request.Params.Page)*pageSize,
	)

	if err != nil {
		return nil, err
	}

	var results []Farmer
	for _, f := range farmers {
		dob, err := time.Parse("2006-01-02", f.Dob)
		if err != nil {
			return nil, err
		}

		results = append(results, Farmer{
			Id:        f.ID,
			CountryId: &f.CountryID,
			CreatedAt: f.CreatedAt,
			Dob: openapi_types.Date{
				Time: dob,
			},
			FirstName:       f.FirstName,
			Gender:          &f.Gender,
			LastName:        &f.LastName,
			Phone:           &f.Phone,
			RegionId:        &f.RegionID,
			RoleDisplayName: &f.RoleDisplayName,
			RoleId:          &f.RoleID,
			UpdatedAt:       f.UpdatedAt,
		})
	}

	response := FarmerList{
		Page:       nil,
		PageSize:   nil,
		Results:    &results,
		Total:      nil,
		TotalPages: nil,
	}

	return SearchFarmers200JSONResponse(response), nil
}
