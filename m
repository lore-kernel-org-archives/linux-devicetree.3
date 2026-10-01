Received: from mail-wr2-f25.google.com (mail-wr2-f25.google.com [74.125.225.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A9B3D2FF7
	for <devicetree@vger.kernel.org>; Thu,  1 Oct 2026 11:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790855068; cv=none; b=ayyNtX7ESOX/Iv5sSz5kig/J2kL0EmkD95+Gte0WeAJl2by683OhSp/ri+0ry0tG6csLlt+NeTE0hd0iV8JO69bQEW1OJ6N9wJpaU5bjdwigAfLSiysNVEXVZveW3Hw8YM0qHangciEisRKCfw2JSt00alLGSgj1MM6yvyZbSvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790855068; c=relaxed/simple;
	bh=rN6PhppOBP+U+H2IVozaLpFZ8gj89uW2aTagm28cAZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tmVu6Hm5u8kpftvvMqpisyJePVy3HtXZ4413FQgWV+O5ZolBTyFQdQdcmTmtL815/LTML4dobRlqH3VvuLyaSguKBLw80fFFhY2UmJPP8K7gr+m09idPsxrohrCmCVRbQVWXi2ofzZzFwH1USDcAk/jmGbvMuDYzujaDgt8dJOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tFH5f6qG; arc=none smtp.client-ip=74.125.225.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tFH5f6qG"
Received: by mail-wr2-f25.google.com with SMTP id ffacd0b85a97d-48b03eb33b2so573117f8f.0
        for <devicetree@vger.kernel.org>; Thu, 01 Oct 2026 04:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790855057; x=1791459857; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ysAADyX7pTvl47KCk7d/xYWK0poDe65ojjsRPrIY4mw=;
        b=tFH5f6qG9gGq5GbPP6LutvjNXhSNrhzHzuZJddGnSdmf0MYuAHSGqc2I5kx8cSvtA8
         gfFzi5eAtkRB3hh0A5UG6NxU23r1ZbrIUNcmTU9ygCDBf4lkFjp/9moqXt2N5uBp0ZGq
         I8yKieqXLmyWg2hXuFSfp36uf50b0NarWxg7Js4CyVzEIKzPIItqwU388hMofAGHGgWP
         NX1U+guxQsFDdLaWsMTor+CchiAr35UUwTNrnAcp1mtwmhXfZeBHFxPsZqsrLYWvvWF9
         oiMfrZC4Pf7dTXbK+LUbykCp6i4eLil4/ua4QUL5WsGn6Xz/gb49/nWUE1b5yJTDWYmZ
         wUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790855057; x=1791459857;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ysAADyX7pTvl47KCk7d/xYWK0poDe65ojjsRPrIY4mw=;
        b=BvW+3GLnuvQ7OaRqgVdjBvhJHX6fGB7ry+nQTmbNhsNfyTWPKYQmmMsqS9843h6TKb
         AexztfaPUNt9H4BSSuNOLAWESUWjcd+1QBu6783M3qPn0AanV2ompFHlieH8OvlOA8fc
         Yue1laP9WyeRzHb0Ah4rXQewCwCzFcR6Ynm/PC8vTKDj4mTHlZUbSZU30T7G4bC+ULr5
         BGYtzz/YE6sXgdqS/+xaVQNey/wd+Nc/kv/rjgp7CUm68GyfOFgAxl4xvH1YaH0xdIGK
         4+bgMDwS1mGBlKqdSp0Z4VbkHxW442tZMjE4K5HnsCXYmnGNQuKpxQLAh0jN+lckW/w0
         A9dw==
X-Forwarded-Encrypted: i=1; AKwUvBy4q6PR5a8pdTZNI4EMjuA5pbRDId13YFlZgfC3zsXJs0jFt2BgWbWfg/0fXXeAllx2PaX6ediJ+Ahh@vger.kernel.org
X-Gm-Message-State: AFq9FYIWQjGYmK46w4CWkGodAH07d7UAPJ5n2VFhymL5XFnrLvFpGKn8
	INwF5MuNErH5jkxKffdCjybRk4+NhKgyBDL5XvWjvJd4GQ9MfpW7oXhO
X-Gm-Gg: AYBFou26MH6dh7ePI78ks75ZgUiwbY6toipe58dmO5nr9LuwaOzhFXClQrDGK4jngxI
	32rTRQ0HL03bqDhZ2dsCAYhxDvPMlm8ghfMyb/9Hm0BQbWWkWlL3tLU4sG6Awk5SZtP5L0n9J+I
	mAbboK9ktgufAUbbiWCMKXNY9ExXfnp+XUspFM+cpp0nGPFnihYXx75/EZ/t70hpu/5PTYC7frQ
	o8F/tVVWqurTI5MrXuyX9c915PLF4+SV1d1+uALyXw3PU52gzRl8u8elfblzqYUXfTs5FsT41cX
	QHuNTif1tDGOUcUdvT6jFZYxvlGAB8Emc+wPOiKKguTuVDl1GWJjs94RXmxvHKUYQEAx5xP3d9y
	17r3L8kX0GqN56TW9xPFk61ta9LBUxWQXP4PBZ/5e1jV+mrXe4UDsucDhaFF6Ry9xQOpXUkVH6b
	vG8U7ViWZj8b0GszJNecZG2dET3VQzuDQDFQfzEyXIv1+ybQK6cEYIANzsHAuFim0LoIv9Ud9OP
	fG+xQ3V2hQzXWp8IUM4DF+Rz+NTj2/1fQj1Pi1XcgTJfkKscQf4TjNYw8nml8bqo8mcYmc5eQ==
X-Received: by 2002:a5d:5601:0:b0:488:5468:c23a with SMTP id ffacd0b85a97d-48b068c8ed3mr4376902f8f.17.1790855057014;
        Thu, 01 Oct 2026 04:44:17 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b1035eff8sm1243705f8f.7.2026.10.01.04.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 04:44:16 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 01 Oct 2026 13:44:10 +0200
Subject: [PATCH v2 2/6] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 UART_4 overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-verdin-imx8mp-hmp-camera-ready-v2-2-7d1343ecd3ec@toradex.com>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
In-Reply-To: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Verdin UART_4 can be assigned to Cortex-M7 firmware. Add an overlay
that marks the UART as reserved so Linux does not claim the port.

The overlay is also combined with the Verdin iMX8M Plus Development
Board device tree to provide a ready-to-use DTB for the non-WiFi SoM
variant. UART_4 carries Bluetooth on WiFi SoMs.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                     |  3 +++
 arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 23e2684d6923..649be5b6aab4 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -736,6 +736,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
@@ -744,6 +745,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
@@ -761,6 +763,7 @@ imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-dahlia.dt
 imx8mp-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mp-verdin-nonwifi-dahlia.dtb \
 	imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
+imx8mp-verdin-nonwifi-dev-uart4-mcu-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx8mp-verdin-uart4-mcu.dtbo
 imx8mp-verdin-nonwifi-yavia-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-yavia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 imx8mp-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-dahlia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mp-verdin-wifi-dahlia.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso
new file mode 100644
index 000000000000..74d90b39faec
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Verdin iMX8M Plus UART_4 for Cortex-M7
+ */
+
+/dts-v1/;
+/plugin/;
+
+/* Verdin UART_4 */
+&uart4 {
+	status = "reserved";
+};

-- 
2.43.0

