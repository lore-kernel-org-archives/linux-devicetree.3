Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FCE4314AB
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 16:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171050; cv=none; b=bhkkZFYaOEGwCMrI428zUsRIAHQ6RvbLdwHSzM9mb1ZurMyDYsJZByhBHHWsaQVGlcOJD0AyzOLX5SjQIoqT9oPW55Uaq6cCW7etKip1SfXP1AYrfBB+hnEXfuHDJelPTRBEs8LLGhkpr6stYtYbghbMd/OiPU8k6popo2yJhWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171050; c=relaxed/simple;
	bh=u8sqJFwDMCgRXeJu9/AxLtYBFuVF587TRulRfeDXXMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BvfQLO4alHyRtOho40PUCdELbRayrGZsptDvFwyYBZlUB1OyeHJwh/Cln/nWVOvP8pvHRotGn+ri+8K6uZ1U5FtjNa6UfKJR6LcijRjhgnHfQM7yL99fabC4xbfvlmB+CrWBODitNV3XEzPHT3jsGJ5Uf2iNv5LrP+FNlBf+QFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXi82Nmn; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXi82Nmn"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-49ff971e903so83718b6e.0
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 09:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785171046; x=1785775846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X7cKInG3LvCx702WPltJ7pIgcjx5mq1L90Yz6/fhnzA=;
        b=iXi82NmnE5ufPgB6OlNRYGJy+Cq5BcBERKVoGeUbF5ZifsukFPw4DWrVNzU1X+D4gw
         tZGNrnQmut0m9OIHZLmhwtNA8+9cadEqP/L3vTZkztyMkhWproEvEBxDI1cxYv1uQgZv
         wpKwzhrrQV17boi2SrnW9gIqBNzgP0Q/Ny8fl+yTLp+kGbwaxNqlQz26zNvSo62muyAV
         X6gv7WC0h6fK1TR/Eay1BY8YKhvOOP00DTJ1REYJl2ZqS9xuKzt5SDB6JgYx364VoQOK
         KhPwbJAv2sbWp52GOvLKrCegY1wwB2RD+tcTPG3Z/FuB0kTJk0+szc2/dbd0WEFxvXzB
         cZCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785171046; x=1785775846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X7cKInG3LvCx702WPltJ7pIgcjx5mq1L90Yz6/fhnzA=;
        b=EcQTSmyrfO9L7b+MzGM1x6pgVzd+Sc04Hb5UhcWL1ZVkwj7XBXeHhinBh9dL0lG7xP
         J+y5DchPSsPmCk0qrhicNANqlDf0KAoCQLxBgckj9gs4qKVgh0uSN4e/oPCMLF1B1MIy
         +M0Q3Uyd3tUCiZjpoTbf/9xFKShAUNEI2hlOkY+hGLUw1GEWYNhA1GO9ViRRoRYeG6/p
         PSvdbeQh0iIrtKBgJ5FUUnMfjTxS3ZvQUUCvjtsZ7zG41Jzn2BIKNyhB2UppzzaxE2uL
         WSAcEB7lOa/QXFCeU2uL+gCwZRuLxJcw1rRNuqQgQQ377l/hO98wo+ForvFwaxerNYyn
         Bt/w==
X-Forwarded-Encrypted: i=1; AHgh+RpQ4S+4cOT7b7wdtA6EtgOnNs6kKxYGyZy4h2uSGbXUJII+Iv85cbw1VcLEmeBB8NC1yDLOts4GSPTJ@vger.kernel.org
X-Gm-Message-State: AOJu0YygudDaKrHZUoNbGa7ur8s+czhxb9/Dg7go7xeK0MIyQCcU9oHA
	1Z7kScLEOo5fgjwGWfkr940q9qf/t6fVN7gfxGSTJrt+Oot40pgogRtE
X-Gm-Gg: AR+sD11HUa7ex6GUIeXGJmAdU/udDqdE8P9q/qKloiO90lUdE3K1yj74T3raiheWYRf
	v+ujNizv+NhkccAWdsdizZEMyTPOAVNgpC1qzbYLuYNMudgVIs498kKPcm1mUc6DP6CWvj9ALLh
	6Tuw0TKbSANYBEd69yHP40D+xn2SxF1r033k8AmXpbEw/yLAzaUOnDTXXZOYD8+lml7yi6eu3up
	RybX+JvzpW2a5niZO3nUQEOAOWqAgRM47HOMgJr4Wq3dXezLh/0mA/lHsZ6KVIKNDxArZhwrsTk
	xkoUZg5/syK8SIGSfqwSipYGzwjcLna9iiLYV4zWpFi8Y5ZI/RJxmBEO2Q4d2ZhvKT7ghpx9ZIH
	eIWiqKcV7gjY2F1dlCEmLz53xxkb0xAloJNEQ2cai5NBdxu5UN+/kvQWx/rASzL1AE9NOP1Cy68
	hklRJQchPCn5w7+bt1gsTg
X-Received: by 2002:a05:6808:f89:b0:49a:7714:ed25 with SMTP id 5614622812f47-4ad55117708mr186818b6e.3.1785171046578;
        Mon, 27 Jul 2026 09:50:46 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0:30e7:7cd7:b59:5863])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ab0c7a1912sm11395050b6e.2.2026.07.27.09.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 09:50:45 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-iio@vger.kernel.org
Cc: andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com,
	jic23@kernel.org,
	jean-baptiste.maneyrol@tdk.com,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	andriy.shevchenko@intel.com,
	Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH V20 4/9] iio: imu: inv_icm42607: Add SPI For icm42607
Date: Mon, 27 Jul 2026 11:48:08 -0500
Message-ID: <20260727164815.65190-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727164815.65190-1-macroalpha82@gmail.com>
References: <20260727164815.65190-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add SPI driver support for InvenSense ICM-42607 devices.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/iio/imu/inv_icm42607/Kconfig          |  12 ++
 drivers/iio/imu/inv_icm42607/Makefile         |   3 +
 .../iio/imu/inv_icm42607/inv_icm42607_spi.c   | 106 ++++++++++++++++++
 3 files changed, 121 insertions(+)
 create mode 100644 drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c

diff --git a/drivers/iio/imu/inv_icm42607/Kconfig b/drivers/iio/imu/inv_icm42607/Kconfig
index 083c212087ab..23f461f57afc 100644
--- a/drivers/iio/imu/inv_icm42607/Kconfig
+++ b/drivers/iio/imu/inv_icm42607/Kconfig
@@ -16,3 +16,15 @@ config INV_ICM42607_I2C
 
 	  This driver can be built as a module. The module will be called
 	  inv-icm42607-i2c.
+
+config INV_ICM42607_SPI
+	tristate "InvenSense ICM-42607 SPI driver"
+	depends on SPI_MASTER
+	select INV_ICM42607
+	select REGMAP_SPI
+	help
+	  This driver supports the InvenSense ICM-42607 motion tracking
+	  device over SPI.
+
+	  This driver can be built as a module. The module will be called
+	  inv-icm42607-spi.
diff --git a/drivers/iio/imu/inv_icm42607/Makefile b/drivers/iio/imu/inv_icm42607/Makefile
index 32046e2727d7..be109102e203 100644
--- a/drivers/iio/imu/inv_icm42607/Makefile
+++ b/drivers/iio/imu/inv_icm42607/Makefile
@@ -5,3 +5,6 @@ inv-icm42607-y += inv_icm42607_core.o
 
 obj-$(CONFIG_INV_ICM42607_I2C) += inv-icm42607-i2c.o
 inv-icm42607-i2c-y += inv_icm42607_i2c.o
+
+obj-$(CONFIG_INV_ICM42607_SPI) += inv-icm42607-spi.o
+inv-icm42607-spi-y += inv_icm42607_spi.o
diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c b/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c
new file mode 100644
index 000000000000..eb04036a6712
--- /dev/null
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2026 InvenSense, Inc.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/dev_printk.h>
+#include <linux/err.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <linux/spi/spi.h>
+
+#include "inv_icm42607.h"
+
+static int inv_icm42607_spi_bus_setup(struct inv_icm42607_state *st)
+{
+	unsigned int val;
+	int ret;
+
+	/* Only support 4-wire mode for now. */
+	ret = regmap_set_bits(st->map, INV_ICM42607_REG_DEVICE_CONFIG,
+				      INV_ICM42607_DEVICE_CONFIG_SPI_AP_4WIRE);
+	if (ret)
+		return ret;
+
+	ret = regmap_clear_bits(st->map, INV_ICM42607_REG_INTF_CONFIG1,
+				INV_ICM42607_INTF_CONFIG1_I3C_DDR_EN |
+				INV_ICM42607_INTF_CONFIG1_I3C_SDR_EN);
+	if (ret)
+		return ret;
+
+	val = FIELD_PREP(INV_ICM42607_DRIVE_CONFIG3_SPI_MASK,
+			 INV_ICM42607_SLEW_RATE_2NS);
+	ret = regmap_update_bits(st->map, INV_ICM42607_REG_DRIVE_CONFIG3,
+				 INV_ICM42607_DRIVE_CONFIG3_SPI_MASK, val);
+	if (ret)
+		return ret;
+
+	val = FIELD_PREP(INV_ICM42607_INTF_CONFIG0_UI_SIFS_CFG_MASK,
+			 INV_ICM42607_INTF_CONFIG0_UI_SIFS_CFG_I2C_DIS);
+
+	return regmap_update_bits(st->map, INV_ICM42607_REG_INTF_CONFIG0,
+				  INV_ICM42607_INTF_CONFIG0_UI_SIFS_CFG_MASK,
+				  val);
+}
+
+static int inv_icm42607_probe(struct spi_device *spi)
+{
+	const struct inv_icm42607_hw *hw;
+	struct device *dev = &spi->dev;
+	struct regmap *regmap;
+
+	hw = spi_get_device_match_data(spi);
+	if (!hw)
+		return dev_err_probe(dev, -ENODATA, "Failed to get SPI data\n");
+
+	if (spi->mode & SPI_3WIRE)
+		return dev_err_probe(dev, -ENODEV, "SPI 3-wire mode not supported\n");
+
+	regmap = devm_regmap_init_spi(spi, &inv_icm42607_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "Failed to register spi regmap\n");
+
+	return inv_icm42607_core_probe(regmap, hw, inv_icm42607_spi_bus_setup);
+}
+
+static const struct spi_device_id inv_icm42607_spi_id_table[] = {
+	{
+		.name = "icm42607",
+		.driver_data = (kernel_ulong_t)&inv_icm42607_hw_data,
+	}, {
+		.name = "icm42607p",
+		.driver_data = (kernel_ulong_t)&inv_icm42607p_hw_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, inv_icm42607_spi_id_table);
+
+static const struct of_device_id inv_icm42607_of_matches[] = {
+	{
+		.compatible = "invensense,icm42607",
+		.data = &inv_icm42607_hw_data,
+	},
+	{
+		.compatible = "invensense,icm42607p",
+		.data = &inv_icm42607p_hw_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, inv_icm42607_of_matches);
+
+static struct spi_driver inv_icm42607_driver = {
+	.driver = {
+		.name = "inv-icm42607-spi",
+		.of_match_table = inv_icm42607_of_matches,
+	},
+	.id_table = inv_icm42607_spi_id_table,
+	.probe = inv_icm42607_probe,
+};
+module_spi_driver(inv_icm42607_driver);
+
+MODULE_AUTHOR("InvenSense, Inc.");
+MODULE_DESCRIPTION("InvenSense ICM-42607 SPI driver");
+MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("IIO_ICM42607");
-- 
2.43.0

