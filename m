Received: from mail-ed2-f28.google.com (mail-ed2-f28.google.com [74.125.228.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A7D49E5E2
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 20:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791232090; cv=none; b=L/LFK8Ip1IO/6G5405PCfr2286pWqlb+FKI16pSUige4SIJksL0t2Qx+Ka0+hBAEQnuZZF3NOBi7lxxyE4SkgZtRqhyS9IJgfFf7rVCVcHIg/5yGtrVGmGaI9lWd22OXTn2XWkhOkhk1rB0LjJ5UFHQdfBmMuKrJGnNbugvQBA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791232090; c=relaxed/simple;
	bh=0rN2rnpmRHjfxJ1MKpGeARtmMxz5upQQkXUeW18qSVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cpXAOD3C+ukBKxf22/hqIIijb+gtKKH2DWnigwtX8vn9cdRUXdahlCJWNMKHRCIHY3AsCCnV+alLbI1WChuXxRs0wMo9GcyFffFwzMVezoEDtpBl03IxZKHL7/5ysk8VROOhehA2skMUWBscTKdPtQ6hWPmDqSpOe08LKpc6+hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OyIfk52I; arc=none smtp.client-ip=74.125.228.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OyIfk52I"
Received: by mail-ed2-f28.google.com with SMTP id 4fb4d7f45d1cf-6afb7d4aefbso3270669a12.3
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 13:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791232080; x=1791836880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uiTeXl+x5pBEWbWX0P2zjZwUjWiuBSWxNfYNiAcr74U=;
        b=OyIfk52IFZIwUIcn4NvGS3pD48IQDlXGAleQuYmrNlAXkXIq4lUqVQwQmK4+JKxyJy
         gQTrvvAWiJG5hya85lL9Y00c1rC4lEGi8/XTMVOb0Vh3P9x6k29DA9VKhiH5PgbCXctn
         d1Mps2y4WBkog6AhV20GFWv7+MiMHSt6KUr56ObabrURg7S1cTUDlhu77I7BTLGJ9g01
         XO8wh+k3HjLI5FqjGmRrxXHVQbzrxWVZEfnvXd9xLAFSB38IZhi5e0ifokFQKaIl44yo
         BkrUmj/wpzuF4fsVHyT3ki9hhfrZv7Ac/E2LHcI+kk1yoTvZ8kpKFOz397c6TPcKASNV
         lBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791232080; x=1791836880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uiTeXl+x5pBEWbWX0P2zjZwUjWiuBSWxNfYNiAcr74U=;
        b=R9hpIUoybQ8X7SGznYC+IvCWQJyVGJDtDR3cwm5xfQQwpdAczYzsFjanUWkbRfmw+1
         rrTQcyGBJyhs54fhuE27KAUQL8BRVUu2dYxLcOm7NJ9sW/KisWivWHWZ/5vNJZPeUwHR
         8GRgjzN26lpACXiR9QDCwmtGj9CDRHEMTHaiDItcOzxmfSbTBUQsagIvqt2HpxwIqSJv
         nJFY07AYDrPm3ouFlj3HqhhBj6Wa8BS53mka0uqzKjDE8xC5pJrzMKH7ln+n8M9flwPr
         taXMA1g2ZRCa6LKTueQ7OjwWBhnAXwOjnHBbk3G+uou7fbVU3XT9QZyIE+RjH6v1QtCK
         2Jpg==
X-Forwarded-Encrypted: i=1; AKwUvBzbwwfd6UOrRFt7hatA4kIqDZshIEUIVt+qbEVWxAY77L8bUHc2cRSVks27AurX90XegsI4RR6iSEuL@vger.kernel.org
X-Gm-Message-State: AFq9FYJF1xJ6ftJnb222Zu6RtcLGoivLCbkjkrpDRtFSqClKb3umI/cz
	UypJmrWc+dhlE2tm9pOTjLO+d5+wQ9kzEIKoeKyFPgiD5tWlZojbrDNy
X-Gm-Gg: AYBFou0uVRNS0oeNDkBYw1O4tVqu2EbLW1zOiFpWo8FrMNdG/0kKPwoJfCKjkY5eAVv
	qVtIoPrTzPlVphSYb0eNJuQGbWraemARQX3A4jx0eFOgmJ3iH7PAwcBDO4A8GB8Y9BsQfyonLBX
	FdQF5RYgV+BhQIACk63iDXPi8X+9Qsm4b06Rnfuokf7Giu7m5YLMiIismry0uWdapBnM/hgyVHO
	GRu3pUk6N3BHVX5s07lReuGI7+3u59oGZZDjbzeTulTw8hbDsFN30MxUirhwVN4lvcJ+7PM38Jd
	x2v+mSeX4Qy5IcbGqwu5ukcEAFF/tsU6pcwJY1OX04kGWnUZTHinWzzYfJRXrLtD9Y+rOT3dY3n
	xusz9a/Fc+MOTjB3wT8Jz1o+vTIq65sGE8NNDrUxTIFvzhtKxut5+IlD3OxVJafy3nRgTBHNVWR
	Qx4qsriD0cj+8mwPf0PQuILKdtzQyvaEwqBwWQ8WUQQXfa0vaRUnL9OzOs48Eg8tq2NjiHD1fgY
	Bft2IY+fwAcMMaBkupz0h5Rs1ez7lU9
X-Received: by 2002:a05:6402:2552:b0:6af:80c4:8960 with SMTP id 4fb4d7f45d1cf-6af9e33e8a0mr10203450a12.26.1791232080254;
        Mon, 05 Oct 2026 13:28:00 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6afb01e572asm3801024a12.13.2026.10.05.13.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:27:59 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 01/11] dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
Date: Mon,  5 Oct 2026 21:27:21 +0100
Message-ID: <20261005202731.153971-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005202731.153971-1-pmazzini@gmail.com>
References: <20261005202731.153971-1-pmazzini@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book readers.
Its CCU needs only the two oscillator inputs, so it fits the existing
schema without changes.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../clock/allwinner,sun4i-a10-ccu.yaml        |  1 +
 include/dt-bindings/clock/sun8i-b288-ccu.h    | 82 +++++++++++++++++++
 include/dt-bindings/reset/sun8i-b288-ccu.h    | 45 ++++++++++
 3 files changed, 128 insertions(+)
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
index 1690b9d99c3d..cc3f62d3554c 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
@@ -28,6 +28,7 @@ properties:
       - allwinner,sun8i-a33-ccu
       - allwinner,sun8i-a83t-ccu
       - allwinner,sun8i-a83t-r-ccu
+      - allwinner,sun8i-b288-ccu
       - allwinner,sun8i-h3-ccu
       - allwinner,sun8i-h3-r-ccu
       - allwinner,sun8i-r40-ccu
diff --git a/include/dt-bindings/clock/sun8i-b288-ccu.h b/include/dt-bindings/clock/sun8i-b288-ccu.h
new file mode 100644
index 000000000000..c9b9eaf979ad
--- /dev/null
+++ b/include/dt-bindings/clock/sun8i-b288-ccu.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+#ifndef _DT_BINDINGS_CLK_SUN8I_B288_H_
+#define _DT_BINDINGS_CLK_SUN8I_B288_H_
+
+#define CLK_PLL_CPUX	0
+#define CLK_PLL_AUDIO_BASE	1
+#define CLK_PLL_VIDEO0	2
+#define CLK_PLL_DDR0	3
+#define CLK_PLL_PERIPH0	4
+#define CLK_PLL_VIDEO1	5
+#define CLK_PLL_24M	6
+#define CLK_PLL_PERIPH1	7
+#define CLK_PLL_DE	8
+#define CLK_PLL_DDR1	9
+
+#define CLK_PLL_PERIPH0_2X	10
+#define CLK_PLL_PERIPH1_2X	11
+#define CLK_CPUX	12
+#define CLK_AXI	13
+#define CLK_CPUAPB	14
+#define CLK_AHB1	15
+#define CLK_APB1	16
+#define CLK_APB2	17
+
+#define CLK_NAND	18
+#define CLK_MMC0	19
+#define CLK_MMC1	20
+#define CLK_MMC2	21
+#define CLK_MMC3	22
+#define CLK_SPI0	23
+#define CLK_SPI1	24
+#define CLK_SPI2	25
+#define CLK_DRAM	26
+#define CLK_DE	27
+#define CLK_EE	28
+#define CLK_EDMA	29
+#define CLK_TCON0	30
+#define CLK_MBUS	31
+
+#define CLK_BUS_THS	32
+#define CLK_BUS_NAND	33
+#define CLK_BUS_SDMMC0_BUS	34
+#define CLK_BUS_SDMMC1_BUS	35
+#define CLK_BUS_SDMMC2_BUS	36
+#define CLK_BUS_SDMMC3_BUS	37
+#define CLK_BUS_SPI0	38
+#define CLK_BUS_SPI1	39
+#define CLK_BUS_SPI2	40
+#define CLK_BUS_I2S0	41
+#define CLK_BUS_I2S1	42
+#define CLK_BUS_SPDIF	43
+#define CLK_BUS_DSD	44
+#define CLK_BUS_DMIC	45
+#define CLK_BUS_USBOHCI0	46
+#define CLK_BUS_USBEHCI0	47
+#define CLK_BUS_USBOTG	48
+#define CLK_BUS_DE	49
+#define CLK_BUS_EE	50
+#define CLK_BUS_TCON0	51
+#define CLK_BUS_CSI	52
+#define CLK_BUS_ADDA	53
+#define CLK_BUS_SDRAM	54
+#define CLK_BUS_PSRAM	55
+#define CLK_BUS_DMA	56
+#define CLK_BUS_UART0	57
+#define CLK_BUS_UART1	58
+#define CLK_BUS_UART2	59
+#define CLK_BUS_UART3	60
+#define CLK_BUS_UART4	61
+#define CLK_BUS_UART5	62
+#define CLK_BUS_TWI0	63
+#define CLK_BUS_TWI1	64
+#define CLK_BUS_TWI2	65
+#define CLK_BUS_PIO	66
+#define CLK_BUS_GPADC	67
+#define CLK_BUS_KEYADC	68
+#define CLK_MMC0_SAMPLE	69
+#define CLK_MMC0_OUTPUT	70
+#define CLK_MMC1_SAMPLE	71
+#define CLK_MMC1_OUTPUT	72
+
+#endif
diff --git a/include/dt-bindings/reset/sun8i-b288-ccu.h b/include/dt-bindings/reset/sun8i-b288-ccu.h
new file mode 100644
index 000000000000..675145654548
--- /dev/null
+++ b/include/dt-bindings/reset/sun8i-b288-ccu.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+#ifndef _DT_BINDINGS_RST_SUN8I_B288_H_
+#define _DT_BINDINGS_RST_SUN8I_B288_H_
+
+#define RST_BUS_THS	0
+#define RST_BUS_NAND	1
+#define RST_BUS_MMC0	2
+#define RST_BUS_MMC1	3
+#define RST_BUS_MMC2	4
+#define RST_BUS_MMC3	5
+#define RST_BUS_SPI0	6
+#define RST_BUS_SPI1	7
+#define RST_BUS_SPI2	8
+#define RST_BUS_I2S0	9
+#define RST_BUS_I2S1	10
+#define RST_BUS_SPDIF	11
+#define RST_BUS_DSD	12
+#define RST_BUS_DMIC	13
+#define RST_USBPHY0	14
+#define RST_BUS_OHCI0	15
+#define RST_BUS_EHCI0	16
+#define RST_BUS_OTG	17
+#define RST_BUS_DE	18
+#define RST_BUS_EE	19
+#define RST_BUS_TCON0	20
+#define RST_BUS_CSI	21
+#define RST_BUS_ADDA	22
+#define RST_BUS_WLAN	23
+#define RST_MBUS	24
+#define RST_BUS_DRAM	25
+#define RST_BUS_PSRAM	26
+#define RST_BUS_DMA	27
+#define RST_BUS_UART0	28
+#define RST_BUS_UART1	29
+#define RST_BUS_UART2	30
+#define RST_BUS_UART3	31
+#define RST_BUS_UART4	32
+#define RST_BUS_UART5	33
+#define RST_BUS_I2C0	34
+#define RST_BUS_I2C1	35
+#define RST_BUS_I2C2	36
+#define RST_BUS_GPADC	37
+#define RST_BUS_KEYADC	38
+
+#endif
-- 
2.52.0

