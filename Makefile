# Defining variables for all scripts
SCRIPTS_DIR := scripts
INIT_APP_SCRIPT := $(SCRIPTS_DIR)/init_app.sh
CLEAN_IOS_SCRIPT := $(SCRIPTS_DIR)/clean_ios.sh
FVM_VSCODE_SCRIPT := $(SCRIPTS_DIR)/fvm_vscode.sh
CODEGEN_SCRIPT := $(SCRIPTS_DIR)/build_runner.sh
INTL_SCRIPT := $(SCRIPTS_DIR)/intl_with_format.sh
RESET_GOLDENS_SCRIPT := $(SCRIPTS_DIR)/reset_goldens.sh
CHECK_COVERAGE_SCRIPT := $(SCRIPTS_DIR)/check_coverage.sh
SPIDER_BUILD_SCRIPT := $(SCRIPTS_DIR)/spider_build.sh
FORMAT_SCRIPT := $(SCRIPTS_DIR)/format.sh

# Tasks to run each script
init_app:
	sh $(INIT_APP_SCRIPT)

clean_ios:
	sh $(CLEAN_IOS_SCRIPT)

fvm_vscode:
	sh $(FVM_VSCODE_SCRIPT)

codegen:
	sh $(CODEGEN_SCRIPT)

intl:
	sh $(INTL_SCRIPT)

reset_goldens:
	sh $(RESET_GOLDENS_SCRIPT)

check_coverage:
	sh $(CHECK_COVERAGE_SCRIPT)

spider:
	sh $(SPIDER_BUILD_SCRIPT)

format:
	sh $(FORMAT_SCRIPT)

get:
	fvm flutter pub get --enforce-lockfile

# By default, we display a message about available tasks
all:
	@echo "Available tasks:"
	@echo " - init_app: flutter clean, clean_ios, pub get, pub run build_runner, dart format -l 100"
	@echo " - clean_ios: Clears local dependencies for iOS."
	@echo " - fvm_vscode: The script creates (or overwrites, if it already exists) a settings file for Visual Studio Code with a specific set of FVM parameters."
	@echo " - codegen: build_runner build & dart format"
	@echo " - intl: Intl generation with formatting"
	@echo " - reset_goldens: Deletes all created golden tests and re-generates them."
	@echo " - check_coverage: The script allows you to automate the process of testing the coverage of the source code of the Flutter project and generating the corresponding report."
	@echo " - spider: Runs spider build, formats the code, runs golden tests."
	@echo " - format: Formats the code."
	@echo " - get: Calls flutter pub get with --enforce-lockfile flag."
