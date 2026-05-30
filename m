Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A68734845C
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 03:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780111225; cv=none; b=uF4MlRw2dzA5/qZ3UukInYB3lIAm0Le8HI+VJ/vbrhjunbvjH5BxXT974Pg9O7zPGnjoWKE8tMRVY8aCWLXyHq+60djrokTDiuE8YFM3Eb9EgvlJEvY51Ver8lVQb1/xJfZUpJC5M7LcaG5cKUEEkjQ9hDURo7cNmdkjikm/y4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780111225; c=relaxed/simple;
	bh=+kGR7bVxbKT9wsB2L0tfl/Mim0nn94lRb4TnvmHYGqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dEpRQBs+eqJ8fNlzkUjj90Nw5h2Up4t8YoDCZq6f9aIz7uX3bvzJdBhpjKe5oyimPSimJ0X45r687xOfiyWpAYEWpykikY6BN5F9CwuutbnQkjCs3uPQzNeYJBFdRq16V+fAtCr5E06hFEKflbfHVunsrBTbRmkXhEoDFNXwdSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qaznJj3f; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qaznJj3f"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-69d8b7aeeecso2648561eaf.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 20:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780111223; x=1780716023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RnwoxwabVhbDbMkRzoM5vsAFsTBGbwkNUwJ3O13YP5o=;
        b=qaznJj3fbKgF4oXt25XuzTN80/BdhwhKyrvR9KE+tswEX6uO4txowJ0qY3SyGxnW4a
         LIB9UBC3rpBM8gF0shR07x/2nNpwbDfHLzIgeK810G21qpKwyh2LdyrFL3YF/KBCdKTZ
         gz+qCEC+zTWu10h7jMw/Vmi7tW4DNLyswQshXojqSVbxe/iS6tTd4e8mdsB6ws+ei3A/
         SSYwvZWSAMA+NObA4gpBnKNr4pjwzas6nxJy037wJalbYbO8TZAAHxW9KYIKDCN525q1
         qDaUPMNF6Qlpxp2PFaVRR03+ReC3qet5wFh89Wias3k5495QECXGAIs1z/rMob7cKeTL
         0mtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780111223; x=1780716023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RnwoxwabVhbDbMkRzoM5vsAFsTBGbwkNUwJ3O13YP5o=;
        b=DmBQltlrswM1UUYr82QtR0EcZ4wuXHWt+N9Pec6SX90xVOKIRWK1Dve/skyjcIriAe
         p+f2wIWWF4Kt12RyrXWLWW660qL2ojtoQrqGUDND1GuLaQSHu+72sgO7NJ0YlOQiwRIl
         pkzXBsAXERvDvUwNqGY+RAoqlLgZwTf6rq45iaX9OQTfQZo0y2E4o+KFcDX70uuJo2Ti
         x3xfZCb8Yb9HV6JoXtpKTdiu47neZmHbyBFMU1AeT/C8+YjCDSnYogtQCAYtiRKHYbZf
         lbuZImMJGuvhgR3t5ykeW6SPjFyQxGXEy3koA6IQUk+gibwDkG8EUIrmb5OCjNpW4Bys
         672w==
X-Forwarded-Encrypted: i=1; AFNElJ95BS5jbG1vTmi45xblTrOt2/DmQw/vvs061fBvYXa4K7bsZpvCRNkp3BZkGu1kTI9Ptg3vGILA+a6R@vger.kernel.org
X-Gm-Message-State: AOJu0YwlAMEPnlacsY/g27e51zHisg1Z+FxjGrJGaeXtdFjW47cgJRAV
	BmF2SDbNCjU1tRLsj4e2B5JchHQTo/TLsEa6tkKoakO+iPZkHHvriDmc
X-Gm-Gg: Acq92OHQ94+r1Sp9fgr8762bd2RozYlgpNXYGN2QMur+RtZCIPklVNoOZa80+Nw1En4
	1fj/jMgdZ2s7Z0eZ1lctfZJOiL672I8YS9RBt8qfqwZCwn20ATnKhou084YaFH6ytkCNVx1xRlz
	Y58By8TiNZ13IIFckRwq2DVdrmNKZ/uAWB8oSMWNizZv5j6Qxd53JIAoU9BDgRunHtUTUqfKxcv
	/0sv/QBh06jO16IOkMDlMUOn+wz+rpbhJEmqkTIEXnCqC8iSRat7W+yyb+XptXHclsCHJd06+jC
	deuOq1y2NEIYx2BBCSq2COnYRIS4AAcQ+Uq0b7l96+3mSfho0C9iVPYkL4jZ5r6YfVFxzFowmq2
	3vAeksev+qKn4fkydJcy6fJjc7DLYuLWSaBJt+uaQ+onj9GePBbYDJS9RKla4eu9tsIeY4E6hyn
	QEUUNCkZuFMm22MbIhQZl0K5oVP+Rlbws=
X-Received: by 2002:a05:6820:2909:b0:694:8cd5:10c9 with SMTP id 006d021491bc7-69e105d8a2emr1079848eaf.51.1780111223684;
        Fri, 29 May 2026 20:20:23 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69e067e911csm2130737eaf.5.2026.05.29.20.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 20:20:23 -0700 (PDT)
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
Subject: [PATCH V9 07/11] iio: imu: inv_icm42607: Add Temp Support in icm42607
Date: Fri, 29 May 2026 22:17:34 -0500
Message-ID: <20260530031739.109063-8-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530031739.109063-1-macroalpha82@gmail.com>
References: <20260530031739.109063-1-macroalpha82@gmail.com>
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
 drivers/iio/imu/inv_icm42607/inv_icm42607.h   |  3 +
 .../iio/imu/inv_icm42607/inv_icm42607_core.c  | 18 +++++
 .../iio/imu/inv_icm42607/inv_icm42607_temp.c  | 81 +++++++++++++++++++
 .../iio/imu/inv_icm42607/inv_icm42607_temp.h  | 33 ++++++++
 5 files changed, 136 insertions(+)
 create mode 100644 drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c
 create mode 100644 drivers/iio/imu/inv_icm42607/inv_icm42607_temp.h

diff --git a/drivers/iio/imu/inv_icm42607/Makefile b/drivers/iio/imu/inv_icm42607/Makefile
index 3c9d08509793..ccb8e007cdeb 100644
--- a/drivers/iio/imu/inv_icm42607/Makefile
+++ b/drivers/iio/imu/inv_icm42607/Makefile
@@ -3,6 +3,7 @@
 obj-$(CONFIG_INV_ICM42607) += inv-icm42607.o
 inv-icm42607-y += inv_icm42607_core.o
 inv-icm42607-y += inv_icm42607_buffer.o
+inv-icm42607-y += inv_icm42607_temp.o
 
 obj-$(CONFIG_INV_ICM42607_I2C) += inv-icm42607-i2c.o
 inv-icm42607-i2c-y += inv_icm42607_i2c.o
diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607.h b/drivers/iio/imu/inv_icm42607/inv_icm42607.h
index cb878de970d4..c651f0b66d43 100644
--- a/drivers/iio/imu/inv_icm42607/inv_icm42607.h
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607.h
@@ -381,6 +381,9 @@ extern const struct dev_pm_ops inv_icm42607_pm_ops;
 
 u32 inv_icm42607_odr_to_period(enum inv_icm42607_odr odr);
 
+int inv_icm42607_set_temp_conf(struct inv_icm42607_state *st, bool enable,
+			       unsigned int *sleep_ms);
+
 int inv_icm42607_core_probe(struct regmap *regmap,
 			    const struct inv_icm42607_hw *hw,
 			    inv_icm42607_bus_setup bus_setup);
diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
index 16ead03a59f9..cf9d0c6f3f4b 100644
--- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
@@ -152,6 +152,24 @@ static int inv_icm42607_set_pwr_mgmt0(struct inv_icm42607_state *st,
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
index 000000000000..418098450592
--- /dev/null
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c
@@ -0,0 +1,81 @@
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
+	ret = regmap_bulk_read(st->map, INV_ICM42607_REG_TEMP_DATA1, raw, sizeof(*raw));
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

