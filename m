Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF31417363
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 15:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783092461; cv=none; b=FlE6VrvYCsZokUfISsnnVvAIddehJK9nKY8EsP4pMaT9Un7Z3+b1VLljHVTYruOS7rjTeLeDeZ5lqWU4lgKr8dMoGb2InFWK9AMAYVmMKWFqiw0NX61pwbKRpQ7qnb8o9mPqrmqwpnSiAyb14I2kBsYRJNtsCNR/aaYH18uZv9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783092461; c=relaxed/simple;
	bh=3IRI+0YZ89YfdI6eLFQJsGv8r3K38cc+bhDF8g2QYh0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lm8J8gxISrmfpqv+iscfFbt1eyWjpOwwwshYyco5sGov4JAoYPrqPP8oGlOBZVviEHMxjNKw9Q4ysjleHzuuO0BpohxQa27sbLPx0Nxj55H29MdHLJWlP8g1qnSFehLPlL9F6kXphrbM1+QMnYWJxY6G0Vk29ZF0G8n8K5prkQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSUEWpfm; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSUEWpfm"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-46ed4f66256so627719f8f.3
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 08:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783092458; x=1783697258; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QGZm4+XMD1ngU96wT2Oojs/SHdS870fkpgs5aUT2QU0=;
        b=iSUEWpfmf9AjL2WOzmmPEZlrvfWF+48/6x8Qi1T2pbkvtchYx4e3/yfut1tC+J005d
         fYM1Y4kVKUf0/gKcn9CuEgMZKzRxPFFFIfvniH8RL6NLH8NHISxYjKVri3tuE9Qcjsxi
         lzVL6JE+r6UuaDkj7hqqcvXMn84loqihtoKpUZIiouJb9p3iRhyqKjavsfAC65mkyw1R
         1txSGG3fngpdYXceCf9yYT9anB21MtweTQ9ipUgXPAeGaylkU8RFOQeytuja41WfPQHX
         cmlSbxWSzPAZsoQYCzWXkebXCewYoM/yDBtmOw/JhPSh4xzYthQ6UXB1FQzoTet8JYZf
         udSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783092458; x=1783697258;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGZm4+XMD1ngU96wT2Oojs/SHdS870fkpgs5aUT2QU0=;
        b=a/4mPJSp0NkY6tP1vaHnAqQHSFmSdu4j4PugECVgv6selwBpXDSdyS42NZv+UxteEs
         /KD0Z7o+Z7BdblmUPAOaAmoN7zp8IyqkKUvUG80woznkhvpq0HBigl0JHLVXc+qQ6uHs
         NxU/N62a9Q+vN4i8/FrcZyPoh2wTCfgelYfwuYNOD8Ie30ABsguUP2N4pDlTJv3e7t4X
         R0Hg7xYcu2cKS+x17T6/Q/UvIcDXtikDuhkAmYLT7G5Dsyzw7F5iicntc53SBUy/lt6E
         HTObwM2eZIWnZEQaEvtcoYd6gTae26fThX30g84y6uOhIALNsQVJxnTUzew3MQ3D4r8s
         g7cQ==
X-Forwarded-Encrypted: i=1; AHgh+RofHDW6tvKgG7e1Khd4JgW4hHWNAMyLnrBgZE5faiXkYAhTpfY28ItkZEt8CVgMoIbevIVtRSut8NVD@vger.kernel.org
X-Gm-Message-State: AOJu0YxraHsw9faKCgAEoRRj2Mj+q30RnrzKlga7D9dfVs0rHUUqmLYp
	Yaaa0GvCoDAy1A+1DNbzJ129BSFm07p3bTcrpsWYgOzjAi+VKtq8KJCo
X-Gm-Gg: AfdE7cnylyRgQScljr6p6VtVBrkSCVx+XgWPeMbWhD3n201jtGhJB8059z3sFOILySy
	4By+AJEp0GnHnivklDpL0TYHfvZ/BuII/Ivao0QkS8XEl+ZyswsGf8LKBbtEQMUEvZzn2hN17US
	nBAlW/LOPhA/E62R15SKuh9LcqRG/wJxJcxYOr1AKIsSSDvEetAhKoM7c8EpKPbP8H08ZQaWd4k
	9V/X/m9vDaJccaGsLAPzx56oIywREa1Z5r9Uir1z0V2oDuNVsjOWv3sVdcz1rfWpmMyI5kH7fmS
	ljksQug3H/lgACJritoLE7Y2o+q5cQIgJEUfbvMKSS/PiqqQVJhj0l607RSIVPZC566Kodi3RRL
	SCsvHoYr6oGQ/XEKha6ECx73MrNmWWLzSn/GjSFcQoqM8/dW5Uq054icplW8R5K1Dd9mhzM3gwW
	kVFm2nXocOCvjTt4md6eSJEDTW4QU7Bfae6APP8baxz/k0enOQctw7zJx8hpId24grEE5Ik1cAO
	KB9RLAKyJpES3ucbaItcfOElRs=
X-Received: by 2002:a05:6000:52:b0:46f:f12b:e44b with SMTP id ffacd0b85a97d-4775be03161mr11748719f8f.31.1783092458177;
        Fri, 03 Jul 2026 08:27:38 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.vodafonedsl.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960b06sm85460f8f.28.2026.07.03.08.27.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:27:37 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 1/1] arm64: dts: freescale: imx9-var-dart-sonata: fix Ethernet PHY configuration
Date: Fri,  3 Jul 2026 17:27:31 +0200
Message-ID: <20260703152731.236793-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Fix the Ethernet PHY description on the DART-MX9 Sonata boards.

The GPIO previously described as the PHY reset line is actually a
board-level enable signal required by the PHY. Model it accordingly and
remove the incorrect reset GPIO description from the PHY nodes.

On i.MX91 and i.MX93 the signal is described as a fixed regulator,
whereas the existing regulator description on i.MX95 is reused.

Keeping the PHY enable asserted during boot ensures that Ethernet
initialization completes successfully.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx91-var-dart-sonata.dts   | 14 +++++++++++---
 .../boot/dts/freescale/imx93-var-dart-sonata.dts   | 14 +++++++++++---
 .../boot/dts/freescale/imx95-var-dart-sonata.dts   |  3 ---
 3 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
index 3f0fd321d95f..f7e32f9375f5 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
@@ -97,6 +97,17 @@ reg_rgb_sel: regulator-rgb-enable {
 		enable-active-high;
 	};
 
+	reg_phy1_supply: regulator-phy1 {
+		compatible = "regulator-fixed";
+		regulator-name = "SUPPLY_PHY1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pca6408_2 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <10000>;
+		regulator-always-on;
+	};
+
 	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -139,9 +150,6 @@ mdio {
 		ethphy1: ethernet-phy@1 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <1>;
-			reset-gpios = <&pca6408_2 0 GPIO_ACTIVE_LOW>;
-			reset-assert-us = <15000>;
-			reset-deassert-us = <100000>;
 
 			leds {
 				#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
index 5513d3b148a2..1ca3ec8330d0 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
@@ -103,6 +103,17 @@ reg_vref_1v8: regulator-adc-vref {
 		regulator-min-microvolt = <1800000>;
 	};
 
+	reg_phy1_supply: regulator-phy1 {
+		compatible = "regulator-fixed";
+		regulator-name = "SUPPLY_PHY1";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pca6408_2 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		startup-delay-us = <10000>;
+		regulator-always-on;
+	};
+
 	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
 		compatible = "regulator-fixed";
 		regulator-name = "VDD_SD2_3V3";
@@ -180,9 +191,6 @@ mdio {
 		ethphy1: ethernet-phy@1 {
 			compatible = "ethernet-phy-ieee802.3-c22";
 			reg = <1>;
-			reset-assert-us = <15000>;
-			reset-deassert-us = <100000>;
-			reset-gpios = <&pca6408_2 0 GPIO_ACTIVE_LOW>;
 
 			leds {
 				#address-cells = <1>;
diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
index 7a58ad38ffb4..ccf7e77016e4 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -346,9 +346,6 @@ &netc_emdio {
 	ethphy1: ethernet-phy@1 {
 		compatible = "ethernet-phy-ieee802.3-c22";
 		reg = <1>;
-		reset-gpios = <&pca6408_2 0 GPIO_ACTIVE_LOW>;
-		reset-assert-us = <10000>;
-		reset-deassert-us = <100000>;
 
 		leds {
 			#address-cells = <1>;
-- 
2.47.3

