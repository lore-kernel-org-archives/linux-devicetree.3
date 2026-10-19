Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352164E3ECA
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 11:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792408732; cv=none; b=NbuJZTA/GlzjRzRppirUIjpt5S5rCXa7cXkxz+hDEk1vYdTXNACp0mIi7rrDrWQHTH80qYgHw4f0wkY4bKSb4ZQv3oVvjrlWf8BOpaBZAwtdDRXOIFw8hHG6v1rtSkjmvZSOaz3FEVZZSLata7jY1PmvZdelLQL/fsRiSOf+CNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792408732; c=relaxed/simple;
	bh=MRLTvOh3aU4FGCN6NR5yVezDJmixMfW4yI8Zi3Belf0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=STtXUFV4piDrXxeWP5ByMxMi6Z3mGMc/YILOCDIP9OVtz07hLI7eJljR+/DQOKhnDQt2gM3gFIG/f/mTTVBo3xZ9SzrhPEw3zSQ9nRAISQSygFYXHZfYL/ETKKfVJjX0O/kVuplMg6dNr2fxrzxfgG1VRO+2XQRAxlIfFd8YaAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=poruXbSe; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="poruXbSe"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1d75f2f11so13423495e9.3
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 04:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792408727; x=1793013527; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pAuGbpbYIgMLYkQDiOfgLoi1DhXaRQoxjNR6h+bBZU0=;
        b=poruXbSeVQauHTlKiyJVwajdCIZRLYUBe//5vP1513xyBjk6h3mOqdvI94Zx2hQGeC
         8yiJ/t9137ShMzPar+oT1sH8UWTOmfAHRiQq/qR4ZRQAr8kHOYcFOP8oaDQNLyeG/csH
         Res5ODecrEpnnAsucP5Vn9tOA5IsNVBhzZzeQNs3nET1oNiMn2RrFme392jNIRRUN5ad
         AoyMdm9I/3rwevq7RhwJ0PqD8zKYYHzSXcgC7Gc+1uENkoVCkPBCL2DkzMES4S/B7Bqg
         pPpYqJERghnXGD82lElk4Zpm4glYaJVnZD8qi1nFeZCzNL891gxAwJfjWB27kTtv9V31
         NQuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792408727; x=1793013527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pAuGbpbYIgMLYkQDiOfgLoi1DhXaRQoxjNR6h+bBZU0=;
        b=2YKSees5RYLxBE2OOrceFAFPNDudOVeQIxXi4+sjSR2bMdDMy4wMo+XjtnaBUbZl5Q
         80HPYMh+XaW2LjSNn2bVvSieG1Fc3Ki8Tou2oOYpBFXCv1pkfGsKPpZwePkgfILEv8fx
         HWdq6ZntEAlqKN7BGpmwndHiHEBv3yw35vYahVn5c8uVTGwRX765iflFXwQpchenPxAX
         lQvrPbJBu2c+yZ7LnFzzZB/CuMXkZ2YtpwKt/tmRQNjqyHNyNm5JNsVaCLTvCXvwxkp8
         Z/bAlKjhFwb48bYXT5uLERnLQTQRVusQg/gJUiznCEbTalpct0IwXY28eh/x0B5oFU4R
         DDIg==
X-Gm-Message-State: AFq9FYIfL5fNg1ymxhNqHVWDY87JHwu9RJI2AOxTsSiqVIelcJjMWRxc
	pRACLF36k4bdvWasLm5mBpotmd3jDSDXXdZTgHiP1hxuODOJNbe88q3O
X-Gm-Gg: AYBFou0GQQUDH0iSJktuo0R4b1EjrxUTNtLzzRP4B0YeE0v2SLZJrsT4DnNf6v+qJK0
	MQh0ImPPa3TqwQvMRn03MaT1g0rJyHpv1Jmss1BgdtDt+AtAgUk2mPrmL5270idZdqq4+Rp0sAe
	jP670T3/Fjf4meoktFxOLf9kcXIPqjqKf9OUvSWZsDMY13M6YgpXavekGxwXaof/5m3BUO6g97/
	DZs01pzcWdA8HzHrAxoYkndOlvQH2KdHDhcbodfjA+5BT3U1UWWtBIK7EazW2mGXorEbx+um29k
	3gaH8EIxEG9h5KwhSP+kFPzRTj746reJQK9m2SN4prHdJtNXdZHuV3QjCm1CWk+43S4gNgNPFdy
	bMFSkqKcfv0doajpX9l4Ltzztb3qPxg+AF3TnXCBihvesQZQGnXV2SHT+TtaLX8Vv6zAmkmmA+g
	K1UQFcZq7gW+7iD5YV1v8p2E23/OhNgWNup7si7AhkBSL13k7t0NEBikmp78vGO6Sl17iOKdjyD
	AQ4y9AlO1gMdb7m4Y2wVJyJRuwD//4uMa4IhX/L9TzuBFgj+z3UftfM9AuKOrDlaCFQLsGRssat
	lIwmcUIyIAE6JZeEbGuN9ZSjJheEWYXv
X-Received: by 2002:a05:600c:8883:b0:4a1:80d8:aed0 with SMTP id 5b1f17b1804b1-4a1d75fe793mr119911565e9.15.1792408726899;
        Mon, 19 Oct 2026 04:18:46 -0700 (PDT)
Received: from [10.0.0.136] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1e3ebb3aasm193183505e9.0.2026.10.19.04.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 04:18:45 -0700 (PDT)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Mon, 19 Oct 2026 13:18:34 +0200
Subject: [PATCH 5/5] ARM: dts: imx6dl-colibri: Add VGA overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-colibri-imx6-overlays-v1-5-e4d028727382@toradex.com>
References: <20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com>
In-Reply-To: <20261019-colibri-imx6-overlays-v1-0-e4d028727382@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4928;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=rV4clumIvWpWiwOoIzG+2Vz7clpxc4eRzzo4Zecgm0w=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsi6+qf/+ASOA7KLGI0Sl+RfY77752CpqZbW1ZVrq9wvJ
 3kF9zW2d5SyMIhxMciKKbJkPFEV5FMIkfXgaE6GmcPKBDKEgYtTACYyR56R4bZtUbmP2NJL336z
 Gx29MdP83MySSVlKgtWTxI/Y6wZOms7I0GW5/a3el2tSyTHfSqpczIW/cHofVb0QxnUiMi/g1QZ
 xJgA=
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

From: Antoine Gouby <antoine.gouby@toradex.com>

Add a device tree overlay for the VGA output on the Colibri iMX6
parallel RGB LCD interface. The VGA output is driven through a
non-programmable video DAC without VESA DDC I2C signals to a DVI
connector. The DAC power-save input is driven by the BL_ON signal on
SODIMM 71, like on the Colibri iMX6ULL and Colibri iMX7.

The overlay is also combined with the Colibri iMX6 V1.2 Aster,
Evaluation Board v3, Iris and Iris v2 carrier board device trees to
provide ready-to-use DTBs.

Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                | 21 +++++++
 arch/arm/boot/dts/nxp/imx/imx6dl-colibri-vga.dtso | 67 +++++++++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 1ea51b13ab7c..11fcef5195c8 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -84,6 +84,10 @@ imx6dl-colibri-v1.2-aster-panel-cap-touch-7inch-parallel-dtbs := \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-panel-cap-touch-7inch-parallel.dtbo
 
+imx6dl-colibri-v1.2-aster-vga-dtbs := \
+	imx6dl-colibri-v1.2-aster.dtb \
+	imx6dl-colibri-vga.dtbo
+
 imx6dl-colibri-v1.2-eval-v3-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-hdmi.dtbo
@@ -96,10 +100,18 @@ imx6dl-colibri-v1.2-eval-v3-panel-res-touch-7inch-parallel-dtbs := \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-panel-res-touch-7inch-parallel.dtbo
 
+imx6dl-colibri-v1.2-eval-v3-vga-dtbs := \
+	imx6dl-colibri-v1.2-eval-v3.dtb \
+	imx6dl-colibri-vga.dtbo
+
 imx6dl-colibri-v1.2-iris-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-hdmi.dtbo
 
+imx6dl-colibri-v1.2-iris-vga-dtbs := \
+	imx6dl-colibri-v1.2-iris.dtb \
+	imx6dl-colibri-vga.dtbo
+
 imx6dl-colibri-v1.2-iris-v2-hdmi-dtbs := \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-hdmi.dtbo
@@ -108,6 +120,10 @@ imx6dl-colibri-v1.2-iris-v2-panel-cap-touch-7inch-parallel-dtbs := \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-panel-cap-touch-7inch-parallel.dtbo
 
+imx6dl-colibri-v1.2-iris-v2-vga-dtbs := \
+	imx6dl-colibri-v1.2-iris-v2.dtb \
+	imx6dl-colibri-vga.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -154,15 +170,20 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-colibri-v1.2-aster.dtb \
 	imx6dl-colibri-v1.2-aster-hdmi.dtb \
 	imx6dl-colibri-v1.2-aster-panel-cap-touch-7inch-parallel.dtb \
+	imx6dl-colibri-v1.2-aster-vga.dtb \
 	imx6dl-colibri-v1.2-eval-v3.dtb \
 	imx6dl-colibri-v1.2-eval-v3-hdmi.dtb \
 	imx6dl-colibri-v1.2-eval-v3-panel-cap-touch-7inch-parallel-touch-adapter.dtb \
 	imx6dl-colibri-v1.2-eval-v3-panel-res-touch-7inch-parallel.dtb \
+	imx6dl-colibri-v1.2-eval-v3-vga.dtb \
 	imx6dl-colibri-v1.2-iris.dtb \
 	imx6dl-colibri-v1.2-iris-hdmi.dtb \
+	imx6dl-colibri-v1.2-iris-vga.dtb \
 	imx6dl-colibri-v1.2-iris-v2.dtb \
 	imx6dl-colibri-v1.2-iris-v2-hdmi.dtb \
 	imx6dl-colibri-v1.2-iris-v2-panel-cap-touch-7inch-parallel.dtb \
+	imx6dl-colibri-v1.2-iris-v2-vga.dtb \
+	imx6dl-colibri-vga.dtbo \
 	imx6dl-cubox-i.dtb \
 	imx6dl-cubox-i-emmc-som-v15.dtb \
 	imx6dl-cubox-i-som-v15.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-vga.dtso b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-vga.dtso
new file mode 100644
index 000000000000..f22f1969a6a8
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-colibri-vga.dtso
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * VGA output connected to the Colibri parallel RGB LCD interface through a
+ * non-programmable video DAC with a DVI connector.
+ *
+ * The VGA output is available on multiple carrier boards (including Iris,
+ * Eval, Aster) without VESA DDC I2C signals.
+ *
+ * The DAC power-save input is driven by the BL_ON signal on SODIMM 71.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	vga-encoder {
+		compatible = "dumb-vga-dac";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_bl_on>;
+		/* Colibri SODIMM 71 - BL_ON */
+		enable-gpios = <&gpio3 26 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				vga_enc_in: endpoint {
+					remote-endpoint = <&lcd_display_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				vga_enc_out: endpoint {
+					remote-endpoint = <&dvi_connector_in>;
+				};
+			};
+		};
+	};
+
+	dvi-connector {
+		compatible = "dvi-connector";
+		analog;
+
+		port {
+			dvi_connector_in: endpoint {
+				remote-endpoint = <&vga_enc_out>;
+			};
+		};
+	};
+};
+
+&lcd_display {
+	status = "okay";
+};
+
+&lcd_display_out {
+	remote-endpoint = <&vga_enc_in>;
+};

-- 
2.55.0

