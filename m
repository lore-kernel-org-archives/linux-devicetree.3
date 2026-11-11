Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423885;
	b=Eqfh2BJ1PSRDmj/TDfJInTSq/dIlJd2YlyDhOjrzbHkbdHRMPF7mbHGZ7zfHZd7c0sx4
	 2jNrxGrOsYYnZvSx24HczlqA8oaPW/cmHs9HU9hYuYai2M5Q+NZemxD5IrIUxcCjkOCft
	 /IP5gnAqR90E5uKaRd0LkCoKCtqreaxEubiOehF5lQhPnfs7kSqPqPar2jFt2aBX9bPrd
	 RBrtm3gRI5toxOVidOzTGo0YoMzKsgRojrImzsehSq0qVWS5yPD5iZnLmYQ4GWPLBkLJ/
	 IL6EUuX48LM1czO2ya9XVjZH3B8/EgjzMCMISuNpx8Pufgx8EAo1IEWw+EyZ3anBh9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423885;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=KDtNFM/ZDCjrMncXpMX0NZxcAvy/V+uo/92tpKVrQoo=;
	b=N3bXJnMkiOpsrWPgbcxo0x2EdM9vwz/v3z3vw3j2NsyT+eNu+1iUaf6FUlZWwLqQ6qgZ
	 r1uNgVVsYfDUvNfP5xvH8/zhSzTlEyqf/SZ2WJ1hBe7Jv3JYxN1sMzSk4AeptSXPm0chY
	 5Kk5Y6Gp0PeK0GCQR0u2XCGcepJKxZJymiZWt3Ed7eB7u1ez9hxkoxoOrSSAjkOpNIgG+
	 Dzj92ZBaoFdZ4olosuiwH5RAMG1nsDoL7V7ZPsBiZyOjsN0bzOc/I01wojqEFLiz0qUwW
	 lD4t02QWDJ2mqjE0Sp6NIlbIowLw6bbdUBTES0d4hxCXcMM12p38TAHyD4exyZL8P8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=snBq0GT4;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE3E606A33C
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 19:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1FE3E606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=snBq0GT4
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so2062291a91.0
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423883; x=1795028683; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KDtNFM/ZDCjrMncXpMX0NZxcAvy/V+uo/92tpKVrQoo=;
        b=snBq0GT4dtgQU9WrqAJdvaSUAC7nV68631xfBn+G00w96vY0n6+31rz0h1ZHpRYohu
         ZDBtHbvUNXLX5RMqQVQJfRwld7Rg4x05DIzXpnYrG3+oby8yfVVDbzZqasFJmDXOJkaA
         NV8sW5Dg1sgm4Br5UJCybE/CgajfCVPLn+bBgJS6tjmwbW0kUT4YcKhEZoyQdaz2fX9v
         Ogfg8h952FzuTl9/EThJ5luBoVsURr0Wvkewlys1bdJ6BONeop6PfE2E+eSnZwUvaiAz
         UGSjWqKcrg0f92y2tRt2lxlLCGp7ScVrK/c0W6sOvuFyjmSLu1f8SupQ0S26XcESGNL3
         nTYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423883; x=1795028683;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KDtNFM/ZDCjrMncXpMX0NZxcAvy/V+uo/92tpKVrQoo=;
        b=M1l/ZUQM0yXpCf6HmvSAH8VFx1CiaK57ArYblFlcQCvwfAjYulkeEzxbu6DnPxIHH5
         Jy9w45tcqWQfoTHLQ+5e7uif51vi8fpNZPEwW6jzLNcBBRyz9w6r2KmriA/ausvTUPUi
         OC5Z+acOlarYxCasDBaW83YGB4ClUtSp6F757BEs5b9VE5Qe8OdXFZSi4J1mwPNoR/pw
         ZhCmMXd4atueDP4FnxLCsf2dX3m4wRNlj5y0Ro1Dd1NRf6/N4/zhU00UkodII2Umtomw
         1iSTFfiHwwe4VUB8YNIDnyYJVU89N5uHt0wnbLA9yVSt9C6xnzxj+GCM3GbSqhMLIc/C
         NaRw==
X-Gm-Message-State: APuU4Z/Fa452+dPjJTszbuvQm0snuNlYa7HkterEbmWEtQJQUyr9lpIm
	7UkIniBSCdZNIWjo9h7UWKabgKEoA2TjZbU2OfCwJHXipaKE/7PFLGHv
X-Gm-Gg: AYBFou0R7u4jKR7reit3/IEjh8oXAqstf5V63RBirwyNdX0QkY4kuBiZftg7ly2waz/
	1uMi/4Gopg1Mg5zlGQMrAe1XTR18GLu4pb4bLdDG355qliSMI5R585B8r5Czv5W0m60ndldqdf5
	9CNhaNmKYhxfiDkdLpO/5E/ubEBh/+9rA+xc3lM8eFdxzeeW34fcebjgnu6GTtPPytNIdhG37Ix
	DodWhSIz9n2fjqLYIEUaw0/+coxUhuACsPrNvWnzYDi3QeG8xeJ3CbVs/BI/DDX+ddXRBcdBSin
	DZFyLxXATaFddsdrijj4d2peZsP5S+BC5LuGVe74PJ1plKW/iFNM7gMY1/Jgve5qsehJsBG6P7g
	3KSuL9YYxvE+nhW3qVxApGwKRsrJ3zM5yFcBtdCedQLCMwnqgdze3IS+2bXlyTgGIQjyU3aFujR
	Vg0myBGzwH21aqGzoJY5Q25ds6nzSJ4TAYFXUSV5merNXMXOe6cl9iPz6ri16TT0eTkY+uU/EvA
	gyw6SjtHp5sn21yKVGlYii+ZH6Qz5Bno1Uga7UlZn0dKyRW+yON4KSZOx0HCbVF+b5GRjzpWU7W
	j1GOltp/CJR4KQXX1WLJdjn5aUMka4FPjqf1Ij9ZAFImqE6Qjipffpo=
X-Received: by 2002:a17:90b:3b48:b0:3b0:9e42:b67c with SMTP id 98e67ed59e1d1-3b182f63031mr3037004a91.61.1794423882994;
        Wed, 11 Nov 2026 11:04:42 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:42 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Wed, 11 Nov 2026 16:04:00 -0300
Subject: [PATCH v2 4/7] ARM: dts: imx6q-apalis: Add Toradex Capacitive
 Touch Display 7" Parallel
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-4-8129b21634c7@toradex.com>
References: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
In-Reply-To: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-bsp@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=3576;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=ZRG6uTVDCNpvd0EHx/INXE11uzseEG+H6P3n5N9dPRk=;
 b=gMm6Huj51U6J6pMlyymBdzIF5kciVOacCr9+30TMDp5J4q5dzRWiQvxRTBPUIsqOtODnGwOtg
 S4o3V/Mx2M4B0pBSn2y4caf+1wAwhzWVtRS/9A9nn3U12oI3nk3WFJH
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Capacitive Touch Display 7" Parallel
on the Apalis iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHC 7" WVGA TFT Transmissive LCD
and the touch input is provided by an Atmel MaxTouch capacitive touch
controller.

The touch controller is connected to the Toradex 10-way Capacitive Touch
Interface connector available on Ixora carrier board and Apalis
Evaluation Board.

The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
Board V1.2 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 |  6 ++++
 ...-apalis-tdx-panel-cap-touch-7inch-parallel.dtso | 34 ++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 3b69669b27129..d7f9b2b5bb493 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -168,6 +168,10 @@ imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-10inch-lvds-v1-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtbo
 
+imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-7inch-parallel-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -325,6 +329,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora-v1.2.dtb \
 	imx6q-apalis-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtbo \
+	imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtbo \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
@@ -336,6 +341,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-10inch-lvds-v1.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-7inch-parallel.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtso
new file mode 100644
index 0000000000000..f04516e3c5cfa
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtso
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Capacitive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display and 10-way Capacitive Touch Interface connectors
+ * (as featured on Ixora carrier board and Apalis Evaluation Board).
+ *
+ * https://docs.toradex.com/104497-7-inch-parallel-capacitive-touch-display-800x480-datasheet.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/capacitive-touch-display-7inch-parallel/
+ * https://www.toradex.com/accessories/capacitive-touch-display-7-inch-parallel
+ */
+
+/dts-v1/;
+/plugin/;
+
+&atmel_mxt_ts {
+	status = "okay";
+};
+
+&backlight {
+	status = "okay";
+};
+
+&lcd_display {
+	status = "okay";
+};
+
+&panel_dpi {
+	compatible = "logictechno,lt161010-2nhc";
+	power-supply = <&reg_3v3_sw>;
+
+	status = "okay";
+};

-- 
2.43.0

