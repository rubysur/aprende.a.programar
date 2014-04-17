install:
	npm install -g grunt-cli
	npm install grunt@0.4.1
	npm install grunt-gitbook@0.2.0
	npm install grunt-gh-pages@0.9.1
	npm install grunt-contrib-clean@0.5.0

publish:
	git push
	grunt publish

server:
	gitbook serve
