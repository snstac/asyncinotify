# asyncinotify Makefile

deb_dist: 
	python3 setup.py --command-packages=stdeb.command sdist_dsc

bdist_deb: deb_dist 
	cd deb_dist/asyncinotify-*/ && dpkg-buildpackage -rfakeroot -uc -us

package: bdist_deb 
