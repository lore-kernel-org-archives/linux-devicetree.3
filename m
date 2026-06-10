Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D98352F85
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 17:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781114252; cv=none; b=A+jRUNI1S5x1yH+1DMVQ+jYp2oIipYZyLxJW7xWAWP533cxsENpcNo77PvwZhN93M0AQD6znS35wtLeAS2O/AomkRF9tl/v+qdgGOmLq2gNjqvEZlztaRPbZ1sSyUcjcrMe4xy8IstnMIfDxKBMEPk87VO9gcefp6AaMJ9DhkOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781114252; c=relaxed/simple;
	bh=Hal5qOvagB1ul9vsYeAe3xb/Oxfjm4EuCOrq7/Hr/Ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N/IzOylQoO5t+tfVsf6xs05dFo/lRek5wO83W2MvVkn84//3X1QDG4z7SXPvVv97ptoyHGxfWJk2UujntGg5g1iWJeq8/pWGagGqSGntEx8IDI4PlStUo1GJ0iOWyQJ/IW6+HLjAYwXzWdh4NDCcfXBUuMiVU9qtR7jarsr6+Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WhqzWa4S; arc=none smtp.client-ip=209.85.167.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WhqzWa4S"
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-486b93fc7c8so2060950b6e.3
        for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 10:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781114250; x=1781719050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Y4ne6J/krNcpETT8MGOTaoOj1NALXr/duHgeNONebA=;
        b=WhqzWa4SqTHIPQEHoW/dVKslUqgUFY6+7JLBKZui/C2FWVlhqfdjeUmW6sWp0wR1Ut
         BC3OxmYlCoBqHQE7eyR4SDgRNLMuQLBHz7zpEitgXvHVC0LJddsPlil9w5qGhx3zOaYe
         BJNVcNfwW30uigXfJ0Q9Mp4AFBpV8p7wcFq0NXZWU+Cl5VnRgfsHBusVETspEAv+aMtK
         jeAs2bB4l/2fKhu3s+KKz9yEMZIx+StvPCTQ4NwMTUDT+Cyv0bank+D03Hby1T3nYonp
         KHgLVaq6xzLvEyNpFXgZmibHMC1S4PgVS24GUr5qJLgx2bVxMap6lskMf/s4wb7agBAO
         t3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781114250; x=1781719050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Y4ne6J/krNcpETT8MGOTaoOj1NALXr/duHgeNONebA=;
        b=Ud80A1lBJauT0uzL5tgaNfaquOXuEn5d+lkz/TAOqx1OTOhsBQCEhhVMyXcZp/OTdo
         KJ4zC7FP3Ej6kWMHYjV3QZ5nqEpcUIUnah73/NrxR6u5mjSSGOI7hS+y8CIbr3peYpth
         MGkdYEdjlyU7ulP4Y6oDi8liQydKS4lIyEPDNDqMDcd+vdPjEUwyixdgI6GGc/snPM3h
         u3hk4M/Vfs6x/Ww5bmgLIMtrjbyt2W3v9LYovYrD2xG0Iqfsz5zZB8BC6MJnkZPuZb42
         4nEO1BqlC25gF3/4fz4Mhd5MIm9zDGQGawtSVwf9DZrWPObQe9kf6Qnb7DzbZGE5zOyT
         sbxQ==
X-Forwarded-Encrypted: i=1; AFNElJ96vX1GunztV3738OW7I7qo/dTQUZukrE15/JUuZuZXESHmG1eMvu7rGae+U3uJknY6E7Dtxk9KRw9u@vger.kernel.org
X-Gm-Message-State: AOJu0YwrOreIzPhtkvhT1RhZ8VMD4qgv4ZmsTw4dUaOO/w0GfR8PYTuf
	JGprv/vCDg3StXhU9g+q6wIVGsAVwwtp/6fuK7WAs746FekQXzO8VkOlfFZk2w==
X-Gm-Gg: Acq92OH0Yu8cG00q+0k8YFgclsPd0hj3qRNjxBDvfj09s8Fd/ukDug/zW/UntuBSIsd
	CWIwI/Y6113jaA7xNLTxhpBI7RuXVHSh5BT+RNue7t9e3PUbPBoUkbOksgt2m/jrIxsVlKthDh0
	QORKfT5oZ1HfpdxtJAVkiyXHOQfxcbyj1dYnVkC31qEPLozybtjX9lhhuOuXJSXHz+O/eyg/SHg
	GWJQGUdTwvUoGb1ZM8Au7zOkqF5/+qcOCnsF/tBcLB/Op8p4yWS2mFdNAkfqMBLIrxKle43Vl/j
	iYCu4K6iexZ6pq5EmFxgnMXEyc6Ojw+chbev3SCP1finlvZeEhgdDNQe53d4gxoKTi7ZyAlYFKa
	3ne8Mu3QFkn7LKoO5RGwQAyhNfL37l5rlpAk9igr+35TKpCO1GnpHj0ZZZGW6+6aBleUrxb6ztQ
	eyr6bbeyon7D1osswK/Pzo82lt+bmuMvbPsOZfhCwtBaKTqP5Gq642/ogz3NUlu5JN
X-Received: by 2002:a05:6808:2388:b0:485:a9c1:db8 with SMTP id 5614622812f47-4868defc36bmr15753067b6e.42.1781114249836;
        Wed, 10 Jun 2026 10:57:29 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0:b86b:51ed:28ca:695f])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-440d7d4f449sm21180794fac.8.2026.06.10.10.57.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 10:57:29 -0700 (PDT)
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
Subject: [PATCH V11 6/9] iio: imu: inv_icm42607: Add Temp Support in icm42607
Date: Wed, 10 Jun 2026 12:54:50 -0500
Message-ID: <20260610175455.19006-7-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260610175455.19006-1-macroalpha82@gmail.com>
References: <20260610175455.19006-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add functions for reading temperature sensor data.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/iio/imu/inv_icm42607/Makefile         |  1 +
 drivers/iio/imu/inv_icm42607/inv_icm42607.h   |  5 ++
 .../iio/imu/inv_icm42607/inv_icm42607_core.c  | 18 ++++
 .../iio/imu/inv_icm42607/inv_icm42607_temp.c  | 82 +++++++++++++++++++
 .../iio/imu/inv_icm42607/inv_icm42607_temp.h  | 33 ++++++++
 5 files changed, 139 insertions(+)
 create mode 100644 drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c
 create mode 100644 drivers/iio/imu/inv_icm42607/inv_icm42607_temp.h

diff --git a/drivers/iio/imu/inv_icm42607/Makefile b/drivers/iio/imu/inv_icm42607/Makefile
index be109102e203..c04953ed42ce 100644
--- a/drivers/iio/imu/inv_icm42607/Makefile
+++ b/drivers/iio/imu/inv_icm42607/Makefile
@@ -2,6 +2,7 @@
 
 obj-$(CONFIG_INV_ICM42607) += inv-icm42607.o
 inv-icm42607-y += inv_icm42607_core.o
+inv-icm42607-y += inv_icm42607_temp.o
 
 obj-$(CONFIG_INV_ICM42607_I2C) += inv-icm42607-i2c.o
 inv-icm42607-i2c-y += inv_icm42607_i2c.o
diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607.h b/drivers/iio/imu/inv_icm42607/inv_icm42607.h
index 1f1397eaa00e..1246a92edffc 100644
--- a/drivers/iio/imu/inv_icm42607/inv_icm42607.h
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607.h
@@ -120,6 +120,7 @@ struct inv_icm42607_suspended {
  *  @orientation:	sensor chip orientation relative to main hardware.
  *  @conf:		chip sensors configurations.
  *  @suspended:		suspended sensors configuration.
+ *  @buffer:		data transfer buffer aligned for DMA.
  */
 struct inv_icm42607_state {
 	struct mutex lock;
@@ -130,6 +131,7 @@ struct inv_icm42607_state {
 	struct iio_mount_matrix orientation;
 	struct inv_icm42607_conf conf;
 	struct inv_icm42607_suspended suspended;
+	__be16 buffer[3] __aligned(IIO_DMA_MINALIGN);
 };
 
 /* Virtual register addresses: @bank on MSB (4 upper bits), @address on LSB */
@@ -361,6 +363,9 @@ extern const struct inv_icm42607_hw inv_icm42607_hw_data;
 extern const struct inv_icm42607_hw inv_icm42607p_hw_data;
 extern const struct dev_pm_ops inv_icm42607_pm_ops;
 
+int inv_icm42607_set_temp_conf(struct inv_icm42607_state *st, bool enable,
+			       unsigned int *sleep_ms);
+
 int inv_icm42607_core_probe(struct regmap *regmap,
 			    const struct inv_icm42607_hw *hw,
 			    inv_icm42607_bus_setup bus_setup);
diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
index 5e1f924a3e34..88e3a064434b 100644
--- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
@@ -117,6 +117,24 @@ static int inv_icm42607_set_pwr_mgmt0(struct inv_icm42607_state *st,
 	return 0;
 }
 
+int inv_icm42607_set_temp_conf(struct inv_icm42607_state *st, bool enable,
+			       unsigned int *sleep_ms)
+{
+	unsigned int val;
+	int ret;
+
+	val = FIELD_PREP(INV_ICM42607_TEMP_CONFIG0_FILTER_MASK,
+			 INV_ICM42607_FILTER_BW_34HZ);
+	ret = regmap_update_bits(st->map, INV_ICM42607_REG_TEMP_CONFIG0,
+				 INV_ICM42607_TEMP_CONFIG0_FILTER_MASK, val);
+	if (ret)
+		return ret;
+
+	return inv_icm42607_set_pwr_mgmt0(st, st->conf.gyro.mode,
+					  st->conf.accel.mode, enable,
+					  sleep_ms);
+}
+
 static int inv_icm42607_set_conf(struct inv_icm42607_state *st,
 				 const struct inv_icm42607_conf *conf)
 {
diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c b/drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c
new file mode 100644
index 000000000000..55260082a19e
--- /dev/null
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2026 InvenSense, Inc.
+ */
+
+#include <linux/device.h>
+#include <linux/iio/iio.h>
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include "inv_icm42607.h"
+#include "inv_icm42607_temp.h"
+
+static int inv_icm42607_temp_read(struct inv_icm42607_state *st, s16 *temp)
+{
+	struct device *dev = regmap_get_device(st->map);
+	__be16 *raw;
+	int ret;
+
+	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&st->lock);
+
+	ret = inv_icm42607_set_temp_conf(st, true, NULL);
+	if (ret)
+		return ret;
+
+	raw = &st->buffer[0];
+	ret = regmap_bulk_read(st->map, INV_ICM42607_REG_TEMP_DATA1,
+			       raw, sizeof(*raw));
+	if (ret)
+		return ret;
+
+	*temp = be16_to_cpup(raw);
+	if (*temp == INV_ICM42607_DATA_INVALID)
+		return -EINVAL;
+
+	return 0;
+}
+
+int inv_icm42607_temp_read_raw(struct iio_dev *indio_dev,
+				struct iio_chan_spec const *chan,
+				int *val, int *val2, long mask)
+{
+	struct inv_icm42607_state *st = iio_device_get_drvdata(indio_dev);
+	s16 temp;
+	int ret;
+
+	if (chan->type != IIO_TEMP)
+		return -EINVAL;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		if (!iio_device_claim_direct(indio_dev))
+			return -EBUSY;
+		ret = inv_icm42607_temp_read(st, &temp);
+		iio_device_release_direct(indio_dev);
+		if (ret)
+			return ret;
+		*val = temp;
+		return IIO_VAL_INT;
+	/*
+	 * T°C = (temp / 128) + 25
+	 * Tm°C = 1000 * ((temp * 100 / 12800) + 25)
+	 * scale: 100000 / 12800 ~= 7.8125
+	 * offset: 3200
+	 */
+	case IIO_CHAN_INFO_SCALE:
+		*val = 7;
+		*val2 = 812500000;
+		return IIO_VAL_INT_PLUS_NANO;
+	case IIO_CHAN_INFO_OFFSET:
+		*val = 3200;
+		return IIO_VAL_INT;
+	default:
+		return -EINVAL;
+	}
+}
diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_temp.h b/drivers/iio/imu/inv_icm42607/inv_icm42607_temp.h
new file mode 100644
index 000000000000..e03924e30866
--- /dev/null
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_temp.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (C) 2026 InvenSense, Inc.
+ */
+
+#ifndef INV_ICM42607_TEMP_H_
+#define INV_ICM42607_TEMP_H_
+
+#include <linux/bitops.h>
+
+struct iio_dev;
+struct iio_chan_spec;
+
+#define INV_ICM42607_TEMP_CHAN(_index)				\
+{								\
+	.type = IIO_TEMP,					\
+	.info_mask_separate =					\
+		BIT(IIO_CHAN_INFO_RAW) |			\
+		BIT(IIO_CHAN_INFO_OFFSET) |			\
+		BIT(IIO_CHAN_INFO_SCALE),			\
+	.scan_index = _index,					\
+	.scan_type = {						\
+		.sign = 's',					\
+		.realbits = 16,					\
+		.storagebits = 16,				\
+	},							\
+}
+
+int inv_icm42607_temp_read_raw(struct iio_dev *indio_dev,
+			       struct iio_chan_spec const *chan,
+			       int *val, int *val2, long mask);
+
+#endif
-- 
2.43.0

