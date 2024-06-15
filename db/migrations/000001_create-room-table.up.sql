CREATE TABLE rooms (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    host_name VARCHAR(255) NOT NULL,
    min_user_num INT NOT NULL,
    max_user_num INT NOT NULL,
    use_cpu BOOLEAN NOT NULL
);
