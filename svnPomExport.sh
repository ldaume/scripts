# scans a svn for pom files like foo/bar/trunk/pom.xml and exports the dir and file structure.
# usage: svnPomExport.sh <svn_base_uri>
# example: svnPomExport.sh https://svn.example.com/repos/important/

svn list -R $1 | grep --line-buffered pom.xml > allpoms
while read p; do
	DIR=$(dirname "${p}")
	mkdir -p $DIR
	svn export --force $1/$p
	mv pom.xml $DIR
done <allpoms
