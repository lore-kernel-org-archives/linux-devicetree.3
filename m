Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794153498;
	b=YFfoHFD1gGrYt/xYeW0UdYH8SVIJ3ZDja/3qd0dzHf1vPnh1oLfFsJJiiuGkq6DFdNFT
	 nUz1XqNC86CAe1Tu7qJgqSbBaWxL/4AOoHlnBSPRRpyhDA5a6vEisPxhvTkEPI7qCM3If
	 LWtAKroV9K773oregzcUl0zwOQfza1yADhuIgpyK2KI/wohElSYEIuttMftm6yjhsUj5F
	 h/c6TYQeUQzzG+YrvVChV+a35XybBFiFHbxTo9wjWqSW0tGsd8b8pQEK2o+d+CMHz4/Gr
	 zADFg/uoyp+fV4IvfhO4x/Qr6JfISQ2cQrEiA6WnsyIaalhCpHpK7lV8a9uTBV4csZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794153498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i1WY2bokB2/Ue8Pd5z/j/FUW7ky8/bU+qddAvCVhc7E=;
	b=HoYGfXbLVIVelIRsHKslJsQmbBdXi5IbwMfD2a+rlYnFMhWlkkYS8Rx94ZY20BQFdyN1
	 B0M4z9q4u58yk0ORUfJhphsgFvo49Dek0dL1qbDKmoVAzeqismRRLQkfNFQ5nkyj9og0M
	 mnnag3xnYxdm6c6CsrCpE6jHsYoZN/hExtZ1jovz21ETrqpLdSdZ8otQyHCnDPqLtsQjs
	 gkjLYSeQMpGU+3IjXhex2Zr56npXA2j+mX8TH/fJG87IOs7uAK5JQmjgfAIHVO+y8LB5E
	 T3H+R7XrkJlV0K5pf4OyJnolNbsuwx10WKgvlfjNt9xkeNV+Dg+0aDbQMs9Sg4s/Weg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CwoRs4oL;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADFD606A337
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 15:58:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ADFD606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CwoRs4oL
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490a0e72588so66542f8f.3
        for <devicetree@vger.kernel.org>; Sun, 08 Nov 2026 07:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794153496; x=1794758296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i1WY2bokB2/Ue8Pd5z/j/FUW7ky8/bU+qddAvCVhc7E=;
        b=CwoRs4oLWMe5R4pidBQdbIYJ2mj15XehI9uLwk+DUYoLnnUEeV1VIP+H895U0nRhwQ
         rZkjrpbjUXQhHzKYxTh13yMozmItutuQsP7AI1oVk+XCtHOo53hZKRtUQpfz/bod5zti
         +r6wk8+XAbamHXUbmKx15XtTBEZ0terS/3HphyDt1B/3kfpfEjB6YOWsObCO/kFcAs8N
         VfJK/UAmnPrrE6Clm/LCS9rFZnimb+vha/02OK7ImRrUlynJ4t3+6gLBS1NbNhH1wKHI
         dIY85GyZroCELHsEovcA4eR1dkO5Zy9sBVCrrzYiiSm+ig9fWGnfoqvQURrYp47KomiP
         dRyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794153496; x=1794758296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i1WY2bokB2/Ue8Pd5z/j/FUW7ky8/bU+qddAvCVhc7E=;
        b=I7ohenk3uhRPfGZRS9dd5yZ1wUdjb5vizSXyRYKEfTYHQysxIatTmrOuB7d9miSwll
         mPQ9gxLj2pKUF64HSHA7ZArFRnDTQZEgmO4M5Y6pfmeFNeAU+X7Txvl9EYlcgjuomN/E
         X1zQmJ+iY29hJZCppUntkh7PN2yxCcYCEryu3Xlos4xbdeCsUCcrOk/haNIHBBhf3yMy
         PvojigZ0wIefcYq0Z24sdo4K+qNhDfvEZMTanyMzQNHRSg8yfGjeXNcQrWc59a9zUED4
         7OZC4vE4aeXqDptzSGBKOi+hKu9Taoxf46LDx5RazMf6MBXw85GlzsmrGffL6yMYK0av
         2KpQ==
X-Forwarded-Encrypted: i=1; AL+hErEv75cas+YvH8N1XO3AlFIqtlg2WDYes/w+/ZHhuSQHcS2QG4BdL+U/1yfHOw1I0dAcAw676BmqdJNb@vger.kernel.org
X-Gm-Message-State: APuU4Z9XFUQ7ZKnUm9m89B6rtXLYHOHVEBQ2VCeq/2pF4ckBdu5v9MdB
	ZM29qhJtkFWvB3cR6Fp6Nyg5meYiv5b3Q8kINndD3yAjKSae6kdxNWJH
X-Gm-Gg: AYBFou1m3Jx/fRyBQET+uQ22mGm41ykXfghGp4WJ1o8iBI1PRtIU5dwLFdRPvbudRdQ
	4Fh0x+ZYlHXjITqNUbwwxyiJENpnAKo3G0JUxL0kl0f6cC9LOuLJoWOT5JmZ7PCELGxwWLO/sWr
	wm8akUXRG4Q5t/CViG6os9pQ9AJB6BuU1sglM6Zeu2LZIQXiM/B1VyByos+3BKCVJlJvx7LPrad
	nXhgWSx7oG6aD+LRgxnGKa5GrrITjnyGP2l1wfJKcpL8P9pX8hXXNqMMNkSaJaEntO8lS3BsT/t
	onh6kWgAxSUPH2URG6DjX3Ez4Rc9Vm8j6OWBjm7RsWQaQ73E0qslfbHYKFzkVcRYHc5N8VlJaNr
	s/97i9jx3AynVAtiKqljvy2t0p5ZqEFJvTf0qbY826L4cwwxmklxzBAB94DDH4GewfOb1Hwc7lM
	jL2rKRO7aOX4aNWvXPAfM1p2Y66MQRBO9cxnbJ+lVMOM0gV4Kwpn8IfedJaiyN6gygjyjRGc1Zk
	oqPtqqNHRTIxoM8XkSVme832PBayjv5s+5n3QQr/YBR5Ip9HZKk5ufcKZfa3pDo1t7+h3QesknL
	iv4l6aCa5yYP30ji82q1LBy0U4H1HvjyY65lTVG4rZnt2vboZo2FMi6dU48MFS0=
X-Received: by 2002:adf:e199:0:b0:48e:84e8:88c3 with SMTP id ffacd0b85a97d-49580830930mr2975816f8f.5.1794153495753;
        Sun, 08 Nov 2026 07:58:15 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-495966f316esm4753282f8f.17.2026.11.08.07.58.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 07:58:15 -0800 (PST)
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
Subject: [PATCH 1/3] dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
Date: Sun,  8 Nov 2026 15:56:59 +0000
Message-ID: <20261108155702.361022-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108155702.361022-1-pmazzini@gmail.com>
References: <20261108155702.361022-1-pmazzini@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book readers.
Its CCU needs only the two oscillator inputs, so it fits the existing
schema without changes.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
Moved unchanged from the B288 series v4.
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

