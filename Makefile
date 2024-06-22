# asyncinotify Makefile

clean:
	@rm -rf *.egg* build dist *.py[oc] */*.py[co] cover doctest_pypi.cfg \
		nosetests.xml pylint.log output.xml flake8.log tests.log \
		test-result.xml htmlcov fab.log .coverage __pycache__ \
		*/__pycache__ deb_dist .mypy_cache

deb_dist: 
	python3 setup.py --command-packages=stdeb.command sdist_dsc

bdist_deb: deb_dist 
	cd deb_dist/asyncinotify-*/ && dpkg-buildpackage -rfakeroot -uc -us

package: bdist_deb 
