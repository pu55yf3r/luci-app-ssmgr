include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-ssmgr
PKG_VERSION=1.0.0
PKG_RELEASE:=1

PKG_LICENSE:=GPLv3
PKG_LICENSE_FILES:=LICENSE
PKG_MAINTAINER:=Gyteng <igyteng@gmail.com>

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/luci-app-ssmgr
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=LuCI Support for shadowsocks-manager
	PKGARCH:=all
endef

define Package/luci-app-ssmgr/description
	This package contains LuCI configuration pages for shadowsocks-manager.
endef

define Build/Prepare
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/luci-app-ssmgr/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(INSTALL_DIR) $(1)/etc/config
	
	$(INSTALL_DATA) ./files/luci/model/cbi/ssmgr.lua $(1)/usr/lib/lua/luci/model/cbi/ssmgr.lua
	$(INSTALL_DATA) ./files/luci/controller/ssmgr.lua $(1)/usr/lib/lua/luci/controller/ssmgr.lua
	$(INSTALL_DATA) ./files/root/etc/config/ssmgr $(1)/etc/config/ssmgr
endef

$(eval $(call BuildPackage,luci-app-ssmgr))