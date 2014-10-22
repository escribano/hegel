function hegel.help () {
  echo "
  hegel.help (kant/lib/help/help)
  wget -qO- https://github.com/escribano/hegel/raw/master/install | bash
  ----------------------------------------------------------------------

(D) hegel.sync; (D) push.hegel

(D) hegel.sync.kant; (D) push.kant
(D) kant.deploy.nginx
kant.setup.nginx
(D) kant.deploy.database
kant.setup.database
(D) kant.deploy.mapserver
kant.setup.mapserver

(D) hegel.deploy.plato
(L) hegel.setup.plato
(D) push.plato

(D) hegel.deploy.owl
(L) hegel.setup.owl
(D) push.owl

(D) hegel.deploy.civis
(L) hegel.setup.civis
(D) push.civis



hegel.install.nginx
hegel.install.postgres
hegel.install.mapserver




hegel.remote

install, update, upgrade, reinstall, uninstall, outdated
help, commands, config, info, log, search, list, options
link, linkapps, unlink, unlinkapps, unpack


  (D) hegel.sync (hege/lib/sync/sync)
      (D) push.hegel (hegel/lib/util)
      ssh (L) hegel.update (hegel/lib/util)
  (D) hegel.deploy.kant
      (D) deploy.kant (kant/lib/util)
      ssh sudo (L) hegel.upgrade kant (hegel/lib/xinstall)
  (D) hegel.deploy.plato
      (D) deploy.plato (kant/lib/util)
      (L) ssh sudo bash hegel.upgrade.plato
  hegel.deploy.nginx
*     (D) run.nginx.template prd (kant/lib/nginx/template)
      (D) deploy.nginx
      ssh sudo hegel.upgrade.nginx

  (D) update.nginx
*     (D) run.nginx.template dev (kant/lib/nginx/template)
      update.nginx.conf (kant/lib/nginx/nginx)

  --- Linux Deploy

  (L) hegel.install <package> (hegel/lib/xinstall)
      (L) hegel.install kant
  (L) hegel.upgrade <package> (hegel/lib/xinstall)

* (L) hegel.upgrade.plato (hegel/lib/xinstall)

  --- Darwin Build n Deploy
  (D) push.kant (kant/lib/util)

  
  --- Missing
  (D) push.plato (missing)
  (D) push.owl (missing)
  (D) push.civis (missing)
* (D) deploy.owl (missing)
* (D) deploy.civis (missing)
* (L) hegel.deploy.owl (missing)
* (L) hegel.deploy.civis (missing)
* (L) hegel.upgrade.plato (missing)
  daemonize.owl (missing)
  daemonize.mapserver (missing)
  setup.database (missing)
  setup.data.workspace (missing)
  
  --- Automate Build
  update.nginx.conf (kant/lib/nginx/nginx)
  go-linux-amd64 build (kant/lib/crosscompile) [see makefile sein]

  --- Darwin Dev Setup
  (D) hegel.clone <package> <path> (hegel/lib/xinstall)
      (D) hegel.clone plato html
      (D) hegel.clone owl ngo
      (D) hegel.clone civis ngo
  (D) hegel.link (hegel/lib/xinstall)

  --- Darwin Service Control
  (D) reload.pg (kant/lib/tools/mac)
  (D) restartDnsmasq (kant/lib/tools/helpers)
  
  --- ec2
  (D) setup.ec2 (kant/lib/cloud/ec2.sh)
  (L) master.user (hegel/lib/boot)
  (L) config.locale (hegel/lib/boot)
  (L) install.packages (hegel/lib/boot)
  (L) intall.nginx (kant/lib/nginx/nginx)
  (L) kant.db.config (kant/lib/db/postgres)
  
  --- philosophie
  (D) mate.hegel (hegel/lib/util)
  (D) mate.kant (kant/lib/util)
  (D) source.hegel (hegel/lib/util)
  (D) source.kant (kant/lib/util)
  
  hegel.info (hegel/lib/util)
  kant.info (kant/lib/util)
  gohegel (hegel/lib/util)
  gokant (kant/lib/util)
  
  --- Database
  _db.settings (kant/lib/db/db-settings)
  show.db.settings (kant/lib/db/db-settings)
  create.philo.db (kant/lib/db/db-setup)
  verify.philo.db (kant/lib/db/db-setup)
  setup.regfund.workspace (kant/lib/db/db-tools)
  xplode.shape (kant/lib/db/db-tools)
  info.shape (kant/lib/db/db-tools)
  gen.parcel.sql (kant/lib/db/db-tools)
  load.parcel.sql (kant/lib/db/db-tools)
  transform.parcel (kant/lib/db/db-tools)
  drop.transformed.parcel (kant/lib/db/db-tools)
  
  --- Dev only
  (D) setup.geoadmin (kant/lib/git/upstream)
  (D) update.geoadmin (kant/lib/git/upstream)
  (D) setup.mux (kant/lib/git/upstream)
  (D) update.mux (kant/lib/git/upstream)
  
  --- Darwin only
  (D) update.git-completion (kant/lib/style/prompt)
  (D) update.git-prompt (kant/lib/style/prompt)
  (D) activate.liquidprompt (kant/lib/style/prompt)
  (D) mate.liquidpromptrc (kant/lib/style/prompt)
  (D) open.liquidprompt (kant/lib/style/prompt)
  (D) mateman (kant/lib/tools/helpers)
  (D) getpdfs1 (kant/lib/tools/helpers)
  (D) getall (kant/lib/tools/helpers)
  
  --- Misc
  setup.colours (kant/lib/style/colours)
  show.colors (kant/lib/style/colours)
  print.cidr (kant/lib/tools/network)
  
  --- Fix
  2x tar (hegel/lib/tar), (kant/tools/archiving)  
  show.function (hegel/lib/tools)
  show.function (kant/lib/tools/helpers)
  "
}