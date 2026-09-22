Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C66F568FDB
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 16:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790094891; cv=none; b=GG5d+R9mhbggVm8MTsAqe5oQIoHrpgr5IWsrQXVH/h1IsW3MsmOadXRnje/fLmhKatwYu96mjUDjkuhbE2IsswXA7J3YOEEob7n+HmpkVd0oujXn4ToU0i/1GH0diSXelB4WQApZMhMy7lia9fEo1+AArdVGTXsgRZcjY50xPxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790094891; c=relaxed/simple;
	bh=sQ3EwTgn0EUt9L8CXBhCZb8lf3xC0w0ejiBjOSV8Pco=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FVtsrvcTuMAWo6MNCH3MXg8WTSgA4fAV3f+anTjkyRxYXIOgBs119l9v/nKT3zsBl8l3QAub7aTSARVmXS6X+Aws1B8uALXw3w6QKuDVYsZ72H06GjZ8tQZrknWqZbsaIpyT9ka7/9mbHuGEti05KfBX/01nLO0euR9isBPZ5ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2HP7tWd; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2HP7tWd"
Received: by mail-oi2-f12.google.com with SMTP id 46e09a7af769-7f4f0cfb29cso84705a34.1
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 09:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790094886; x=1790699686; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=660IpMR0mIr/dOv4xwWcEolN+/t1yP+V7wW0zQGaZaQ=;
        b=A2HP7tWdVWWx/fd6vQL7k8rcYgHq+41hUkWddMzJJ9e/hEipAC5II4HiICpdl/K1/s
         29J5rvf226MH4uTnLOyTn/YjghhiVoVP0sc9CoGrv7zIET8JT4QdaFY9JlIkrTiTlKx4
         ggCo7XEkDcXib1ToOOR4RGIFhtAHRtWyYa9fqlHBlJ0dDLdrD3FSe+gdARIUIeynueJM
         7eNtGTotGAhppvyL86ceF82Y/G4fSDOVXcuuqUDy6c4McfOuz5TMb6kfTRp1aAKPPQGm
         EaxPwh/qav5ovkq0exybMDh3cfrSO6HsCQYjak7K4QaKIUy6nN/oQJ3VnkJ+IkByinUt
         dHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790094886; x=1790699686;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=660IpMR0mIr/dOv4xwWcEolN+/t1yP+V7wW0zQGaZaQ=;
        b=aRuBt7BqXyus39jIhF7M0bokFR6YwFl1Po7OYjhr0BJesOqej9+WqhPpMSrdMHj328
         /ESGk9UTz8jXrui7PyyJmhABkKRXMlFuuaKqXcWmDxj1HuE42BSVJWuqyK0DpDxAyUKs
         6bjpAHBpuzaObnYytCKX9nCvpDZwJOqV21eedUUUX1shHvfIzxrbTHiQSQz+WAVMmBsp
         /IsXsK/QocgkvVVpZxM4bhUSE+qcY4exYatU42EM67iFkocf40+o/ZDcuGZH1YLQZoAN
         dBz03R4Rw+VT7fySWaIfkRcQ3/cAIJfj2BAMBMzDQ1YU7kfj+panlAehA5/Y54OQoYoY
         rowA==
X-Forwarded-Encrypted: i=1; AKwUvBwWBnwUtBv30PJEeT8bIOqCmSzh+WL+tQUZigA5YLjVOXH6PEPUt25DgShtGxCaOhKuW/iWNUg0QYL0@vger.kernel.org
X-Gm-Message-State: AFuF++mmLBrwQ55jw2vF62srT7Ja1rvZgVLBpJ7lIiAAwKilhz658aKy
	irZt/IUgK51ouFWuCmO4o3pyp8B6U61pBHsjRZerS4oLSbO8Uo0AC4B+
X-Gm-Gg: AYBFou3l25OSPGx37R42atn+RFJS3Id64trLb1IEavzZnMQMm9nir5TkQJQbXmqWaGO
	ejVecGBW3WdSsRUFHrPmyHLbZofPk51S05EXarxg0PHOw+HdSp8AsWAtuLj4p1dbN/5/Rjb0BGl
	XlNDoj+bxyNobEVbNnIwz9gFWAzHf5q36vKQFQnFChiRT9xg+7TwbS3u849iwncDrTpCcTbZzoQ
	xt8YvNeswFlvpN16q/EbijcotMQB+vfXAE1ExOZgjfFgkAyAXo6YKT4NJd8k1SMjObzLEEyLCYA
	GYW4Rzn7a/J1K9xRZzOPoNxJz5d+eylLLEkphOiJ833a1Ho5bqoHdIADplHfTr6k/DJCiMPNXRh
	Vaw+Nf+bq0Qc83BEMX8LSrLkgM3VZyHS5r+wWl+ZiF3C29WoPWxk3zTXRlP47cypN/RPLMexRef
	nZ9weuG3Jjo87jLh8BguaYjkvdRlor4nPfHeO6ZELbJ0ZVD8GtQYCif7y1LK8l/DPA4xH7eyuBo
	QsempFvDzVITbwpHvbZJtpMYXmw+8kf1Io1GTwyEdI3eaSz9F5YiBeFOBtoE+9MBulocBOdKRWR
	FQiIhbokCBxYalaUDh/iWs1pi+wJHq7gfhrdBCTTJhWLBF9Xw4DRF9ijxGS2GfWrbf2P+4UHzSj
	qh89DwyovowzIDFhRa50tcCA=
X-Received: by 2002:a05:6830:44ab:b0:7f8:4ebe:2854 with SMTP id 46e09a7af769-815ef49c682mr197798a34.4.1790094886387;
        Tue, 22 Sep 2026 09:34:46 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-814e0a13a73sm2679320a34.0.2026.09.22.09.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 09:34:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 22 Sep 2026 10:34:35 -0600
Subject: [PATCH v13 2/2] mfd: ac200: Add X-Powers AC200 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-submit-ac200-mfd-v13-2-8832afd2481c@gmail.com>
References: <20260922-submit-ac200-mfd-v13-0-8832afd2481c@gmail.com>
In-Reply-To: <20260922-submit-ac200-mfd-v13-0-8832afd2481c@gmail.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, 
 James Hilliard <james.hilliard1@gmail.com>, Lee Jones <lee@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 linux-sunxi@lists.linux.dev, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

The X-Powers AC200 is a mixed-signal companion IC with a paged register
map accessed over I2C.

Enable and rate-lock the shared input clock, retain the vendor resume
path's 40 ms wait before creating the regmap and accessing registers, and
deassert the common reset. No minimum delay is documented. Set only the
deassert bit instead of forcing a reset cycle, avoiding a chip-wide reset
of unrelated function registers. Leave the common reset deasserted during
driver removal and system shutdown; function drivers own their block
resets. Supplier unbind still tears down linked consumers and releases
the provider's clock references.

Cache only the common page selector. Individual functions can reset
independently and invalidate their other registers, so leave all
functional registers volatile.

Register the audio codec and TV encoder using static MFD cells and
automatically assigned platform device IDs. Their firmware properties
belong to the parent node. Map their supply lookups to the parent with MFD
supply aliases, without assigning separate OF nodes to the cells.

When INTB is connected, pass its physical IRQ to the TV encoder cell.
Select a cell array without IRQ resources when INTB is absent. No regmap
IRQ controller or private IRQ domain is needed.

Configure the level-triggered INTB output, defaulting to level-low when
the upstream IRQ has no trigger type. Mask all sources before enabling
INTB. Function drivers request shared threaded IRQs before enabling their
own source, check and clear their own status, and mask their source before
freeing the IRQ. Disable INTB after removing the children on failure or
removal, while the regmap and clock are still available.

The Ethernet PHY is enumerated on its MDIO bus rather than as an MFD
child. It follows the x-powers,ac200 phandle and uses this regmap for
ancillary package-control access.

Co-developed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 MAINTAINERS          |   1 +
 drivers/mfd/Kconfig  |  14 ++++
 drivers/mfd/Makefile |   1 +
 drivers/mfd/ac200.c  | 222 +++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 238 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 419340093c9b..1d03b0060bda 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -29510,6 +29510,7 @@ M:	James Hilliard <james.hilliard1@gmail.com>
 L:	linux-sunxi@lists.linux.dev
 S:	Maintained
 F:	Documentation/devicetree/bindings/mfd/x-powers,ac200.yaml
+F:	drivers/mfd/ac200.c
 
 X-POWERS AXP288 PMIC DRIVERS
 M:	Hans de Goede <hansg@kernel.org>
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 857ca3bb0d5b..071cba7c775b 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -205,6 +205,20 @@ config MFD_AC100
 	  This driver include only the core APIs. You have to select individual
 	  components like codecs or RTC under the corresponding menus.
 
+config MFD_AC200
+	tristate "X-Powers AC200"
+	depends on COMMON_CLK
+	depends on I2C
+	depends on OF
+	select MFD_CORE
+	select REGMAP_I2C
+	help
+	  Support for the X-Powers AC200 mixed-signal companion IC. The AC200
+	  contains audio, video, RTC and Fast Ethernet PHY functions and is
+	  co-packaged with some Allwinner H6 and H616 SoCs. This driver provides
+	  the shared register access and instantiates the individual function
+	  devices.
+
 config MFD_AXP20X
 	tristate
 	select MFD_CORE
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 72d3944b0ad8..f8101d2a9ce9 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -150,6 +150,7 @@ obj-$(CONFIG_MFD_DA9052_SPI)	+= da9052-spi.o
 obj-$(CONFIG_MFD_DA9052_I2C)	+= da9052-i2c.o
 
 obj-$(CONFIG_MFD_AC100)		+= ac100.o
+obj-$(CONFIG_MFD_AC200)		+= ac200.o
 obj-$(CONFIG_MFD_AXP20X)	+= axp20x.o
 obj-$(CONFIG_MFD_AXP20X_I2C)	+= axp20x-i2c.o
 obj-$(CONFIG_MFD_AXP20X_RSB)	+= axp20x-rsb.o
diff --git a/drivers/mfd/ac200.c b/drivers/mfd/ac200.c
new file mode 100644
index 000000000000..3c6543a1688c
--- /dev/null
+++ b/drivers/mfd/ac200.c
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * X-Powers AC200 Core driver
+ *
+ * Copyright (C) 2019 Jernej Skrabec <jernej.skrabec@gmail.com>
+ * Copyright (C) 2026 James Hilliard <james.hilliard1@gmail.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/irq.h>
+#include <linux/mfd/core.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+
+#define AC200_SYS_CONTROL_REG			0x0002
+#define AC200_SYS_CONTROL_CHIP_RESET_DEASSERT	BIT(0)
+#define AC200_SYS_IRQ_ENABLE_REG		0x0004
+#define AC200_SYS_IRQ_INTB_ENABLE		BIT(15)
+#define AC200_SYS_IRQ_INTB_ACTIVE_HIGH		BIT(14)
+#define AC200_SYS_IRQ_RTC			BIT(12)
+#define AC200_SYS_IRQ_EPHY			BIT(8)
+#define AC200_SYS_IRQ_TVE			BIT(4)
+
+/* Interface register accessible from every register page. */
+#define AC200_TWI_REG_ADDR_H	0x00fe
+#define AC200_MAX_REG		0xa1f2
+
+static const struct regmap_range_cfg ac200_range_cfg[] = {
+	{
+		.range_max = AC200_MAX_REG,
+		.selector_reg = AC200_TWI_REG_ADDR_H,
+		.selector_mask = 0xff,
+		.window_len = 256,
+	},
+};
+
+/*
+ * Each AC200 sub-block can reset independently, invalidating its register
+ * contents without regmap's knowledge. Cache only the common page selector;
+ * this avoids a selector read-modify-write for every access on the same page
+ * without ever returning stale functional-register values.
+ */
+static bool ac200_volatile_reg(struct device *dev, unsigned int reg)
+{
+	return reg != AC200_TWI_REG_ADDR_H;
+}
+
+static const struct regmap_config ac200_regmap_config = {
+	.name = "ac200",
+	.reg_bits = 8,
+	.reg_stride = 2,
+	.val_bits = 16,
+	.ranges = ac200_range_cfg,
+	.num_ranges = ARRAY_SIZE(ac200_range_cfg),
+	.max_register = AC200_MAX_REG,
+	.volatile_reg = ac200_volatile_reg,
+	.cache_type = REGCACHE_MAPLE,
+};
+
+static const char * const ac200_codec_supplies[] = {
+	"ac-ldoin",
+};
+
+static const char * const ac200_tve_supplies[] = {
+	"tv-vcc",
+};
+
+static const struct resource ac200_tve_resources[] = {
+	DEFINE_RES_IRQ_NAMED(0, "intb"),
+};
+
+#define AC200_CELL(_name, _supplies, _resources)		\
+	{							\
+		.name = (_name),				\
+		.parent_supplies = (_supplies),			\
+		.num_parent_supplies = ARRAY_SIZE(_supplies),	\
+		.resources = (_resources),			\
+		.num_resources = MFD_RES_SIZE(_resources),	\
+	}
+
+static const struct mfd_cell ac200_cells[] = {
+	AC200_CELL("ac200-codec", ac200_codec_supplies, NULL),
+	AC200_CELL("ac200-tve", ac200_tve_supplies, ac200_tve_resources),
+};
+
+static const struct mfd_cell ac200_noirq_cells[] = {
+	AC200_CELL("ac200-codec", ac200_codec_supplies, NULL),
+	AC200_CELL("ac200-tve", ac200_tve_supplies, NULL),
+};
+
+static void ac200_disable_intb(void *data)
+{
+	struct regmap *regmap = data;
+	int ret;
+
+	ret = regmap_clear_bits(regmap, AC200_SYS_IRQ_ENABLE_REG, AC200_SYS_IRQ_INTB_ENABLE);
+	if (ret)
+		dev_err(regmap_get_device(regmap), "failed to disable INTB: %d\n", ret);
+}
+
+static int ac200_init_irq(struct device *dev, struct regmap *regmap, int irq)
+{
+	unsigned int trigger;
+	u16 value = 0;
+	int ret;
+
+	trigger = irq_get_trigger_type(irq);
+	switch (trigger) {
+	case IRQ_TYPE_LEVEL_HIGH:
+		value |= AC200_SYS_IRQ_INTB_ACTIVE_HIGH;
+		break;
+	case IRQ_TYPE_NONE:
+	case IRQ_TYPE_LEVEL_LOW:
+		break;
+	default:
+		return dev_err_probe(dev, -EINVAL,
+				     "INTB is level triggered, not type %u\n", trigger);
+	}
+
+	/* Mask every source before enabling the shared output. */
+	ret = regmap_update_bits(regmap, AC200_SYS_IRQ_ENABLE_REG,
+				 AC200_SYS_IRQ_INTB_ENABLE | AC200_SYS_IRQ_INTB_ACTIVE_HIGH |
+				 AC200_SYS_IRQ_RTC | AC200_SYS_IRQ_EPHY | AC200_SYS_IRQ_TVE, value);
+	if (ret)
+		return ret;
+
+	/* Children are removed before INTB is disabled and the regmap released. */
+	ret = devm_add_action_or_reset(dev, ac200_disable_intb, regmap);
+	if (ret)
+		return ret;
+
+	if (trigger == IRQ_TYPE_NONE) {
+		ret = irq_set_irq_type(irq, IRQ_TYPE_LEVEL_LOW);
+		if (ret)
+			return dev_err_probe(dev, ret, "failed to set INTB trigger\n");
+	}
+
+	/*
+	 * Function drivers request INTB with IRQF_SHARED | IRQF_ONESHOT before
+	 * enabling their own source. They check and clear their own status and
+	 * mask their source before freeing the IRQ. No IRQ domain is needed.
+	 */
+	return regmap_set_bits(regmap, AC200_SYS_IRQ_ENABLE_REG, AC200_SYS_IRQ_INTB_ENABLE);
+}
+
+static int ac200_probe(struct i2c_client *client)
+{
+	const struct mfd_cell *cells = ac200_noirq_cells;
+	unsigned int num_cells = ARRAY_SIZE(ac200_noirq_cells);
+	struct device *dev = &client->dev;
+	struct regmap *regmap;
+	struct clk *clk;
+	int ret;
+
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "failed to enable input clock\n");
+
+	ret = devm_clk_rate_exclusive_get(dev, clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to lock clock rate\n");
+
+	/*
+	 * No minimum delay is documented. Retain the vendor resume path's 40 ms
+	 * wait after enabling the input clock and before register access.
+	 */
+	msleep(40);
+
+	regmap = devm_regmap_init_i2c(client, &ac200_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap), "failed to initialize regmap\n");
+
+	ret = regmap_set_bits(regmap, AC200_SYS_CONTROL_REG, AC200_SYS_CONTROL_CHIP_RESET_DEASSERT);
+	if (ret)
+		return ret;
+
+	if (client->irq > 0) {
+		ret = ac200_init_irq(dev, regmap, client->irq);
+		if (ret)
+			return ret;
+		cells = ac200_cells;
+		num_cells = ARRAY_SIZE(ac200_cells);
+	}
+
+	/* Function drivers read their firmware properties from the parent. */
+	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, cells, num_cells,
+				   NULL, client->irq, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add function devices\n");
+
+	return 0;
+}
+
+static const struct of_device_id ac200_of_match[] = {
+	{ .compatible = "x-powers,ac200" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, ac200_of_match);
+
+static const struct i2c_device_id ac200_i2c_ids[] = {
+	{ .name = "ac200" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ac200_i2c_ids);
+
+static struct i2c_driver ac200_driver = {
+	.driver = {
+		.name = "ac200",
+		.of_match_table = ac200_of_match,
+	},
+	.probe = ac200_probe,
+	.id_table = ac200_i2c_ids,
+};
+module_i2c_driver(ac200_driver);
+
+MODULE_AUTHOR("Jernej Skrabec <jernej.skrabec@gmail.com>");
+MODULE_AUTHOR("James Hilliard <james.hilliard1@gmail.com>");
+MODULE_DESCRIPTION("X-Powers AC200 Core driver");
+MODULE_LICENSE("GPL");

-- 
2.53.0

