Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F18847D465
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 10:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799733; cv=none; b=GtcrUJCc9ZRGmMuEZGH+ZPVqJbTFfz5lgn2K68P33VqJ7HrxX3cM67Fi8V9VeCmL3uCHvNe68ksjoxisdPb2Ut5+gJY9A8vqjjwQpubc+6o3+euynOtlQhgrPTGiwbauJUGedsNm0wV4jAD4LL/e6Nxv5YAfYXrEYANshPhhSEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799733; c=relaxed/simple;
	bh=0rN2rnpmRHjfxJ1MKpGeARtmMxz5upQQkXUeW18qSVM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F88hfwuRlpVjsVL1u6rACfmNb+oN6Dnz9GOQ3MW9Dv24Ai8vQuEV1DgwNTEJ9UmWB/Y7ZRH78jP14Asq/sKOAiKeF3DHt88/dsSFv4c4/thpDO76LGio0j/g1EXkwi8cZKh8YMbZ/IcL6pYh5+ybVb18oH9AzkBH1INd+U4Eyow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxWw5EsB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxWw5EsB"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a01933b584so14760985e9.0
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 03:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799716; x=1792404516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uiTeXl+x5pBEWbWX0P2zjZwUjWiuBSWxNfYNiAcr74U=;
        b=jxWw5EsB2vw2nDvDwVmFdokiEkQao/oMzaEKOdboR3+VkKvq4hrEAY3ByNqJ8rJs7a
         ThFg7YTwcaBytoauxpuyNd/MN2oWvBtPAxrQfrMZqHVC0K6OO0cax3EaUZr7NYXSlaKH
         GOM012Xc9izhd41Nnisdx2t2zjj47pqcuiS1XC6+2w4yDORV5HJO3srrQbcLUyPC1BAi
         RSPZ7Be6116t4Woh0kdPNS+zVrYbMAqzAb5GiBKuHMdqLmYITdNuanXj4P5xDakwzsbo
         pFt7QarF9qM4BXASD58kiRQX4Urkx0BRGP3sYA2QZS1bfOOkD17wlo6mZ5UCUm6zIYr3
         9Qqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799716; x=1792404516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uiTeXl+x5pBEWbWX0P2zjZwUjWiuBSWxNfYNiAcr74U=;
        b=f1uHsN+yZFKMl514oWogcfL5Vui8u0T/Ex/421Xu0K06Vn6cqXAbalA+DSC59vdUb0
         SvEz4LqCrYr3yYw8s38KfSizNltT1rwdlb2dy+oGwROdUS9cESjYDCZQd4AN7shOAxFX
         c+PgT2SUjeYnW8pC9IRIxjj4dYW0WP7IKioj1UbWtHO9Xyfo4LWzyGrDnv4Y5QqhciIq
         qjr5NDJgdw++9brPR7octndq6zbzE1PzcQGNYk++82gyQ7GqXokjMT1BFtUoaodEygpP
         YxOAgISMz+h+p8kaoTEqitTBijHrzANSinEuKX7Qc80eVJAzF9jUzyDeY2jHYNG4enUC
         5xsw==
X-Forwarded-Encrypted: i=1; AKwUvBximgr8/+H7xFRdQgZUriXTMwoMLitlMjK1rPk0I5R6fmBl59H8Am3qIQRHyDeAjZVBvsJhRHLtoxBs@vger.kernel.org
X-Gm-Message-State: AFq9FYIPoYGsE6iWMZUyQx22PwWS2wXvWILazeQNlOO+aq3gSkxsmB/f
	1QbfjznbIPx3GjUdYOMle7mpuAI4HDlFtOkCG8Tc8WfNXAPvJWGjN0FU
X-Gm-Gg: AYBFou03pR0KPXhmP4/X7MviS4sQCKr1zF+rkKf3cYV8W9um+EbutN6h6fTkHgK4MID
	dveLEWdqdtb7HNFzk1cJDTV/oh7Gq91skceDvbtmxwPgW4tYIct4c1UPKvt+FrPvvLYxL4E7Acp
	DQom+8INjvUOeQUShfCnwhM903OqOLy9gLOC+4T/y+eCbcJ17v4tlTDlaP4PEtzj/2NpUVkHQG+
	Py5+39s0tqGJkClZuFTbL+DH1NczPeRIvvmNlNw61WNo5B5eJ/sjjnEQ6P+9jGtme4hp1bVJyJf
	uolCgNBa0stOg9uRZJGkk884OXYN5GljjgE6A9E/P5pqBILL4wyR1WZjM3MGMXc9fK4G84GwqAP
	b47c/rMN+EmaJ4EUTKGBFKGVcucBdAue5mESVFtWJMSwdw+iqSzSrBXMuLubDhppuHG7hwbimkZ
	EV/XZC7abYu1Hpgjd93a5dXKw+X4RkZq5Wo71zfL4Z0VJdFennBW86/6QObZqFLXP6Oc5VFZJXo
	7y1E3xMX7KoRFE/oAk7OQpNrHQfV0kH
X-Received: by 2002:a05:600d:8488:10b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4a190780997mr105769955e9.31.1791799716489;
        Mon, 12 Oct 2026 03:08:36 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a192d3efb6sm166229885e9.1.2026.10.12.03.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:08:35 -0700 (PDT)
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
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v4 01/11] dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
Date: Mon, 12 Oct 2026 11:08:06 +0100
Message-ID: <20261012100816.331033-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261012100816.331033-1-pmazzini@gmail.com>
References: <20261012100816.331033-1-pmazzini@gmail.com>
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

