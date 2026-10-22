Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792648337;
	b=H2CAmjoAHP3VRUARoRZ4rvRqF0USyozxupB6vbfAwOIiPuYeUj4rhTQzvrlfiLIURICX
	 6/UssfdUkzuSPVnaRJuKt7Uw1IsCUnb4s4hZQPN+Jq8uB1f2Ox5ZSZfTFizzVH67DOm9j
	 oK4pM8YIV935nMi1/L/f+LTbEYI5bLcUtcmpXNIcABa+8zejCvneVirU7Iim2q6FdI61m
	 c+My2af8qEMYDt/WBKxUFZjyvSEmJa1eronpVZJnIdUucLeP29hN72gxxRNE2Z3eZL+TI
	 MjVaA8hj7FztwnoEMCYkEWaJ/XnZbFE+jJN2e+YNJs1SXF0zaoXjhK54rda53H04dTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792648337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=K2tWmEOG35vkyGU1OZ0Xjhu69P/i4beeqfklVuj2BQQ=;
	b=Tqb55KDGjm3YRgjS767E7UUxHnsVg/f2ZSRHu9mWfJij7D5iBhfNuspcGFuPAbk/mvxO
	 ruQtVJElAV1jx+SLj5Cf27w17JomhZ5f/jmdzcLAnFBmI0gFo4YJjPiYi/J2hbj9e07ub
	 nSNsUdFuOCvU43k9bcuVx6ubcV6DjjLgicSQmimFfAJAMlymfyVsPKmbfV2gnpjkhpt+c
	 KQWgGK5krckgFiTlieSVaHoRH5edcVS0AZlKrJTFnO+oxFGn+MN/RwTuZ/md43wEv68VO
	 3pdT/bwFC3T+yNo9n5Hk5ih/h2K+ZjJzOqXbxLAqi3idWjVZ+Nt8Hg0EmnThs6KkdlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lQRJrQ8o;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 488D4606A32D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 05:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 488D4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lQRJrQ8o
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso2769005e9.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 22:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792648336; x=1793253136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2tWmEOG35vkyGU1OZ0Xjhu69P/i4beeqfklVuj2BQQ=;
        b=lQRJrQ8oSQIwG/TXADRZHwRmstT2q0TjO16z5OTT96fmiSQTd6o12ffxSGR9Qm068g
         pzhv7cqhlV9Tm6x6a+mTnPC9xRfu5h4TzAjEzHY8703+lU+B+7qeggJFI1clDAyeY0Ol
         ANVMXtQYhkuh2vlxoDnD7BQ1ZQzv4vG4iXoZ3wWz2mcEUob133f+4o5Y4kIl+v0ky83m
         eq++273wj+UbHBLwRnP4bh/ClwzKslu5w4QY5DF5ZNER68EBHe/mgcYTjGoMCC9rC/tX
         A+nWzqak3oSm77fUD4DsbcSu9m3zTtzMpRUvntZ5hcgMrXCe6TkubULCoXce8uf1SzuM
         cxgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792648336; x=1793253136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K2tWmEOG35vkyGU1OZ0Xjhu69P/i4beeqfklVuj2BQQ=;
        b=L9LW4NqF8kOQ9wuLkpR7KRcGZoacKuEkKsMtJeGQib+8+98Qlg7JgRipq9kp3k9vT9
         6wNNqPPlVebc/JOeC+i41l0sS4UwgX77T8uotzop+Uc0xd5tVHJGnUGqpV+qvqAzZkS8
         0TjbzPd+Os/BOGiprnV9PXUCt3fGmfCboZUHREgQEl8UaUA5MS7zvs81K7rlVY9J9wAa
         nnCHEs61FZr2yRad4G21fs1K8qsPww/ZmPpvh3xnQWLJqKiIXCKe0qTfO0zwFu3ZAeoo
         EEEsvR+KTTVL/Po4QlqY2Q1tgT8czDIcGXek9FONKq+UohoMZMf0ksYOKDqZ+9AFX7aw
         YmfA==
X-Forwarded-Encrypted: i=1; AKwUvByOggSB14ShdJ9MirDtA0hLPg/JuWJpJFRPrrtPfPz1CE+CAe5963NoVZFrx7IN9rXZVRiFmnbtNAXT@vger.kernel.org
X-Gm-Message-State: AFq9FYIM3kzoFshAGsFgICuHrC+FOedJJJIXEi+audaHncTbXZ9XkASS
	IYyHSmtG5YvQDzYmGXyEuxBL70HoQslfotf3XPXzgliSXzX/MBrmkDPd
X-Gm-Gg: AYBFou0zeSh1rEBlsXjenyrmuQqw4FV9hbnueUFLt/bqmaw9xhjfx9yrPWRFfG8nqwR
	zLLfTa/V66F7CG4/Lrjg5blRqUa6yL4wqHpM4fYysKS0r2/KhKuv5m1S7MsPl/g1pD6WFp1SgYK
	4nungBAHIX6pKOaQk1pLzTp4BHtRU8W03lgzEf33OjNbGTULU+vpELTlQHUi3gxRrUjpV7Jpx5O
	KIzcPO+digPstu718G5jyjX5+k+WCBh9sW2qJLmsuSLxUQFJkYA7gNrS1SfYReUWO9jbnZ9gaSD
	iBYW8GhDQ7sizZEaGdJqTi2vrqiM6DMWUZgb0zrZaP5/tBtIi4/UoX/9ivV/Veh4u610pgdi7bC
	f/3DFnTZJ5wkVQLuHGRedDkFY8IpqqyY+mzXDEV04rzPbYmZvAGp3LHWCVMJtVLoJ7Zs/rZb5Uz
	CRkUPvE0jdJj4wa8mcALJkDQ0dGfTwgA1au705GD8gThSvPrr3ts8wufjsQ6qpuHEU3oJlrcpDj
	gown0etvhkuQK+OdXw0cuJbO05gvPfchuCvvK5hkcfSH/3mZRFv2tyI6dERHyEx4dSpPDHGtSs2
	lfs9wucQlbmc9XcGsjp3/GlQMqx3fSVJA10D5amLtbJMSt3MvfMl4hZt2Msr7UI8awiJQwYSpsB
	+DJEXbKi3nXjiniwpIWswadRfhnqiTFP20c+lU4tmO8oJ0P4f94cGYz/FoX80hWChDomuWN+bz1
	gVGxET
X-Received: by 2002:a05:600c:a49:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4a204b20321mr25966005e9.11.1792648335601;
        Wed, 21 Oct 2026 22:52:15 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-a0a3-b57b-feb7-50dc.ipv6.o2.cz. [2a00:1028:8388:a84e:a0a3:b57b:feb7:50dc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2038ddb20sm41312875e9.0.2026.10.21.22.52.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:52:14 -0700 (PDT)
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
Subject: [PATCH v2 2/2] ARM: dts: samsung: Add Hardkernel ODROID-U2
Date: Thu, 22 Oct 2026 07:52:08 +0200
Message-ID: <20261022055208.17746-3-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261022055208.17746-1-pepe.schlehofer@gmail.com>
References: <20261022055208.17746-1-pepe.schlehofer@gmail.com>
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
Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 arch/arm/boot/dts/samsung/Makefile            |  1 +
 .../dts/samsung/exynos4412-odroid-common.dtsi |  6 +--
 .../boot/dts/samsung/exynos4412-odroidu2.dts  | 42 +++++++++++++++++++
 3 files changed, 46 insertions(+), 3 deletions(-)
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
index 000000000000..bc14df9be9f7
--- /dev/null
+++ b/arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts
@@ -0,0 +1,42 @@
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
+	samsung,audio-widgets =
+		"Headphone", "Headphone Jack",
+		"Microphone", "DMIC";
+};
+
+/* No expansion header with SPI */
+&spi_1 {
+	status = "disabled";
+};
-- 
2.54.0 (Apple Git-157)

