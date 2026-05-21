Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560E4368D6D
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779375686; cv=none; b=WpeJpVHYdoZOLEiE8jbIeIc1mYgd0qwR0fQx6MpOnIFkS/d7q4Vo3yXeeK8MrxrpR/+s/yILhd32lUgoO8+aHWPn7MhfQMYtugVRh7L3c/ToIfPMaeK9e70E2nPtkn4vfgie8NajjaqqxiytmhwwFVhA1JwwyHPY8mhR8BjiX9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779375686; c=relaxed/simple;
	bh=u6aHnMtp0LzC2YoXnChYv0KmQORYYnbeS/YVk0QSdvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cnTji9vXqbK+wNcXVgD9J4WMv/UWacZNf3CWhxp6A7TyXCNL3rGGOW+1hJljJIcOyyn+PUAGIS9hnoswJQGD4oOtwJ26D35rW7/Ow7VKCeAZcXpKwCQBckEQ3YkDDT2POuJCVFafXDv1HPg9B4uZ9vlaPqptaL0ALPjJxEwgwVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fu/Ywbd0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fu/Ywbd0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48984d29fe3so67662495e9.0
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779375684; x=1779980484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CF3gRsfbMMzbZIz4+Gb+p1TqqTyY+cXpLaVD2dZQxls=;
        b=fu/Ywbd01dymdmHEPbkNzhSlDPSpuRoRNWRVwAXeXvVo1IPgtk8C5dGOUpp8Ykneqj
         QQ1SgFOusZRCZhHjrYaQpKYRPgmU7wPI/9o/9aYiDyvqssxnTzzxI84+gv8AkWkAMH5l
         OTpcmFjF8Minpa0LEKR8Jb5tte5EA9+nbzSFrnQDXosIPaMPwiy9UZH4wpOc3R4RFT1a
         lA3Zj4xOP3vjZOhLQ+0IRG8xMARJXaOsSZqKuCcr1Dexa6EFJzs7B2XZciIX9pXNRA+2
         J77M8ofd1wmmSfre5havFjgaRf2aa7uEJpkQazSc3JiMbtFRqOAvz5Vh4aByjGBtjeiI
         vRTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375684; x=1779980484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CF3gRsfbMMzbZIz4+Gb+p1TqqTyY+cXpLaVD2dZQxls=;
        b=c50T9PWoV/l8pxtNGGfda5xVdz3wE82D8JYcEfcMKY8D67JDEF2jacE5tncd+LOZjB
         Omc4TLP8xsyXrWJ4Ug6OgCzLs4T0iZDxPBUZOekAD5zc9DWRzqmNxxwFaBMQj6p2aGfv
         jOCkZSkbhLbDhNyzQ7oLx1u2LKN1zgWaTlQhO+XK8UhMASgFvAzYkkI0aF+U1MBYvjPB
         OrTKt5fttpoMW7LB98DaCv0PTeE0nVtRUTaZMJCSVCLcwhKI+WrkrrxTU1pwM8XB/6uR
         ZDEpJQkK4ocoKdsbvnRvR/x3a18xD69r/XdnURJTh6jnoLQPmfKqGQw/uwIABFbJ5YdG
         1eaA==
X-Forwarded-Encrypted: i=1; AFNElJ9ehgjIGoukCQyMK8OaaLG35LjAWeuXFLBMQSKODxDox4qyEJwgEjYfLjyrztmIq8flLulvabvpyeXk@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6Wb08uqZFTsff+zjGuR97g0VNni7aNl/K1dlHhOZG8+1OmsBR
	wWXlwEBmZ1omUqOPgMkdm1sccfHabmk93mVnY0ZbMLwtyzD2JvQHQ8+3
X-Gm-Gg: Acq92OFl9mtSsmOhO4NcrTQ1LD1ZEyx96spb+1gVJHfXpNwItLL0W2iR/37hcN9AW2j
	TjY8LPFaLpoJAdS3nYIUax42o8vVvT1Ju6tApkzJqCkIiKFrsBpxivqB7hxmBKqEgyCBEZqyvD2
	2docwbUH63uEoL2p33L845h4GbJcTCq7uvJ5IqGsRhzM1zMZEqMBNLE/IvNm9/++g6tuAqNheZg
	e61rDMRDAfRrlcj0f3PIgUAC/dk0uFSJW/2HlUk6uIvFGIMY7F11KKLadqw5Cqcfk5RWEMIxBM9
	2r5opVoEQerP1I1PztH8JxIgR/TI4etR0ER2pWuoQl67caDZH655VArzKoex9W/7HPdmdp6YZlq
	muU+PxKT34TxULOZMqPXJVCBkuCkWRDEZkoPkbIGYbXqOMDl5a3TG/5e3ytcLH5vLUcCxHcz2jj
	Jqgz/iv2L03zXTfnhNaSrDwRoGCVdmbTrxhbkceyjhWw==
X-Received: by 2002:a05:600c:c0c1:b0:48a:f18:ece4 with SMTP id 5b1f17b1804b1-490360c495bmr39484555e9.24.1779375683441;
        Thu, 21 May 2026 08:01:23 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm34056745e9.14.2026.05.21.08.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:01:22 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 11/15] arm64: dts: ti: k3-am62-verdin: Add Toradex Verdin Mezzanine CAN
Date: Thu, 21 May 2026 16:00:47 +0100
Message-ID: <20260521150038.103538-28-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521150038.103538-17-ivitro@gmail.com>
References: <20260521150038.103538-17-ivitro@gmail.com>
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

