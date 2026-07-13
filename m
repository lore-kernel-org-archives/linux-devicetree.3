Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6393441CB4B
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 15:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955228; cv=none; b=uxSTXHvTZL/d6CiS+W0ruBNeaFAucSSYjDIdqkFdMIEpw+AblSruLs6lDr3W/B/WHAj/ssL5lMQlDmGQxp0W21Mdj5zzb1iD7jCtvspLnbA8OFH+Z/Ph3jOqkZ45hcfDgXBvqzKqqeHpj4ZYcayLOYzR+x+tMfpr3Mmxzh0j/6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955228; c=relaxed/simple;
	bh=3181rxI7RMc/ENmXtWxGxojMovVD/zC4nX94sor5K1I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LUmZKE05SsKG7Gmi1PPnOvtg04zX6KUgHQzpgpZbk0tEqX9q5fWfuysvLT2S/HHzTbbdXQbaUnWImAgFMWHwuDhRHatzkbZ28pOdY6gihWcHMY2gRgMiqeGfuoTaGrlInSvdL5eVdypAkkn0ZCYrPtaE63MM8gvuhBRHgLmiA+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m715yh6o; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m715yh6o"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so2992559f8f.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 08:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783955221; x=1784560021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pfh4lLbCVK5LG8yB3IA/+fVz0G2PykpCGfs0ou1iHvM=;
        b=m715yh6oMoneUtmkk/VgDfiKD2tzqLdcVojXjvbcTLbFBAFfbZO3pNnlsX2/SqVe+A
         CmYStyQ9OcBpt2OYG8JzltFZh41Gx9b8tTre+r2/zxAm/KwoSXEAc8h29Lqcj0WFvrhO
         IPANUgzOk7xiLee0Ws03fVokYCP+H80M/IwGPt0mS5jBRFZDJ/BIGuhJbz5S1iNii76/
         ivtctOm+MXQ6+OzZG5ko9xmXT08iDXOWRuMNSzI7Q/qONcJd1zx38YjEV4qg88Lp4db5
         h3IPEsR7uB8+1CfjwN7VJe4Ez8df3QLA7tzQHNBMSaollUR4h2M2JRcZKxiwDPaBPtOZ
         R9Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955221; x=1784560021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pfh4lLbCVK5LG8yB3IA/+fVz0G2PykpCGfs0ou1iHvM=;
        b=N8iTW+n4fD7hNSwCdFwJSL8FMu8PklIfGOhXrUGi8M98k3kEs2qQ9QQBMXF0jnCy3C
         SiJ0StqyI+5W8e7bfEYenR6JmnBm/aSTOhtHT6yUFPdySGT2Yb3P6MlngtgysquxSxWt
         MZt6m4rXqu+stECQIgTpFrlLMy8Rxgeu1CEtQSOAqT3+kfKBZObqwe4cdOH954gcuPp0
         nI9Ty1Zb4Zb2FHt6rrzYgxKN86ZbjSEibDopgansGrVjF9+dqlnJriioz69rOZya8ZkF
         NiAylJWXS0FJZHlp803U0FpmKYNrvEl7J1ohKIPRwIx1oyLwJb4dXnupfOeI1jL+uHz5
         qjbg==
X-Forwarded-Encrypted: i=1; AHgh+Ro03P2cLmit1GSCxwMDzWe5SYBf4RyIaNjuzNjuJBcq1bemzcLYaDDPH1nGw+qOR3Yh81S+zMr0bH9X@vger.kernel.org
X-Gm-Message-State: AOJu0YyPewG0l72nC86PzqFJDSuCK0uWGaTcnMP4j/vllwnXsbsMY0DW
	LYxLRbrp9LuwqJsiiThKFTVlVp/w9IPZaJ/hXvd2t6W1gq2uK8dO4U8/
X-Gm-Gg: AfdE7ck/4ONcskAGKlenEUSHcZVoY9AGba/uY9MwJ3RCDheWRSsElkPWPC5L13yCbig
	EYXbT75MhTRtB32LSgSVwjvk909gj0cF2NXgzFwEvdqzb+fnwIq8+x7zBIoIy3DuYnXoET5/gxr
	Zvi2CaQHIIxo2xZXCCpyaXIywoVaOG4N9GonYI5i6m7RAt48fD+9bftoUzsGLhmMAOEX9FEPMBO
	EJsRH3S0aJ4ZwZYTZ6ZyIAb7JlrVR66gTQ2/Bvq/XpEtIon15c8L/sQ5KHuHWiOXjfM8YofpR2F
	I8qf2/S6iTYiZ0mLwPW384yvbQauS6/L49OiP4cPO/qiKxaHiT5Nw3aI84EK9tgZA5lwUwfoe/g
	YQQ+8VpAWo/fF/VwdgtUIRtErqRyLCEG0l3Krm8b75WmABV+hn8UzBDSMwZdSBDApsbDBBC/Avs
	tQXJO4kmSvU3gdHbqgzHng81x+/ol0Bg/akC8UVk6ycE0CsPJCH7ZJndqpNJ6Slg2tlT9yhnVsz
	bRNYbv8ugu8gMWb
X-Received: by 2002:a05:6000:4381:b0:47d:eedb:ee62 with SMTP id ffacd0b85a97d-47f2dcb50f2mr11326337f8f.14.1783955220701;
        Mon, 13 Jul 2026 08:07:00 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a5d7sm19389f8f.10.2026.07.13.08.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:07:00 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 13 Jul 2026 17:06:29 +0200
Subject: [PATCH 8/8] arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F
 UART_4 overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-v1-verdin-imx8mm-dtbos-v1-8-4acd63db4504@toradex.com>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
In-Reply-To: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Verdin UART_4 can be assigned to Cortex-M4F firmware. Add an overlay
that marks the UART as reserved so Linux does not claim the port.

The overlay is also combined with the Verdin iMX8M Mini Development
Board device tree to provide a ready-to-use DTB for the WiFi SoM
variant.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                     |  3 +++
 arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index ed3d678e7c5e..605008d7fe6e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -193,6 +193,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-ov5640-24mhz.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-ov5640.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dahlia.dtb
@@ -202,6 +203,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-nau8822-btl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640-24mhz.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-ov5640.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-verdin-wifi-mallow.dtb
@@ -225,6 +227,7 @@ imx8mm-verdin-wifi-dev-ov5640-24mhz-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-ve
 imx8mm-verdin-wifi-dev-ov5640-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-ov5640.dtbo
 imx8mm-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := imx8mm-verdin-wifi-dev.dtb \
 	imx8mm-verdin-panel-cap-touch-7inch-dsi.dtbo
+imx8mm-verdin-wifi-dev-uart4-mcu-dtbs := imx8mm-verdin-wifi-dev.dtb imx8mm-verdin-uart4-mcu.dtbo
 imx8mm-verdin-wifi-yavia-dsi-to-hdmi-dtbs := imx8mm-verdin-wifi-yavia.dtb imx8mm-verdin-dsi-to-hdmi.dtbo
 
 imx8mm-tqma8mqml-mba8mx-lvds-g133han01-dtbs += imx8mm-tqma8mqml-mba8mx.dtb imx8mm-tqma8mqml-mba8mx-lvds-g133han01.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso b/arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso
new file mode 100644
index 000000000000..8dbecffe9e7b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin-uart4-mcu.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Verdin iMX8M Mini UART_4 for Cortex-M4F
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

