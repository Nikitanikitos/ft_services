echo "GRANT ALL ON *.* TO admin@'%' IDENTIFIED BY 'admin' \
					WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql
