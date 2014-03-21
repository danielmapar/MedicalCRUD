dataSource {
    pooled = true
    driverClassName = "org.postgresql.Driver"
	dialect = org.hibernate.dialect.PostgreSQLDialect
    username = "postgres"  //"webadmin" 
    password = "99841276" // "Ls1ksevfNK" 
	dbCreate = "update"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
	
// environment specific settings
environments {
    development {	
		dataSource {
			dbCreate = "update" // one of 'create', 'create-drop','update'
			url = "jdbc:postgresql://localhost:5432/modular"
			driverClassName = "org.postgresql.Driver"
			username = "modular" 
			password = "6f82b0a3426f82b0a342111111" 
			dialect = net.sf.hibernate.dialect.PostgreSQLDialect 
		}
    } 
    test {
		dataSource {
			dbCreate = "update" // one of 'create', 'create-drop','update'
			url = "jdbc:postgresql://postgres-modular.jelastic.servint.net/modular"
			driverClassName = "org.postgresql.Driver"
			username = "webadmin" 
			password = "cr4M9Go5BF" 
			dialect = net.sf.hibernate.dialect.PostgreSQLDialect 
		}
    }
    production {
		dataSource {
			dbCreate = "update" // one of 'create', 'create-drop','update'
		    url = "jdbc:postgresql://postgres-modular.jelastic.servint.net/modular"
			driverClassName = "org.postgresql.Driver"
			username = "webadmin" 
			password = "cr4M9Go5BF" 
			dialect = net.sf.hibernate.dialect.PostgreSQLDialect 
		}
     }
 }