
function _db.settings () {
  #[ $UNAME -eq "" ] && $bashPath/plotryxt.bash -fry=$fcmd.ry -fxt=$fcmd.xt
  #DB_USER=ademir # postgres
  #DB_USER=$(( "$UNAME" == "Darwin" ? "ademir" : "postgres" ))  
  #[ "$UNAME" == "Darwin" ] && DB_USER=ademir || DB_USER=postgres
  me="ademir"
  pg="postgres"
  #DBA_USER=$([ "$UNAME" == "Darwin" ] && echo "$me" || echo "$pg")
  #GISDB_USER="gisuser"
  PHILO_DB="philo"
  PHILO_USER="rousseau"
  MORADIADB_USER="moradiauser"
  #DEBIAN_IMPORT_DIR="/mnt/ebs/data/mapa/import"
  #MAC_IMPORT_DIR="$HOME/code/habitacao/data/mapa/import"
  # IMPORT_DIR=$([ "$UNAME" == "Darwin" ] && echo "$MAC_IMPORT_DIR" || echo "$DEBIAN_IMPORT_DIR")
  #DEBIAN_DATA=/mnt/ebs/data
  #MAC_DATA="~/code/data"
  DBA_USER=$([ "$UNAME" == "Darwin" ] && echo "$me" || echo "$pg")
  GISDB_USER="gisuser"
  # IMPORT_DIR=$([ "$UNAME" == "Darwin" ] && echo "$MAC_DATA/import" || echo "$DEBIAN_DATA/mapa/import")""

  #MAINDB_NAME="postgres"
  #GISDB_NAME="gis"
  DB_PORT=5432
  #[[ $(find /path/to/file -type f -size +51200c 2>/dev/null) ]] && echo true || echo false
  PGVER_QUERY="SHOW server_version;"
  PGISVER_QUERY="select default_version from pg_available_extensions where name='postgis';"
  #PGMVER_QUERY="SELECT substring(version() from $$(\d+)\.\d+\.\d+$$)::smallint;"
  PGMVER_QUERY='SELECT substring(version() from $$(\d+\.\d+)\.\d+$$)::char(3);'
  POSTGRES_VERSION=`psql -U $DBA_USER -d postgres -c "$PGVER_QUERY" -t -A`
  POSTGRES_MVERSION=`psql -U $DBA_USER -d postgres -c "$PGMVER_QUERY" -t -A`
  POSTGIS_VERSION=`psql -U $DBA_USER -d postgres -c "$PGISVER_QUERY" -t -A`
}

function show.db.settings () {
  #_db.settings
  echo "DBA_USER is $DBA_USER"
  echo "PHILO_USER user is $PHILO_USER"
  echo "PHILO_DB user is $PHILO_DB"
  echo "DB_PORT user is $DB_PORT"
  echo "DATA_PATH is $DATA_PATH"
  echo "REGFUND_PATH is $REGFUND_PATH"
  echo "POSTGRES_VERSION is $POSTGRES_VERSION"
  echo "POSTGRES_MVERSION is $POSTGRES_MVERSION"
  echo "POSTGIS_VERSION is $POSTGIS_VERSION"
  
  #psql -U $DBA_USER -d postgres -c "SELECT substring(version() from $$(\d+)\.\d+\.\d+$$)::smallint;"
  #psql -U $DBA_USER -d postgres -c "SELECT substring(version() from $$(\d+)\.\d+\.\d+$$)::smallint;"
  
}