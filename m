Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793735064;
	b=jnr7dCqY+MZAuutEAmT7ks8Q0LVtd4HHfvzac2sjWVtEvOfUQtBLzUI9+DLJBeWUdCyU
	 V7S8xeorGdBa+PkFlF2K5JPMknZ2QeJsQ/NDGn60h0XA8353FDEbBIR7korMUFCi5sFBE
	 JxixOL4Z7QAQhWVC75uY8X9/1RaA39HFVjJDaNVXtjbeI39xLkNXrthpbCVMT1Yzre4KL
	 rfjRzpfZuJYjwyYFMPYDrykRukKOHY175DSLGzLi3gTXNnUeN6oM1eaXXal71WCHwYOto
	 4rxhFLgdcUF9D6tdSh1oN68OhYMOYIRhS2SlrtvKPlneQDQvtlnUlrsJQ2dRTjS7RWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793735064;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BPBXAYTXYbMEy8QV6jnqhXPs04AFPqS/cjIJVil8Sr8=;
	b=rYtPgo9YUJvctcPLII7BfQp5qnisKEywKI4OAgN3BBsUoILbRjr6l+ataf+Aja5gDWY4
	 xkUj7i5LbPMd6WQkccj0GIMTTWO7TQbHotpiLDQ38QvkTCJddC4H1ETRCOLRS+/UPAaQM
	 3I80kWt2Sx5nY9dwiADRRhGZY2PeDSnbyVQjkMv5WFQuyDto7tZxFzqNNFss5kwtjstZT
	 KcDugOSlbAOlFXHcYoJVQY9/tqngt5Ow3kzYuKiFHYuEwyGfTOjeoA1yueI6JgxCDOLHg
	 NEJkRuKPPgLw7igEEzlxo2vnNklmSAgMEAfJNn/bmVS5xfHyOSa9NWp5rArwBidN0mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IW8J4INq;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543DE606A338
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 19:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 543DE606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IW8J4INq
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a4dc547987so23262355e9.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 11:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793735063; x=1794339863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BPBXAYTXYbMEy8QV6jnqhXPs04AFPqS/cjIJVil8Sr8=;
        b=IW8J4INqEGAdY8hNt3SIZADC368TOfaj6kW9Z1AUeNH1NGvtLmaMfggT2mUov8LyfL
         VjamePxOIt20UAQDfSDKKCQddTucqQr6+FX+WwGfULV/wmeZfmul5qH/SfWCtgZu5aY4
         HfyQPmqXpphbD5hO3XoEnw2ILIss+qmkIWhsKStnFCjXMOaRUZ0FUZn2ICa0lEZCvgLH
         dnnyIJnnKTUwldfciGQfwUzo/EbWQFDM93mFnkgCj3g7OlzrGU1FXv+gxYIEMlc6K+gx
         ecVpKdK+Ny1Nmv/5EwrFnGIPyg0XpQ5zxxlWwlW70BnMlhoZSe0aFQ4U3Wn8YjDbrzem
         39oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793735063; x=1794339863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BPBXAYTXYbMEy8QV6jnqhXPs04AFPqS/cjIJVil8Sr8=;
        b=cB/TIBVL+tIAe1JZsY4mgfBc1+PcFSAcV5tFkdR0FAyIc5cC3twN67XZ4+cryfTHgS
         ahIyD21UDPNfL1EC8rzezJf54n7sr3TN5+lmN3IYYRAGJzzAx0iJFB8JWYzz4kU40Tz9
         s6qgBs9pR7shs2hUvEd6EG7z2l1bakwRPIwxhZ4cM+HRnN6K0hzv00PWvd3Jjhdk/cC5
         plDMpOZJZpOpVxxP/auanpt/OjVdFZROFe3VQOgm5+ke+djt+Hclm9FwOiV2+uvWHLdb
         cduU4IFoh6RfuwDWBgZn5eO6MDTsKsQMDqz0V909BxQ86UgPzIdqI/FqFt4WEy0ngzQ4
         aBEw==
X-Forwarded-Encrypted: i=1; AKwUvBzhmI8KO22Y0O+eeUmnn9jK8+MObNWMSUPj0530bT7rkh6Q5l579sXMhyUCB7ejOvLgZvHN3QWEjK7Y@vger.kernel.org
X-Gm-Message-State: APuU4Z+EnyJNLIRrTpDaXrTFQonIXcK7sF2slnnCwklJ/YtowTxm/8Xd
	LvDns4pYVaCW7Hfe87W+kOLh6eU0/vr2NhytNKToDSRpHvbhS8SrAi61
X-Gm-Gg: AYBFou2bSYmAGggzEWRenKYz6+AiYiXkljb03r4mu6CZIFFGj7Tz+tNrOMqIWtRZlIY
	4BUxz7aJ+fDnLn4PNSgK7d6UQw8qreaJNEiA0s9OxAZyLh+RYehSRdncF8AX7Yuh6BEAdSQvi3r
	K1XWFmOuTKm1INxnUkDrOznmk7zLkpjLs5754oNefO3pvtfZzXEGtYeLzSpThw7rYHtq4fQOQ+y
	YpqXd0PRjfCggSkzAvE7MqQxpIpCpymJuziqDh6gO56TCQJvGXyT2X3F4GqQlj8YUPR58F8ITxH
	xftoO9nR0AjIo9AR2aPkPIHTT2JuCn1QeXZ4LfCgK69oZR8JRZmdv3vPj7R0LS5ESAHwb4WyuG+
	6KFQ4aiUdZ5wLziZxK5iERhY/EYianbUpxUOjuFqxWu8lLtS22wybzHxJ66PoXw8yyYv28UDs5q
	AGIkshIRHcVr8CVj0fQxfU/q4xegrSrakgmu+lZR8xVPKMcUj2vA278ltbhxGfi6PqOT7OgrkW0
	VmVgh6ss3wKqdVSNFz5iZ/AO1fGXccYwDV3qYGQCwb/Rs6OxJYBXRyGrsOqKPSmFzblw7Gm8V2H
	GiXUmtkVBhVUAHMkir48HQK2ndkrQ0331HaFRYMkvD5R3ifKguYNyDvVQwoKQHHmWN60Mm4DNbt
	YshfONpRx7tuQM2knsqEQCFSV46CcZkqa8Q==
X-Received: by 2002:a05:600c:1d29:b0:4a5:5fb9:5d35 with SMTP id 5b1f17b1804b1-4ac187a7678mr344557325e9.21.1793735062696;
        Tue, 03 Nov 2026 11:44:22 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b2a93232f0sm82557885e9.10.2026.11.03.11.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:44:22 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v15 2/3] phy: move and rename Airoha PCIe PHY driver to dedicated directory
Date: Tue,  3 Nov 2026 20:44:07 +0100
Message-ID: <20261103194410.6632-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103194410.6632-1-ansuelsmth@gmail.com>
References: <20261103194410.6632-1-ansuelsmth@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To keep the generic PHY directory tidy, move the PCIe PHY driver for
Airoha AN7581 SoC to a dedicated directory.

Also rename the driver and add the relevant SoC name to the .c and .h
file in preparation for support of PCIe and USB PHY driver for Airoha
AN7583 SoC that use a completely different implementation and
calibration for PHYs and will have their own dedicated drivers.

The rename permits to better identify the specific usage of the driver
in the future once the airoha PHY directory will have multiple driver
for multiple SoC.

The config is changed from PHY_AIROHA_PCIE to PHY_AIROHA_AN7581_PCIE.

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 MAINTAINERS                                         |  4 ++--
 drivers/phy/Kconfig                                 | 11 +----------
 drivers/phy/Makefile                                |  4 ++--
 drivers/phy/airoha/Kconfig                          | 13 +++++++++++++
 drivers/phy/airoha/Makefile                         |  3 +++
 .../phy-an7581-pcie-regs.h}                         |  0
 .../{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} |  6 +++---
 7 files changed, 24 insertions(+), 17 deletions(-)
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 rename drivers/phy/{phy-airoha-pcie-regs.h => airoha/phy-an7581-pcie-regs.h} (100%)
 rename drivers/phy/{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index a9c78e635764..d56142c8fefa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -785,8 +785,8 @@ M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/phy/airoha,en7581-pcie-phy.yaml
-F:	drivers/phy/phy-airoha-pcie-regs.h
-F:	drivers/phy/phy-airoha-pcie.c
+F:	drivers/phy/airoha/phy-an7581-pcie-regs.h
+F:	drivers/phy/airoha/phy-an7581-pcie.c
 
 AIROHA SOUND DRIVER
 M:	Christian Marangi <ansuelsmth@gmail.com>
diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 105fbe408aa2..4ac7475dccfa 100644
--- a/drivers/phy/Kconfig
+++ b/drivers/phy/Kconfig
@@ -46,16 +46,6 @@ config GENERIC_PHY_MIPI_DPHY
 	  Provides a number of helpers a core functions for MIPI D-PHY
 	  drivers to us.
 
-config PHY_AIROHA_PCIE
-	tristate "Airoha PCIe-PHY Driver"
-	depends on ARCH_AIROHA || COMPILE_TEST
-	depends on OF
-	select GENERIC_PHY
-	help
-	  Say Y here to add support for Airoha PCIe PHY driver.
-	  This driver create the basic PHY instance and provides initialize
-	  callback for PCIe GEN3 port.
-
 config PHY_CAN_TRANSCEIVER
 	tristate "CAN transceiver PHY"
 	select GENERIC_PHY
@@ -168,6 +158,7 @@ config PHY_XGENE
 	help
 	  This option enables support for APM X-Gene SoC multi-purpose PHY.
 
+source "drivers/phy/airoha/Kconfig"
 source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
 source "drivers/phy/apple/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index c6dd02003bbe..dcc88a3cbaa7 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -7,7 +7,6 @@ obj-$(CONFIG_PHY_COMMON_PROPS)		+= phy-common-props.o
 obj-$(CONFIG_PHY_COMMON_PROPS_TEST)	+= phy-common-props-test.o
 obj-$(CONFIG_GENERIC_PHY)		+= phy-core.o
 obj-$(CONFIG_GENERIC_PHY_MIPI_DPHY)	+= phy-core-mipi-dphy.o
-obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_CAN_TRANSCEIVER)	+= phy-can-transceiver.o
 obj-$(CONFIG_PHY_ECONET_PCIE)		+= phy-econet-pcie.o
 obj-$(CONFIG_PHY_EYEQ5_ETH)		+= phy-eyeq5-eth.o
@@ -20,7 +19,8 @@ obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
 obj-$(CONFIG_PHY_SNPS_EUSB2)		+= phy-snps-eusb2.o
 obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
 
-obj-$(CONFIG_GENERIC_PHY)		+= allwinner/	\
+obj-$(CONFIG_GENERIC_PHY)		+= airoha/	\
+					   allwinner/	\
 					   amlogic/	\
 					   apple/	\
 					   aspeed/	\
diff --git a/drivers/phy/airoha/Kconfig b/drivers/phy/airoha/Kconfig
new file mode 100644
index 000000000000..9a1b625a7701
--- /dev/null
+++ b/drivers/phy/airoha/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Phy drivers for Airoha devices
+#
+config PHY_AIROHA_AN7581_PCIE
+	tristate "Airoha AN7581 PCIe-PHY Driver"
+	depends on ARCH_AIROHA || COMPILE_TEST
+	depends on OF
+	select GENERIC_PHY
+	help
+	  Say Y here to add support for Airoha AN7581 PCIe PHY driver.
+	  This driver create the basic PHY instance and provides initialize
+	  callback for PCIe GEN3 port.
diff --git a/drivers/phy/airoha/Makefile b/drivers/phy/airoha/Makefile
new file mode 100644
index 000000000000..912f3e11a061
--- /dev/null
+++ b/drivers/phy/airoha/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+obj-$(CONFIG_PHY_AIROHA_AN7581_PCIE)	+= phy-an7581-pcie.o
diff --git a/drivers/phy/phy-airoha-pcie-regs.h b/drivers/phy/airoha/phy-an7581-pcie-regs.h
similarity index 100%
rename from drivers/phy/phy-airoha-pcie-regs.h
rename to drivers/phy/airoha/phy-an7581-pcie-regs.h
diff --git a/drivers/phy/phy-airoha-pcie.c b/drivers/phy/airoha/phy-an7581-pcie.c
similarity index 99%
rename from drivers/phy/phy-airoha-pcie.c
rename to drivers/phy/airoha/phy-an7581-pcie.c
index 56e9ade8a9fd..81ddf0e7638b 100644
--- a/drivers/phy/phy-airoha-pcie.c
+++ b/drivers/phy/airoha/phy-an7581-pcie.c
@@ -13,7 +13,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#include "phy-airoha-pcie-regs.h"
+#include "phy-an7581-pcie-regs.h"
 
 #define LEQ_LEN_CTRL_MAX_VAL	7
 #define FREQ_LOCK_MAX_ATTEMPT	10
@@ -1279,12 +1279,12 @@ MODULE_DEVICE_TABLE(of, airoha_pcie_phy_of_match);
 static struct platform_driver airoha_pcie_phy_driver = {
 	.probe	= airoha_pcie_phy_probe,
 	.driver	= {
-		.name = "airoha-pcie-phy",
+		.name = "airoha-an7581-pcie-phy",
 		.of_match_table = airoha_pcie_phy_of_match,
 	},
 };
 module_platform_driver(airoha_pcie_phy_driver);
 
-MODULE_DESCRIPTION("Airoha PCIe PHY driver");
+MODULE_DESCRIPTION("Airoha AN7581 PCIe PHY driver");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
 MODULE_LICENSE("GPL");
-- 
2.55.0

