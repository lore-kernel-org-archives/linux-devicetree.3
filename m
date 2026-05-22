Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1B947CC82
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 16:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779466321; cv=none; b=IZsBWlPkf3qocJT49XWFy7zjCjnMTMxi6KWi0R7qP9gS5biCgYQpJTHUt38aGbiiQ0TDUkpS9Fi2R9mD+VMzrt949kD89CWCsGiLv/WqAawTrKIGs2+wmTiPafBY8z+5RqGKhusXEf7PaTiSo6FF5A8r06Elv5Oj97Qa9UY1blE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779466321; c=relaxed/simple;
	bh=u6aHnMtp0LzC2YoXnChYv0KmQORYYnbeS/YVk0QSdvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fxr8O+DOTQzozeQiCu34EN2BGugibb88l9RdZ2c00WCXJIxPLZ3PG2abUBof1Nu9W0sYdpu1srgme1ZIxbuWBysZ0ItDA/sISlLZ/jKXyt4ZqdcaYaENwArtq91kFxNjZy8PMtcACKdihSdoIt3HMyiSqYVa7w89bj5P+pKm860=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nvh8Biuu; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nvh8Biuu"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso65932265e9.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779466316; x=1780071116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CF3gRsfbMMzbZIz4+Gb+p1TqqTyY+cXpLaVD2dZQxls=;
        b=nvh8Biuuq2T2lUnHdG/OxO3HDMpJrGBTUPLZV4UXqXOvOeIa3W0UhjOENnb5jOn0Q6
         oFAF+SyrjP1//rFpZFyPzsfDlpabW+aJlGP5GQKvmab98jHMQ1Suxj9O3NLDF8j6XTAd
         beQsd0jXabQBkCUliYWmJmfktgQjezSSNKPGqL+DVNhIW+oiIWP2DbKqBjOU+tN4rwpa
         WRxEb7IlNZDwoz4ygt52rFtlolk/a0HWK1QNTY70UVwzJrS9+Q5PDYkU3WIa2pE6VGN6
         U7ooLTFyNuxWntTE9x3l2BfEl7NCqx+T5HW4guR03J5Ewg/aAzeLukO/uDn+Qo3W0Ac/
         EkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466316; x=1780071116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CF3gRsfbMMzbZIz4+Gb+p1TqqTyY+cXpLaVD2dZQxls=;
        b=CRBERFhsL0zABXeeGud9b3VIj+poKV+U91RN4Una35dvBATzBjcNwZY6o9ZfXF8u9h
         1lf1Fs5Xz91v9lxcA42iL3p1Jh9+rg+i+B0I41BBDulo1iEWc8OpWnTnb/D8ZFUmPZan
         +QcxPqQMqguoFts5zpwDPXXCJKpD6Az+CDHnxdqGPm8gco4cZslzJT0MVEDPQF77+epN
         hDXUBgxWq3393gGIMAil7oUhuIxO/KituZt3IbMA6rRwBs4xqV+ibQfBq0hkHnehx5Vh
         OT+p94eG6CC4Y0fS7fwhAXuSa/3h8SI5jtdjPNw8oXmEBbv5fT3Nm5TPo4ffngkPArQz
         lr2A==
X-Forwarded-Encrypted: i=1; AFNElJ9YrqEQ210vzd/9HXL2nFrLn8zgXA7EkPlCktwoWTyclLjoK+3rIzrN41akjVgYG4As8xEQQfEvEr2y@vger.kernel.org
X-Gm-Message-State: AOJu0Yyolwx+G4C2Rzcr0RVKeQ48ENG1gPor+A/MeNJtQ5kexHmK66t6
	mWpBhDPBTsBk5pkV8ook2VczpouWQIY1OO9xejAa5wse8ZvHw7AOg/52
X-Gm-Gg: Acq92OHYwdwZBfYcuVKr4EkeVGYWsTHzXBaBNPrgfLn0DVlwan2NWRI5DTGFPp/st0u
	oAv/NaRstD69+yc7l50JWQGUQbk460/JJ+xgye+kKWH2tXdhiLI5iULlJMqKHOdDpsWKSKjsw6V
	eP3ghDRB31F8zNm3mRFk/0mnnIUVlLBhgTJioUaN/t+b7HlimLFt1hJ6XJKTB5SIlweTY8tcJU8
	WAuCgNZ+ZMpukh/oHOgkMEvyNQGH7d8IaA/5JAQr2ksTJshBw6BxMiRFo4zxFyYRuLstkjdyUQc
	RihRRDzTAmresHx/2KVrgSqlG7tPpWDKPQaB5InEO6Td/0zsl5/GLLFtaHXqIsnl3IPWzbv4IRb
	vuhGdOFamN0syouxseF8DBZr67r4rfldfVQF7osPNlIFkzN+dvWxz80WeiYIZixvYPS72Fm+EK6
	NXDjb4S4zR1ZaFfiy0oS/6b7po6vu78Kv0R6I8y0ZOJA==
X-Received: by 2002:a05:600c:a402:b0:486:fd5c:2b35 with SMTP id 5b1f17b1804b1-490426adf66mr50035925e9.13.1779466316275;
        Fri, 22 May 2026 09:11:56 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b9asm51042755e9.11.2026.05.22.09.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 09:11:55 -0700 (PDT)
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
Subject: [PATCH v3 10/11] arm64: dts: ti: k3-am62-verdin: Add Toradex Verdin Mezzanine CAN
Date: Fri, 22 May 2026 17:11:14 +0100
Message-ID: <20260522161105.277519-23-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260522161105.277519-13-ivitro@gmail.com>
References: <20260522161105.277519-13-ivitro@gmail.com>
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

