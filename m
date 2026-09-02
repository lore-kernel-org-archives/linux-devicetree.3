Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431F839A054
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 19:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377329; cv=none; b=E90VoMTBrAxciRfZrQAo5Qt6r9bauIWLAoL0GsXbai9aNNwA6UwYAhe3+0S2CovW/R4m5UC38yDDgYsxT13UOCgiAJyDQZArEBLRLkL3tnKu46dNX58oHzVYUzvcO3cyh0LiJmpyo8i870fFbd4+abM/VEdy/Q5dY0YBS94h+vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377329; c=relaxed/simple;
	bh=y0NxW0k15f6y/xEBJQYLSpmIltouG64hV/iDPd4IdpA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nxtTdT/r1qg47xT4vT+gXmd7pncdU2LfzCTj7ixPKufSdolkP93D0qpdiBylE2+yOhm/Z5smpa0P1dbxxL2ZzyXw7JQLNmsjtzWQcVDQ1m8vywb8fT501KYQ+Brd7bEaAOfD0bzsGJcnfqUE8RrWG/Cnp8NJP3vpbyA3Dn8IOLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZkiWWSQ; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZkiWWSQ"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-48a0ca07c38so1140163b6e.2
        for <devicetree@vger.kernel.org>; Wed, 02 Sep 2026 12:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788377321; x=1788982121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sKMtJXFkj0ikZheuQpeLvqIbR43z+P6lPFG8SqKjAYQ=;
        b=nZkiWWSQmq5Ggqk5LUcvvX5/lFA9fVjrs1lfm7KvBu6029v1MSfVMhYs0PlToxXsI8
         npdAEAiqSygCLcbFnK28yZdBsOLw2YFFoKO9EC3RULmrNtYB17GihwxKCh80LW1KDVOv
         eTexeGvpxl9A5qZgZlL9iA52HzjhZ174Mp5jq9dJfF8EN0PHURBFIlX4U6xHgM4onyOp
         GxM5Gap+Z/2YdfRyqFHNe9JE5kYYOQBs4PhyTtOjgtU+g97239EDGjWztCPhI9WWj8yC
         O8zGEE9f2jsYhr9WQJDO/jG7MGT5oR9oyWimH8McfjsycPq43GUz+/3e/hHOu/BzHrb/
         Ou5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788377321; x=1788982121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sKMtJXFkj0ikZheuQpeLvqIbR43z+P6lPFG8SqKjAYQ=;
        b=OkNAFBfSowyY3rOlXeowgzF9NswdS204IoAD2cjA1uKj61rm4D4uzVqnvfvAL05oRj
         OcDazREkODyhxHbFzAZ3YjMbpJY8LIQsK8N+o4kyFbLB/s4w8E44NAGrCs4D/XJYLnw3
         j8cUjQhrO3aYpJapyPIcwv+9Qk2Mc5MnG3AUoGesd78I+x5z0shGGt0tQkFtx6Mq36pw
         bsv75jPzGRWxZCEQRsGx0acvlSPY4JUtZuciWlIBbVSN85vj3L8h9d3OpY2pPgJtyRF0
         5vmYcD8tziqf1MvFs2SUI5FhXMhFlaPJyWmQGjkUpjsWSvNEFOCNWc1YfK+BRbjK6/tX
         saHw==
X-Forwarded-Encrypted: i=1; AHgh+RpM8q+IfvWzBnD6fLAPAoLHqpkDr7v367OsPps8CB8fTV/YjUVXtGW+gX27hRaHqHSdssiTzEOaNhs3@vger.kernel.org
X-Gm-Message-State: AFuF++mYzKOBnVRyP14UArQxRs68RQRLSWyCLVNITZrA+v3fjj7My0gr
	/hf8GpAEkxHSdki3EE5GaZye1uzre/TLYzQVh+ty6w+Xz/Mv2oKWvFyD
X-Gm-Gg: AR+sD103BT7Bgvcke54JFT5XgbHlkMsEDDcZFXoiwAUKvcrMcZGbtoxd3olPHoZ03XZ
	HBWW2Pl5AHXw8BPaBAREq95urGZK6b/mv1NBO1glFWjxA4UJ5KRU6p1VPce5BCCiyOrCqo2Bk6v
	n+MUgZAkacl104bfykH9xKWEpan0CZxqRumcoGCCCNc6b9DxE4BvtVvZuQjiNIaQ0tlDO81n9s+
	M5//9YhYF+sDtkCHwy/sAiIWIDJwnBUnnTHNvUWWASrap59KX1Yt3SKlhpNnoI/wsvEyKfiGUSo
	mJQElHZhDPn7Nb3yblWpcaMlAusTrrr+028dzpjnF9POV+vqUxGnZRFVWGnkuW9xZl2Gh6WBbJv
	uGlpAG00dVK9EZodrCgcammHa+wS9km/uyiROr/svEHiqjO5HJn+197x8XYBbGZ5fEL2ehJRzwk
	ECEHpFLnb6nJvEVemZsIOUAAOo+Y51ZcmWC8wUq/sFJUKnC8796Ll1kOlK3X1MVU3qQv7NL9adB
	BrbRVja4FsRD4zTIsJfOEZnBKRc0wMtZQ/qb8pL8Jeko88TtX8DXY6DblCK8FIdIExhfkF69sN1
	LWZfuyljXOfUMo0wAA8t2JvBVIgWRO5kIdoFakFeu4ES/J+/7i2dHCrQogVPI+35I12jVlLDz4N
	ozEbv5X0PbM9hQjeZ8HQ=
X-Received: by 2002:a05:6808:1905:b0:4b2:8d7b:41b8 with SMTP id 5614622812f47-4b6bf07c2damr5955510b6e.18.1788377320618;
        Wed, 02 Sep 2026 12:28:40 -0700 (PDT)
Received: from [127.0.1.1] (184-96-151-165.hlrn.qwest.net. [184.96.151.165])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46f30baa0d4sm4932181fac.6.2026.09.02.12.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:28:39 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 02 Sep 2026 13:28:25 -0600
Subject: [PATCH v8 2/2] mfd: ac200: Add X-Powers AC200 support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-submit-ac200-mfd-v8-2-2aa06720b8ac@gmail.com>
References: <20260902-submit-ac200-mfd-v8-0-2aa06720b8ac@gmail.com>
In-Reply-To: <20260902-submit-ac200-mfd-v8-0-2aa06720b8ac@gmail.com>
To: Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, 
 "Jagielski, Jedrzej" <jedrzej.jagielski@intel.com>, 
 Andre Przywara <andre.przywara@arm.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2

The X-Powers AC200 is a mixed-signal companion IC with a paged register
map accessed over I2C.

Enable and rate-lock the shared input clock, wait 40 ms before the first
register access, initialize the paged regmap and reset the chip. Assert
reset again during driver removal and system shutdown.

The Ethernet PHY is enumerated on its MDIO bus rather than as an MFD
child. It follows the x-powers,ac200 phandle and uses this regmap for
ancillary package-control access. Other AC200 functions can be added as
MFD children.

Cache only the common page selector. Individual functions can reset
independently and invalidate their other registers, so leave all
functional registers volatile.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mfd/Kconfig  |  11 +++++
 drivers/mfd/Makefile |   1 +
 drivers/mfd/ac200.c  | 136 +++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 148 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index e4fd4572472f..cac3fff5aee9 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -205,6 +205,17 @@ config MFD_AC100
 	  This driver include only the core APIs. You have to select individual
 	  components like codecs or RTC under the corresponding menus.
 
+config MFD_AC200
+	tristate "X-Powers AC200"
+	depends on I2C
+	depends on OF
+	select REGMAP_I2C
+	help
+	  Support for the X-Powers AC200 mixed-signal companion IC. The AC200
+	  contains audio, video, RTC and Fast Ethernet PHY functions and is
+	  co-packaged with some Allwinner H6 and H616 SoCs. This driver provides
+	  the shared register access used by the individual function drivers.
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
index 000000000000..8445a460ef6c
--- /dev/null
+++ b/drivers/mfd/ac200.c
@@ -0,0 +1,136 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * MFD core driver for the X-Powers AC200
+ *
+ * Copyright (C) 2019 Jernej Skrabec <jernej.skrabec@gmail.com>
+ * Copyright (C) 2026 James Hilliard <james.hilliard1@gmail.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#define AC200_SYS_CONTROL_REG			0x0002
+#define AC200_SYS_CONTROL_CHIP_RESET_DEASSERT	BIT(0)
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
+static void ac200_disable(struct regmap *regmap)
+{
+	regmap_write(regmap, AC200_SYS_CONTROL_REG, 0);
+}
+
+static int ac200_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct regmap *regmap;
+	struct clk *clk;
+	int ret;
+
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk),
+				     "failed to enable input clock\n");
+
+	ret = devm_clk_rate_exclusive_get(dev, clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to lock clock rate\n");
+
+	regmap = devm_regmap_init_i2c(client, &ac200_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "failed to initialize regmap\n");
+
+	i2c_set_clientdata(client, regmap);
+
+	/*
+	 * No minimum delay is documented. Match the vendor driver's 40 ms delay
+	 * before its first AC200 register access after enabling the input clock.
+	 */
+	msleep(40);
+
+	ret = regmap_write(regmap, AC200_SYS_CONTROL_REG, 0);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(regmap, AC200_SYS_CONTROL_REG,
+			   AC200_SYS_CONTROL_CHIP_RESET_DEASSERT);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void ac200_remove(struct i2c_client *client)
+{
+	ac200_disable(i2c_get_clientdata(client));
+}
+
+static void ac200_shutdown(struct i2c_client *client)
+{
+	ac200_disable(i2c_get_clientdata(client));
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
+	.remove = ac200_remove,
+	.shutdown = ac200_shutdown,
+	.id_table = ac200_i2c_ids,
+};
+module_i2c_driver(ac200_driver);
+
+MODULE_AUTHOR("James Hilliard <james.hilliard1@gmail.com>");
+MODULE_DESCRIPTION("X-Powers AC200 MFD core driver");
+MODULE_LICENSE("GPL");

-- 
2.53.0

