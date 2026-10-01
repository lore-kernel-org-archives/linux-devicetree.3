Received: from mail-wr2-f29.google.com (mail-wr2-f29.google.com [74.125.225.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382AE486431
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 15:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870075; cv=none; b=s2IXWdc/6ye1xMuMS2prU/mo8dMsW46tNwHGHUxRT19kOuaKyOtNvgP0TXLp6assol8Ha0kEvghJj/5uEmgys5B4gkYMflnXcmThONPkrPP8Z10VCvxoU98mvVCj85LRlgvvyH0z0yLgUNWp7tQiVJrd5Ke4cTjYhI/nSimApEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870075; c=relaxed/simple;
	bh=dHV1S0743ZWwIgXm5VDJrijPJE34+rYwyTI38JNTUhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c7X7Ru035L3pL21WO1BmnbFDRKT07bnsceoNH0SXdbpFOVgPqsFLOa4pJobth9wUaof7glU8oGAmXipy+S73OfoNorK6yFjeR82UGlk1US0PA7LB4bC5/4Q2AkcLk4MQCZdSZ4tf+j9dP8lupnuUoByYhpNZ5Irc9Aw4EpWGeYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HHzqv+VU; arc=none smtp.client-ip=74.125.225.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HHzqv+VU"
Received: by mail-wr2-f29.google.com with SMTP id ffacd0b85a97d-48aef5d66c1so1930507f8f.3
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 08:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870069; x=1791474869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J5CGv0/6w5gVrsPF9zExhSI+JtnFir6oWba07h7nJSU=;
        b=HHzqv+VU0HDAXoZu14Mz/iYfR3we/1cTpNqGip+tuO1RRpyAxdQhwdVR7VdSruJifZ
         KkeYWFHtu8ZA3kBU/kgFXW+vSSVu0QAwgAdE/zIQOpavhFaulpuw6sN7jIdmaKWwI5JK
         dUvqM5HufJI/1jyUETGQu7yrgyTyeUZKJSsnNbjjxV42p4BW8IovUhmYcNBVW/cAzu/j
         ejG7cORYTvC4OqKLpdDHJdlr8Rh7ohH5BQWnM/V/W0otwLNZl6o4g8TPb+w4DK5lkvUe
         UiMmR0OQme5KSxI64joFdWQxmwCIFbyG2u15WE/ufXb87wEV7f5qR64UhbG4at/QFeIv
         ez2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870069; x=1791474869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J5CGv0/6w5gVrsPF9zExhSI+JtnFir6oWba07h7nJSU=;
        b=OVzgbr8dPqjuKBAnmKsY6nrY1dTKEEkGD/0LjCwShSjKIo9q8FFn0Fd+PT1gPWgorz
         l36KwEUm17xcMYT8H8J6HEYxIyhejUiKuhhyUxZ9sP7lxvAcMSFRTAS0cd1cM1p0TK7D
         reRTC6JIfhYubUb+aGKZ+0RyTUyWHf0A2vKG/ExgoinSVeEXZrPw1sXHXvWCTDdQN+VE
         JaS2TgL8JFhG41vinAzFBIwtiIB6lKAf35HDHw/xGkG/1ODpHwbqUxvc+DzNFZqCA3/v
         6tXl4THFKtoShxA4ajEEmvWx3+07LVZhEgSXHKPfg5R0Wylo4bjeyDrL0+w+9nHJUldt
         Wqew==
X-Gm-Message-State: AFq9FYJvs6QhW9dJmr1cygt+PFgpFUvPAvrIrF+KBAC9tK8bcIevYhNt
	nzJX+/iK64wfwBYrPCZGAR3Rnm77bSD//3lXjbE8dFsPTr3+lAl9Oc6V
X-Gm-Gg: AYBFou3LlYafaLCryz3LjiIYQTV5209J0wwWjWDy9E0/OZpb48OkKfTs8v7zpSsU58i
	Ke8/1JyerqUB2Tk+TfBhG5WT97++xemPPivwWSJwiUAwunUxOTtn9dtdC47ZMRWXLnbP8gKpzY9
	ZrDlWyM9WR7OoCNYyQnnuU6EemMT6IZkCw2MrZ40p6kcVJ2HvAwzsubKuGv8ktZ+O1iuVliBHE1
	lkLnxd1hUx4ePXuiAjeiYUUIpUmCVUEGqNniKRDORL8KOaVkTGBC/apVZQ3lIunx2bh3h/YgfZM
	784WjwfLX1ZS+6DBsHn6qmh82nnRmjKGexPoD+n+dPpoWp08+Dc/Jl+L80y6j2nipQiSAr7uJ9U
	jUSBMtB18R08E93+ifo5gUJMOekuxeYOkGAIgYVPhj/MphhI2pf6kFa+B/7PD6PO68CPavGGP63
	7NkWKVIsBfpdDJd3IVlV2ho8cOXjyN1ikTpOdmqjDIpkGLUgCwxY8r0nPhvzvzXBEemZ1d4GZSN
	XU1X1hsxYgMO0PNcnwKX07Yvgu8lhXqlcmMbdPvXN7WxqHPCHTVb5bdOFp8Lk9ZxrFbKLOG59sZ
X-Received: by 2002:a05:6000:41c6:b0:487:81c:6de with SMTP id ffacd0b85a97d-48b1271f670mr44164f8f.34.1790870069033;
        Thu, 01 Oct 2026 08:54:29 -0700 (PDT)
Received: from leonardoc-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6eesm6517294f8f.11.2026.10.01.08.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:28 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	leonardo.costa@toradex.com,
	hvilleneuve@dimonoff.com,
	marex@nabladev.com,
	stefano.r@variscite.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] ARM: dts: imx6q-apalis: Add Toradex Capacitive Touch Display 10.1" LVDS
Date: Thu,  1 Oct 2026 12:52:53 -0300
Message-ID: <20261001155412.3177428-4-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001155412.3177428-1-leoreis.costa@gmail.com>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Toradex Capacitive Touch Display 10.1"
LVDS connected via the Apalis iMX6 LDB.

The panel is a LogicTechno LT170410-2WHC 10.1" WXGA IPS LCD and the
touch input is provided by an Atmel MaxTouch capacitive touch
controller.

Remove the panel-lvds node from the Apalis iMX6 dtsi, as it is an
external component that does not exist at the SoM level.

The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
Board V1.2 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile            |  6 +++
 ...6q-apalis-panel-cap-touch-10inch-lvds.dtso | 53 +++++++++++++++++++
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 13 -----
 3 files changed, 59 insertions(+), 13 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 32d77a59c4358..23fcc80d7f309 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -99,6 +99,10 @@ imx6q-apalis-v1.2-ixora-v1.2-hdmi-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-hdmi.dtbo
 
+imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -233,6 +237,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-ixora-v1.2.dtb \
 	imx6q-apalis-ixora-v1.2-hdmi.dtb \
+	imx6q-apalis-panel-cap-touch-10inch-lvds.dtbo \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
@@ -243,6 +248,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-ixora-v1.1-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-panel-cap-touch-10inch-lvds.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso
new file mode 100644
index 0000000000000..a84114e1d3fba
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-panel-cap-touch-10inch-lvds.dtso
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 10.1" connected via Apalis iMX6 LDB
+ * on carrier boards with a Toradex standard LVDS display connector.
+ *
+ * https://docs.toradex.com/105952-10-1-inch-lvds-capacitive-touch-display-1280x800-datasheet.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-101inch-lvds
+ * https://www.toradex.com/accessories/capacitive-touch-display-10.1-inch-lvds
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	panel-lvds {
+		compatible = "logictechno,lt170410-2whc";
+		backlight = <&backlight>;
+		power-supply = <&reg_3v3_sw>;
+
+		port {
+			lvds_panel_in: endpoint {
+				remote-endpoint = <&lvds0_out>;
+			};
+		};
+	};
+};
+
+&atmel_mxt_ts {
+	status = "okay";
+};
+
+&backlight {
+	status = "okay";
+};
+
+&ldb {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	lvds-channel@0 {
+		reg = <0>;
+
+		status = "okay";
+	};
+};
+
+&lvds0_out {
+	remote-endpoint = <&lvds_panel_in>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index 5fcd7cdb7001f..e52b55a386f7a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -95,18 +95,6 @@ lcd_panel_in: endpoint {
 		};
 	};
 
-	panel_lvds: panel-lvds {
-		compatible = "panel-lvds";
-		backlight = <&backlight>;
-		status = "disabled";
-
-		port {
-			lvds_panel_in: endpoint {
-				remote-endpoint = <&lvds0_out>;
-			};
-		};
-	};
-
 	poweroff {
 		compatible = "regulator-poweroff";
 		cpu-supply = <&vgen2_reg>;
@@ -738,7 +726,6 @@ port@4 {
 			reg = <4>;
 
 			lvds0_out: endpoint {
-				remote-endpoint = <&lvds_panel_in>;
 			};
 		};
 	};
