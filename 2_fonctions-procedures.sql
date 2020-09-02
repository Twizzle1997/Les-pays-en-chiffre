CREATE OR REPLACE PROCEDURE insert_country(name VARCHAR)
LANGUAGE PLPGSQL
AS $$
    DECLARE
        temp_pop int := RANDOM() * 100000000;
        temp_density int := RANDOM() * 1000;
        temp_area int := temp_pop/temp_density;
    BEGIN
        INSERT INTO countries VALUES (name, temp_pop, temp_density, temp_area);
END;
$$;

CREATE OR REPLACE FUNCTION density_range(text) RETURNS TABLE (country_name TEXT, country_pop INT,country_density INT,country_area INT,pop_range TEXT)
LANGUAGE PLPGSQL
AS $$
    BEGIN
        RETURN QUERY
            SELECT country, pop, density, area,
                CASE 
                WHEN density > 350 THEN 'Densément peuplés'
                WHEN density BETWEEN 133 AND 350 THEN 'Densité intermédiaire'
                WHEN density BETWEEN 51 AND 133 THEN 'Peu denses'
                WHEN density BETWEEN 0 AND 50 THEN 'Très peu denses'
            END as "pop_range"
            FROM countries 
            WHERE country= $1;
    END; 
$$ ;

CREATE OR REPLACE FUNCTION viewcountry(text) RETURNS countries
AS $$
    SELECT * FROM countries WHERE country= $1;
$$
LANGUAGE SQL;

CREATE OR REPLACE FUNCTION set_insertion()
RETURNS TRIGGER 
LANGUAGE PLPGSQL
AS $$
    BEGIN
        NEW.last_update := now();
        RETURN NEW;
    END;
$$;
