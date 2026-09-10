Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92AC64AA1CC
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 15:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054691; cv=none; b=RdMcwnH20clCt2ZklFlMlJAi0530kSA36lq2GvcrbmAHkhVp3mIrZE1iNexz/uixeYXNb3J+n5bfom8nQjxo7Ti/rBuIFCuwtRHnwQNvBFo8GvE2/Uo1G2I/sAVt3VqVjj6bp0MYB8VECPLi1bnyZnCToewM/sK1E3KbQAaUbYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054691; c=relaxed/simple;
	bh=gzh2q+u58cFhgRp7gV46O/Wa8UfTHXxr/Xs3h1IWYJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZsNTX0ShSzyMtBohPrBM30DL0YPz+pwIK0JKbWMzZTLRRSHLWpeQdhXXw/H2nipaJQlnZFWIBKC8M0QKxhlh/cCTy0Jw+EFNiCJDpWV5AnLSJnXb9FNoF1gf+9CPiedHCehxz4eNV+9XENPX8prUkDes6xPlh51CmvAUsN1qaOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GpaWFmLR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GpaWFmLR"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so83090455e9.1
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 08:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789054686; x=1789659486; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NaPp8HoKKF6sxkd9LUTX+PGTrCWY5tm9shIAUpEtxY0=;
        b=GpaWFmLRfml43eTWIA+4qwYRB6iI0H2D37ckVk485xPhCWHSyuegORMgn38reDkbNm
         Gcgo2UVcboyKR/LS1f18PhaU+rkT/hKW5lut+1HnDbH0vCOzyWO05w3440qSx4XMFQ9x
         ga8p0jYtTm4bgo6zh0anc1/KITsh1CNLQZ6t/GRDsAaZ0X9Nm67CuFTfUwdIV7tstfpv
         hAM8dTIYluJuyjxiJqZXOwrMiHN4QRl0Sj6FuObR0Bg/WekbSlI8OK1bXqoLaQoZrnj9
         Ii7g36dp3gn1EKkulKwn0KEcsjPnIB1SudvWQ3itG9eGBRPxnugrsbFOYHDH787o/LnV
         RcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054686; x=1789659486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NaPp8HoKKF6sxkd9LUTX+PGTrCWY5tm9shIAUpEtxY0=;
        b=deARuMGKtSYL7dqWetHjdC7f4A+DiIixOOCeY1dGUzx5U6SSocEIfXW5xfsz2nZFGZ
         FXrP0SHzOD36CTmaLEB2X7WUA8PnyBJvQX1dAvR1khd0KjBBYIHc7Zt/gXL4MHz3xyiP
         8xjvpqGsq5fZkVnHb/4Yv9emvKqCf52au/Q29KhAVfkJFdvQtKYwuSE4J37ZRGUaA2ts
         iCrXt0AuyPXW62h9KDFhsObqoQkP/fFB0TinU0VBp/fizNEbttuL4p+nCmCbgY80ff7w
         nqyqZbUMyIFz8HE5SOkQGSKtJ6hfZFvrznvJGgAPOuFoR3/SivjAPG5XuprY0dpSym3y
         +ajQ==
X-Forwarded-Encrypted: i=1; AKwUvBwsoLIwTGQDBO7zPwLRT9a9R2R/Is71vXhRg7rnR1B2497emj4crHKrfZq6w/Z/BB0JRUiOm1QtvlSG@vger.kernel.org
X-Gm-Message-State: AFuF++l5b2MX3eWOVsS3eGW5exFLQVCi0tYbt3di0xOAhps9ST389s+G
	exddVWRb6des7EumyDxCB7/gT8iAlLFA0wlGmK/0vnjC8PzzHI68q3dF
X-Gm-Gg: AYBFou1q6V8nnvmhijsaoRHIGv5cjV2KNpLrbzgVry1arqnWxWAp2YvBhpGrOtR6w7i
	YYnanY81uepW3lGpJJtDhW7Qby3ELvmCRJAXN/J1CRl2/yRkZnhZ/VyMm2oVyEhit6Unbmil7CO
	kQh89VTBGPcv63IRLsWaOaEjOAkmtfZz0Rn9QXZDpvYT33xBcfijkyD4gtT84PQcsrcsSjido9+
	CftcjiCqQCYS3s7zkz8Xt9JI0NJ/o+FXMU+avvgHLtVlcbjM5smPQ9CVxHISPxq9nTwGMAZkr8j
	EXqRSpoExp4v7irgZ4+wEbYDMGwRxsWmzYdcfCmCl+sfx2TTgMWWF1sVWjOi13Afr9AWDS/PONn
	d/n1Cv/2q7IQSAEt+BO98OfuqbhyzvgefFfycRzqFbdgxH3WiCmVKMEIEtz92jT1ti/3+NuHnqU
	sJweZVtf0xhKa4J+Ac48y+FYkNTucM12mgNkkHT/v1hcVqsoN4FypfXyehKJDI3697kKoaQZLpp
	4MUQ6lixxVMafMcP9LbvT5lJB6HCNrg5PQAEfPPiIjqQfzAk/M8+yg8a/1yRR5VwUxQnWZa9QC/
	/3ca06dg
X-Received: by 2002:a05:600c:a49:b0:49c:fc6c:be0c with SMTP id 5b1f17b1804b1-49cffdc3823mr348668065e9.18.1789054686376;
        Thu, 10 Sep 2026 08:38:06 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm3390545e9.14.2026.09.10.08.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:38:05 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 10 Sep 2026 17:37:58 +0200
Subject: [PATCH 2/6] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 UART_4 overlay
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-verdin-imx8mp-hmp-camera-ready-v1-2-3c9349ecdb9f@toradex.com>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
In-Reply-To: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
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
index ca4fec7c1038..8b152903b4b1 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -734,6 +734,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
@@ -742,6 +743,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
@@ -759,6 +761,7 @@ imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-dahlia.dt
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

