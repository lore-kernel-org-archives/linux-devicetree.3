Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD09242D9D
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 15:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779375682; cv=none; b=HyCIuU9PrS4AjQJEhmbL8TRIbRDZjQTp/SDTYmU7ElD2UCHqbIBlh01Siow8+orXfOee3ceWw8cfx2BjwmDyzBmigxVSopr2shrjducZMO30Mm8OTG+It4pdzTT8rFcsD8t5F5V2LnkwgEMPoALoOpkfG3u+1JdI+ebhEFsBAys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779375682; c=relaxed/simple;
	bh=Onfdz/xscxQ/YvwLu1pxDVtAauf991A7gIDb6FNuNSA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UWwUZFj0PZKVIaPi/+9cPphTvu8AiiSPx3C2ZH5Reb4rXWiRSDuyOOHMAPEOoSj2IHekmPXa1DWpTH/+hGmmpCJlh0shMOj8NZUExMnCOsHJjgZWVFAtA3EdvgrSrjRh69tURzHBJ1kCqlI1sRFLLg5HjNfIAig4sonXkahAqmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A3GOSr61; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A3GOSr61"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4903997fcb5so8202715e9.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779375679; x=1779980479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RP+CltVi6jUCZJal0Anzdw8j6V9ipqNLat7Pdw8ZHRU=;
        b=A3GOSr612tOohV6Ta3ypD4+v3wr4d9QYIANrO177y4NK9hLyVurB4e0EWyBA7YZUjN
         3T5HacUTVo9CCNNyKEc7SBzZttUAMp8PCB+jvLI29JZ+MMIAUxBkSrIwe9+BUBpHYVLW
         z9h3AFumuhSA2EvS23h6KcrznXvgl7dh5Wm8kYKANF29ZNr7IYZCNA/b+tkmhbgF+o6/
         B5D/F07DHX5oqTS3/SO0X7TpJ9mFHqLZJIsjatW9nnf+bZQgd88Sgi86aAtMQnayQvRq
         jJkmQQUJt2JO3MFHPI4ngfZacW7d1tzOVgwYwKypJh2OTnW2QzgOavrMjpDfitIl4wuP
         EPhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779375679; x=1779980479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RP+CltVi6jUCZJal0Anzdw8j6V9ipqNLat7Pdw8ZHRU=;
        b=i7XigYf9xW0nQQ65xOo0UwV7+xDInnGBORVz/zN9l/x8u5M8HWIKVqUL0MLO14LdWl
         E6MkX7cHeCnGL6cqf+vGmCnvyNNFgrSK9RKJfj0N7vqq+PHmGKrG5KtD8j5UeCcKKbrT
         CzE5sL72LMjsWoKPwsJ0UYpuuHAWHhXF4aAuQ/GrF/Hrt37Wj+HJ/O0hNlE6LYRnXzfp
         xx7w2k1hS7OmzHH5lfRtnSjRuZ46zYP6m8dgrETRSi4NixN/sAy9gIjB527YfY7TDb86
         SyFXwyBKyyYNaHoR0YULTq+O1CfMf26mIXJByjCjcaMJL85Wk6KbE7PLnK7e5N0sl+2B
         EjZw==
X-Forwarded-Encrypted: i=1; AFNElJ9Aspw+TMetBzRWa7Pd/c5oVD4qrtr0eCIMrQEUaaM47kM/KjmwIKrZJTIiw/AFKyDX5ZPSjWdl3d2f@vger.kernel.org
X-Gm-Message-State: AOJu0Yy88u6Krm3X21aXL4Yr7u8b8iRMyWessc7wcYAKxZThVFeAMzMJ
	swX001tLWJ28J7+wqPf4jtMoeLbDSgagfCowgMyPIF5QaUeVUEpuV3qu
X-Gm-Gg: Acq92OHHhZiMIU/U0E5J1+3KC+E3Fimilvqn0av7lpFfVrW1gzK/QemY0MxXQZ65LbM
	C/vuGHSbU04z/XxrB/ieDyobVfWmo0gM/nhToZoFsvb4Rb6RbYqOAsplm7goMp22FYVzjaW4KIV
	p8tRKgcgJqCk4hpxaDHH7Jkhxmr9s7YVC9mpOJ5Uz3x2wiWei5KwEpoPACDSmzU2ELEIpl0CNg/
	CYlRHKNcS16NbJduFmGjJ8Aib7HOtslBtMp6cJQhEEGE5cNYA3NbVbfDQ/uaGQDHjT1HD7R64iQ
	lO2+7GUfKy5FpqfMeKg448fJQTR7OwsolG0GZNdSsl7orsZGxO+T5Px15r7kbp6EI8yHks4gALX
	NjiNrB3IkDcg8wcbaW2m4JdAN+LUz4CUr0Cd+jw652HEt18xNjzMJ0zzLXHGQM6M/Z8CAlcre/k
	lDo/geiE4rPkefG9B7/EiMovl3K2mhxeBr3Oeu02hq0inxtYH4zpQz
X-Received: by 2002:a05:600c:8b05:b0:48f:e230:c3f8 with SMTP id 5b1f17b1804b1-490360cc5d7mr64212735e9.30.1779375678650;
        Thu, 21 May 2026 08:01:18 -0700 (PDT)
Received: from vitor-nb (dsl-113-208.bl27.telepac.pt. [176.79.113.208])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm34056745e9.14.2026.05.21.08.01.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 08:01:17 -0700 (PDT)
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
Subject: [PATCH v1 09/15] arm64: dts: ti: k3-am62-verdin: Reserve UART_4 for Cortex-M4F
Date: Thu, 21 May 2026 16:00:45 +0100
Message-ID: <20260521150038.103538-26-ivitro@gmail.com>
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

