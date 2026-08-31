Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EFC3C10B9
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 22:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788216962; cv=none; b=gp5BYwZ8QF/BrKINFzV1v8d5M4vojn/ZlPthsBIGhmCAEE5jDOy1YrrZ6sDWiQdouS7Mgo9eI8G3gGkS7XG0jICE4Iodp3Et+WEeCKWXNLMkoUvh+tOEWvbT2Xb8oU/MSNO97SZMm2RF0sMpoK3RVhJrd8vDTU3w4XFy1GbzEOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788216962; c=relaxed/simple;
	bh=LWV1yslNrR6exy8zvIULRFrm97CATe1aucUaM+2p7ng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jNbBzSzjMnD7YFy1pYOdpGTyhFRuVa8XGiNXs0vxP7AEo+dqXuGU888xZ3NRx88DIJUMTg+bY7hxHreERq8K0fuIG+p28mEGx8hWcoChTzuE3zIjBcmoYaepnxkwWG/F6wyXYH7fjFFJ/KksWyeoEowCd1+mxmc1RK/l/ZUSt2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gsgpodDg; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gsgpodDg"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so29396945e9.1
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 15:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788216958; x=1788821758; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fh21ClYtU+oMC8asyGsbESdj8juYcsuSGAhDaVF8sqY=;
        b=gsgpodDgbRN3fuYgVzU88PjLO76L5Js7c+SSlZ8nHOnRKmEhpwCtANT7OZ2NAXFI1u
         zwbpNEBsDgea7WJZYf/ukO1KS/Q1Xnbo2NzUpIOs5d0e1jxR1EoNEJ8QlYt5yZ65bVFd
         OM/VYqB9Juc9C4oYyV7k/4JE06Mng1YWFPk8A1+GiRTqDk8L9LL6cHproOGgtMgpWjcx
         ioL0ZfWd7HOb6LFgkj7nuHaLJz/uc2iwGQajRy831Mcd9L9Ee0eLpqQjg0ZXgzSEQch9
         55gM54L37N8YGYkNhEBF5elzR8cu5bQ3Otz2mzQuDTZY/fIckKGTOMh8QRlC4x1TizV9
         8nEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788216958; x=1788821758;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fh21ClYtU+oMC8asyGsbESdj8juYcsuSGAhDaVF8sqY=;
        b=rD35qlie4x5FNqZRtFWdrVpd90j7geaEKtIo5JsIGDj9o74CLorUM8PhxkJ0KhYjg0
         gLJb/lIWLmDbtdVSjb1zE/9NnThu9V5T76Mv7BpN3eGc4W/SH1zshc0uUa0945UQvOZ+
         5gIURPoIzv42b2w7evE6CPjU85RlWZgg5laotl1oThTjRLCdHhrvKjH2oAAH9ZPQ7mhw
         L14fuGFS/aRo3+LN0p1TP4Dmf3EShqiKmh+ooqI0KuZ+oGaQyA9T7nHbG2+2Dgh3hMV8
         hXHc0UUoHAsn2YPsAhRBv8M9m1q9NwKkFW8aC+qnLbfYVLzfM322bwmeUiwfSdy+D++h
         kJQQ==
X-Forwarded-Encrypted: i=1; AHgh+RrYpws8MG4P0Pq+NSkoGNxCT0UClLshTel36MlkmU2thuYm2mQl08EhBzFlyFoH7FQGMyHkcZDLbrz6@vger.kernel.org
X-Gm-Message-State: AFuF++kRtbk5eABdbhQqbYg+WuSs9M65DM1j4nqoxVoII/Oy9JKEqy8n
	PSfz13rNWl+JbAa7uzAC/QNK8ZtsP3d5x08hMKvX+UhxAXZXQtyjTbbe
X-Gm-Gg: AR+sD10lrMaz2GxSCMdQ3rTFut6g+VuZz58kWk0yzdS+Y8Q+cT+mq6ONRWvzpICSUIj
	HTI7FxB5MFHmUGaBGlqJqezNDrAYfHCdCpX0FEmI5FZVqaHQ/30rghIu4TcmlICj73of1FVvEvR
	m1b3JecMZei44AuXffuyCbSck/TMvHeVWYFAhIY7KL5j8M5/kLQ3K98P6FZu34dFRw5ohbOg8GF
	QdDAW87EFF3ciZ0oezWEnVRsd3BnswwmXpvc3/lF3yYO4cdc1JiP0HAHLi6H0EvIVJv6lX/0d1e
	T2/nI3+ZK5/5UMEL7/OOTgCv5ZdaCvaeAKsRJPT0n94nmaPo/3hNZEvqxvWRLpvZIL7mD72DSwB
	vd22DhI6mNvVkPVeXVaE+fXxxwKM9HXT6fSB39IkcxV2oa/Khp085/XsgufxM6LeDuRHLwgZr/+
	b0qk8rpNz18kljUGIip9i+j9xbOxH4iidNvMEqwpJoK0BADAK6Yc4D1LRrwU+KLOXwriVlJIgy8
	8JcUuK2W7YlPhnKYCtdIJ2m0MM=
X-Received: by 2002:a05:600c:3f0a:b0:49b:8c63:dfdf with SMTP id 5b1f17b1804b1-49cdc560110mr78518675e9.15.1788216958381;
        Mon, 31 Aug 2026 15:55:58 -0700 (PDT)
Received: from GLaDOS.station ([187.14.102.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10153sm24452615e9.4.2026.08.31.15.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 15:55:57 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
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
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: [PATCH v8 3/3] ARM: dts: imx7d: add Variscite MX7CustomBoard support
Date: Tue,  1 Sep 2026 00:55:20 +0200
Message-ID: <0cb7621279b199c28be92c338ecf07e60f16e574.1788184274.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788184274.git.stefano.r@variscite.com>
References: <cover.1788184274.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add device tree support for the Variscite MX7CustomBoard carrier board
with the VAR-SOM-MX7 system on module.

This includes supported board configurations for both VAR-SOM-MX7
hardware revisions, with eMMC and NAND variants, and WM8731 variants
for the first hardware revision.

Also add the resulting DTBs to the i.MX7D device tree Makefile.

Link: https://www.variscite.com/carrier-boards/var-mx7customboard/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v7->v8:
 - 

v6->v7:
 - Added common dtsi for wm8904 codec removing it from base dtsi

v5->v6:
 - 

v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - Fixed commit message
 - Fixed model names

 arch/arm/boot/dts/nxp/imx/Makefile            |  6 +++++
 .../imx/imx7d-var-som-emmc-mx7customboard.dts | 23 ++++++++++++++++++
 ...x7d-var-som-emmc-wm8731-mx7customboard.dts | 23 ++++++++++++++++++
 .../imx/imx7d-var-som-nand-mx7customboard.dts | 23 ++++++++++++++++++
 ...x7d-var-som-nand-wm8731-mx7customboard.dts | 23 ++++++++++++++++++
 .../imx7d-var-som-v2-emmc-mx7customboard.dts  | 24 +++++++++++++++++++
 .../imx7d-var-som-v2-nand-mx7customboard.dts  | 24 +++++++++++++++++++
 7 files changed, 146 insertions(+)
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
index 000000000000..594ee2d2d23a
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc-mx7customboard.dts
@@ -0,0 +1,23 @@
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
+#include "imx7d-var-som-wm8904.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7 with eMMC & WM8904 on VAR-MX7CustomBoard";
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
index 000000000000..d3fbf3b4b5a3
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-nand-mx7customboard.dts
@@ -0,0 +1,23 @@
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
+#include "imx7d-var-som-wm8904.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7 with NAND flash & WM8904 on VAR-MX7CustomBoard";
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
index 000000000000..1c419251bedd
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-emmc-mx7customboard.dts
@@ -0,0 +1,24 @@
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
+#include "imx7d-var-som-wm8904.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7-5G_V2 with eMMC & WM8904 on VAR-MX7CustomBoard";
+	compatible = "variscite,var-som-imx7d-v2-emmc-mx7customboard",
+		     "variscite,var-som-imx7d-v2",
+		     "fsl,imx7d";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts
new file mode 100644
index 000000000000..68569111f3a3
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-v2-nand-mx7customboard.dts
@@ -0,0 +1,24 @@
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
+#include "imx7d-var-som-wm8904.dtsi"
+#include "imx7d-var-som-mx7customboard.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-MX7-5G_V2 with NAND flash & WM8904 on VAR-MX7CustomBoard";
+	compatible = "variscite,var-som-imx7d-v2-nand-mx7customboard",
+		     "variscite,var-som-imx7d-v2",
+		     "fsl,imx7d";
+};
-- 
2.47.3

