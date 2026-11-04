Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753021;
	b=VQ9V0qHm3fAzMu5O9wau+x+OfKl0h6wDXWQ1CbielBZ40xmt9BGeQbG268YwsMnBRGrl
	 nArCKqG06iPqIL/AF20z2A4duaA1hbE27zwOJlXWGHFjMjdwUb586GsxmIyhXAVPVuEDx
	 p2EZcs8VtLy1NmqXmNkRwAgm2vaLurtOopnqwxSiyHYnFXU3+a8tgcU62POn9hqYNTES8
	 gpA/i25mTltbgTXOd/aP50TpDy7A+IN1vNEbCB0USd/5OMs2RbDMalzLf+g7sJW3sKURM
	 UtMQ04hXWa0f8NEa/eij/g/tABJ3LFGPUp/C2c8nzsoauoh/5/BNTpKSIPNEToXMlwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PvkfzsuQCCCBTer+HvQR59pMaHuODvI+445x+rDaQOc=;
	b=gXkPhGnfK9dnYRLSA/I6+FgmLO6F3J4MkweWVTPqynL95WQT7j6YmExZ3rujPcZXwK5W
	 iGu/gTVMbG4tBW5WooaF021i+7fvi43Se9eEh5Vt9rsWp+6GxJacy+Ffq6LaccVztgvwh
	 XhJYAho3kaK2nLgRvhVLDcfximooS/BS+xDcdj1JM3uvGAhQHek9PekHoT5If6pgVN9rJ
	 zvdbogxubFqDlQEOA1K+HEstteW85BXqSFqcU0KYYO+U/VVkYT8YRmY9eBIWSUT3AST94
	 cYDQAzL/j5b2WZQM2Qn9OCgT6iuII+lXwn04JlT/Eyr8HkjOnVSPYQ7VYHkY14deavA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ObcV0h1M;
	arc=none smtp.remote-ip=209.85.161.44
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4FD606A33D
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 00:43:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F4FD606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20260707.gappssmtp.com header.i=@riscstar-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ObcV0h1M
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6df5e315bd1so127047eaf.2
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 16:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20260707.gappssmtp.com; s=20260707; t=1793753020; x=1794357820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PvkfzsuQCCCBTer+HvQR59pMaHuODvI+445x+rDaQOc=;
        b=ObcV0h1MRloP368BbCyiS+6FAfjdg/gjmHWWiX3btLauk4cvBQMztRvSOlKiguicWj
         FA3aNFIuRk1jgUjUpYn9VcxL/eV0VzNBhf0yOxBd0OeTLVjeWdT0++zjE5LNwLo8keV3
         zZZWdGiFBGUUdiQbVmhxG1Cg4BZMc8M8xhCTm2NkkVsfRXyrYNBZeNAQGZ+pb7BMy2Y8
         F2MblAxD6sAYiZkHxQ+TR0CB0fdWEYpip60+Ud1tJhLYSWIYQq2+ozXw6MfCqpMis/I0
         rpjbyA5GPx4cdPEbVMRNd6pmlqehGhbDdUoh5SUM1CgFXuBDGt+VGK7VMYv7/yiBhLzJ
         PeFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753020; x=1794357820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PvkfzsuQCCCBTer+HvQR59pMaHuODvI+445x+rDaQOc=;
        b=zqrrI+2T3wuXAyx2N6PNi8Gjw6gSR+7IEZD2KMP0TTLPo8TR6NnhkWIXtVsYflS/0P
         w8qnJIqV2ac7ZWg9cUp9SADIXyp8uBcyvQ3d0btS5pXxWRwJ/LW8E4+tLG+gdbCs6Hts
         j098KTqdpNYQHe8hd4xE6Xz7WQ5TLFpW86LLkSmFCJG0vMlpHzqPBMQj2fNoXk5lCXpE
         uNrx/JfZdzdmlhXkaGKPKji9xZvxlCSOW5Mv87v8GxilAisYyAQv/n7kGnBmQFWz1b+q
         YamEHPAfbmWHhC19IZ4EODnKfZhpcO8l4zG6S9jx3cCUl95uPbGVJ+o57ndvypuJo+Oz
         D5uw==
X-Forwarded-Encrypted: i=1; AKwUvBxxaZU1tpi8NT+cPZWLMjpcrpf/To1G1LiHmgmbykilhyQhfBPqah8gJDEN+XJo8i4LxmwqXNvNchBp@vger.kernel.org
X-Gm-Message-State: APuU4Z+d8mkdKRxTJnkwXC1c480vi82dyICdTOAIo5F2PyLjY45D3u6j
	ur9elWUKdnAAtofKgYFCPuYcxkoEvikV+37WZ3tLIXinKV8e8EQjUFYeZTUWto5XHYE=
X-Gm-Gg: AYBFou1/noOT1a2BRPSyTbWPHSpp8U1QUi38QPdYO5dPdXNE7Riu3N/DGLkL1EPDGCu
	PPtEe3ZGzmHGMEQf9J9UMXdOjPPezarqJsQr7MBlj5mnP5TRs/r6wKPXYa7ta5cGuABDb9s3NnP
	RUJTdRV9YojjVS5Ksar8fr1ySoRAv0yQKTds9A6LGbt0rgYdJZjEVmz7p2OlVO6Utrv6dzfKUdg
	5z2ohYDgJvryvXQJLHWYWm+/HIKtCZcp4al+eUKtVGBedd5Aukn5c3xZg7oFuqLaosmZQuNGHoI
	Um/82WYwYeg10d7tibiGReXHOsr9R2UsOsF3lCc5jCE+/ByRfNA/96HDwMG6rgrYOrvopMWrVu4
	A8EgZOvoyNmJDM5CbCoSfbfP7otaQurmuXoBfXwU5yrSs7ZEWzdsWs7z3MellRoWqKSsQh6G+9u
	rM1Wbqf13lXhXoVzUHOL0jtQB7lyl8SsHJHrVvHh2P2A4YKpz9W/sTSrVjzvEQYQdigNKCGvu8w
	Ml9T06ho+nDgyqiqZN5/CFrxwoR8FapPsoEVeK21SmgBgXmnTsutATYu+9VhK7MNfDl8tm+i5gm
	iPYWgyfyo2VKWbkW0WYwKmBO8ZApQJQ9hCIxJLjL2GD4Wc5YDCEWHQw=
X-Received: by 2002:a05:6820:1607:b0:6d8:bba5:658a with SMTP id 006d021491bc7-714f24a07f8mr8269371eaf.43.1793753020211;
        Tue, 03 Nov 2026 16:43:40 -0800 (PST)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acea61f0c0sm513493fac.14.2026.11.03.16.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:43:39 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	fabrice.gasnier@foss.st.com,
	alexandre.torgue@foss.st.com,
	marex@nabladev.com,
	changhuang.liang@starfivetech.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] clk: toshiba: introduce a TC9564 SoC clock driver
Date: Tue,  3 Nov 2026 18:43:30 -0600
Message-ID: <20261104004332.2141282-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104004332.2141282-1-elder@riscstar.com>
References: <20261104004332.2141282-1-elder@riscstar.com>
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

Define a new platform driver that manages clocks implemented by the
Toshiba TC9564 SoC.  There are 21 gate clocks that can be enabled
and disabled, but currently only the clocks that are (or will soon
be) used are defined to be controllable.

Two registers manage the state of the clocks.  The registers are
accessed via a regmap supplied by a system controller.  Access to
the memory region is provided via a BAR on a PCIe endpoint function
embedded in the TC9564 SoC.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 MAINTAINERS              |   7 +
 drivers/clk/Kconfig      |  12 ++
 drivers/clk/Makefile     |   1 +
 drivers/clk/clk-tc9564.c | 288 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 308 insertions(+)
 create mode 100644 drivers/clk/clk-tc9564.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c25ee6e0f1c68..ee01aed56508d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28332,6 +28332,13 @@ F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.yaml
 F:	drivers/media/i2c/tc358743*
 F:	include/media/i2c/tc358743.h
 
+TOSHIBA TC9564 CLOCK DRIVER
+M:	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
+M:	Alex Elder <elder@kernel.org>
+M:	Daniel Thompson <danielt@kernel.org>
+S:	Maintained
+F:	drivers/clk/clk-tc9564.c
+
 TOSHIBA TC9564 PCI DRIVER
 M:	Alex Elder <elder@kernel.org>
 M:	Daniel Thompson <danielt@kernel.org>
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 37a8e35d41783..0d186150d0c75 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -293,6 +293,18 @@ config COMMON_CLK_S2MPS11
 	  clock. These multi-function devices have two (S2MPS14) or three
 	  (S2MPS11, S5M8767) fixed-rate oscillators, clocked at 32KHz each.
 
+config COMMON_CLK_TC9564
+	tristate "Toshiba TC9564 clock support"
+	depends on SOC_TOSHIBA_TC9564_SYSCON
+	select MFD_SYSCON
+	default SOC_TOSHIBA_TC9564_SYSCON
+	help
+	  This enables support for the clock controller embedded in the
+	  Toshiba TC9564 SoC.  The state of each clock is controlled via
+	  MMIO to a region managed by a system controller; this ensures
+	  access to the region is coordinated between this and the reset
+	  and XGMAC (stmmac) drivers.
+
 config CLK_TWL
 	tristate "Clock driver for the TWL PMIC family"
 	depends on TWL4030_CORE
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 52d138d4ffc88..a11a8326d79cb 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -111,6 +111,7 @@ obj-$(CONFIG_COMMON_CLK_SI570)		+= clk-si570.o
 obj-$(CONFIG_COMMON_CLK_SP7021)		+= clk-sp7021.o
 obj-$(CONFIG_COMMON_CLK_STM32F)		+= clk-stm32f4.o
 obj-$(CONFIG_COMMON_CLK_STM32H7)	+= clk-stm32h7.o
+obj-$(CONFIG_COMMON_CLK_TC9564)		+= clk-tc9564.o
 obj-$(CONFIG_COMMON_CLK_TPS68470)      += clk-tps68470.o
 obj-$(CONFIG_CLK_TWL6040)		+= clk-twl6040.o
 obj-$(CONFIG_CLK_TWL)			+= clk-twl.o
diff --git a/drivers/clk/clk-tc9564.c b/drivers/clk/clk-tc9564.c
new file mode 100644
index 0000000000000..8eeba85919703
--- /dev/null
+++ b/drivers/clk/clk-tc9564.c
@@ -0,0 +1,288 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+#include <linux/bits.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/soc/toshiba,tc9564.h>
+
+/*
+ * The full name of every clock has a prefix "tc9564" followed by a single
+ * character ('a', 'b', etc.) that differs for each chip/device number.
+ * Each clock's "name" defines the unique portion of the clock's full name.
+ */
+#define FULL_NAME_SIZE	24	/* Enough for formatted full name */
+#define NAME_SIZE	12	/* Unique portion of the clock name */
+#define FORMAT_FULL_NAME(_full_name, _id, _name)		\
+	snprintf(_full_name, FULL_NAME_SIZE, "tc9564%c_%.*s",	\
+		'a' + (_id), NAME_SIZE, _name)
+
+/* Two registers control whether gate clocks are enabled */
+#define CLK_CTRL0_OFFSET	0x1004	/* Common and MAC0 gate clocks */
+#define CLK_CTRL1_OFFSET	0x100c	/* MAC1 gate clocks */
+
+enum clock_type { PLL, FIXED, GATE };
+
+struct tc9564_clock {
+	struct regmap *regmap;
+	struct clk_hw_onecell_data *clk_data;
+};
+
+struct gate_clock {
+	struct clk_hw hw;
+	const struct clock_init *init;
+};
+
+struct clock_init {
+	const char name[NAME_SIZE];
+	enum clock_type type;
+	union {
+		u32 mult;	/* PLL rate multiplier */
+
+		u32 div;	/* Fixed rate clock divider */
+
+		struct {	/* Gate clock */
+			u16 parent;	/* Parent clock ID, e.g. CLOCK_50M */
+			u16 offset;	/* CLK_CTRL0_OFFSET/CLK_CTRL1_OFFSET */
+			u32 mask;
+		};
+	};
+};
+
+/* There is only one PLL */
+#define PLL_INIT(_name, _mult)				\
+	[CLOCK_##_name] = {				\
+		.name = #_name,				\
+		.type = PLL,				\
+		.mult = (_mult),			\
+	}
+
+/* The PLL is the parent of all the fixed rate clocks */
+#define FIXED_INIT(_name, _div)				\
+	[CLOCK_##_name] = {				\
+		.name = #_name,				\
+		.type = FIXED,				\
+		.div = (_div),				\
+	}
+
+#define GATE_INIT0(_name, _bit, _pname)	__GATE_INIT(_name, 0, _bit, _pname)
+#define GATE_INIT1(_name, _bit, _pname)	__GATE_INIT(_name, 1, _bit, _pname)
+#define __GATE_INIT(_name, _reg, _bit, _pname)		\
+	[CLOCK_##_name] = {				\
+		.name = #_name,				\
+		.type = GATE,				\
+		.parent = CLOCK_##_pname,		\
+		.offset = CLK_CTRL ## _reg ## _OFFSET,	\
+		.mask = BIT(_bit),			\
+	}
+
+/*
+ * Clocks are initialized and registered in the order of their IDs.
+ * Parent clocks must be registered before their children.
+ */
+static const struct clock_init clock_init[] = {
+	PLL_INIT(PLL, 50),
+
+	FIXED_INIT(62_5M, 20),
+	FIXED_INIT(125M, 10),
+	FIXED_INIT(250M, 5),
+	FIXED_INIT(312_5M, 4),
+
+	GATE_INIT0(MSIGEN, 18, 62_5M),
+
+	GATE_INIT0(MAC0_TX, 7, 250M),
+	GATE_INIT0(MAC0_RX, 14, 250M),
+	GATE_INIT0(MAC0_125M, 29, 125M),
+	GATE_INIT0(MAC0_312_5M, 30, 312_5M),
+	GATE_INIT0(MAC0_ALL, 31, 250M),
+
+	GATE_INIT1(MAC1_TX, 7, 250M),
+	GATE_INIT1(MAC1_RX, 14, 250M),
+	GATE_INIT1(MAC1_125M, 29, 125M),
+	GATE_INIT1(MAC1_312_5M, 30, 312_5M),
+	GATE_INIT1(MAC1_ALL, 31, 250M),
+	GATE_INIT1(MAC1_RMII, 15, 125M),
+};
+#define CLOCK_COUNT	ARRAY_SIZE(clock_init)
+
+/* Parent is the input oscillator running at 25 MHz; PLL runs at 1250 MHz */
+static struct clk_hw *pll_register(struct device *dev,
+				   const struct clock_init *init)
+{
+	char full_name[FULL_NAME_SIZE];
+
+	FORMAT_FULL_NAME(full_name, dev->id, init->name);
+
+	return devm_clk_hw_register_fixed_factor_index(dev, full_name, 0, 0,
+						       init->mult, 1);
+}
+
+/* The PLL is the parent of all fixed clocks */
+static struct clk_hw *fixed_register(struct device *dev,
+				     const struct clock_init *init)
+{
+	struct tc9564_clock *tc9564_clock = dev_get_drvdata(dev);
+	char full_name[FULL_NAME_SIZE];
+	struct clk_hw *pll_hw;
+
+	FORMAT_FULL_NAME(full_name, dev->id, init->name);
+
+	pll_hw = tc9564_clock->clk_data->hws[CLOCK_PLL];
+
+	return devm_clk_hw_register_fixed_factor_parent_hw(dev, full_name,
+							   pll_hw, 0,
+							   1, init->div);
+}
+
+static const struct gate_clock *hw_to_gate_clock(struct clk_hw *hw)
+{
+	return container_of_const(hw, struct gate_clock, hw);
+}
+
+static void gate_clk_manage(struct clk_hw *hw, bool enable)
+{
+	struct tc9564_clock *tc9564_clock = dev_get_drvdata(clk_hw_get_dev(hw));
+	const struct gate_clock *clock = hw_to_gate_clock(hw);
+	u32 mask = clock->init->mask;
+
+	regmap_update_bits(tc9564_clock->regmap, clock->init->offset, mask,
+			   enable ? mask : 0);
+}
+
+static int gate_clk_enable(struct clk_hw *hw)
+{
+	gate_clk_manage(hw, true);
+
+	return 0;
+}
+
+static void gate_clk_disable(struct clk_hw *hw)
+{
+	gate_clk_manage(hw, false);
+}
+
+static int gate_clk_is_enabled(struct clk_hw *hw)
+{
+	struct tc9564_clock *tc9564_clock = dev_get_drvdata(clk_hw_get_dev(hw));
+	const struct gate_clock *clock = hw_to_gate_clock(hw);
+	u32 val;
+
+	regmap_read(tc9564_clock->regmap, clock->init->offset, &val);
+
+	return val & clock->init->mask ? 1 : 0;
+}
+
+static const struct clk_ops gate_clk_ops = {
+	.enable = gate_clk_enable,
+	.disable = gate_clk_disable,
+	.is_enabled = gate_clk_is_enabled,
+};
+
+static struct clk_hw *gate_register(struct device *dev,
+				    const struct clock_init *init)
+{
+	struct tc9564_clock *tc9564_clock = dev_get_drvdata(dev);
+	struct clk_init_data clk_init = { };
+	const struct clk_hw *parent_hw;
+	char full_name[FULL_NAME_SIZE];
+	struct gate_clock *clock;
+	int ret;
+
+	clock = devm_kzalloc_obj(dev, *clock);
+	if (!clock)
+		return ERR_PTR(-ENOMEM);
+
+	FORMAT_FULL_NAME(full_name, dev->id, init->name);
+
+	parent_hw = tc9564_clock->clk_data->hws[init->parent];
+
+	clk_init.name = full_name;
+	clk_init.ops = &gate_clk_ops;
+	clk_init.parent_hws = &parent_hw;
+	clk_init.num_parents = 1;
+
+	clock->hw.init = &clk_init;
+	clock->init = init;
+
+	ret = devm_clk_hw_register(dev, &clock->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &clock->hw;
+}
+
+static int tc9564_clk_probe(struct platform_device *pdev)
+{
+	struct clk_hw_onecell_data *clk_data;
+	struct tc9564_clock *tc9564_clock;
+	struct device *dev = &pdev->dev;
+	struct device_node *parent_np;
+	int ret;
+
+	parent_np = dev_of_node(dev->parent);
+	if (!parent_np)
+		return dev_err_probe(dev, -EINVAL, "no devicetree node\n");
+
+	tc9564_clock = devm_kzalloc_obj(dev, *tc9564_clock);
+	if (!tc9564_clock)
+		return -ENOMEM;
+
+	/* Note: MMIO regmap (no error checking needed when used) */
+	tc9564_clock->regmap = device_node_to_regmap(parent_np);
+	if (IS_ERR(tc9564_clock->regmap))
+		return dev_err_probe(dev, PTR_ERR(tc9564_clock->regmap),
+				     "failed to get config regmap\n");
+
+	clk_data = devm_kzalloc_flex(dev, *tc9564_clock->clk_data, hws,
+				     CLOCK_COUNT);
+	if (!clk_data)
+		return -ENOMEM;
+	tc9564_clock->clk_data = clk_data;
+
+	dev_set_drvdata(dev, tc9564_clock);
+
+	/* Initialize all the clocks */
+	for (u32 i = 0; i < clk_data->num; i++) {
+		const struct clock_init *init = &clock_init[i];
+		struct clk_hw *hw;
+
+		if (init->type == PLL)
+			hw = pll_register(dev, init);
+		else if (init->type == FIXED)
+			hw = fixed_register(dev, init);
+		else
+			hw = gate_register(dev, init);
+		if (IS_ERR(hw))
+			return dev_err_probe(dev, PTR_ERR(hw),
+					     "failed to register %s\n",
+					     init->name);
+		clk_data->hws[i] = hw;
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add provider\n");
+
+	return 0;
+}
+
+static struct platform_driver tc9564_clk_driver = {
+	.probe = tc9564_clk_probe,
+	.driver = {
+		.name = "toshiba-tc9564-clock",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
+	},
+};
+module_platform_driver(tc9564_clk_driver);
+
+MODULE_DESCRIPTION("Toshiba TC9564 Clock Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:toshiba-tc9564-clock");
-- 
2.53.0

