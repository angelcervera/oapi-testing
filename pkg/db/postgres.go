package db

import (
	"github.com/jackc/pgx/v5"
	"github.com/jackc/pgx/v5/stdlib"
	"github.com/uptrace/bun"
	"github.com/uptrace/bun/dialect/pgdialect"
	"github.com/uptrace/bun/extra/bundebug"
	"log"
)

type Config struct {
	DBConnection string
	Debug        bool
	MaxOpenConn  int
	MaxIdleConns int
}

func NewDB(c *Config) (*bun.DB, error) {
	config, err := pgx.ParseConfig(c.DBConnection)
	if err != nil {
		return nil, err
	}

	sqldb := stdlib.OpenDB(*config)
	sqldb.SetMaxOpenConns(c.MaxOpenConn)
	sqldb.SetMaxIdleConns(c.MaxIdleConns)

	// Ensure the connection is working
	if err := sqldb.Ping(); err != nil {
		log.Fatalf("Unable to connect to database: %v", err)
	}

	db := bun.NewDB(sqldb, pgdialect.New())
	if c.Debug {
		db.AddQueryHook(bundebug.NewQueryHook(bundebug.WithVerbose(true)))
	}

	return db, nil
}
