Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787F63E49E2
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 10:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791282593; cv=none; b=tUoLRHCDsL2AKVtC0LShAOOoyC47Uf+I3cMHZkdTl2eBhtmc/amXI5esYZrQX75mnIShH5oKn62cTUOAueqqjo3pj/QZf8l6f0pNYGesnFCh0rXVmr3pBEfW8ixeENAppf1zgq6Bm17uOjCqsANOqzsabgsJyFZZPuDecmV/zWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791282593; c=relaxed/simple;
	bh=p5ADRrx0O+aMsplnsIiwngmVtpcvO9b/TDH/4B2YNOs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YrlHhgn+RyEB2N5vu/Y8AujMEnc1f5xiXyVnWPNwSqPHtxIBp6bDZ3m1TxWbzUN5ey0GUPWE/qF37MlIBg4v1Y0Co6R1OVi6Yt0KGySZ93ctVpCCPNZI7TRRjaZk5FCO5ynH57oyjQ3x//dwopbgi1J0VuDY/zAE468fI8UXtRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CCY1K97p; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CCY1K97p"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a16bc2278aso4065935e9.1
        for <devicetree@vger.kernel.org>; Tue, 06 Oct 2026 03:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791282588; x=1791887388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GMoDjP/8jzIOVVPI/q7X7XspWmYoPHIZ6LHmrab35AY=;
        b=CCY1K97p/wlCa8+PqulVPsahNAYPrvYnQ6t/g01wCuqnmZM4M+lPRWaTDo+Aw6Li2x
         XAoZw0iz4USY8e6MruLsTo58fmk3XYC3HOf00xcahJ7M78mMcYDPV6to/+cLvCln1MZW
         C3021vMakLzyN3yQELQq+BiERXXdspTRPkdpXp9ySU8Et7tpHclwngXF1CfcHza1ciJF
         69bZEzZoz2UDSDRKA48xERwKbzoQ6Y+lbl0WWPqofXY5uj6Py6VnubNtqD4blYzSonXM
         BTSA3hKWhZGc+Yg0uXSLzYcrrT8ZZgR0r1EF1kWVG4SV+lMPg2bR2uoJyU3WynlNeaz+
         QKyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791282588; x=1791887388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GMoDjP/8jzIOVVPI/q7X7XspWmYoPHIZ6LHmrab35AY=;
        b=dIdRidYoulMGMPhZ+orUlPV2qCtWLGPvoN6ihCVH85YZ/eYbWRu2vS09r3ICmXLXP1
         3bYgc1pDffZPTsv7bw3KI9tUCqS6zNUllDy1a0j4NzV/1hEVwlo4GXFfIsRmBeAhL2RR
         yoEs7VdNDkIo7KukeM8mLkEgsGd1FNh9SjHZR5SdQFENvbBQTaigQsqBC+hTv1fjFsmr
         KnfCUn2oAHHNFvQq/GVF3DXRFVusf1VCXjLpHF3gOyb8IjfmJRhSPYGcTbR+e8GpGAZa
         0cqOp8C6Q3oNT0bh9P2ziiqN5E+PVblzvK60h5B+v5NQR+1S9OlLRGlQ3JmIkqnHt+9/
         2IGw==
X-Forwarded-Encrypted: i=1; AKwUvBz1JkNgaFPZfhfPpuDhE188MvaEx57cTPyRlFJZruHfnPkPNHgsTsWZUOGkwhebcsAIXpy0XXXj1bs1@vger.kernel.org
X-Gm-Message-State: AFuF++lipqn09aAF+J0niJOUUajzd+yhCjSCJpcQWo5AZ0DnK+RJdBte
	KFThYzENiF+9ZRhPcRkAfis4mZ58mJ3WTJWx3XJUBG8KJ89FtkZW8BoH
X-Gm-Gg: AYBFou3rKVAIdZPpTfT2HPtWEi733i7F2RDta1nG2yx9NRnwiFF1hvLd2sCVMauh35t
	sWo0BvTihbzbrUcRzRYU9ShC3+K0z58Lj9UA0ftxLlglGiZHXjE2wYdD9HyK5cORinK5CAD/AG0
	fpE5YqN/DYrxKz4L+B4qD5jK8tOfd6weSmIXOcucmE6Zr2+LwkDVY+7hBIJYC7u2wa2z0Ra/KTy
	zaAE9tq8WZs6Voar4pHE5XaGC043Kd0NtkQ6vecNaWLAJWz8ZJNfUEXUmOUERjuRAXVsks/YrUh
	qxwRK3iLTu0f75uh98Fs8PvYkSsV6SOaMQeoCUHSA2oUnA6+NVfXEnQPgzTzlQTPoLZJCrzOijE
	EhQ2VuRmbvCmSrPdMQfQqdIVpgnH6a24cQgcf3hc3eEVxbNhT4kJRwunR8y73bwwjSkN/xHM7EB
	Ku5u8nWP07wvd+yyk6anoh+ikKCWxF1mSCFS9rPXQTBMRJ/y4EoioDqykli4Z+RHhOkmc9s3m07
	1b+TKHDtnGdwDxSawxqCesvlXEifd8gmdmNKvbunxIDXIgj2BM2uMWCmth/
X-Received: by 2002:a05:600c:45d3:b0:49c:fc6c:be03 with SMTP id 5b1f17b1804b1-4a17b53f3e5mr16825945e9.26.1791282587957;
        Tue, 06 Oct 2026 03:29:47 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-20-252-14.retail.telecomitalia.it. [87.20.252.14])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a178c33091sm63427485e9.4.2026.10.06.03.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:29:47 -0700 (PDT)
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
Subject: [PATCH v14 2/3] phy: move and rename Airoha PCIe PHY driver to dedicated directory
Date: Tue,  6 Oct 2026 12:29:34 +0200
Message-ID: <20261006102937.10972-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261006102937.10972-1-ansuelsmth@gmail.com>
References: <20261006102937.10972-1-ansuelsmth@gmail.com>
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

Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
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
index d8cf9722f76e..26ba9624acd5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -764,8 +764,8 @@ M:	Lorenzo Bianconi <lorenzo@kernel.org>
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

