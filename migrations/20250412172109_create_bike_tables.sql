-- +goose Up
-- +goose StatementBegin
CREATE TABLE bikes (
    bike_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    model_name VARCHAR(255) NOT NULL,
    purchase_date DATE
);

CREATE TABLE bike_parts (
    part_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    bike_id UUID NOT NULL,
    part_name VARCHAR(255) NOT NULL,
    condition_percent INT CHECK (condition_percent BETWEEN 0 AND 100),
    last_maintenance DATE
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE bike_parts;
DROP TABLE bikes;
-- +goose StatementEnd
