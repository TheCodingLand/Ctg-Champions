Ce projet contiendra tous les composants pour réaliser cetta application.


# BACKEND :
-	Une base de données (postgres, mysql, mongo, ou mariadb) 
-	Un service de synchronisation avec des api externes vers notre db (depuis  https://www.football-data.org/index)  

# FRONTEND :
-	Un service d’api pour communiquer avec nos clients (web et mobiles)
-	Un front end web
-	(appli mobile non containerisée)

# NETWORK : 
-	Un reverse proxy pour accéder au serveur via HTTPS.(Traefik 2.0), SSL avec letsencrypt.

# ADMIN :
-	Un système de management pour nos containers (probablement Portainer)
-	Kibana
-	Elasticsearch
-	Logstash
-	Prometheus (metrics pour grafana)
-	Grafana (graphs infra + monitoring)
-	AlertManager (générateur d’alertes pour grafana)
