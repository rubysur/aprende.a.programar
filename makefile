bin = ./node_modules/.bin

install:
	npm install gitbook@0.4.2
	npm install grunt-cli@0.1.13
	npm install grunt@0.4.1
	npm install grunt-gitbook@0.4.2
	npm install grunt-gh-pages@0.9.1
	npm install grunt-contrib-clean@0.5.0

publish:
	git push
	$(bin)/grunt publish

server:
	$(bin)/gitbook serve
