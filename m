Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EC54968F4
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 09:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985113; cv=none; b=SVwdWR5Mn0M0eqV8QDbSUIi+qk5/7vwTFBqM7z7tSu+0R9sKAstD5W21WfVCq9LGRaKmoDlOZMk2AcZOIK3HAwnQPLb/16DG9jKvsxESk+TTUgTx/o7kxhlSEqddMXtA8UmPtPUytRTaA42DHL72VweXqeMcXPONrRgkqwde96M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985113; c=relaxed/simple;
	bh=xtzhudypbNeVsFar+T1OKjRqJ8pBCkucdqQ7a7xGCLA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pgcBCP5sXFmI2VfNxfkh8dzhyANlAqEQB4MXmfG5lThY20ta6fQdbPOl6UQmiIrasm7yviCR5tMXW2ta/YfgRHe2Cy0cWADoDVMeOqwEZ43tcHhLXK6RoKYVxf6mGoxENg4I54sLUyzo3uAug4DOwgAHMJj+LaxaMNam33hNBBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HesZkWlB; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HesZkWlB"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47122683cf3so1181928f8f.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 02:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782985109; x=1783589909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=19Blhbug/ViMibEwSUq3xAqJ9uRR52sZJ3C/I6CrjH0=;
        b=HesZkWlB8ce0kHCDderySS/V7gIw0tL/1felMVmC9TrC4KSpc9xltO+cOsLsiLQ8fr
         WsYRtJOxmvKLw8aKX74EdMlzNhm0CfWlNqNt0xD6NFo2EzKoVZKYV1p7rMrPDBANaKgs
         nxdrB5TwjUJD5LAR+OfGu5GXLdImcTZoHL0cMTMCYOg9gfLG2xxM0AwONHsKLZdXhbrk
         Uhwb3x7ovxaC4oS7BV7YbM4bovJMHa1es0qg2YTHAV3b1DbVMumzsUh9VtzaKFb4MUaY
         Yw+4Pvhsq3QiIN2keMa7nW6xx+LCbHnrAXK3KjbXwx3vArOxyqb6p55TI3zalfw/8+u1
         wMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782985109; x=1783589909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=19Blhbug/ViMibEwSUq3xAqJ9uRR52sZJ3C/I6CrjH0=;
        b=KVcj/4G0ixxfqagAokdzVF/rXPSPd78mRaCMue/r1y3JxNtGRPgDtF9T/eWXCdlOc+
         iC+iXRV/vjcA5isGzvqJoLgwDzfpNAtdvgaPA4eBd2SIBtXdR3er7JZYrlREpc6FANNj
         jwPSYjzVM5FW8nvnOUs2k59mD2YftB/gH6BhJ5DdSAc8tWquimYTUFgxYaRJGgCQbZKQ
         mlEkHiO5KArt8Vc8Nar5yT73qRZfmIGE7n+WWNZ658umh9Tczk7MKOoow/67y/Oghwnd
         TXZ+BpZ0HI2RHIHwF8MzOOLOii9Z7jQBnEZMES1a5Jjshyb/ZziVAOklKBwtcsyeWDAt
         v/Yw==
X-Forwarded-Encrypted: i=1; AFNElJ8912phQox6Geg7slX/51A55weC92fqu+SMaOcXTakaFc3dNkTklYDhUvl+vPWrK7dY+w/8Yndfh7wE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5dDsj+kN4rvGFkVJ/uAivLtQvmBSMO16Xi1wXa5plvXeqkFiV
	x8Hmg1Og6w6NNj8q/tINsii/uuP4tPNjRIOpzbmxaNJt/vJD3ql8VXPa
X-Gm-Gg: AfdE7cmGMKLm/X5+cSSgyKl4BU+eAVCUe2wgMaIgUDcCgzB00he9+aIzq5mWh24fsz+
	lZffUyNj5a4FaFGqq4itCj4ERQgXtT+UmLeMKiCX9B4AmLlSYfgb53wxR0HTyxOMQgVGD97o6tS
	r52RW+gUjkQVYZ/3w8Mlb87ppxGqg7bWPh2Z75cuuQSSMq1rZHESr9YFv4n3MFrXjFCLFu+RQAu
	0R0A08zFIi6FBlmn28XMObuUbz892a4aWkPgG4uSo4kjRwmk7BqlJHvUdIBpstdneH2MsddP+0W
	pyPzkiQNbjT1qNTWJy3M2yZFVRrUHplniZnV8/0GrMZbg94Z8WnZSOQoL7zhYEhvWf2qg2meguC
	NY0HJsiXBs+z1Wal9Aia7HuwaQYmHvvAxBlAd4IovW+TpAws7v63t2VSXX5+uRnXXK8BciOC2Yv
	+pE0ryyIgw3Mo9V0Hd8VRxCu02oY0+L9QwKvop8Vct73snwkv03xIFJPtdVarSNG09IE2PK+8R7
	TjlwA==
X-Received: by 2002:a05:600c:8117:b0:490:688b:f9f8 with SMTP id 5b1f17b1804b1-493c2b99aafmr71835635e9.27.1782985108910;
        Thu, 02 Jul 2026 02:38:28 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-52-250-217.retail.telecomitalia.it. [79.52.250.217])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493c636c8b9sm35502285e9.10.2026.07.02.02.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 02:38:28 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Felix Fietkau <nbd@nbd.name>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Subject: [PATCH v10 4/5] phy: move and rename Airoha PCIe PHY driver to dedicated directory
Date: Thu,  2 Jul 2026 11:38:09 +0200
Message-ID: <20260702093812.15918-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260702093812.15918-1-ansuelsmth@gmail.com>
References: <20260702093812.15918-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
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

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 MAINTAINERS                                         |  4 ++--
 drivers/phy/Kconfig                                 | 11 +----------
 drivers/phy/Makefile                                |  4 ++--
 drivers/phy/airoha/Kconfig                          | 13 +++++++++++++
 drivers/phy/airoha/Makefile                         |  3 +++
 .../phy-an7581-pcie-regs.h}                         |  2 +-
 .../{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} |  6 +++---
 7 files changed, 25 insertions(+), 18 deletions(-)
 create mode 100644 drivers/phy/airoha/Kconfig
 create mode 100644 drivers/phy/airoha/Makefile
 rename drivers/phy/{phy-airoha-pcie-regs.h => airoha/phy-an7581-pcie-regs.h} (99%)
 rename drivers/phy/{phy-airoha-pcie.c => airoha/phy-an7581-pcie.c} (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 05e90c3f7fe0..952653034c4c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -765,8 +765,8 @@ M:	Lorenzo Bianconi <lorenzo@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/phy/airoha,en7581-pcie-phy.yaml
-F:	drivers/phy/phy-airoha-pcie-regs.h
-F:	drivers/phy/phy-airoha-pcie.c
+F:	drivers/phy/airoha/phy-an7581-pcie-regs.h
+F:	drivers/phy/airoha/phy-an7581-pcie.c
 
 AIROHA SPI SNFI DRIVER
 M:	Lorenzo Bianconi <lorenzo@kernel.org>
diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
index 19f3b7d12b7d..e93951a4a898 100644
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
index d7aa516bcc49..4ca4a07963fc 100644
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
 					   axiado/	\
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
similarity index 99%
rename from drivers/phy/phy-airoha-pcie-regs.h
rename to drivers/phy/airoha/phy-an7581-pcie-regs.h
index 58572c793722..b938a7b468fe 100644
--- a/drivers/phy/phy-airoha-pcie-regs.h
+++ b/drivers/phy/airoha/phy-an7581-pcie-regs.h
@@ -1,4 +1,4 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (c) 2024 AIROHA Inc
  * Author: Lorenzo Bianconi <lorenzo@kernel.org>
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
2.53.0

