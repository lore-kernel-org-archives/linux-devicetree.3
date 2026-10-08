Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C01A4FECD6
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 19:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791488438; cv=none; b=Y1JFmVMMa6LzP1HXB+HEIP0Brz1/hPXKjL/Jsmf5HNysOYxLv+1phPBMDBGPVBeAow4SaQ8A4spYhvTZ8gyIbIlOcj6lxBI+IFM7tws2p0YAyxRBtKN3Z0uIqeIrP6Ayt/ti8/xwrOzPrmU7Fu+y3eUgNpI5agNYGmFv8wyty64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791488438; c=relaxed/simple;
	bh=uYnoAlVMzjPf1koqMWb3wOPeMUNPpHGIO7RXL2fZKnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HMBIZsadc3Jw0x9wyFO41v7ZTpc50E0MkYdkPf9koaX6B889YlvwH7sKmDBFNCrudUSYof01QFo5N2VNfEK+YzjNu7izhhYXRCGmS6wqu1xPp8mVjlJZRxXnXEUUfeFtqzxKCWU9IHO+VXskj/I1zajptA6dlQtYhjX6XW5erjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1xeIeMF; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1xeIeMF"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a01933b584so31352215e9.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 12:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488429; x=1792093229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hRkcPjZLCx4KGQ69YlsYx3CS01joHDVdS8gNEI5i67g=;
        b=i1xeIeMFOaDcs/qDd6ECvx3yo7CACdrr2Pd5y7ll1sFrQNfZEWM0/UXdnVFeeGy65h
         M0J7AmBaTkmaavHSZ2iV5+pXoJwCxroLRXqdEutYsXC4I1Yv3gPzXVHeC+LFEo164QRj
         kbWxUXQ+5qYwtkQzlt82aP8s+bzKm4EuM1ZL7OJPKVZDJWGqQUm1hsYLSbYLGZCCFSsY
         YJLCyziM+Uw19TMZkBFC9aXYneKuRe87JdkKuqWxXOTUYEC6C8qd63BQ51lNA5yJSG/3
         eUfb+NTeCx7u9M7U4q7f6l2CHoEI7ebLQwDJV+PvbpZ1QJ7nlWNHSegmprc3EVVvLGNp
         D/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488429; x=1792093229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hRkcPjZLCx4KGQ69YlsYx3CS01joHDVdS8gNEI5i67g=;
        b=BF3W1C9cKLxYH2NYU0Cx2Bwe5F7sM4NWqaUr3Nc/Q9iC2XL5jGdoBI+2h/yZmSyQ8O
         Od3aGZ2y3SxgIvktyPbgZkV+y0PbdaWfBDje/J+Yap8S/lP+AEGSh4YgcKSPp/Qlkzl9
         OrBdUHmvwEDaCFDgfV8y4oKndO3Y3SNcNz1/Q/rU+A486s4JZwPipLIKTPrr6weDpNEg
         lIcOPnG5hMGEgLNahHdHLYNJ+6o4SkkMAgskiN7zN7X5z+POApuxs1s9ZdI4aaaWdkeH
         E+K4GybNq9XC4FrC5iqh5raW7JZxsCN/Pc+ZVWKnADHvhHM7eIibsc2GKkdEKRMGJ0s8
         oglw==
X-Forwarded-Encrypted: i=1; AKwUvBwnlOf1oWKbrzzPL9sPGWhq5JGrKRzJtQUV/xR+zApNZxgIDgl6esMhBarD713k+n3RBMeKBcX+tNx/@vger.kernel.org
X-Gm-Message-State: AFuF++l9blRrHzQkbf185JaI6VuqVJJjoKd1E/ZpZQ8HbaMno/tL/VWU
	GunMSjNP3t08DoNiQSIQ9GgBXkwgulAqugigSmqN6eEbxqjrDcu1fW13
X-Gm-Gg: AYBFou3icSvaOtTN1iOUqwzXbfZlPgkG8WU5hQAzc/G147GxAF3/dFcoe2IRIIM3N+a
	ju2amXZufWsuuu5SfoS/4BsIIvjUE5juyvT8r97hFmRr7AJfR2egs1DaWz3uY0sh7vx7jUz9BUG
	ZP3f9udLuUomPSU6qYtYrvwFRzMMfJ/SaxzjId7Ot2mQdPGCTEpbQsHZw3W7nfWdjHBq8VWijN0
	14ePNlpGirVS9Kz7B3h2vcX8Q7sK+/UPiUEFud+e/KLkwnD6StigE/zFntEZ/DO3OzqYxi6Ewlr
	ChNC+cEOj7P057FqKRVlSAS8QUvk0OHEIIAK6K75PgoGCFNHrct0QHBj4+FzN6TcOH2s9iBud2C
	Ug4m8dDd4L2F+J2m8IKE+XMtK3A5WTJ3HJ4ikiGr6lspoC0/Jv+TsZUn0Eqjln3s3XoNMRx95XL
	BKbgkqGuaj1UPrQPb5YxZu4N5Dc9psFqKPBFAD9tojpt+rVEq3bBmp7m8YP/R/+TRt/oSo4ClLr
	hxevOQlwIztIqiEpmw8geyGSfp/VnPOeHbNSXBnuAwfF6bARXUuoEJ9LwwtfySN7aWd/gEQE0HW
	/Mc62tIU9ApHejQSMZzOTw==
X-Received: by 2002:a05:600c:a00d:b0:49f:ce78:356f with SMTP id 5b1f17b1804b1-4a18065f30cmr122465985e9.32.1791488429121;
        Thu, 08 Oct 2026 12:40:29 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:28 -0700 (PDT)
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
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v5 07/13] ARM: dts: imx6ul: Add Variscite WM8904 and WM8731 support
Date: Thu,  8 Oct 2026 21:37:47 +0200
Message-ID: <50f74f31925dd5d43d5b6578888c33875d8f2a20.1791487179.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add shared WM8904 and WM8731 codec and sound-card descriptions for
VAR-SOM-6UL and DART-6UL. Reuse imx6ul-var-som-audio.dtsi for SAI2
and select the clock setup and audio routes in each codec file.
The DART-6UL WM8904 wrapper adds the IN2L, IN2R and MICBIAS routes.

The existing Concerto DTS files enable SAI2 but do not describe a
codec or sound card. Include the WM8904 option there to connect the
codec on I2C2 to SAI2 with the module's audio configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Reuse imx6ul-var-som-audio.dtsi for SAI2 and its pinctrl, keeping
   codec-specific clock and routing settings in the codec files.
 - Add the WM8904 include to the four existing Concerto DTS files in
   this patch instead of waiting for a later conversion patch.

v1->v2:
 - Share the WM8904 description with a DART-specific microphone
   routing wrapper, and consolidate the identical WM8731 files.

 .../imx/imx6ul-imx6ull-var-dart-wm8904.dtsi   | 17 +++++
 .../nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi    | 50 ++++++++++++++
 .../nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi    | 68 +++++++++++++++++++
 .../nxp/imx/imx6ul-var-som-concerto-full.dts  |  2 +-
 .../dts/nxp/imx/imx6ul-var-som-concerto.dts   |  2 +-
 .../nxp/imx/imx6ull-var-som-concerto-full.dts |  2 +-
 .../dts/nxp/imx/imx6ull-var-som-concerto.dts  |  2 +-
 7 files changed, 139 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi
new file mode 100644
index 000000000000..236022f3da10
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-dart-wm8904.dtsi
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+
+&sound_wm8904 {
+	simple-audio-card,routing =
+		"Headphone Jack", "HPOUTL",
+		"Headphone Jack", "HPOUTR",
+		"IN1L", "Line In Jack",
+		"IN1R", "Line In Jack",
+		"IN2L", "Microphone Jack",
+		"IN2R", "Microphone Jack",
+		"Microphone Jack", "MICBIAS";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi
new file mode 100644
index 000000000000..ed9af0a39714
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8731.dtsi
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+#include "imx6ul-var-som-audio.dtsi"
+
+/ {
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&sound_master>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&sound_master>;
+		simple-audio-card,name = "wm8731audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "RHPOUT",
+			"Headphone Jack", "LHPOUT",
+			"LLINEIN", "Line Jack",
+			"RLINEIN", "Line Jack",
+			"MICIN", "Mic Bias",
+			"Mic Bias", "Mic Jack";
+		simple-audio-card,widgets =
+			"Headphone", "Headphone Jack",
+			"Line", "Line Jack",
+			"Microphone", "Mic Jack";
+
+		sound_master: simple-audio-card,cpu {
+			sound-dai = <&sai2>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&codec>;
+			system-clock-frequency = <12288000>;
+		};
+	};
+};
+
+&i2c2 {
+	codec: audio-codec@1a {
+		compatible = "wlf,wm8731";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&clks IMX6UL_CLK_SAI2>;
+		clock-names = "mclk";
+		AVDD-supply = <&reg_3p3v>;
+		DBVDD-supply = <&reg_3p3v>;
+		DCVDD-supply = <&reg_3p3v>;
+		HPVDD-supply = <&reg_3p3v>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi
new file mode 100644
index 000000000000..c95dbf3824af
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wm8904.dtsi
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+#include "imx6ul-var-som-audio.dtsi"
+
+/ {
+	sound_wm8904: sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,bitclock-master = <&sound_master>;
+		simple-audio-card,format = "i2s";
+		simple-audio-card,frame-master = <&sound_master>;
+		simple-audio-card,name = "wm8904audio";
+		simple-audio-card,routing =
+			"Headphone Jack", "HPOUTL",
+			"Headphone Jack", "HPOUTR",
+			"IN1L", "Line In Jack",
+			"IN1R", "Line In Jack";
+		simple-audio-card,widgets =
+			"Microphone", "Microphone Jack",
+			"Headphone", "Headphone Jack",
+			"Line", "Line In Jack";
+		simple-audio-card,mclk-fs = <256>;
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai2>;
+		};
+
+		sound_master: simple-audio-card,codec {
+			sound-dai = <&codec>;
+		};
+	};
+};
+
+&i2c2 {
+	codec: audio-codec@1a {
+		compatible = "wlf,wm8904";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		clocks = <&clks IMX6UL_CLK_SAI2>;
+		clock-names = "mclk";
+		AVDD-supply = <&reg_3p3v>;
+		CPVDD-supply = <&reg_3p3v>;
+		DBVDD-supply = <&reg_3p3v>;
+		DCVDD-supply = <&reg_3p3v>;
+		MICVDD-supply = <&reg_3p3v>;
+		wlf,drc-cfg-names = "default", "peaklimiter", "tradition",
+				    "soft", "music";
+		/*
+		 * Config registers per name, respectively:
+		 * KNEE_IP = 0,   KNEE_OP = 0,     HI_COMP = 1,   LO_COMP = 1
+		 * KNEE_IP = -24, KNEE_OP = -6,    HI_COMP = 1/4, LO_COMP = 1
+		 * KNEE_IP = -42, KNEE_OP = -3,    HI_COMP = 0,   LO_COMP = 1
+		 * KNEE_IP = -45, KNEE_OP = -9,    HI_COMP = 1/8, LO_COMP = 1
+		 * KNEE_IP = -30, KNEE_OP = -10.5, HI_COMP = 1/4, LO_COMP = 1
+		 */
+		wlf,drc-cfg-regs = /bits/ 16 <0x01af 0x3248 0x0000 0x0000>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x0408>,
+				   /bits/ 16 <0x04af 0x324b 0x0028 0x0704>,
+				   /bits/ 16 <0x04af 0x324b 0x0018 0x078c>,
+				   /bits/ 16 <0x04af 0x324b 0x0010 0x050e>;
+	};
+};
+
+&sai2 {
+	assigned-clock-rates = <0>, <11565177>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
index 725f34d6b7ee..66c9deaea083 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
@@ -13,7 +13,7 @@
 #include "imx6ul-var-som-wifi.dtsi"
 #include "imx6ul-var-som-enet2.dtsi"
 #include "imx6ul-var-som-enet1.dtsi"
-#include "imx6ul-var-som-audio.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
 #include "imx6ul-var-som-lvds-panel.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
index c249e15772b8..4905abf5aa08 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
@@ -13,7 +13,7 @@
 #include "imx6ul-var-som-concerto-common.dtsi"
 #include "imx6ul-var-som-sd.dtsi"
 #include "imx6ul-var-som-enet2.dtsi"
-#include "imx6ul-var-som-audio.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
 #include "imx6ul-var-som-lvds-panel.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
index 1b7c1a3383ee..880b72833091 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
@@ -13,7 +13,7 @@
 #include "imx6ul-var-som-wifi.dtsi"
 #include "imx6ul-var-som-enet2.dtsi"
 #include "imx6ul-var-som-enet1.dtsi"
-#include "imx6ul-var-som-audio.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
 #include "imx6ul-var-som-lvds-panel.dtsi"
 
 / {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
index 9c9d16eb1a11..c481839a98a5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
@@ -12,7 +12,7 @@
 #include "imx6ul-var-som-concerto-common.dtsi"
 #include "imx6ul-var-som-sd.dtsi"
 #include "imx6ul-var-som-enet2.dtsi"
-#include "imx6ul-var-som-audio.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
 #include "imx6ul-var-som-lvds-panel.dtsi"
 
 / {
-- 
2.47.3

