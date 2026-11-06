Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953840;
	b=QMC7PcZHEmQ45OBNBbt2a9BtF65cYRZR+MgEfA1FCVgM0myNzTfM+jpvYq7A9wUcrIOI
	 DmzdeKZ8jHyFm8ZCNhf808DDGW3Mo+7Y95a8/hNJ9IioUA3k0LrWTJI0efDvTk3NntTSc
	 mT3WXhf64YtKj54VJC51/eem6OUSQJCPbJyN4n8ijvnu7PX7yiEx5BGklh22bHGDCj+Vg
	 hXTm8egS6zCsbHl3ItFk1iPU55LDt7yJqKDsO9n4rdMRVVUxtzTodQy1AUdw8BNaQe384
	 qEEsNVOgnvBur7DIQQUtb9eTqFfhAsF50R4a/T9YztrHe+w9r/B+owXc+z9MOGkK1ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953840;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=sUwgE7umEstB2AuKdIc5+gCPN9cVvjjoRM3ZlqDw+SU=;
	b=iB6MnyOUyUUXx+VTZZ8zmyxuiq8TzTfvKhdmx9RBKHA366gphd2Etum/jvS/z7Dupis1
	 5MojHmdE7q4KXIhpRCTKvmRnaEMILcayDYI4QUPOZOFz4WeKtRTQyua3/r/Sclp+z595r
	 0lxhSIFKS5/oIvqjuX71raPHI8PEGGqB9pQN+1dLPuouJNBI7QEbW7w0BC7h9oFgyvL9j
	 l3dIkfCHknJqhjsFWaV0QcrK00FBZE+bxbVJD7FcH+JB8NI+ge48xCJUz/EHgtQ9YC+Yq
	 GviqESFwLKNxNGO3ZhK6loCNIpDqVjrdfIcSHjtTPjFyM69j0zaL/4ph6YaUDaBe4Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GzJBV7xr;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7467A606EE83
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 08:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7467A606EE83
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=GzJBV7xr
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so2234575e9.2
        for <devicetree@vger.kernel.org>; Fri, 06 Nov 2026 00:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793953838; x=1794558638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sUwgE7umEstB2AuKdIc5+gCPN9cVvjjoRM3ZlqDw+SU=;
        b=GzJBV7xr/1V4jgH8Y+pnEN2YVXgLgF5PHBaSjoKhw3a2gJOxIx9H2EidNc1yx6h9F6
         8olp3oTmXni4od2oVG6f+GvZHbkJRqtDD9C94+sjd/HFwHf76f4qpWXV7a4TdsZKHPnn
         dBJ9ORY5H/EmuEAxfLePuvts0M4YkqPCC1L0NzStW9rGqI0wkvW5YP1laWa0slTycdQ4
         teRvR0nEbj9i1NslHIUCcp3iwd+a37M+XLsCePJ0kKJnEE/Mb0GgvjLGeAUj+8OD2Q0x
         jp2WPoEO2cttZUmgpUt4JWy43W4sQYGwraoelN4aqZAfnA5IF79gts9Nzvf0ku4jA6yo
         n81w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953838; x=1794558638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sUwgE7umEstB2AuKdIc5+gCPN9cVvjjoRM3ZlqDw+SU=;
        b=1VV573aQo62NE0IK1RsecjvQ/pCAwqP0z8P1g9ewr4xkEbA8g1dP2RLRa02Eg9tjCo
         DMsWbY2A+ysBC7s+oCSInL3y1Nvffza8lUPly203ccbCgWIv59tvR9zohwk4XdIA7xCj
         lrRr9xKycCMb/DjRHGfZkiVZKj1p6Qk2sPA34AiZj3NmggKYnHrlBZolOAyzx/3eImVr
         Cwh/VvyVmWS8x3JcKkY7aZHnIM56ppc09PcUWldD8STaTN5BK/75ovgmVQf0WD97ktJi
         NAM9WR13u+DQnv2QyD/Qt6AJ4x+jpZAITuTW6UsSGMk8MOksL5oVAHvNy+gTYudODSdU
         G31w==
X-Forwarded-Encrypted: i=1; AKwUvByLZ6PxxinFI2xMWhg5svFZ6wqSM3RP28/UOcG+1C8RtZDYjXht0s3noLJo8vuuxon3NqOEZrh3028o@vger.kernel.org
X-Gm-Message-State: APuU4Z/kFPVMlar0JQS787iOVUosNLicDVoVzKg+Oxe0gEzFgwa7D8mi
	dcLvYS8txrraTNLRNxBCYe3jCd0xxGfuwLlHjRr7/Dwj12tWX/zBLw6o6kM8m0DQxxc=
X-Gm-Gg: AYBFou2oTW0GoUrC587PIXlvTsC4u6hVyXlbsz1Avg4d6HY/98DoOWNDk73qJkhVNVA
	HAMftWRSzd+KqyuhaPaWiUQk9JkP2S8OWtPtdp2TiERiqZt7cnZkIZNLi/9uSEVdaea4IvyEVHG
	s7TTdG1/ev5uZhoZopfUD4TeHekV4fGedp/Km5cCbxMvsrMVD6iqJfcMpn+eWGzn/JykCfmZF16
	0OKumykTn3Xss5UtbeYlJdakLS7txAAzJO021YQlww5zsp6omzz5KszXJiI8wh7Vbkvgl4248bj
	/aeeca3rzWw1DpttmUWBW8EPc023/oV2d+gMepV1BK3QNIIc6RowvSB5VHstJD6K6nqKO7vlE7x
	owLQr0LbjZYqNxzTeKuX0zyqn4dlhxoHJevyc7e9SwdxPGWtkIykKa1h6moa9+bUsbXbfaVUjv1
	WhzLjdKgxSfkTBiJkrNWtTalhCTubbWZw7+WEtKYZMuPwsfIc6jYZn876Pu5Ww4lt8yzg3Rv/RZ
	VLGkjAdR+v+crBbcO/eOS+B/L3lwHS3b6R6ry5kbxSHbPdo3RqfudkZ/d1bewqQTsq6wtPvL5qg
	OBvwvot9QSqCqlGfPfm9dwvUKpJTH+XE/a+/0WAsaFcN800eGv/O/yomsEjHy7fSIUSLCPXD8vK
	QkilxMFNUbbHGIadSD4SG8xdylhpT7OOPAUI4rwuUQMeS2Q==
X-Received: by 2002:a05:600c:c4a4:b0:4a1:f736:79f3 with SMTP id 5b1f17b1804b1-4b6de4a7678mr23607875e9.5.1793953837813;
        Fri, 06 Nov 2026 00:30:37 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm2366839f8f.58.2026.11.06.00.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:30:37 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 06 Nov 2026 09:30:28 +0100
Subject: [PATCH 5/7] clk: amlogic: Add S7 PLL clock controller driver
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-upstream-s7-clk-v1-5-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
In-Reply-To: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0

The S7 PLL controller provides the fixed PLL with its fclk dividers,
the GP0, HIFI0 and HIFI1 PLLs, and the HDMI PLL.

Add a driver for it. The GP0 and HIFI PLLs are expected to run with
their input divided by 2 (div0p5) and the HDMI PLL without it, as the
firmware and the init sequences set them up.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/Kconfig  |  14 +
 drivers/clk/meson/Makefile |   1 +
 drivers/clk/meson/s7-pll.c | 648 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 663 insertions(+)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index d460514bb8a1..35f2971448af 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -229,6 +229,20 @@ config COMMON_CLK_S4_PERIPHERALS
 	  Support for the peripherals clock controller on Amlogic S805X2 and S905Y4
 	  devices, AKA S4. Say Y if you want S4 peripherals clock controller to work.
 
+config COMMON_CLK_S7_PLL
+	tristate "Amlogic S7 SoC PLL controller support"
+	depends on ARM64 || COMPILE_TEST
+	default ARCH_MESON
+	select COMMON_CLK_MESON_REGMAP
+	select COMMON_CLK_MESON_CLKC_UTILS
+	select COMMON_CLK_MESON_PLL
+	imply COMMON_CLK_SCMI
+	help
+	  Support for the PLL clock controller on Amlogic S805X3 based
+	  devices, AKA S7. This controller provides the fixed PLL and its
+	  dividers, the GP0, HIFI0 and HIFI1 PLLs and the HDMI PLL. Say Y if
+	  you want the S7 PLL clock controller to work.
+
 config COMMON_CLK_T7_PLL
 	tristate "Amlogic T7 SoC PLL controller support"
 	depends on ARM64
diff --git a/drivers/clk/meson/Makefile b/drivers/clk/meson/Makefile
index 56b04254eb1a..9d439106d11c 100644
--- a/drivers/clk/meson/Makefile
+++ b/drivers/clk/meson/Makefile
@@ -28,5 +28,6 @@ obj-$(CONFIG_COMMON_CLK_G12A) += g12a.o g12a-aoclk.o
 obj-$(CONFIG_COMMON_CLK_MESON8B) += meson8b.o meson8-ddr.o
 obj-$(CONFIG_COMMON_CLK_S4_PLL) += s4-pll.o
 obj-$(CONFIG_COMMON_CLK_S4_PERIPHERALS) += s4-peripherals.o
+obj-$(CONFIG_COMMON_CLK_S7_PLL) += s7-pll.o
 obj-$(CONFIG_COMMON_CLK_T7_PLL) += t7-pll.o
 obj-$(CONFIG_COMMON_CLK_T7_PERIPHERALS) += t7-peripherals.o
diff --git a/drivers/clk/meson/s7-pll.c b/drivers/clk/meson/s7-pll.c
new file mode 100644
index 000000000000..2aa253a5f211
--- /dev/null
+++ b/drivers/clk/meson/s7-pll.c
@@ -0,0 +1,648 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Amlogic S7 PLL Clock Controller Driver
+ *
+ * Copyright (c) 2026 BayLibre, SAS.
+ * Author: Carlo Caione <ccaione@baylibre.com>
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include "clk-regmap.h"
+#include "clk-pll.h"
+#include "meson-clkc-utils.h"
+#include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
+
+#define FIXPLL_CTRL0			0x040
+#define FIXPLL_CTRL1			0x044
+#define FIXPLL_STS			0x05c
+#define GP0PLL_CTRL0			0x080
+#define GP0PLL_CTRL1			0x084
+#define GP0PLL_CTRL2			0x088
+#define GP0PLL_CTRL3			0x08c
+#define GP0PLL_STS			0x09c
+#define HIFI0PLL_CTRL0			0x100
+#define HIFI0PLL_CTRL1			0x104
+#define HIFI0PLL_CTRL2			0x108
+#define HIFI0PLL_CTRL3			0x10c
+#define HIFI1PLL_CTRL0			0x110
+#define HIFI1PLL_CTRL1			0x114
+#define HIFI1PLL_CTRL2			0x118
+#define HIFI1PLL_CTRL3			0x11c
+#define HIFI0PLL_STS			0x120
+#define HIFI1PLL_STS			0x124
+#define HDMIPLL_CTRL0			0x1c0
+#define HDMIPLL_CTRL1			0x1c4
+#define HDMIPLL_CTRL2			0x1c8
+#define HDMIPLL_CTRL3			0x1cc
+#define HDMIPLL_STS			0x1dc
+
+static struct clk_regmap s7_fixed_pll_vco = {
+	.data = &(struct meson_clk_pll_data) {
+		.en = {
+			.reg_off = FIXPLL_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = FIXPLL_CTRL0,
+			.shift   = 0,
+			.width   = 9,
+		},
+		.n = {
+			.reg_off = FIXPLL_CTRL0,
+			.shift   = 11,
+			.width   = 5,
+		},
+		.l = {
+			.reg_off = FIXPLL_STS,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = FIXPLL_CTRL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "fixed_pll_vco",
+		.ops = &meson_clk_pll_ro_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "fix",
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_fixed_pll = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = FIXPLL_CTRL0,
+		.shift = 9,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO | CLK_DIVIDER_READ_ONLY,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "fixed_pll",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_fixed_pll_vco.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+#define S7_FCLK(_name, _mult, _divider, _reg, _bit)			\
+static struct clk_fixed_factor s7_##_name##_div = {			\
+	.mult = (_mult),						\
+	.div = (_divider),						\
+	.hw.init = &(struct clk_init_data) {				\
+		.name = #_name "_div",					\
+		.ops = &clk_fixed_factor_ops,				\
+		.parent_hws = (const struct clk_hw *[]) {		\
+			&s7_fixed_pll.hw				\
+		},							\
+		.num_parents = 1,					\
+	},								\
+};									\
+									\
+static struct clk_regmap s7_##_name = {					\
+	.data = &(struct clk_regmap_gate_data) {			\
+		.offset = (_reg),					\
+		.bit_idx = (_bit),					\
+	},								\
+	.hw.init = &(struct clk_init_data) {				\
+		.name = #_name,						\
+		.ops = &clk_regmap_gate_ro_ops,				\
+		.parent_hws = (const struct clk_hw *[]) {		\
+			&s7_##_name##_div.hw				\
+		},							\
+		.num_parents = 1,					\
+	},								\
+}
+
+/* The datasheet documents FIXPLL_CTRL1[30:26] as a single fclk_en field */
+S7_FCLK(fclk_div2, 1, 2, FIXPLL_CTRL1, 30);
+S7_FCLK(fclk_div3, 1, 3, FIXPLL_CTRL1, 26);
+S7_FCLK(fclk_div4, 1, 4, FIXPLL_CTRL1, 27);
+S7_FCLK(fclk_div5, 1, 5, FIXPLL_CTRL1, 28);
+S7_FCLK(fclk_div7, 1, 7, FIXPLL_CTRL1, 29);
+S7_FCLK(fclk_div2p5, 2, 5, FIXPLL_CTRL0, 25);
+
+static const struct pll_mult_range s7_pll_mult_range = {
+	.min = 134,
+	.max = 265,
+};
+
+static const struct reg_sequence s7_gp0_pll_init_regs[] = {
+	{ .reg = GP0PLL_CTRL0,	.def = 0x02520800 },
+	{ .reg = GP0PLL_CTRL1,	.def = 0x09900322 },
+	{ .reg = GP0PLL_CTRL2,	.def = 0x00000000 },
+	{ .reg = GP0PLL_CTRL3,	.def = 0x00000006 },
+};
+
+static struct clk_fixed_factor s7_gp0_pll_div0p5 = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data) {
+		.name = "gp0_pll_div0p5",
+		.ops = &clk_fixed_factor_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "gp0",
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_gp0_pll_vco = {
+	.data = &(struct meson_clk_pll_data) {
+		.en = {
+			.reg_off = GP0PLL_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = GP0PLL_CTRL0,
+			.shift   = 0,
+			.width   = 9,
+		},
+		.frac = {
+			.reg_off = GP0PLL_CTRL2,
+			.shift   = 0,
+			.width   = 17,
+		},
+		.l = {
+			.reg_off = GP0PLL_STS,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = GP0PLL_CTRL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+		.frac_max = 131072,
+		.range = &s7_pll_mult_range,
+		.init_regs = s7_gp0_pll_init_regs,
+		.init_count = ARRAY_SIZE(s7_gp0_pll_init_regs),
+		.flags = CLK_MESON_PLL_NOINIT_ENABLED,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "gp0_pll_vco",
+		.ops = &meson_clk_pll_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_gp0_pll_div0p5.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_gp0_pll = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = GP0PLL_CTRL0,
+		.shift = 9,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO |
+			 CLK_DIVIDER_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "gp0_pll",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_gp0_pll_vco.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+/* hifi is HIFI0 in the datasheet */
+static const struct reg_sequence s7_hifi_pll_init_regs[] = {
+	{ .reg = HIFI0PLL_CTRL0,	.def = 0x02520800 },
+	{ .reg = HIFI0PLL_CTRL1,	.def = 0x09900322 },
+	{ .reg = HIFI0PLL_CTRL2,	.def = 0x00000000 },
+	{ .reg = HIFI0PLL_CTRL3,	.def = 0x00000006 },
+};
+
+static struct clk_fixed_factor s7_hifi_pll_div0p5 = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data) {
+		.name = "hifi_pll_div0p5",
+		.ops = &clk_fixed_factor_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "hifi",
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_hifi_pll_vco = {
+	.data = &(struct meson_clk_pll_data) {
+		.en = {
+			.reg_off = HIFI0PLL_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = HIFI0PLL_CTRL0,
+			.shift   = 0,
+			.width   = 9,
+		},
+		.frac = {
+			.reg_off = HIFI0PLL_CTRL2,
+			.shift   = 0,
+			.width   = 17,
+		},
+		.l = {
+			.reg_off = HIFI0PLL_STS,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = HIFI0PLL_CTRL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+		.frac_max = 100000,
+		.range = &s7_pll_mult_range,
+		.init_regs = s7_hifi_pll_init_regs,
+		.init_count = ARRAY_SIZE(s7_hifi_pll_init_regs),
+		.flags = CLK_MESON_PLL_ROUND_CLOSEST |
+			 CLK_MESON_PLL_NOINIT_ENABLED,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hifi_pll_vco",
+		.ops = &meson_clk_pll_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hifi_pll_div0p5.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_hifi_pll = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HIFI0PLL_CTRL0,
+		.shift = 9,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO |
+			 CLK_DIVIDER_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hifi_pll",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hifi_pll_vco.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct reg_sequence s7_hifi1_pll_init_regs[] = {
+	{ .reg = HIFI1PLL_CTRL0,	.def = 0x02520800 },
+	{ .reg = HIFI1PLL_CTRL1,	.def = 0x09900322 },
+	{ .reg = HIFI1PLL_CTRL2,	.def = 0x00000000 },
+	{ .reg = HIFI1PLL_CTRL3,	.def = 0x00000006 },
+};
+
+static struct clk_fixed_factor s7_hifi1_pll_div0p5 = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data) {
+		.name = "hifi1_pll_div0p5",
+		.ops = &clk_fixed_factor_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "hifi1",
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_hifi1_pll_vco = {
+	.data = &(struct meson_clk_pll_data) {
+		.en = {
+			.reg_off = HIFI1PLL_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = HIFI1PLL_CTRL0,
+			.shift   = 0,
+			.width   = 9,
+		},
+		.frac = {
+			.reg_off = HIFI1PLL_CTRL2,
+			.shift   = 0,
+			.width   = 17,
+		},
+		.l = {
+			.reg_off = HIFI1PLL_STS,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = HIFI1PLL_CTRL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+		.frac_max = 100000,
+		.range = &s7_pll_mult_range,
+		.init_regs = s7_hifi1_pll_init_regs,
+		.init_count = ARRAY_SIZE(s7_hifi1_pll_init_regs),
+		.flags = CLK_MESON_PLL_ROUND_CLOSEST |
+			 CLK_MESON_PLL_NOINIT_ENABLED,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hifi1_pll_vco",
+		.ops = &meson_clk_pll_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hifi1_pll_div0p5.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_hifi1_pll = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HIFI1PLL_CTRL0,
+		.shift = 9,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO |
+			 CLK_DIVIDER_ROUND_CLOSEST,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hifi1_pll",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hifi1_pll_vco.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static const struct pll_mult_range s7_hdmi_pll_mult_range = {
+	.min = 125,
+	.max = 249,
+};
+
+static const struct reg_sequence s7_hdmi_pll_init_regs[] = {
+	{ .reg = HDMIPLL_CTRL0,	.def = 0x00881000 },
+	{ .reg = HDMIPLL_CTRL1,	.def = 0x2c6011cc },
+	{ .reg = HDMIPLL_CTRL2,	.def = 0x86801000 },
+	{ .reg = HDMIPLL_CTRL3,	.def = 0x00000000 },
+};
+
+static const struct clk_div_table s7_hdmi_pll_div0p5_table[] = {
+	{ .val = 0, .div = 1 },
+	{ .val = 1, .div = 2 },
+	{ /* sentinel */ }
+};
+
+static struct clk_regmap s7_hdmi_pll_div0p5 = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HDMIPLL_CTRL1,
+		.shift = 19,
+		.width = 1,
+		.table = s7_hdmi_pll_div0p5_table,
+		.flags = CLK_DIVIDER_READ_ONLY,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_div0p5",
+		.ops = &clk_regmap_divider_ro_ops,
+		.parent_data = &(const struct clk_parent_data) {
+			.fw_name = "hdmi",
+		},
+		.num_parents = 1,
+	},
+};
+
+static struct clk_regmap s7_hdmi_pll_vco = {
+	.data = &(struct meson_clk_pll_data) {
+		.en = {
+			.reg_off = HDMIPLL_CTRL0,
+			.shift   = 28,
+			.width   = 1,
+		},
+		.m = {
+			.reg_off = HDMIPLL_CTRL0,
+			.shift   = 0,
+			.width   = 9,
+		},
+		.frac = {
+			.reg_off = HDMIPLL_CTRL3,
+			.shift   = 0,
+			.width   = 17,
+		},
+		.l = {
+			.reg_off = HDMIPLL_STS,
+			.shift   = 31,
+			.width   = 1,
+		},
+		.rst = {
+			.reg_off = HDMIPLL_CTRL0,
+			.shift   = 29,
+			.width   = 1,
+		},
+		.range = &s7_hdmi_pll_mult_range,
+		.init_regs = s7_hdmi_pll_init_regs,
+		.init_count = ARRAY_SIZE(s7_hdmi_pll_init_regs),
+		.flags = CLK_MESON_PLL_RST_ACTIVE_LOW |
+			 CLK_MESON_PLL_NOINIT_ENABLED,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_vco",
+		.ops = &meson_clk_pll_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll_div0p5.hw
+		},
+		.num_parents = 1,
+	},
+};
+
+/*
+ * The datasheet documents HDMIPLL_CTRL2[22:19] and [18:15] as single fields:
+ * each is two power-of-two dividers.
+ */
+static struct clk_regmap s7_hdmi_pll_od0 = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HDMIPLL_CTRL2,
+		.shift = 19,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_od0",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll_vco.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_hdmi_pll_od1 = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HDMIPLL_CTRL2,
+		.shift = 21,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_od1",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll_od0.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_hdmi_pll = {
+	.data = &(struct clk_regmap_div_data) {
+		.offset = HDMIPLL_CTRL2,
+		.shift = 15,
+		.width = 2,
+		.flags = CLK_DIVIDER_POWER_OF_TWO,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll",
+		.ops = &clk_regmap_divider_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll_od1.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_fixed_factor s7_hdmi_pll_pix_div5 = {
+	.mult = 1,
+	.div = 5,
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_pix_div5",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_fixed_factor s7_hdmi_pll_pix_div6p25 = {
+	.mult = 4,
+	.div = 25,
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_pix_div6p25",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_fixed_factor s7_hdmi_pll_pix_div7p5 = {
+	.mult = 2,
+	.div = 15,
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_pix_div7p5",
+		.ops = &clk_fixed_factor_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll.hw
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_regmap s7_hdmi_pll_pix = {
+	.data = &(struct clk_regmap_mux_data) {
+		.offset = HDMIPLL_CTRL0,
+		.mask = 0x3,
+		.shift = 9,
+	},
+	.hw.init = &(struct clk_init_data) {
+		.name = "hdmi_pll_pix",
+		.ops = &clk_regmap_mux_ops,
+		.parent_hws = (const struct clk_hw *[]) {
+			&s7_hdmi_pll_pix_div5.hw,
+			&s7_hdmi_pll_pix_div6p25.hw,
+			&s7_hdmi_pll_pix_div7p5.hw
+		},
+		.num_parents = 3,
+		.flags = CLK_SET_RATE_PARENT,
+	},
+};
+
+static struct clk_hw *s7_pll_hws[] = {
+	[CLKID_FIXED_PLL_VCO]		= &s7_fixed_pll_vco.hw,
+	[CLKID_FIXED_PLL]		= &s7_fixed_pll.hw,
+	[CLKID_FCLK_DIV2_DIV]		= &s7_fclk_div2_div.hw,
+	[CLKID_FCLK_DIV2]		= &s7_fclk_div2.hw,
+	[CLKID_FCLK_DIV3_DIV]		= &s7_fclk_div3_div.hw,
+	[CLKID_FCLK_DIV3]		= &s7_fclk_div3.hw,
+	[CLKID_FCLK_DIV4_DIV]		= &s7_fclk_div4_div.hw,
+	[CLKID_FCLK_DIV4]		= &s7_fclk_div4.hw,
+	[CLKID_FCLK_DIV5_DIV]		= &s7_fclk_div5_div.hw,
+	[CLKID_FCLK_DIV5]		= &s7_fclk_div5.hw,
+	[CLKID_FCLK_DIV7_DIV]		= &s7_fclk_div7_div.hw,
+	[CLKID_FCLK_DIV7]		= &s7_fclk_div7.hw,
+	[CLKID_FCLK_DIV2P5_DIV]		= &s7_fclk_div2p5_div.hw,
+	[CLKID_FCLK_DIV2P5]		= &s7_fclk_div2p5.hw,
+	[CLKID_GP0_PLL_DIV0P5]		= &s7_gp0_pll_div0p5.hw,
+	[CLKID_GP0_PLL_VCO]		= &s7_gp0_pll_vco.hw,
+	[CLKID_GP0_PLL]			= &s7_gp0_pll.hw,
+	[CLKID_HIFI_PLL_DIV0P5]		= &s7_hifi_pll_div0p5.hw,
+	[CLKID_HIFI_PLL_VCO]		= &s7_hifi_pll_vco.hw,
+	[CLKID_HIFI_PLL]		= &s7_hifi_pll.hw,
+	[CLKID_HIFI1_PLL_DIV0P5]	= &s7_hifi1_pll_div0p5.hw,
+	[CLKID_HIFI1_PLL_VCO]		= &s7_hifi1_pll_vco.hw,
+	[CLKID_HIFI1_PLL]		= &s7_hifi1_pll.hw,
+	[CLKID_HDMI_PLL_DIV0P5]		= &s7_hdmi_pll_div0p5.hw,
+	[CLKID_HDMI_PLL_VCO]		= &s7_hdmi_pll_vco.hw,
+	[CLKID_HDMI_PLL_OD0]		= &s7_hdmi_pll_od0.hw,
+	[CLKID_HDMI_PLL_OD1]		= &s7_hdmi_pll_od1.hw,
+	[CLKID_HDMI_PLL]		= &s7_hdmi_pll.hw,
+	[CLKID_HDMI_PLL_PIX_DIV5]	= &s7_hdmi_pll_pix_div5.hw,
+	[CLKID_HDMI_PLL_PIX_DIV6P25]	= &s7_hdmi_pll_pix_div6p25.hw,
+	[CLKID_HDMI_PLL_PIX_DIV7P5]	= &s7_hdmi_pll_pix_div7p5.hw,
+	[CLKID_HDMI_PLL_PIX]		= &s7_hdmi_pll_pix.hw,
+};
+
+static const struct meson_clkc_data s7_pll_clkc_data = {
+	.hw_clks = {
+		.hws = s7_pll_hws,
+		.num = ARRAY_SIZE(s7_pll_hws),
+	},
+};
+
+static const struct of_device_id s7_pll_clkc_match_table[] = {
+	{
+		.compatible = "amlogic,s7-pll-clkc",
+		.data = &s7_pll_clkc_data,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, s7_pll_clkc_match_table);
+
+static struct platform_driver s7_pll_clkc_driver = {
+	.probe		= meson_clkc_mmio_probe,
+	.driver		= {
+		.name	= "s7-pll-clkc",
+		.of_match_table = s7_pll_clkc_match_table,
+	},
+};
+module_platform_driver(s7_pll_clkc_driver);
+
+MODULE_DESCRIPTION("Amlogic S7 PLL Clock Controller driver");
+MODULE_AUTHOR("Carlo Caione <ccaione@baylibre.com>");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("CLK_MESON");

-- 
2.56.0

