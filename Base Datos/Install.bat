@echo Instalador de la Base de Universidad
@echo Comenzando la instalacion
sqlcmd -S.\SQLEXPRESS -E -i "BDVentas.sql"
@echo Finalizada la instalacion.... 
pause