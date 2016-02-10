CREATE OR REPLACE FUNCTION director.director_id(text)
  RETURNS integer AS
$BODY$
    SELECT CASE WHEN $1 != ''
    THEN regexp_replace($1, E'^.*\\.(\\d+)$', E'\\1')::integer
    END
  $BODY$ LANGUAGE sql IMMUTABLE;

COMMENT ON FUNCTION director.director_id(text) 
    IS 'CREATED WITH id_functions.sql FROM https://github.com/iangow/equilar/';

CREATE OR REPLACE FUNCTION director.equilar_id(text)
  RETURNS integer AS
$BODY$
    SELECT CASE WHEN $1 != ''
    THEN regexp_replace($1, E'^(\\d+)\\..*$', E'\\1')::integer
    END
$BODY$ LANGUAGE sql IMMUTABLE;

COMMENT ON FUNCTION director.equilar_id(text) 
    IS 'CREATED WITH id_functions.sql FROM https://github.com/iangow/equilar/';

CREATE OR REPLACE FUNCTION director.equilar_director_id(text)
  RETURNS equilar_director_id AS
$BODY$
    SELECT CASE WHEN $1 != ''
    THEN (director.equilar_id($1), 
            director.director_id($1))::equilar_director_id 
    END
$BODY$ LANGUAGE sql IMMUTABLE;

COMMENT ON FUNCTION director.equilar_director_id(text) 
    IS 'CREATED WITH id_functions.sql FROM https://github.com/iangow/equilar/';

  

