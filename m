Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199591;
	b=uxh8kYUZpAybr7kTv/pfqj8UlwIuYxMecjvLdNAxP1Nl+K2YMc43avpuAk7vDjEZjb9l
	 iInz5HCg2dF+iQqCohvD54W1sxE7IMuNH1vrt0UaCTg2wl0rIdC6oaakTKd1p3uVZ5Kus
	 to6fIpfIQ7UI5giyz78bCWdrxHcL7sD/CQO0aBFeUX7rsdimg8mjmnlJkbZnM3n3lmZVM
	 nLWCGL4lC2guTF6YyByDXglnhU+oMMIoV3bRz3p0cXKFUiPAcj0lOAYEX9sBQJuV2JtJR
	 4Fiu5q9pjvDssLKzUyEHc7Opg9fQS19feziDlb4HDTj6DQSgVt95gdsxgUv4hj8lKjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=VelTmERfpnFtTZC+wB5krB/CsanpetBmD1N19wuVuo4=;
	b=HPCYSwAjn1og0P8bPlq9rfHgX84eelFectkNDPEfg9gjCtezrzNfYJGQ6Bi1K20je326
	 RkXFNmn1gJd/WoQz7NlxYwRwO/F4ndAmfBboVrFqYwbJf0B8T9r1EE5SfRzAzzGgTNVJv
	 4EyuMOICyUP8bZQOaO2HDk79ULgROutDyjarpYD4ypVO7c/7YeoeJrtLJLA/ZxbNCcOIw
	 IcpAVGu4pY3K/LIQYk+kCeUVuTFfFhwmnfEpMRXei9QbPd1WPjKEYd1tfLFpracmUo4wG
	 g3cYU4EOEzSuiBJ4S8rlX2QJF5U772Ph7Tuh7jjuPkxcx+ryBLHxMMQ7C4/N4bDv5dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="e/vUfSGK";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18386606A338
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 18:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18386606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e/vUfSGK
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so11974855e9.2
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795199588; x=1795804388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VelTmERfpnFtTZC+wB5krB/CsanpetBmD1N19wuVuo4=;
        b=e/vUfSGK2nLDCmR+2h0b4xZOOYcXLebcbdhm8F/MNUP5srJNffvjBpTTM5JCNO14gH
         s/dslp+bm8bcT+NhmUT2zY5aPqGLSgzzqiK7N6bWd/LHgv/0PmdbYsDCK39FSZbt9OMn
         mEFCtFjRFr2yVZ9k2Q7x/CYY6toJkcKXiGUhwOz4QttmWVVwe4jbf032H89MdwvR/vWS
         vXGbiZfn3A8RemrRjo2e7yZ/Cy8WbMzTCKng6Crc2+TmiPey2y51znW1lRgE1dftsRS2
         qii7mTE7Ej6kx0i4NXnf+QOUmofP1RIL2tPwgR5ffJk3EnPBWYIUxSi5pabIE/ha4dLT
         buUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795199588; x=1795804388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VelTmERfpnFtTZC+wB5krB/CsanpetBmD1N19wuVuo4=;
        b=BOs31GFu9fg+RtGKm3CRWWRJkH7kDn/URRmobL1zl9aDAn4hZ7gVjlnhSmTEuZDOS/
         yebabVsBcgiNFvXayPQ9sjpOxDWkIq7TRoY8I7dKiLtodRs2yXKeZ4rv3dMbGaiSbmsy
         M3X5kTQGkI4g0ASG/PsOEw8Oqu75tMnyd3zFW5zRFQTKpXb23vxBdbcudHup4fFt84C6
         cmr/MirSX+2vdYh5kuomIniMrKRktKZcYot9TIX1PgzRrwbbOc4ZuMuwd763EW/XG5VI
         Lt8IMr/Kva3vrNMbs5j4YR+pd8r8wyTaeFWFIaT8BupGocs0oWQp6dh/7DBoP4IV2GmY
         m7+g==
X-Forwarded-Encrypted: i=1; AL+hErHjfLnnPi6zy1ApByFobSIAdM/h32n511+2pA2kAN7zXXqwZRNo7qAGEqD/eleFj8fUeYAsK0qfqvt2@vger.kernel.org
X-Gm-Message-State: APuU4Z/S+FHxtiDC2MkWxUEcrObWKVH8nu4Ei9t9A3L8lQFMVTS+EG0V
	3s0t1+A8PDAwYBtcs2Y8zz3t5u5k5MWGgMpY6bxdXcOXbFwO26rLUTE+
X-Gm-Gg: AYBFou25eKEIqKtV3IskleRt1MyVfx94ZE1xD45cNj8JANom/YqKMD3WqYR6fnBBjiK
	M7SJxT3AzJWNcTKeXOlwven/zM/x05v5j5zZXF5wuULt8trMHshrUkJZMDRDuemgaEZg6Be7wAm
	bH6A/rRqsn2hebdPejHouDgUhqv/XxomnLjjjExskuJ8IBUG+OXfgY+jGT2LNo/ZoN4ONqcZv0G
	vTp2g2OpNpvItRs11P3uVP8DPOU5lw0awLk8Ma2U6cM/jhvnSWyZrv5udKGmpN/dlp1l8Y96sbH
	JT0kqRgnYEbp0MBAId30HVp+MvP/7LUXnvWGSouKZSvJ+UbAuEy5mN3JVHZrNCFOWvrer6h6qlo
	tuHUVWto9l4HgxyFDV1n/K3NW0GGfuf8cET8B/ayYAqv8MGaHu3xSl6VsTRCKdFoxwwGFbieST7
	ByIsgURaT2rfqK9OX5DfUZIJPQqxRoTJu8Fu0YBU9dU11TIkAFCoFHL4aMd2njbjPkjk3eYMcrP
	pklT4Ie7dSlQoqLxKbLVC11Xt+C79EtH6sKRUZLESM0lvAxCMEoTtlwpB0o0hqC4aYXmone5MIk
	A2ePVDnFkl3jyVnESprJ+Vw9ahwKxAQGnce6qGLkxlSiI95tz69aWGP2bWEKgVSBwe6JBn8sl4U
	pd0RVqGv8wtyjwAU2xXeuRzquKP9Aj6flHn7bdhhFwzqwQ6ty4pqfWKMk5p3wS9Tdd2bk
X-Received: by 2002:a05:600c:a087:b0:4bb:5c92:ce22 with SMTP id 5b1f17b1804b1-4bb887fe887mr89696315e9.8.1795199587508;
        Fri, 20 Nov 2026 10:33:07 -0800 (PST)
Received: from GLaDOS.station ([193.207.36.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb98b4dsm7467718f8f.53.2026.11.20.10.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:33:07 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH v4 2/3] arm64: dts: freescale: imx93-var: Extract common Cortex-M33 configuration
Date: Fri, 20 Nov 2026 19:32:29 +0100
Message-ID: <6ab5925c4f1346cd801c58fd88ec624419ad0ce8.1795197853.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795197853.git.stefano.r@variscite.com>
References: <cover.1795197853.git.stefano.r@variscite.com>
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

From: Stefano Radaelli <stefano.r@variscite.com>

Move the Cortex-M33 reserved memory and remoteproc configuration into a
common include shared by DART-MX93 and VAR-SOM-MX93.

Include the common file from both module DTSI files.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
Changes in v4:
- Move the resource table, RPMsg vrings and shared buffer from both
  carrier DTS files into the common include.
- Use generic memory@ node names and move memory-region-names from the
  overlay patch into this patch.
- Include the common configuration from both module DTSI files.

Changes in v3:
- Split the common configuration extraction into a separate patch,
  preserving the existing DART-MX93 configuration.

This patch uses the following binding and driver commits, already in
linux-next:

- ebb21cc5d1c0 ("dt-bindings: remoteproc: imx_rproc: Document
  memory-region-names to avoid implicit ABI")
- 8396089f91fa ("remoteproc: imx_rpoc: Use memory-region-names to avoid
  implicit ABI")

 .../dts/freescale/imx93-var-common-m33.dtsi   | 65 +++++++++++++++++++
 .../dts/freescale/imx93-var-dart-sonata.dts   | 31 ---------
 .../boot/dts/freescale/imx93-var-dart.dtsi    | 15 +----
 .../dts/freescale/imx93-var-som-symphony.dts  | 31 ---------
 .../boot/dts/freescale/imx93-var-som.dtsi     |  1 +
 5 files changed, 67 insertions(+), 76 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
new file mode 100644
index 000000000000..72b47ba99cb9
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common Cortex-M33 configuration for Variscite i.MX93 modules
+ *
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
+ *
+ */
+
+&{/} {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		rsc_table: memory@2021e000 {
+			reg = <0 0x2021e000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0vring0: memory@87ee0000 {
+			reg = <0 0x87ee0000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: memory@87ee8000 {
+			reg = <0 0x87ee8000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring0: memory@87ef0000 {
+			reg = <0 0x87ef0000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: memory@87ef8000 {
+			reg = <0 0x87ef8000 0 0x8000>;
+			no-map;
+		};
+
+		vdevbuffer: memory@87f00000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x87f00000 0 0x100000>;
+			no-map;
+		};
+	};
+};
+
+&cm33 {
+	mbox-names = "tx", "rx", "rxdb";
+	mboxes = <&mu1 0 1
+		  &mu1 1 1
+		  &mu1 3 1>;
+	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
+	memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
+			      "vdev1vring0", "vdev1vring1", "rsc-table";
+	status = "okay";
+};
+
+&mu1 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
index 1ca3ec8330d0..efd51f6364f3 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
@@ -137,37 +137,6 @@ ethosu_mem: ethosu-region@88000000 {
 			reg = <0x0 0x88000000 0x0 0x8000000>;
 		};
 
-		vdev0vring0: vdev0vring0@87ee0000 {
-			reg = <0 0x87ee0000 0 0x8000>;
-			no-map;
-		};
-
-		vdev0vring1: vdev0vring1@87ee8000 {
-			reg = <0 0x87ee8000 0 0x8000>;
-			no-map;
-		};
-
-		vdev1vring0: vdev1vring0@87ef0000 {
-			reg = <0 0x87ef0000 0 0x8000>;
-			no-map;
-		};
-
-		vdev1vring1: vdev1vring1@87ef8000 {
-			reg = <0 0x87ef8000 0 0x8000>;
-			no-map;
-		};
-
-		rsc_table: rsc-table@2021e000 {
-			reg = <0 0x2021e000 0 0x1000>;
-			no-map;
-		};
-
-		vdevbuffer: vdevbuffer@87f00000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x87f00000 0 0x100000>;
-			no-map;
-		};
-
 		ele_reserved: ele-reserved@87de0000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x87de0000 0 0x100000>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
index 69495bb7fc9f..4ee4d74cadea 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart.dtsi
@@ -12,6 +12,7 @@
 
 #include <dt-bindings/usb/pd.h>
 #include "imx93.dtsi"
+#include "imx93-var-common-m33.dtsi"
 
 / {
 	model = "Variscite DART-MX93 Module";
@@ -54,16 +55,6 @@ wifi_pwrseq: wifi-pwrseq {
 	};
 };
 
-&cm33 {
-	mbox-names = "tx", "rx", "rxdb";
-	mboxes = <&mu1 0 1>,
-		 <&mu1 1 1>,
-		 <&mu1 3 1>;
-	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
-			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
-	status = "okay";
-};
-
 &eqos {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&pinctrl_eqos>;
@@ -221,10 +212,6 @@ bluetooth {
 	};
 };
 
-&mu1 {
-	status = "okay";
-};
-
 &mu2 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 78b19d8918b7..c3e880025a06 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -87,37 +87,6 @@ ethosu_mem: ethosu-region@88000000 {
 			reg = <0x0 0x88000000 0x0 0x8000000>;
 		};
 
-		vdev0vring0: vdev0vring0@87ee0000 {
-			reg = <0 0x87ee0000 0 0x8000>;
-			no-map;
-		};
-
-		vdev0vring1: vdev0vring1@87ee8000 {
-			reg = <0 0x87ee8000 0 0x8000>;
-			no-map;
-		};
-
-		vdev1vring0: vdev1vring0@87ef0000 {
-			reg = <0 0x87ef0000 0 0x8000>;
-			no-map;
-		};
-
-		vdev1vring1: vdev1vring1@87ef8000 {
-			reg = <0 0x87ef8000 0 0x8000>;
-			no-map;
-		};
-
-		rsc_table: rsc-table@2021e000 {
-			reg = <0 0x2021e000 0 0x1000>;
-			no-map;
-		};
-
-		vdevbuffer: vdevbuffer@87f00000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x87f00000 0 0x100000>;
-			no-map;
-		};
-
 		ele_reserved: ele-reserved@87de0000 {
 			compatible = "shared-dma-pool";
 			reg = <0 0x87de0000 0 0x100000>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index b0ffcb534cb6..46b739a147e3 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "imx93.dtsi"
+#include "imx93-var-common-m33.dtsi"
 
 /{
 	model = "Variscite VAR-SOM-MX93 module";
-- 
2.47.3

