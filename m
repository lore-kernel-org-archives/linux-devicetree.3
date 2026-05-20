Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1863F39C9
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 15:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779289779; cv=none; b=YXiwpOU0RJPDoVAuDyQV3CgfTqvj0pgCuOipxEuW4/SckDFPz3MYHMQYxls7rcq9oCuZorlTxFUPSzXg6kKS+DySH1kdMnAAwuIVh5OXLS31yQJGb3LaLdKPkVFQuO2vSV0rzVHBIaY+hCpQb8rwTRkqfu9ojCsPCO2dlnSzIow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779289779; c=relaxed/simple;
	bh=vlR3puWHieza9MOKOJJmGwiDMzuP1TFxVd7G1KyNRhE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oT1TyJXzkTcbsM/+ijQGaoTsT/6oJrTfqPrdPxhe1pXl3aGxHNAu4YicSlwLoXO1q+w08pBwBHah5Bvi9Rex87Obkqg2utky5BfQHZXpmVd8ovFT3VXW4epk7qdLQOsu4ysuLZqCBD9tBk0+BmlZNO10yqZSOvs63+nYUkqwdD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5x73lQB; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5x73lQB"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488b0046078so44358605e9.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779289776; x=1779894576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+2MTlGdLnnx84SeHTRkSWUbFZVMSjGe7LyFztDYyPJA=;
        b=S5x73lQBCf9UybaDWvvjcXmxHXgiEzbnTdBwUVli19zUHvDqwqkE3plYGdpffl0ukA
         2BQawt5rEpnXcVCikBNQzzr/ZkgEWVKDQ/tgwKYWwz2zDvL9mrR35gcmJ/NEGafTar5N
         iqreCi1sQmG/iihGDtzCFPRrOMk+GtYHtizdnhK9rqLfu3zuDY9Dqcnj6t3zWUnppvNm
         Z5EywHBskfYaxR2tlEE9BdJncw5bOC8H1PUscB7nQI8TjNJWMjsuV7lZm3aZ8TSemIx7
         T82g557EO9fFueYIr2Ok5dZCmeEaGdRGyJpzN/yEF+j3k0nB46fEdn7RHKcYjlVRwXvq
         JjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779289776; x=1779894576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+2MTlGdLnnx84SeHTRkSWUbFZVMSjGe7LyFztDYyPJA=;
        b=aWD7wWqlaF4zSuKZQMFeekYmcfLoXP4Rby+pbMBNqjSxx3ovbOUZUmu+Px2kA7xBPh
         vleTUPoQOKTyW3lJcaTl/r/6b28jgkDbjx/3GckwDNcQEP7AkzXKoe7PvvYUQMrDQ+Na
         8p3dBs9GobQZUqWpV4uDUfS1hRTXXxKXh4IsBXsWfXh4KmGL/0In11kNgK9eZGfD3yna
         jYiDe+slcxW/wbWzMb67Wt4xwOz94NXBjGQWxkCgIWf8StLct1cHO/17Y06TnQL7zfgQ
         rJumCruNslUosibzFia0CUR1yiq/9aP65tj8csqAy86TERaYUE34AK3dBrQG5q+MA/fE
         nEOA==
X-Forwarded-Encrypted: i=1; AFNElJ+1RuZfU+akjt5+o1lA/QEsprF3jzJ8gD0UINdeaVfpQm9L57VRWxPVWg4ejIYpbJSW6mcCGF/DWhPF@vger.kernel.org
X-Gm-Message-State: AOJu0YxDfKCa+9pGj4me2JPFzrBdXq5qWImroUV/Qa8WUGiOm5TTEVTa
	E4tjCiwVeaUMT2ScwrHm68Y3uqtYxZNuL3talHt9EW1y8/Zq23ed8W6K
X-Gm-Gg: Acq92OEND/81N44Ks1peUyKc/9H1D+K0c4v/oXnMoeii0bERcUCEByVTZYhgtpNHBHv
	e+p0QoZuvMKt1qgewgpQOcEpJP2dZeivQiI8FwU2dziDiV+T+1r0NthXJfaSfXNOn+rgTnv+PUU
	K3/SwH4EV+okYNPLEzzMx2Dq7ZgrpF8R/GEhWX+3aYuIgY8Fbn4Zf5o0drEVBtJYsEzabC41Pei
	D0Gbj/4IBggxktLZHqjagvhIo1AvnReRd3oOlobUKWw+bi+nw82kBZHSnwtTOIgyWPAQnuLWYT/
	9uVHmBp5lXcE3s1SHtnKPBiM8v1rkzvy5tUbUkkJoHIuZhcpt3jkgJcTOAQ4SKLFpClFnebj+X0
	hXElZi90rwqvn/DYQeG8n3+ShzpGmU7a7d/Vsgx+fA6WAm/gklXldSS+Capza1N3y4kCgp+0nTq
	v6Cqhq3LhKoyVsa+HxS9A28wRH4TpM/yuJtwUhf9dy2/bNKjTPBPHZXewRnrchiKM=
X-Received: by 2002:a05:600d:8496:10b0:48f:eb8b:9980 with SMTP id 5b1f17b1804b1-48feb8b9ademr241288455e9.30.1779289776052;
        Wed, 20 May 2026 08:09:36 -0700 (PDT)
Received: from Ansuel-XPS24 (host-79-22-5-99.retail.telecomitalia.it. [79.22.5.99])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45d9ec39806sm53639804f8f.9.2026.05.20.08.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 08:09:35 -0700 (PDT)
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
Subject: [PATCH v8 4/5] phy: move and rename Airoha PCIe PHY driver to dedicated directory
Date: Wed, 20 May 2026 17:09:09 +0200
Message-ID: <20260520150912.11614-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520150912.11614-1-ansuelsmth@gmail.com>
References: <20260520150912.11614-1-ansuelsmth@gmail.com>
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
index 932044785a39..7bea8c620da8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -759,8 +759,8 @@ M:	Lorenzo Bianconi <lorenzo@kernel.org>
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
index 227b9a4c612e..f9cd765a3ccc 100644
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
@@ -133,6 +123,7 @@ config PHY_XGENE
 	help
 	  This option enables support for APM X-Gene SoC multi-purpose PHY.
 
+source "drivers/phy/airoha/Kconfig"
 source "drivers/phy/allwinner/Kconfig"
 source "drivers/phy/amlogic/Kconfig"
 source "drivers/phy/apple/Kconfig"
diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
index f49d83f00a3d..84062279fa63 100644
--- a/drivers/phy/Makefile
+++ b/drivers/phy/Makefile
@@ -7,7 +7,6 @@ obj-$(CONFIG_PHY_COMMON_PROPS)		+= phy-common-props.o
 obj-$(CONFIG_PHY_COMMON_PROPS_TEST)	+= phy-common-props-test.o
 obj-$(CONFIG_GENERIC_PHY)		+= phy-core.o
 obj-$(CONFIG_GENERIC_PHY_MIPI_DPHY)	+= phy-core-mipi-dphy.o
-obj-$(CONFIG_PHY_AIROHA_PCIE)		+= phy-airoha-pcie.o
 obj-$(CONFIG_PHY_CAN_TRANSCEIVER)	+= phy-can-transceiver.o
 obj-$(CONFIG_PHY_GOOGLE_USB)		+= phy-google-usb.o
 obj-$(CONFIG_USB_LGM_PHY)		+= phy-lgm-usb.o
@@ -17,7 +16,8 @@ obj-$(CONFIG_PHY_PISTACHIO_USB)		+= phy-pistachio-usb.o
 obj-$(CONFIG_PHY_SNPS_EUSB2)		+= phy-snps-eusb2.o
 obj-$(CONFIG_PHY_XGENE)			+= phy-xgene.o
 
-obj-$(CONFIG_GENERIC_PHY)		+= allwinner/	\
+obj-$(CONFIG_GENERIC_PHY)		+= airoha/	\
+					   allwinner/	\
 					   amlogic/	\
 					   apple/	\
 					   broadcom/	\
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

