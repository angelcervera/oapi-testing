package api

import "palmyra-pro-api/pkg/db/repository"

type Server struct {
	FarmerRepo repository.FarmerRepo
}
