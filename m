Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047325;
	b=25xkshfn/d3kO91WH0QTiJ06yvo6mAvohjDvZJDPNQEebgcuoD72uP1VYAEC+7H4urq8
	 l3s4lA9DWDvzXeHiAU4oHzj3jRvU8d55DAxbw2/jAu/EYfcJtIhWRxzFYbeTUsOAxhoK9
	 tUG2DatRaIhBgw6nCArqgYt+A72pkgEaXIUUTk2AuGrrgky/8DGSckq8XVXxWckylO5fR
	 Scvs68kYYyTY9TjmKbwA0Em5wkOljwkZieNXFH56UQHWBJRL/3lBREGEHUaE7uTsKhjPa
	 R2vPnwgG8vK+Ph6wqlFdLfk1teq0q2+XXzRzEoOETZ9aN2CCaA54w0d6JCK8tq7O0aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047325;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=uNPrYlA+DnonfWUvT/WXv31GUY54FKsXFffmLPGjc3U=;
	b=XoEl8A06vcjnDbWTkuPsw284VcYo2Z79y427GnW5nphXhCj5k5E0V/DX0p1bF6MGFK24
	 tJ1GUGV4TBkIj4aKcWPfC/gXbS7jnZDeoBpqyZITvILI3LrISZp4XdoGHdxqc0ds5CV3k
	 xyJCzcrpQaKP2puKEYo49y+741/Q1mrp6RSQpQtWduTaSpcLvAvObuCcUJkTyHHXpELSL
	 KxkcFO+8BbktZ0sBZm1+bSk8fS+Sl96i17NQXDAvbwvyKAxmksw0DexN3jER6Bu5R9qX3
	 2eorxvigtyc/SKiCP9AReXwOTEXBn9r+9ywbctLo71A2BdbkwGC0RDq3ZiD2j69Ravw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D2u1l+51;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A50606A321
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 20:41:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8A50606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D2u1l+51
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso3122545f8f.2
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 13:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047318; x=1793652118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNPrYlA+DnonfWUvT/WXv31GUY54FKsXFffmLPGjc3U=;
        b=D2u1l+51ww8RaMZptAI7B2SQPsbabz0R1hDbaoLcihdpMnClUig+O2jy2SiOn6eCJy
         JP0e/6Y8IEo/e6RUNAR5tjAWURStvxGEa4z/0tw6qzs1npH1Oac7ytoJwqXL64BQOHZ5
         eXjxwfgAztA1AqLXQypQ96peyGJb+MBQhTCDHmUZfWXT5IcMmtlIlx1vmH2qfFdHEfgJ
         uj59hHB7bYa9KpH08mXvwZi7Y6sCqk0LWrOry9IUWjW4edsqo/avSYZ0pMS06WjSmUbp
         1lXiuqrDhTiatpBYX9dANzQ4xNyajc8C2+bgRsJE/6IKDJi3DdtJLqWeonuvPpgw8Gzl
         u5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047318; x=1793652118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uNPrYlA+DnonfWUvT/WXv31GUY54FKsXFffmLPGjc3U=;
        b=RILJPpjCmTu03YS2so5viow/hAzBFhSYxYXPC6oBk4vT65z5NoPtMHEMnhOrNjB6Om
         3Y89skUarsk/T91Fd/1APd56qowXLsGImPnr92adjSMHX2y74ifQ12AMt0ktqrPwhpsf
         mWdfrIjn3zT6fbkie7yIaROUZ6P/pbXebU3igXzokn3uGfBNQ1B7pwwEqn6x7qY76LEY
         KWwgIiZ1UzmxnOAnp4ik56IPbMO7PejV4Od6O4NkabSrX7HbPzkjMynj4W23nOO72fGN
         if2AfmtTEc+vGygbs7RIcXbxk1P+ZVR/M/cT16I44Ks30lIbswZJoFQ+YxNeQwcS6iHB
         YI8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzIXMO9hsHAWsrtoBNZaShTWziNHkEzro6BhGvXkBiTVGZC38+cjqa/peqbCRZyqoC6Dqot9IMoDj3F@vger.kernel.org
X-Gm-Message-State: AFq9FYLwp7bi887sDzq0avcfJuRN0RM3WNJoOXiBShRYaw8OpEnFg9Uh
	jhnlN6SUzoziAP40oXKJiLrt0/s5zgKMG1d6pebBoz3P0SwqYHXGWNMo
X-Gm-Gg: AYBFou23VdFfPU4JItKuza15JzUvTaHv7bzrH6PspCmZg6toawO3Kn7rgYXr2YBImfi
	C5fnU7va4EBB4fhLKyUMIQeAy8D2146RqnlgWGzSDmZhV/lMiVnvGGWkV6svrU7WUSttMSM0q8h
	Qb8kNmuz1KAgbk2inHeiFIJSx2k/xUL/ZWbmxGyYk6b+i7agdJ349quR6r9oq14abCgDxhLqMcW
	iIdN5cUVt2ih5jDs98OaSFB999bliqC4ZuZE0ISk0f04sM7d8orLgKifI8tdD8Da1QRvleF6Bhr
	xWrw4sjbjLpwKuJx8OUYvOnzob5JO0vvoziFquAjjY668pQVdMzb9D2q1q9cW6+1aUV6G6UJV6y
	rJyfdYnmQyz8yc1ZzksoeTomr6aQqbmcFLL/3hxQnvQS9m+v+baBnp6ADtEDaokvfvSAdHkEU1u
	3eOncxQHmXiJIKnLTfBWB+skKG/ZNmwhpijjvS45IqADEMdrXK5P59Hd3ljnZStZQnrLfaiCIKw
	on2dP8n1XtDWUCUqjiV5Uz7OJ4PQ5I8R676X2k3ATdeNwlXxnkbLabRjkM4gjZ8TUYEDCr6C0x7
	o+7FP9EB6f9HWe0ihh4+r5vAuqk0WOk5tRyoS1BoefN1HN7Vmbg45iaZJM3yBu68cmWKkxqMLv0
	8dabkz/UZt5fh6kjFv5baUeahNvtuJ7XnX3iIDleG3RV77bTm1iHbbGOELAnjiKdbe2ffRXYzIB
	Iolr+f
X-Received: by 2002:adf:f284:0:b0:48e:2980:d396 with SMTP id ffacd0b85a97d-48e3eb8d6a5mr12409485f8f.37.1793047318143;
        Mon, 26 Oct 2026 13:41:58 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-8ce1-bbf6-5949-b0f3.ipv6.o2.cz. [2a00:1028:8388:a84e:8ce1:bbf6:5949:b0f3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm19053152f8f.10.2026.10.26.13.41.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 13:41:57 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Henrik Grimler <henrik@grimler.se>
Subject: [PATCH v3 2/2] ARM: dts: samsung: Add Hardkernel ODROID-U2
Date: Mon, 26 Oct 2026 21:41:54 +0100
Message-ID: <20261026204154.26378-3-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261026204154.26378-1-pepe.schlehofer@gmail.com>
References: <20261026204154.26378-1-pepe.schlehofer@gmail.com>
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

ODROID-U2 is a single board computer from Hardkernel based on the
Samsung Exynos4412 Prime SoC with 2 GB of LPDDR2 RAM. It is the
predecessor of the ODROID-U3 and shares most of its design:
- microSD card slot and eMMC module socket
- SMSC LAN9730 10/100 Ethernet on HSIC0
- SMSC USB3503A hub on HSIC1 with two USB 2.0 host ports
- micro-HDMI port with CEC
- MAX98090 audio codec with a 3.5 mm headphone jack and an on-board
  digital microphone
- MAX77686 PMIC
- 2-pin header for an optional PWM controlled cooling fan
- blue heartbeat LED

Unlike the ODROID-U3, the micro-USB port has no VBUS supply switch, so
it can only work in peripheral mode, and there is no expansion header
with SPI. The 3.5 mm jack is headphone only and the speaker outputs of
the codec are not connected.

Add a device tree for the board that includes the ODROID-U3 one and
describes only these differences, as the ODROID-X2 does with the
ODROID-X, and update the comments in the common dtsi, as the LDO22 and
BUCK8 constraints are now also used by the ODROID-U2.

Also route "HiFi Capture" to "Mixer DAI RX", as on the ODROID-XU3. The
odroid sound card driver adds only the playback routes for boards with
a single CPU DAI, so without it the DPCM capture path to the I2S
back-end is incomplete and recording from the digital microphone fails
with "no backend DAIs enabled for Primary".

Link: https://www.hardkernel.com/shop/odroid-u2/
Link: https://www.hardkernel.com/blog-2/odroid-u2-u-schematics/
Reviewed-by: Henrik Grimler <henrik@grimler.se>
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 arch/arm/boot/dts/samsung/Makefile            |  1 +
 .../dts/samsung/exynos4412-odroid-common.dtsi |  6 +--
 .../boot/dts/samsung/exynos4412-odroidu2.dts  | 41 +++++++++++++++++++
 3 files changed, 45 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts

diff --git a/arch/arm/boot/dts/samsung/Makefile b/arch/arm/boot/dts/samsung/Makefile
index e0143ee8c82d..2a173e4b3e1a 100644
--- a/arch/arm/boot/dts/samsung/Makefile
+++ b/arch/arm/boot/dts/samsung/Makefile
@@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_EXYNOS4) += \
 	exynos4412-i9305.dtb \
 	exynos4412-itop-elite.dtb \
 	exynos4412-n710x.dtb \
+	exynos4412-odroidu2.dtb \
 	exynos4412-odroidu3.dtb \
 	exynos4412-odroidx.dtb \
 	exynos4412-odroidx2.dtb \
diff --git a/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
index 93ddbd4b0a18..b56b92c78c1d 100644
--- a/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos4412-odroid-common.dtsi
@@ -414,8 +414,8 @@ ldo21_reg: LDO21 {
 
 			ldo22_reg: LDO22 {
 				/*
-				 * Only U3 uses it, so let it define the
-				 * constraints
+				 * Only U2 and U3 use it, so let them define
+				 * the constraints
 				 */
 				regulator-name = "LDO22";
 				regulator-boot-on;
@@ -486,7 +486,7 @@ buck7_reg: BUCK7 {
 			buck8_reg: BUCK8 {
 				/*
 				 * Constraints set by specific board: X,
-				 * X2 and U3.
+				 * X2, U2 and U3.
 				 */
 				regulator-name = "BUCK8_2.8V";
 			};
diff --git a/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts b/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts
new file mode 100644
index 000000000000..8a18e65de30c
--- /dev/null
+++ b/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Hardkernel's Exynos4412 based ODROID-U2 board device tree source
+ *
+ * Copyright (c) 2026 Josef Schlehofer <pepe.schlehofer@gmail.com>
+ *
+ * Device tree source file for Hardkernel's ODROID-U2 board which is based
+ * on Samsung's Exynos4412 SoC. The board is the predecessor of the
+ * ODROID-U3, so only the differences from it are described here.
+ */
+
+#include "exynos4412-odroidu3.dts"
+
+/ {
+	model = "Hardkernel ODROID-U2 board based on Exynos4412";
+	compatible = "hardkernel,odroid-u2", "samsung,exynos4412", "samsung,exynos4";
+};
+
+/* No VBUS supply switch on the micro-USB port */
+/delete-node/ &vbus_otg_reg;
+
+&hsotg {
+	dr_mode = "peripheral";
+	/delete-property/ vbus-supply;
+};
+
+&sound {
+	model = "Odroid-U2";
+	audio-routing = "Headphone Jack", "HPL",
+			"Headphone Jack", "HPR",
+			"DMICL", "DMIC",
+			"DMICR", "DMIC",
+			"Mixer DAI RX", "HiFi Capture";
+	samsung,audio-widgets = "Headphone", "Headphone Jack",
+				"Microphone", "DMIC";
+};
+
+/* No expansion header with SPI */
+&spi_1 {
+	status = "disabled";
+};
-- 
2.54.0 (Apple Git-157)

