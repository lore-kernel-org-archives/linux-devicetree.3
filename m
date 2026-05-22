Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AB83B2D0F
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456056; cv=none; b=n9x6CDUiHX4KXiY9G2juJdCYcfkTOf6byfhtGdO5uvdx96r2JwSa0H6ZB93DSKymVl8nODZqhgH5aOX4xrrpJZ9UegdDhAd1k6NOIbN8jy2MT4LtVnvwJ8zQ1sfC1NC2FdB/sLCFSBuqWyTQjjhQyhC52xS31uiE4vt+PMJM4z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456056; c=relaxed/simple;
	bh=u6aHnMtp0LzC2YoXnChYv0KmQORYYnbeS/YVk0QSdvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EhHR2v3luLAbUjIVTr+eQJjTV6lUuJkdHPG3xGg3BuEezRwxHPhWnOyLc5UE/a5X1WFg26z+xk2x6HikM3g/m3Gkod/ZNISgeXVQH33UdtXiatg/1TcWJ7qCChpy751cpiYkZF1WLSLpVeNsR8YXJ02KM31JOfmdGVFMwDOLoXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aAJcYdU4; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aAJcYdU4"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48fde648a71so50947265e9.0
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 06:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779456053; x=1780060853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CF3gRsfbMMzbZIz4+Gb+p1TqqTyY+cXpLaVD2dZQxls=;
        b=aAJcYdU4CDpHFsg8gZbnYR+CHm2/MLA2AeDQr9SqjJ/LmOv5Mq924i+41fOD+f52Gw
         IlRBPTdtjsZs2C0g/8jAtp2n6vy+hnarhVV+GEr7nI597KE9lS6c6F1vaAu7aGWGotAw
         xJXy48sGcJts/JDmqEcA9uKWPK0XFM4QpKm4DogvzIwjCSoZAE6d3dqeDJwaoMROWv3k
         PS76k3TsFPy1wmp8XubW4RRoLoYfMMN/FcF34AfOv+fncSzQfwvSX+JFd+x1uxFYl8S4
         IaTP4yKuuAJVMlxxkopypJSwEnpgae/gmzlXOg0BqGqQHtcumQKpYp+HR7YzvGnoWaaZ
         392Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456053; x=1780060853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CF3gRsfbMMzbZIz4+Gb+p1TqqTyY+cXpLaVD2dZQxls=;
        b=EoudMO5Sy/D9y48WcsPQ2rkRw2r2d0i8hpA5eqaY7Yv6G3LZzowt/dA4yn4NSqXCmt
         YurSCFOm4hgm+EmCWfwq/C1o8nUdgx3p4oWz4gNMfbeRVGbi/KsdU/3E9fygKPTiOJT+
         QozdHY0xeZYvLtv7isELvQC89GUAIsFeBs8AODDDzsEqxzg19KNSgaICzD1ChqanIPI1
         O1MTqoupAuBES8Avw8gGNDd+CsAy50ZytbZljMJF8DuAiYLyzu8cAx0/Fw1K0oEOOVA/
         R7eK0NiBRWSZSj6dSDE9QnB51RDoM6FanwYjb2SgYNfmTgwBUCBYwRSD3z7OE8I7Orx1
         rMvQ==
X-Forwarded-Encrypted: i=1; AFNElJ++e25QQiOdNB5KWAg8bKcVIOppW1/Iqq9NO71mqetOfRkwYc126MixMO4rO8v/wDzt2SvUQ+MZpB4K@vger.kernel.org
X-Gm-Message-State: AOJu0YzJOmF2aIEPOg4V1uiivoTLNFtB4G3VjM1rRUp/3F6Ozzd5WzXu
	q8SoZwQEoto7zV6qarh0Ezzuek85krsZQRi4tIOMXrrTrUvL6jp98OA2mrtDzw==
X-Gm-Gg: Acq92OGws4SLtAhN9E/xMMF98zYmF4Uf/oJBwsyJZRiyghzvaSmpVq6z4F5RuE6/xlG
	oEpF/qgD2ypZrsVQA+p3UrDI51FujXhhfXfc+0JBYed5RmmKmiMzqTTFOkpjMAa4WF8TZR/TUOU
	pdIIRJ6cVAN02yk9xtxhul1FyrVyw6gs1tkaZrWrkZJjwtu+EsMORmFCwxp8Qw2JdKSp6ttYKm9
	1yDWVW6bS0+Qg2PnM3KLoYZ00GiudcUsTUQze/ITwXyLJKgcUCGsgVgKacoILGJOj4JnXiMTzQ5
	sT30I77GXBwloj2Fsu0OLUEEt8Vh+kYdhsbWw/pGil74H9v93Z4DBAwFVbx2Qkc1eQwYT6gK5dR
	634mzyynzKWKOFUKCtQYiMgIKmV3UJglKDpU0MAcHkhYWJubFBIpDyls6iZUqSOPwKifUDjetM6
	ZfAN9SV8aoLitn94eqfXiDN4cn40bxEYxT3KPt7DLoCg==
X-Received: by 2002:a05:600c:46cb:b0:48f:e044:927d with SMTP id 5b1f17b1804b1-49042480f2dmr39029315e9.10.1779456052918;
        Fri, 22 May 2026 06:20:52 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0cd5sm52220755e9.10.2026.05.22.06.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 06:20:52 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 10/11] arm64: dts: ti: k3-am62-verdin: Add Toradex Verdin Mezzanine CAN
Date: Fri, 22 May 2026 14:20:23 +0100
Message-ID: <20260522132014.226721-23-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522132014.226721-13-ivitro@gmail.com>
References: <20260522132014.226721-13-ivitro@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vitor Soares <vitor.soares@toradex.com>

Add a device tree overlay enabling AM62 MCU_MCAN1 on the Toradex Verdin
Development Board with Verdin AM62 Mezzanine expansion board. MCU_MCAN1
is exposed on the Mezzanine CAN Header (J13), Pin 3 (CAN1_CONN_N) and
Pin 4 (CAN1_CONN_P).

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |  4 +++
 .../ti/k3-am625-verdin-dev-mezzanine-can.dtso | 28 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-can.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 60844951c9ce..90bb3b0522d3 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -29,6 +29,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-beagleplay-csi2-tevi-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-phyboard-lyra-rdk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-tqma62xx-mba62xx.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-mezzanine-can.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dev-nau8822-btl.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-hdmi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
@@ -228,6 +229,8 @@ k3-am625-sk-hdmi-audio-dtbs := k3-am625-sk.dtb k3-am62x-sk-hdmi-audio.dtbo
 k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dsi-to-lvds-panel-cap-touch-10inch.dtbo
+k3-am625-verdin-wifi-dev-mezzanine-can-dtbs := k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-dev-mezzanine-can.dtbo
 k3-am625-verdin-wifi-dev-nau8822-btl-dtbs := k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-dev-nau8822-btl.dtbo
 k3-am625-verdin-wifi-dev-ov5640-24mhz-dtbs := k3-am625-verdin-wifi-dev.dtb \
@@ -344,6 +347,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-sk-csi2-tevi-ov5640.dtb \
 	k3-am625-sk-hdmi-audio.dtb \
 	k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
+	k3-am625-verdin-wifi-dev-mezzanine-can.dtb \
 	k3-am625-verdin-wifi-dev-nau8822-btl.dtb \
 	k3-am625-verdin-wifi-dev-ov5640-24mhz.dtb \
 	k3-am625-verdin-wifi-dev-ov5640.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-can.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-can.dtso
new file mode 100644
index 000000000000..7ebf60d27c3c
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-dev-mezzanine-can.dtso
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Enable AM62 MCU_MCAN1 exposed on Toradex Verdin Development Board with
+ * Verdin AM62 Mezzanine expansion board on CAN Header (J13),
+ * Pin 3 (CAN1_CONN_N) and Pin 4 (CAN1_CONN_P).
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include "k3-pinctrl.h"
+
+&mcu_pmx0 {
+	pinctrl_mcu_mcan1: mcu-mcan1-default-pins {
+		pinctrl-single,pins = <
+			AM62X_MCU_IOPAD(0x0040, PIN_INPUT,  0) /* (D4) MCU_MCAN1_RX (SODIMM 116) */
+			AM62X_MCU_IOPAD(0x003c, PIN_OUTPUT, 0) /* (E5) MCU_MCAN1_TX (SODIMM 128) */
+		>;
+	};
+};
+
+&mcu_mcan1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_mcu_mcan1>;
+	status = "okay";
+};
-- 
2.54.0

