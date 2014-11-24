
function create.philo.db {
  createuser -p $DB_PORT -U $DBA_USER -D -R -S -e $PHILO_USER
  # createdb -U postgres -E UTF8 -l pt_BR.UTF-8 -T template0 -e gis
  createdb -p $DB_PORT -U $DBA_USER -E UTF8 -l pt_BR.UTF-8 -T template0 -e $PHILO_DB -O $PHILO_USER
  psql -p $DB_PORT -U $DBA_USER -d $PHILO_DB -c "CREATE EXTENSION postgis;"
  psql -p $DB_PORT -U $DBA_USER -d $PHILO_DB -c "CREATE EXTENSION ltree;"
  psql -p $DB_PORT -U $DBA_USER -d $PHILO_DB -c "CREATE EXTENSION unaccent;"
  #psql -p $DB_PORT -U $DBA_USER -d $PHILO_DB -c "CREATE EXTENSION plv8;"
  

  #psql -p $DB_PORT -U gis
}

function verify.philo.db () {
  psql -p $DB_PORT -U $PHILO_USER -d $PHILO_DB -c "show SERVER_ENCODING;"
  psql -p $DB_PORT -U $PHILO_USER -d $PHILO_DB -c "show LC_COLLATE;"
  psql -p $DB_PORT -U $PHILO_USER -d $PHILO_DB -c "show LC_CTYPE;"
  psql -p $DB_PORT -U $PHILO_USER -d $PHILO_DB -c "SELECT PostGIS_Version();"
  #psql -p $DB_PORT -U $DBA_USER -d gis -c "\d"
}
















function load.philo.db () {
  psql -p $DB_PORT -U $DBA_USER -d $PHILO_DB -f "$KANT_PATH/sql/xmetropol_boundary.sql"
}

function grant.to.philouser () {
  psql -p $DB_PORT -U $DBA_USER -d $PHILO_DB -f "$KANT_PATH/sql/philo-grants.sql"
}





function create.gis.db {
  # createdb -U postgres -E UTF8 -l pt_BR.UTF-8 -T template0 -e gis
  createdb -p $DB_PORT -U $DBA_USER -E UTF8 -l pt_BR.UTF-8 -T template0 -e gis
  psql -p $DB_PORT -U $DBA_USER -d gis -c "CREATE EXTENSION postgis;"
  psql -p $DB_PORT -U $DBA_USER -d gis -c "CREATE EXTENSION ltree;"
  psql -p $DB_PORT -U $DBA_USER -d gis -c "CREATE EXTENSION plv8;"
  createuser -p $DB_PORT -U $DBA_USER -D -R -S -e $GISDB_USER
  #psql -p $DB_PORT -U gis
}

function create.moradia.db {
  # createdb -U postgres -E UTF8 -l pt_BR.UTF-8 -T template0 -e gis
  createuser -p $DB_PORT -U $DBA_USER -D -R -S -e $MORADIADB_USER
  createdb -p $DB_PORT -U $DBA_USER -E UTF8 -l pt_BR.UTF-8 -T template0 -e moradia
  psql -p $DB_PORT -U $DBA_USER -d moradia -c "CREATE EXTENSION postgis;"
  psql -p $DB_PORT -U $DBA_USER -d moradia -c "CREATE EXTENSION postgis_topology;"
  psql -p $DB_PORT -U $DBA_USER -d moradia -c "CREATE EXTENSION ltree;"
  
  # problem
  #psql -p $DB_PORT -U $DBA_USER -d moradia -c "CREATE EXTENSION plv8;"
  #psql -p $DB_PORT -U gis
  #psql -d [yourdatabase] -c "CREATE EXTENSION postgis;"
  #psql -d [yourdatabase] -c "CREATE EXTENSION postgis_topology;"
}

function verify.gis.db () {
  psql -p $DB_PORT -U $DBA_USER -d gis -c "show SERVER_ENCODING;"
  psql -p $DB_PORT -U $DBA_USER -d gis -c "show LC_COLLATE;"
  psql -p $DB_PORT -U $DBA_USER -d gis -c "show LC_CTYPE;"
  psql -p $DB_PORT -U $DBA_USER -d gis -c "SELECT PostGIS_Version();"
  #psql -p $DB_PORT -U $DBA_USER -d gis -c "\d"
}

function verify.moradia.db () {
  psql -p $DB_PORT -U $DBA_USER -d gis -c "show SERVER_ENCODING;"
  psql -p $DB_PORT -U $DBA_USER -d gis -c "show LC_COLLATE;"
  psql -p $DB_PORT -U $DBA_USER -d gis -c "show LC_CTYPE;"
  psql -p $DB_PORT -U $DBA_USER -d gis -c "SELECT PostGIS_Version();"
  #psql -p $DB_PORT -U $DBA_USER -d gis -c "\d"
}

function load.gis.db () {
  psql -p $DB_PORT -U $DBA_USER -d gis -f $IMPORT_DIR/sql/metropol_boundary.sql
  psql -p $DB_PORT -U $DBA_USER -d gis -f $IMPORT_DIR/sql/island.sql
  psql -p $DB_PORT -U $DBA_USER -d gis -f $IMPORT_DIR/sql/wellspring.sql
  psql -p $DB_PORT -U $DBA_USER -d gis -f $IMPORT_DIR/sql/tiete_hydrography.sql
  psql -p $DB_PORT -U $DBA_USER -d gis -f $IMPORT_DIR/sql/rail_tunnel.sql
  psql -p $DB_PORT -U $DBA_USER -d gis -f $IMPORT_DIR/sql/main_highways.sql
  psql -p $DB_PORT -U $DBA_USER -d gis -f $IMPORT_DIR/sql/municipal_seats.sql
  psql -p $DB_PORT -U $DBA_USER -d gis -f $IMPORT_DIR/sql/main_hydrography.sql	
  psql -p $DB_PORT -U $DBA_USER -d gis -f $IMPORT_DIR/sql/simple_hydrography.sql	
  psql -p $DB_PORT -U $DBA_USER -d gis -f $IMPORT_DIR/sql/main_contour.sql	
  psql -p $DB_PORT -U $DBA_USER -d gis -f $IMPORT_DIR/sql/land_use.sql
}

function load.moradia.db () {
  psql -p $DB_PORT -U $DBA_USER -d moradia -f $IMPORT_DIR/sql/xmetropol_boundary.sql
}

function grant.to.gisuser () {
  psql -p $DB_PORT -U $DBA_USER -d gis -f "$HABITATIONE_ROOT_PATH/sql/gis-grants.sql"
}

function grant.to.moradiauser () {
  psql -p $DB_PORT -U $DBA_USER -d moradia -f "$HABITATIONE_ROOT_PATH/sql/moradia-grants.sql"
}



function setup.gis {

  setup.postgres
  create.gis.db
  load.gis.db
  grant.to.gisuser

}

function setupx.moradia {

  setup.postgres
  create.gis.db
  load.gis.db
  grant.to.gisuser

}