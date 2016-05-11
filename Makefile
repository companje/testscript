##############################################
# OpenWrt Makefile for testscript program
#
#
# Most of the variables used here are defined in
# the include directives below. We just need to 
# specify a basic description of the package, 
# where to build our program, where to find 
# the source files, and where to install the 
# compiled program on the router. 
# 
# Be very careful of spacing in this file.
# Indents should be tabs, not spaces, and 
# there should be no trailing whitespace in
# lines that are not commented.
# 
##############################################

include $(TOPDIR)/rules.mk

# Name and release number of this package
PKG_NAME:=testscript
PKG_RELEASE:=1


# This specifies the directory where we're going to build the program.  
# The root build directory, $(BUILD_DIR), is by default the build_mipsel 
# directory in your OpenWrt SDK directory
PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)


include $(INCLUDE_DIR)/package.mk



# Specify package information for this program. 
# The variables defined here should be self explanatory.
# If you are running Kamikaze, delete the DESCRIPTION 
# variable below and uncomment the Kamikaze define
# directive for the description below
define Package/testscript
	SECTION:=utils
	CATEGORY:=Utilities
	TITLE:=testscript -- prints a snarky message
	#DESCRIPTION:=\
	#If you can't figure out what this program does, \\\
	#you're probably brain-dead and need immediate \\\
	#medical attention.
endef


# Uncomment portion below for Kamikaze and delete DESCRIPTION variable above
define Package/testscript/description
	If you can't figure out what this program does, you're probably
	brain-dead and need immediate medical attention.
endef



# Specify what needs to be done to prepare for building the package.
# In our case, we need to copy the source files to the build directory.
# This is NOT the default.  The default uses the PKG_SOURCE_URL and the
# PKG_SOURCE which is not defined here to download the source from the web.
# In order to just build a simple program that we have just written, it is
# much easier to do it this way.
define Build/Prepare	
	@echo "Build/Prepare"
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef


# We do not need to define Build/Configure or Build/Compile directives
# The defaults are appropriate for compiling a simple program such as this one
# define Build/Compile
# 	@echo "Build/Compile"
# 	$(MAKE) -C $(PKG_BUILD_DIR) \
# 			$(TARGET_CONFIGURE_OPTS) \
# 			prefix="$(PKG_INSTALL_DIR)/usr"
# 	$(CP) $(PKG_BUILD_DIR)/testscript $(PKG_INSTALL_DIR)/usr/bin
# 	touch $@
# endef

# Specify where and how to install the program. Since we only have one file, 
# the testscript executable, install it by copying it to the /bin directory on
# the router. The $(1) variable represents the root directory on the router running 
# OpenWrt. The $(INSTALL_DIR) variable contains a command to prepare the install 
# directory if it does not already exist.  Likewise $(INSTALL_BIN) contains the 
# command to copy the binary file from its current location (in our case the build
# directory) to the install directory.
define Package/testscript/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/testscript $(1)/bin/
endef


# This line executes the necessary commands to compile our program.
# The above define directives specify all the information needed, but this
# line calls BuildPackage which in turn actually uses this information to
# build a package.
$(eval $(call BuildPackage,testscript))
