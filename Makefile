.PHONY: run deploy submod

run:
	hugo server

deploy:
	hugo
	cd public && git add . && git commit -m "rebuilding site `date`" && git push origin master

subup:
	git submodule foreach git pull origin master

subinit:
	git submodule add --force -b master https://github.com/kpango/hugo-nederburg-theme themes/hugo-nederburg-theme

subrm:
	git submodule deinit -f --all
	rm .git/modules/*
	rm .gitmodules
	git rm -rf themes
	git rm -rf public
