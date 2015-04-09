#!/usr/bin/make -f
export APPLICATION = Notepad
QMAKE_MAKEFILE_NAME = Makefile_$(APPLICATION)_qmake
BUILD_DIR = build/debug

.PHONY: all
all: osx_dmg


########## General targets ##########
.PHONY: $(QMAKE_MAKEFILE_NAME)
$(QMAKE_MAKEFILE_NAME):
	qmake -makefile -o $(QMAKE_MAKEFILE_NAME)

dropbox: osx_dmg
	cp $(BUILD_DIR)/Notepad.dmg



########## OS X targets ##########
.PHONY: osx_dmg
osx_dmg: $(BUILD_DIR)/Notepad.dmg

$(BUILD_DIR)/Notepad.app: $(QMAKE_MAKEFILE_NAME)
	make -f $(QMAKE_MAKEFILE_NAME)

$(BUILD_DIR)/Notepad.dmg: $(BUILD_DIR)/Notepad.app
	cp makefile_osx_dmg $(BUILD_DIR)/
	$(MAKE) -C $(BUILD_DIR) -f makefile_osx_dmg 


############################
.PHONY: clean
clean: 
	make -f $(QMAKE_MAKEFILE_NAME) clean
	rm -f ./$(BUILD_DIR)/$(APPLICATION)*.dmg
	if [ -e /Volumes/$(APPLICATION) ]; then hdiutil detach /Volumes/*$(APPLICATION)*; fi

.PHONY: distclean
distclean: clean
	make -f $(QMAKE_MAKEFILE_NAME) distclean
	rm -rf build/
	rm -rf omcbuild/
