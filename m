Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB074183CC
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781544493; cv=none; b=UEktomkGNbStCmb0sy2u/iODuFlF3tfMmNGVBzbcDiHtV6pASP5N57sXUvjtV8oaEJr9mwcAjFqtbA5NXbfqf4P1K0mmuPpLd92GZNzpKmPcXO+AUsj8nbO5Uq3uKDm2uC0KB9o11zpMbchkzb7wv8coPFwR5p8uQwVtX8X24jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781544493; c=relaxed/simple;
	bh=7hJ+FTl6h+6fyNcy5OF/K7CW2W/fE3cMOF+DresIZGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gp4pB9gylu8ODvNfUKBziJPKFeq5j5AgLfs+NiOPFGvHEaOi+n5IEuWxnEnp85SFWyoVUmDml81lTNKqX6iao/4hO2xILxnRn7zSswOkScQfjYoHaBcVmM+H2Ted4+wrgCAK+FiZQGYekyvgwvw+0DPyPfVR1X0Q88Zp6hdLvuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jrZjg8iW; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jrZjg8iW"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7e6cfdc8382so2747993a34.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 10:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781544491; x=1782149291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdGvXpxhZV3aMifO6F6NzYEcuT1/loZxmdAdWZDr/EU=;
        b=jrZjg8iWTcjxTl9gElg+4Mnrf2loUZofjifsb9nskFjkWNBBMrsX2ssKNHtkM2l3tn
         rD3pMIFDqLFHbd1jXgcX33q/NIHw+CnRAZvJSluzsnhg5sdepAeqMgKGq6mVMQVJFGTg
         hb8/h66V1sUhMw5udw4E6AryIeaVoajOITDv2zopxg134Z1cYMT1WsVeJFFIuuFS/RaO
         rTAq1j3vqqUUGJ4z0TDsoyXdKe4U3LLWifAZtkE4caJfvF/9xlm+8ZbAV6Cql1568s6s
         RUXGq240wBFEJBNhAzFcZysRYpOEizTGGDYzSYS1vuk9r0PcSxRIzr3Wnljtb/YVFZAh
         Zkig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781544491; x=1782149291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MdGvXpxhZV3aMifO6F6NzYEcuT1/loZxmdAdWZDr/EU=;
        b=pfJZt9w/KOy4J9cdaBm0G1VTY1nu5rmiUzept4/QDjT4r8h5cfLMS7hfUpeJ8h3MmD
         DDGqSmg6pc0HwmJSBTg2CSExGm+cB/qxMTRGciZnXndNkKNSrq7Eb1fYNt9/DURR4p4x
         yZQ5OWxpGvL3B5vGaZmXzWAs/lX/3tlTZXg412byBdW/2hoU7x4aPRzBaWR5sY08o3IU
         g73ImQD83/fC0DadliP+9E2v64Rfe7tcDbimpgiZLV5TEeC3B7SIZXC/IkPci6f+urRb
         lzW/h6JWcLYbDf7k6TbGEl0lOXRzdVw+IpzyPdXMtD1iOF7YMkwjU7XiiD4kMQYO5Edz
         hNjg==
X-Forwarded-Encrypted: i=1; AFNElJ/U5hyst6mbiqNrWVLkWBZVScnd9ilgC0KQ+uyh8S4mlObAzU5RAjHBtQtuAsCsecy69AbAXaTXgvZL@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa3QeuD3UjhNpXZDGyZChOghThQjlsCLLsSMZyeKH0R86wYtr2
	fMJ15byJQshc/vThhXZGWxT7nckIA7/OrktgkA0+4li9653/KNCnnTjY
X-Gm-Gg: Acq92OGl3ZqXtYqenzumRTHnORAsBypkVdsMfYT/x1hnPuoJlsKcDGJsJKr4XKxojP5
	sVDZizhx2eH0MMV2ngx/hO4t775+KVCW/uA2MDvMRUzEd/MdxZMBn6ZivH/fmFFHm9Qb6cSm0d9
	50bBnikqH5hORNBDbN4CNMu3zfsewg01xea7fNzLQsy4G3eCP9cs4A2fqc43CUG+WlkdzvN6ops
	83mtndmvX9yvB7ob0XG2IOmOybUOuxM+RmLAeTVKf+osUZ4gNNi06EFAY+A1Yko1BxOaZe+TLeV
	K/4lyPloZJsLo7Kg/ZSczijrARqTMKrvN0S+P4KPYva+X4KQ677yHVzmfzQbM7J7rhpagQ/4tSt
	FWQgVUaBvoYjg1VzefYMVu+szpPJDEwk4UPe7rI1yo7T/6XUUaUA7aUr7dY8HLx7E7obEt0Ty8I
	7PV9ZsO5sgleOvb6CMc/cB4Q==
X-Received: by 2002:a05:6830:7009:b0:7e6:dc7a:f459 with SMTP id 46e09a7af769-7e7847fbf8emr9879773a34.11.1781544491219;
        Mon, 15 Jun 2026 10:28:11 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e79f451fe7sm4480033a34.0.2026.06.15.10.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:28:10 -0700 (PDT)
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
Subject: [PATCH V13 4/9] iio: imu: inv_icm42607: Add SPI For icm42607
Date: Mon, 15 Jun 2026 12:25:47 -0500
Message-ID: <20260615172554.160910-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615172554.160910-1-macroalpha82@gmail.com>
References: <20260615172554.160910-1-macroalpha82@gmail.com>
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
---
 drivers/iio/imu/inv_icm42607/Kconfig          |  12 ++
 drivers/iio/imu/inv_icm42607/Makefile         |   3 +
 .../iio/imu/inv_icm42607/inv_icm42607_spi.c   | 107 ++++++++++++++++++
 3 files changed, 122 insertions(+)
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
index 000000000000..6072ed7adc86
--- /dev/null
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2026 InvenSense, Inc.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/dev_printk.h>
+#include <linux/err.h>
+#include <linux/mod_devicetable.h>
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
+		return dev_err_probe(dev, -ENODEV, "Failed to get SPI data\n");
+
+	if (spi->mode & SPI_3WIRE)
+		return dev_err_probe(dev, -ENODEV, "SPI 3-wire mode not supported\n");
+
+	regmap = devm_regmap_init_spi(spi, &inv_icm42607_regmap_config);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "Failed to register spi regmap\n");
+
+	return inv_icm42607_core_probe(regmap, hw,
+				       inv_icm42607_spi_bus_setup);
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

