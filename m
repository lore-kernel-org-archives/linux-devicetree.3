Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768D82D0602
	for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 12:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315310; cv=none; b=saBgSYayim7V9fRHJKJToIwEfDs+WQMSHIhbj+NuTLGHLPPVD9iDGiurKs8bK7aIqfTVuZ6vdniQqVew7RpjYyAx/Z3X4INapurz5D3PwPcPG97k291DJuMkrUiH59TPjgzdE/zkBbXNZBoLcQpl+Y0+aVbSRono0e0FqaYDx3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315310; c=relaxed/simple;
	bh=+N3/agn7H+LM4PYxo5pCGWbRYsEuRXeW8+XWTrwVv/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b/6XQqkPlPYkDstLH1HMP2iObwZhgV5VxMTKAZ8eG+m056TM5cWIa4308+u2P96N4DuhJSvmf4eNE+dd56+yvXnQpIJPHF36hcovTsOa/y0oNfOTO6e0seu/7F9iMNP9e6ks5cJIK1wytn3LcxM2oPtsHq3Omqna9D/AO5mlMHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/PM/Kg5; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/PM/Kg5"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a38098734bso1919750a12.1
        for <devicetree@vger.kernel.org>; Fri, 21 Aug 2026 05:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315301; x=1787920101; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mI9wJomB1mEoMcf5Syv6RAm3Sw0SkfIqlts4HkuUXYE=;
        b=K/PM/Kg5KoLyliEslOHx2DAm6SGBFCZ9WDiV3WPYYYL3m3DnZN4st9C9h3JVoACJ14
         BFGwpbc2nW7gekJqIrpWrDG4A/ttMXh2Pm7HG9JZf2DyV0FK01n6r8rfOdvDli6TqIdb
         I0pIB4cobuRyr6Ino7+JrXodlHrDKsmFOeBMvl8OBpDnbAVDihdcox1zpxm7lO0DnkOy
         93QOR+xVImutNSxtOX+ZsW8tUpf8VsZlACAPenTl0k6CuTFLFXQ8hnAdyp+ohsUFcbn2
         kdgxRX4xsqPQlAAQwWwfcmtvQ0jvZByhCNT49X21IjcOAMIvlm7A23pfLI0jE+tOwc2u
         a9Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315301; x=1787920101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mI9wJomB1mEoMcf5Syv6RAm3Sw0SkfIqlts4HkuUXYE=;
        b=p10QDAg2QB+C6sbGShUjJ/Ft0/8OAMvr+W4U/Nd+a3F5CV58TlnsJLrbhirujm8k55
         03v5BiXgw1qHmVnu9WUlYTXaMCLO/kg7f8goi3b3X6/6DvpdaKuxVcq6JxQj1tSP0yZ1
         ssLIl8oeT0fdB5/8M5QSU0/d/RGKzbk+7e9kMk5T9YO6Z5YyEmz5V7KeEwFP3FzwpyTV
         ssWur/r+p9EQf865/21Hc4b//cVyYXyhQ9JJtAfH3Qqj4TxQfO+Re8f/o/s8f1qyDHIK
         HPugPs1n6FFcZvNxQX8/mhi/0eJEeMsEBXU41jpOS4jyDnF2TbO8iQE4oBqyjmfvfe/K
         QbkA==
X-Forwarded-Encrypted: i=1; AHgh+RpovC3Lnto6OhIJXIag7cm8F/ipyRdRCQWf40zHZfXgTjzQ3Sy/5EmO+3naYZpJrLEfEX0PwymENt3d@vger.kernel.org
X-Gm-Message-State: AFuF++k4iP+CE6ANVxVR+ngkAMrmMbYXH0Tx33C6oM5UFMh9hhMLjeQH
	q4GNciC5vyphjiUhV+DpSzQ6JemLEyv415MUawqH5ty0cm+epW+rxK1b
X-Gm-Gg: AR+sD12EQl8BrAcb5E/jfQmMGjVLpVSeFB3f3J4UV7YoZ2I+TTxS9b21NyokxXADcWb
	41l3bjypaKgKD1SkM+RMMlJyn1k9DOVSlqRTZ1ewrHhhYqRt1HDvzUQm3+aDJsK3weeTtePAMfA
	AC/F7om9xH9p29MnFrJbYlZFpfhpKv0fQEsLd7Ny6RSXrrLzoP6xenEGeCUcHbKjl096Z7bTh3I
	pPtWWyfRTaa8DbQWvRnCnIJ+zaE3ObeqqgTaEQqb8XXeoW3oQX6zs8rz3iAQRGYk0HL6boe4+ZO
	TiHn7bwQxKZyROyWZoDSAPsb8UWA6HHSTd+hi2YwmrALk9umqt2zX5uT9zY4oY1BszW85Vmp1Z2
	8u8tb+dvSJxNKXYMUuWFRDHWjnG/yT9Pu2p+ngY1vEdDSmcFVskI1c3rtdoS6Gg5msI1/LU8HKH
	LcKDRynrKzLPVFx9rrzG+xQngSCGFSdxlRI4ClRP5v/cHJm6ThJ1wGjGPmlFVMm5M/sBpEfN/bJ
	HU29U0h2TBmmdlyWxxyAOfUGn9YSD/+dctwOsFudPfZtyZKea7N7iTv531SdW67lpVK
X-Received: by 2002:a05:6402:2187:b0:6a3:905b:3c40 with SMTP id 4fb4d7f45d1cf-6a42f1d0649mr6603642a12.8.1787315301076;
        Fri, 21 Aug 2026 05:28:21 -0700 (PDT)
Received: from GLaDOS.station (mob-5-90-140-38.net.vodafone.it. [5.90.140.38])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3feec9c9dsm6608874a12.4.2026.08.21.05.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:28:19 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	alexander.h@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: [PATCH v1 3/3] ARM: dts: imx7d: add Variscite MX7CustomBoard support
Date: Fri, 21 Aug 2026 14:27:52 +0200
Message-ID: <af43fd35a6ccbcf633966a9b18f21832e8f44366.1787314780.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787314780.git.stefano.r@variscite.com>
References: <cover.1787314780.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add device tree support for the Variscite MX7CustomBoard carrier
board with the VAR-SOM-MX7 system on module.

Add the supported board configurations for both VAR-SOM-MX7 hardware
revisions, including eMMC, NAND and WM8731 variants.

Also add the resulting DTBs to the i.MX7D device tree Makefile.

Link: https://www.variscite.com/carrier-boards/var-mx7customboard/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  6 +++++
 .../imx/imx7d-var-som-emmc-mx7customboard.dts | 22 ++++++++++++++++++
 ...x7d-var-som-emmc-wm8731-mx7customboard.dts | 23 +++++++++++++++++++
 .../imx/imx7d-var-som-nand-mx7customboard.dts | 22 ++++++++++++++++++
 ...x7d-var-som-nand-wm8731-mx7customboard.dts | 23 +++++++++++++++++++
 .../imx7d-var-som-v2-emmc-mx7customboard.dts  | 23 +++++++++++++++++++
 .../imx7d-var-som-v2-nand-mx7customboard.dts  | 23 +++++++++++++++++++
 7 files changed, 142 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 1a2539fa19b4..37da667f9ffb 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -444,6 +444,12 @@ dtb-$(CONFIG_SOC_IMX7D) += \
 	imx7d-sdb-reva.dtb \
 	imx7d-sdb-sht11.dtb \
 	imx7d-smegw01.dtb \
+	imx7d-var-som-emmc-mx7customboard.dtb \
+	imx7d-var-som-emmc-wm8731-mx7customboard.dtb \
+	imx7d-var-som-nand-mx7customboard.dtb \
+	imx7d-var-som-nand-wm8731-mx7customboard.dtb \
+	imx7d-var-som-v2-emmc-mx7customboard.dtb \
+	imx7d-var-som-v2-nand-mx7customboard.dtb \
 	imx7d-zii-rmu2.dtb \
 	imx7d-zii-rpu2.dtb \
 	imx7s-colibri-aster.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts
new file mode 100644
index 000000000000..3eb68927804d
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * VAR-MX7CustomBoard for VAR-SOM-MX7 with eMMC
+ *
+ * Link: https://variscite.com/carrier-boards/var-mx7customboard/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx7d-var-som.dtsi"
+#include "imx7d-var-som-emmc.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7 with eMMC on VAR-MX7CustomBoard";
+	compatible = "variscite,var-som-imx7d-emmc-mx7customboard",
+		     "variscite,var-som-imx7d",
+		     "fsl,imx7d";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts
new file mode 100644
index 000000000000..94c4b1fa5d6c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-wm8731-mx7customboard.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * VAR-MX7CustomBoard for VAR-SOM-MX7 with eMMC and WM8731
+ *
+ * Link: https://variscite.com/carrier-boards/var-mx7customboard/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx7d-var-som.dtsi"
+#include "imx7d-var-som-emmc.dtsi"
+#include "imx7d-var-som-wm8731.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7 with eMMC & WM8731 on VAR-MX7CustomBoard";
+	compatible = "variscite,var-som-imx7d-emmc-wm8731-mx7customboard",
+		     "variscite,var-som-imx7d",
+		     "fsl,imx7d";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts
new file mode 100644
index 000000000000..b1ef719a924b
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * VAR-MX7CustomBoard for VAR-SOM-MX7 with NAND
+ *
+ * Link: https://variscite.com/carrier-boards/var-mx7customboard/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx7d-var-som.dtsi"
+#include "imx7d-var-som-nand.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7 with NAND flash on VAR-MX7CustomBoard";
+	compatible = "variscite,var-som-imx7d-nand-mx7customboard",
+		     "variscite,var-som-imx7d",
+		     "fsl,imx7d";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts
new file mode 100644
index 000000000000..603b2dbf4c8e
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-wm8731-mx7customboard.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * VAR-MX7CustomBoard for VAR-SOM-MX7 with NAND and WM8731
+ *
+ * Link: https://variscite.com/carrier-boards/var-mx7customboard/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx7d-var-som.dtsi"
+#include "imx7d-var-som-nand.dtsi"
+#include "imx7d-var-som-wm8731.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7 with NAND flash & WM8731 on VAR-MX7CustomBoard";
+	compatible = "variscite,var-som-imx7d-nand-wm8731-mx7customboard",
+		     "variscite,var-som-imx7d",
+		     "fsl,imx7d";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts
new file mode 100644
index 000000000000..109f52b641f3
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * VAR-MX7CustomBoard for VAR-SOM-MX7 V2 with eMMC
+ *
+ * Link: https://variscite.com/carrier-boards/var-mx7customboard/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx7d-var-som.dtsi"
+#include "imx7d-var-som-v2.dtsi"
+#include "imx7d-var-som-emmc.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7_V2 with eMMC flash on VAR-MX7CustomBoard";
+	compatible = "variscite,var-som-imx7d-v2-emmc-mx7customboard",
+		     "variscite,var-som-imx7d-v2",
+		     "fsl,imx7d";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts
new file mode 100644
index 000000000000..f0db68373d05
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * VAR-MX7CustomBoard for VAR-SOM-MX7 V2 with NAND
+ *
+ * Link: https://variscite.com/carrier-boards/var-mx7customboard/
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+/dts-v1/;
+
+#include "imx7d-var-som.dtsi"
+#include "imx7d-var-som-v2.dtsi"
+#include "imx7d-var-som-nand.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7_V2 with NAND flash on VAR-MX7CustomBoard";
+	compatible = "variscite,var-som-imx7d-v2-nand-mx7customboard",
+		     "variscite,var-som-imx7d-v2",
+		     "fsl,imx7d";
+};
-- 
2.47.3

