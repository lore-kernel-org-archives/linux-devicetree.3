Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912E547B409
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 16:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779466316; cv=none; b=STrp6ZgrjqPeeGVfjSPeOS4Li+1eD+ippbU8uy42vcAec5zodXVWjOjM6f2wpZWpEcwfFBR3rbx+s31gy/XfU93j7XRHWYoVVD8zDeGXm+lCggvd5Y/DY/IicniDF/0JPkJhxf7AymLO5t29XalwqiQZg6XfBHfzUfD1DiV9YJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779466316; c=relaxed/simple;
	bh=Onfdz/xscxQ/YvwLu1pxDVtAauf991A7gIDb6FNuNSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rano4D6ngNx+WEnOpm3SgWyLrQWz65cssj0adGaDEhxv7rRxP6EOwIMhpEJUzpcq1Fq0Asez6U8foru6WkbH39bwzJ2vLlze5+SODbnndvVU/AIlhVVgEepVwFvBDmMmKbkE+BEdoa5yjI5Fl06LVmdPnsxLPjfltV5ZYH8VACo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nBPBUYps; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nBPBUYps"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so20601705e9.2
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 09:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779466313; x=1780071113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RP+CltVi6jUCZJal0Anzdw8j6V9ipqNLat7Pdw8ZHRU=;
        b=nBPBUYpspqjq0p8zKdjP2TWTNi3XUJ+tvrQasThlsiWR1PCbNDemqRGTiE7Q+XOuHU
         JEK4BJpTIxyVZRucvDFF6hdHQqN4uRIKMF20MWfGR/VXKbzD18/iHKccBdwuNUljrRXr
         36/PgcLJS8baRZfJ5BSZdPRSj4BeWZmu669cF7Mf0nL8Ju7+acMfnlAKfgFRT1+y1gpP
         eKa0xvKz8dAWz0uY5i+HBCoEzwg9MBi0rWOh8I9XJGErb3lD+f+RUVcFCiF/ABAFHaoJ
         oTggqW7PVh5w/rcl5Yb62bsX18i/1QWWx11VGzKiRWgR49/R0NFIYpnWv78NHfnbJda5
         XmgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779466313; x=1780071113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RP+CltVi6jUCZJal0Anzdw8j6V9ipqNLat7Pdw8ZHRU=;
        b=Mk44M8qj0BuDGooT8VSIQLPotxIOADqomAVQl0gksyKT4ciOGlcPBH1is6cH7OieXh
         QuThZa63Fz+tHtp0ZaLhruYZs/43ppogXFI3xhZMuh2nvpg6diAtEUhVH4vDlZwsazpU
         69KNJ/85n7+1xj3dlldVO881PRi6x3+yRV77a3zIPZh54xHLyJ9rH34RDLttPcF06Twn
         f55AIME8fj6/bXTSDVqoeeLfHjoiLc71dL9ojLQJHMjqUfulLetwH4sc5sUapTliLM7b
         wgJQtTXT+FLZu5uPjuTTooaYclrQNZv5bpdJ2I7o+4TqfYwJ4ZflnaWOQdihNYcC2nFw
         JAnQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Wp0o7Eiu984tQwjCXiqTorjbdbW3FGY5yv5t9czjKXz7GZRedCn/ZYbeUrzxZCPSd1lfOXeDJhwTY@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa1S4FVb87ui7Hm7KxkwooTWo46PqvNDerjoSbe3UDo8ZRzZc+
	aHxS48Emy+DF6jGyp3ynDSueVTHL1pVZyagi+DUdQuiWsUYD2LwE+E1H
X-Gm-Gg: Acq92OFB7aoefJzWMpPDWHdKrqEB6W9DAyB1fZWuD+pjK5vz3XYIR2sKwfxrPrK8yhE
	nw282NeTStj15aa1jdzS5w7fVzFVfSmlq05S0vUdMDqC+2xh1ZIXAvBlfApyPyUIa4LzFbidiq6
	U6W+d28Vx+K9MG2Ok0G9n9N2VE/EjNVuEB74hpkMuZM+KB9jeeuNWe04IzwkylITjGNE7j0wJpS
	BKQe0LdGYi+8jFUAwxMkG73XwSeyvqrxHvKXfG5CnYvxIIOqp03Zkr17nY4hMBUCOPZspTuWpMh
	e0TOONt+chodzKybFQCpl/6S6UvwRl4tBFqfQyddhjf/4f4SBfmfegf2SbfdENiZVIYzYOYthAi
	UJo3N5HMPN+11RCShtJncWme77cm0WFmnKATPo7+33Y5UH1gKL3qUtJAMFPx6HZnpvRfvIo1EJF
	T/GYMJ32yrDQ5MzlHWhhPpsbGdu9Hv53tZ5aafwXlweQ==
X-Received: by 2002:a05:600c:3e0c:b0:488:ac01:72de with SMTP id 5b1f17b1804b1-49042489c30mr69866695e9.5.1779466313046;
        Fri, 22 May 2026 09:11:53 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490454a0b9asm51042755e9.11.2026.05.22.09.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 09:11:52 -0700 (PDT)
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
Subject: [PATCH v3 08/11] arm64: dts: ti: k3-am62-verdin: Reserve UART_4 for Cortex-M4F
Date: Fri, 22 May 2026 17:11:12 +0100
Message-ID: <20260522161105.277519-21-ivitro@gmail.com>
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

Add a device tree overlay reserving AM62 MCU_UART0 (Verdin UART_4) for
use by the Cortex-M4F co-processor as its debug UART.

Assisted-by: Claude:claude-sonnet-4.6
Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile                     |  4 ++++
 .../boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso      | 13 +++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index a1083c0b2502..31c9bc1d48b1 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -44,6 +44,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia.dtb
@@ -230,6 +231,8 @@ k3-am625-verdin-wifi-dev-nau8822-btl-dtbs := k3-am625-verdin-wifi-dev.dtb \
 k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
+k3-am625-verdin-wifi-dev-uart4-mcu-dtbs := k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-uart4-mcu.dtbo
 k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
 	k3-am625-verdin-wifi-mallow.dtb \
 	k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
@@ -337,6 +340,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-verdin-wifi-dev-dsi-to-lvds-panel-cap-touch-10inch.dtb \
 	k3-am625-verdin-wifi-dev-nau8822-btl.dtb \
 	k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb \
+	k3-am625-verdin-wifi-dev-uart4-mcu.dtb \
 	k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb \
 	k3-am62-lp-sk-hdmi-audio.dtb \
 	k3-am62-lp-sk-nand.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso
new file mode 100644
index 000000000000..e263809cdf74
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-uart4-mcu.dtso
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Verdin AM62 Cortex-M4F debug UART
+ */
+
+/dts-v1/;
+/plugin/;
+
+&mcu_uart0 {
+	status = "reserved";
+};
-- 
2.54.0

