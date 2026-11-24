Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518831;
	b=pFlloILZ3fUnZYMBpjUo4sDM+1srXGBivZ1HZO0OFGj9h+1Ze4aPdwLtA/BSMrHI6pbQ
	 pXQgM//etR/jayHW8g6i3dtKwXP+AWuyzo/clDUVleUbNWdw//dEFiar13VZiHacTFkd2
	 mYNU/AdcsVPcTXiXCk5dvsh9M0ztGIkn845Fh/Lealrm9UaA10K4/jGSp082Li2dvdI1D
	 MeDyUUhXQMpqMF3ghuZu3JzsDYgsofZQQ03uKwcDrNiCn9ZFy3e4fwX+wn0YBF3epWZ5R
	 kd+y2UcTll2IqFCblMgm2doEEP0BS4Yjn8u4MXDwA4YOXueDVgUyM08Ehp8mawZMdeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yG2dCjBS4ggkEY33xu61CfV0q36FoceeadD9K8iGVnE=;
	b=0VWgj8bIiSQEMVn2rGM/HF8JxMgZidwwWJ0Lufqv7GbZYnnNIk1XHZhqUTsnHUPQF43J
	 G3jK/+/OnsKh9Stq4VBJYpESOZY/Sr9o96sEDHcLnoAR6c4EbjbVkrlCkwfLMxn3aiUsR
	 VEvUqIp7YdTT8MnDhgFPvtV5UIKJVEyE6ER2plp8UCyLzK5vZeSzntYz0ygmyXIXz7VH3
	 bSDFX5wWpAjuTjQUPzcGoWVweIWSb/gcRlDExrmGBZu5nawR0L6Ykw7N7emEKcfzXn5B0
	 uq/zbw9wYyFN+4co7JHSPuAbRuzCA32kKwGh5EmzCLOI3+zIjFi9q8+bVGcW+a4ShFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fDrFrceU;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4607606A321
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 11:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4607606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fDrFrceU
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so33707025e9.2
        for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 03:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795518829; x=1796123629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yG2dCjBS4ggkEY33xu61CfV0q36FoceeadD9K8iGVnE=;
        b=fDrFrceUJv2oPRnXubjKtGLG+//ACaWZciX3qP56yxOm3nopWl0wgIQ++FBrvZ/FND
         t+mik1xF3OpSkYh5yrMsgHkPM7lLYYsgI6Qrpav/Ug+9pOCG05LMQHU85uTVn7qCEHnG
         BjOQ4zkPU9OGRN0OUd3Hf3S/Krklu3OETxGINuy8OWRI1EjY3U6ZsfX+5S7eBLXJv6R3
         X/JysY53uRRTFA/W5K15P04P9gMKFC9xRqEQ2Lfp9lhcKcbSNS908nraf4M06jknAlCD
         kDW5IKkTMnc12m2kwY4RcyDqpCS6GL5mmhOqPkkXfK3gSpX6VoLuofCXNce6sOSlKVzD
         fucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795518829; x=1796123629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yG2dCjBS4ggkEY33xu61CfV0q36FoceeadD9K8iGVnE=;
        b=S/olbsKmVRiQOGhRYBgWS1TI4Xna3xZdDRD6g6QcZiS8xRmdFtlCsLIKDx8S54Gt+G
         ApaHQrnJBRzjexvXMZiMtzsd/tFHYv7t3ASpWQllrz699uq2PFv0TZ49UEUdWNhORfb+
         40jitVTaWTV3ZwEox2A70Rqc+iSIIOaiQrpHIcMoi5Sv7wKkx2e+e2p2PgjcH1m3+xKk
         rnUuRP5RzOBP8JERSqn0AdtC7dHjKOWNi7Zj9qDJLUWcdT6S59w+sdVH+VVZKL9ykgmR
         3peaSXiCS30TCkqxSaR2tikN1vcm//jeVAYFoSjrpI6nQAwI7qMEiqLTPj+GQY71Abo8
         kWdA==
X-Forwarded-Encrypted: i=1; AL+hErEDkhb8JLMMeg7epkHrDyxBKCki0f+MMLOTPVW+PeoLQgdXnJ3deSxnKpkgwxXGWzB8QDckimlQrCJT@vger.kernel.org
X-Gm-Message-State: APuU4Z9A8aiHMcsXrMLx36DFus1l7U+/6sgNIHI19SAd2rlV8OrMXv5d
	AQBqBeyV3fxFOnAU1W72o6nI007QETFMYcrmjvQLzPUcwN7pTH3+zG6J
X-Gm-Gg: AZFdTZfPc5S3tYFWOEjCwboJ281GML9L+89gx/fkDdkcLTozq5+VNl+BkmWiag7gCuO
	/c0XPgLaJm1uTaC9okFKilSlUEsSvZUxYY0hKUPEaDb2iPWROGr4Fyl6jVYOT/EM6KFMctN4diL
	VRIhoqbYIqkH+PwzdAfQ5p7BWZgrDIgFpeldBrnMEOKJ3x6Dvm+u+h557RNX4zrUDDvQNELhV9t
	gPPp52b1ZkB2GlLL09y7rZeqgw5FlZECF7/sQPUe6LaZIA5sO53YcMXTZJxekLWG56V45xVBq20
	UyJlzEXMVy0psuI/jYZtY2WQFpSJlOh0xuz4L2F5CvfU1oz9ceAEPtLSW1yLYqvt8+sDRs2Y5Z4
	JB0Rt/37eL+x4lb+RCqwlAjb184Od+nKXaJgPthfcWoTOf6toN2VBfu4f5la87+WZNSzqo7ZGr3
	MHOAlIYEqPKe6AA0UpGfGl7TA4NgM38T4DiBt7XoblRQWJyFKWj3B3nRYBUxG7kc2A/rrhoaYTk
	T4HqGCvuWVsE73BuBQl5pLkAXdxyAP2YE9kHHgcwanALz9h22o7JsM9BAAI9TVJx0TFN2jWN0hC
	LGurfeQ8tYbblgy39rVkPLh2qW7nUsnfMX1J6330/06HZBM=
X-Received: by 2002:a05:600c:1d8c:b0:4bb:5345:606b with SMTP id 5b1f17b1804b1-4bb8882358dmr285246895e9.31.1795518828812;
        Tue, 24 Nov 2026 03:13:48 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm27642918f8f.5.2026.11.24.03.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:13:48 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jose Nieto <jnieto.alaber@gmail.com>
Subject: [PATCH v2] arm64: dts: amlogic: khadas-vim3: add SPI NOR flash overlay
Date: Tue, 24 Nov 2026 12:13:33 +0100
Message-ID: <20261124111333.33734-1-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261103164730.160593-1-jnieto.alaber@gmail.com>
References: <20261103164730.160593-1-jnieto.alaber@gmail.com>
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

The Khadas VIM3 has a 16 MiB SPI NOR flash (W25Q128) whose data lines are
shared with the eMMC D4-D7 lines. Add an overlay that restricts the eMMC to
4-bit mode and enables the SPI NOR controller, exposing the flash as an MTD
device.

The flash HOLD#/WP# lines are wired to the eMMC D3/D7 nets, so the
nor_hold_wp_pins pinctrl group is intentionally not used.

Signed-off-by: Jose Nieto <jnieto.alaber@gmail.com>
---
Changes in v2:
- Keep the original BayLibre copyright and mention the U-Boot
  meson-khadas-vim3-u-boot.dtsi origin (Neil Armstrong).

 arch/arm64/boot/dts/amlogic/Makefile          |  2 ++
 .../dts/amlogic/meson-khadas-vim3-spifc.dtso  | 28 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 57bc440fa55c..3714cbaaa03e 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -23,6 +23,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12a-u200.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12a-x96-max.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-bananapi-m2s.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-spifc.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-a311d-khadas-vim3-ts050.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-cm4io.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-g12b-bananapi-cm4-mnt-reform2.dtb
@@ -104,5 +105,6 @@ dtb-$(CONFIG_ARCH_MESON) += meson-sm1-x96-air.dtb
 # Overlays
 meson-g12a-fbx8am-brcm-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-brcm.dtbo
 meson-g12a-fbx8am-realtek-dtbs	:= meson-g12a-fbx8am.dtb meson-g12a-fbx8am-realtek.dtbo
+meson-g12b-a311d-khadas-vim3-spifc-dtbs := meson-g12b-a311d-khadas-vim3.dtb meson-khadas-vim3-spifc.dtbo
 meson-g12b-a311d-khadas-vim3-ts050-dtbs := meson-g12b-a311d-khadas-vim3.dtb meson-khadas-vim3-ts050.dtbo
 meson-sm1-khadas-vim3l-ts050-dtbs	:= meson-sm1-khadas-vim3l.dtb meson-khadas-vim3-ts050.dtbo
diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
new file mode 100644
index 000000000000..9f57d9433ee8
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3-spifc.dtso
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2020 BayLibre, SAS
+ * Author: Neil Armstrong <narmstrong@baylibre.com>
+ * Copyright (c) 2026 Jose Nieto <jnieto.alaber@gmail.com>
+ *
+ * The Khadas VIM3 on-board SPI NOR flash shares its data lines with the
+ * eMMC data lines 4-7. Restrict the eMMC to 4-bit mode to free D4-D7 and
+ * enable the SPI NOR controller, exposing the flash as an MTD device.
+ *
+ * Derived from the U-Boot arch/arm/dts/meson-khadas-vim3-u-boot.dtsi file.
+ *
+ * The flash HOLD#/WP# lines are wired to the eMMC D3/D7 nets, so the
+ * nor_hold_wp_pins pinctrl group is intentionally not used.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&sd_emmc_c {
+	pinctrl-0 = <&emmc_ctrl_pins>, <&emmc_data_4b_pins>, <&emmc_ds_pins>;
+	bus-width = <4>;
+};
+
+&spifc {
+	status = "okay";
+};
+
-- 
2.47.3

