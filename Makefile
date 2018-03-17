include $(THEOS)/makefiles/common.mk

TWEAK_NAME = RetryUnlock
RetryUnlock_FILES = Tweak.xm
RetryUnlock_FRAMEWORKS = UIKit Foundation
ARCHS = arm64

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
