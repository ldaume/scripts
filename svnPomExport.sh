# reads a file with svn dirs to pom files like foo/bar/trunk/pom.xml and exports the dir and file structure.
# usage: svnPomExport.sh <fileWithPaths> <svn_base_uri>
# example: svnPomExport.sh latestPoms.txt https://svn.example.com/repos/important/

while read p; do
	DIR=$(dirname "${p}")
	mkdir -p $DIR
	svn export --force $2$p
	mv pom.xml $DIR
done <$1
