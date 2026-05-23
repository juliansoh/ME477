.PHONY: release

release:
	@echo "Building release ..."
	@zip -r -X -9 -q -o D1a.zip . -x .DS_Store -x ".git/*" -x "releases/*" -x Makefile -x "workspace/.git/*" -x "docs/*"
	@echo "Moving zip to releases folder ..."
	@mv *.zip releases/
	@echo "Done!"