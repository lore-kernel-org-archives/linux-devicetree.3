Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC84A433BB3
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 18:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784226548; cv=none; b=d2OecsLRyIYEpTX4v3qGClAarQefotgEpI7Q1VThcV7dxUbGyi/ByCTW7E3glhnncoTz8QN0oIuZ3zffftaAzkRI9VDuQx2fIZ6NlFX+lojkfDaU053fzEO8yE6vhtcjTQg7RMoqh6XAM6Agxr6LkR620vH+cfsKMBLIx30K/gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784226548; c=relaxed/simple;
	bh=WQutJRijrnKBWEOL5ffHyp1U1A8V6uH9D0gypdIpfJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Js5Pn3IJZPkuNEvXf/4QNBdKe6Gmmd5T8E/sDwDXySSuG44J1McklPtLRGc1wAcaXYUnaQuHSPEEstXu/3VAI337vg5K5CHXKZdjqxe1pY4lv47eLzr54WyVyXi6HI4W89c5onzkIJOq0IUxYGPvFxqCG7OId7aYl1VNfuM9nOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCSeQgeK; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCSeQgeK"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7e9f69ee6f4so2743039a34.2
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 11:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784226544; x=1784831344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BBQj5o1xBe0UYUjJRFQjbTlsi/qLCduPzV5e4TThaHw=;
        b=XCSeQgeKOd+JX2QIHW3SI91cl2H2K+H4zXYMjxRqANnG+M3RJW+OSIPY2ixx/Swxwk
         SVHSGpxuBZlSaqFmyZkFHNwwt05HlIoyS/ubIYXZat7xxY5XWiiA+1dGFpfeyRxeKlz4
         SK86tDDpcBhoMlZxCmGX0v4JukKdggoGkUfiW6A3zugoZALXVIBVV42Y65qh3j/uoeKH
         rZYX/6VgTF+eX6AY0Z87BPYKJDeQ7eCC7pYmxDaVbjGztn4ub/KBIaSzw32kNVVzaLvs
         2ZbNk+cv2rRXxkr6yPIyOZKzeVIcblVtdNg0kLTkukadbiwufwxtE20+prkkOtfsQ/lG
         3DGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784226544; x=1784831344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BBQj5o1xBe0UYUjJRFQjbTlsi/qLCduPzV5e4TThaHw=;
        b=Unk3cekv+BYk/RDlbx6DkDxpnscnoj/dmJVQNT4leOWkTUl1ND02nK0vAi1KvzDeHh
         8PwiYjHOV3JRDcvh2mWWFcau36JnUML+/lBEMAPhOcHnc6EiHvaLy11zIQ7pps7ZZJrE
         UQqcWug4SHPdHAFZjSbJ45vmlVjDKE2q2wXvHfF2ltixkxoJCvcQbE+ibip/rMFsZXle
         Cxp4C6e2Zeibq6Z4qy1wRHufMvra30N6cADIJsuK7zFKpPHrtNwpAYlYaoetnTMHdgyy
         6I3AwzE7o/Nui+95UH2DxwiGTeh5I2kUxJ5+rCRuFwxXFeCvJjhCV4XZqosEo8fBieKr
         zEnA==
X-Forwarded-Encrypted: i=1; AHgh+RqpME4xf9CQB5XDwNuXU2ltzhmqRgFS8Ubk7Cl4BwotG8DGOdQzW/1035AbIYjBj0NgaGqXpVpS38Hq@vger.kernel.org
X-Gm-Message-State: AOJu0YzxDhOklXjNkvtjOsUuQF/Gjdm6U6uHb4jo8Mx1DTWkBxwZbmdE
	psm/9xkFp1QJOobeamdHgmK7s7Ckw7+XokWDjAs2zx7AHtJ5GMyieCjF
X-Gm-Gg: AfdE7cnoLf/bolvvngRLg1h49jYh5GjDAIy1UjQzP1VHI3E8QM+hXn0tGrqBkADeuKz
	5gO9YBQzrNjBFiHsX2mj7oQ1/wo5p2lS16p/ZcWON2cjCOuUK9k501yTNMoyuOvfYRoPBvniWWH
	89+7RVi3U7pa2XdEvC2U9w9+xbnvNAnS857J+Qh7/3SAX38oMziBn1k0SDuLZWEvBdJFdUf3LMh
	P7/z5Zcv1Vc9sjzExseMHu9zbeDm7+An98pj6+oa60xPLrSsQppWpM5k1CBq8bJc/RhyEtgaXgB
	n6vC7EknoxfKv5n8qp8Cg0Opd+KjLXZxcYFsnPgg3wigZKLG3NVhdcTgPwwwE1fTQj+IB/mQ/Tw
	pskV2NV+xLZr7kQn3VMwOJYxBN4rK0ZUoWdF3HV2Vco1KNSIOghnBxiY/aFg/pwVhuW+3vWlVuv
	C8
X-Received: by 2002:a05:6830:710e:b0:7ec:6749:f38f with SMTP id 46e09a7af769-7ec9fe96c9emr470066a34.22.1784226544055;
        Thu, 16 Jul 2026 11:29:04 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ebcb3f6826sm19939993a34.27.2026.07.16.11.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:29:03 -0700 (PDT)
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
Subject: [PATCH V17 4/9] iio: imu: inv_icm42607: Add SPI For icm42607
Date: Thu, 16 Jul 2026 13:26:31 -0500
Message-ID: <20260716182637.24310-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716182637.24310-1-macroalpha82@gmail.com>
References: <20260716182637.24310-1-macroalpha82@gmail.com>
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
index 000000000000..8eee7f162126
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

