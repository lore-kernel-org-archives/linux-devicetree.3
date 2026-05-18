Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49506392837
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 20:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779134878; cv=none; b=HkluopHutO5LKUBV38WhpFqM9fX4jb43otbBpBLsM2jzOTpDzLZzL8fPoTZQt+XVUMAynbKvtWPifFowi99p6IWJpQ8mOKOi/2ed6L+B68rsFSq69Y5+7eEKWtPH9QRE7osUSvzo8BQkkvmF+wrB2R5NwkfJCwU1MUzLEKXtJA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779134878; c=relaxed/simple;
	bh=NKGvsX2Iv/BvU+Fq89P7HQdFPgzhFRrfbyy+AneJmJ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fA0QWao528e6eiwb1VFp1n5OzP0wWdKdq/pCKTdV2/SM/WRrvC0+Gw4DEzsNQHNQ23GCI7IgjfYmQuVTzaqtO611R8KyOuS7wyKoOfJ908AEZT41xOpdtq67uwwxFrpCskJnBb0WO/WMACGYyMdg3UcisxeYzkj7AQFVsB9tw94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sotS6cqg; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sotS6cqg"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7de4be15125so2664577a34.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 13:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779134876; x=1779739676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpMIMoMYtOrpLFBsWaOB2VeI0ANekR1SavPmEu5FFvk=;
        b=sotS6cqgDPnKuAHWPbDgmOk5Q3gFxvDJpm/A1SUm9AP+VClqFShlFT9zMCs/QCZ7NR
         l1AKRA9MNJtWaV7jDloNAEphxTDqp2zsZncod25I2VzuAht3Njmb7AChRzSXy4f9zOeQ
         A1uXJYo1J9R1J6Xkz+z11YvWVfnXpMfZeM3JwsQEjoaI7BzYkkTSYERwbUI7EBLglmL6
         OQxkrpqm0qQsRbGP3I4WWfV9gVItg+nioWJgO99MakN0+rt2kiUFfKR00iB+JuUs7T2B
         xGwzIIo5WBDJPwv5Gpkbs31X+iq+tLzH92jRLCrnk0foklpUUETug2iLrKgDI6RJKC72
         Ef3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779134876; x=1779739676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WpMIMoMYtOrpLFBsWaOB2VeI0ANekR1SavPmEu5FFvk=;
        b=Obdlv6K2hLYrYGju5CNaE4s01/RI0mi/hfylqQhuIbRkJPqjL+g1I1QKGhoI3h2Lol
         CVgRxkK9JhYJSaKTSPkfkmBEWP4eKOCCCp7JSrCJsDbK7RIiXBzaABNa0lwE+aoRcDEs
         OqpFThdNqHbP01BsuXV1L4jMhkJvm2dUqoQ8au8s2rzgJly9WZOyYzxhOWfrIkNt6z78
         BJc+WYlUjl0wsm967Sn6BRfnS/59TLlEEyS7Xv9CAmiCSep1gaRWG56NXqcN7rom843Z
         QUQ1hqt35GMHouRaDB79j08oQOM+jc5FkGxHNoeTHT8vt4q5ChTEaAV0rP841LqWF3bz
         PiFA==
X-Forwarded-Encrypted: i=1; AFNElJ+BUoQGEUuPIdxzwURqfOWYYRD3mTfLymBjNQwt/pz4EOZ/dp/YZWjmTqk7fIh8GjSlBjH8xsgzHzP0@vger.kernel.org
X-Gm-Message-State: AOJu0YxCDSaBXHFriI1MkdB3EkXa/LYN39c2PDcUihEdGOLEDId/kDhp
	GYsz+b5p5Ttg+xsrGft/bNCwzbcfWoiKKlMtGjDSsaS3Y0zuy7JGbUGR
X-Gm-Gg: Acq92OFFoNo9L6ZtE1s3TesBwInimt1NC0s1jtEXSIbsAddAZrrivhm1wAlCW4lAI+q
	ABrQ8pngHPc6QQhGVnEDSf0SZ1H5ylk8WoQuwdaEGxiA6S5G2EDJyjW3ZGlDbrcuu170QTkKnYc
	+5+b6qFv930ZBNdHmxySY3/tUNE8jSSupApDdQ/QBvhNun9g7MBBgyqkBQsaGqsEnxPAiC4gQJ/
	T1VdLGqCVbsD5+bqMr3XFM/BQyDgVMfjjpLj//8zBFwqr2c4njYwkBy+GsvKJ/+R5igYsH6Y5Rm
	EK0h9pN4e2o3bTfWQJuTpSTQDvvXntDGK5SJ+tPNKkLlmXk+7lm15glLyDpYXPUeziaF7vxO35n
	ZbNcf3nH8ge/xmihdHG/rZoN4CjPOUXHP6SP1//1UrDJVDNogC2zbZvdkTHdztjqH5SPQ1EzZvO
	qxdIQfec5fdsAy3GhL4KiMHbM7tsP6k8s=
X-Received: by 2002:a05:6820:1513:b0:67b:baae:3339 with SMTP id 006d021491bc7-69c94583a5fmr11163626eaf.45.1779134876331;
        Mon, 18 May 2026 13:07:56 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69d0462e85esm6113360eaf.6.2026.05.18.13.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 13:07:56 -0700 (PDT)
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
Subject: [PATCH V8 07/10] iio: imu: inv_icm42607: Add Temp Support in icm42607
Date: Mon, 18 May 2026 15:05:22 -0500
Message-ID: <20260518200526.458421-8-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518200526.458421-1-macroalpha82@gmail.com>
References: <20260518200526.458421-1-macroalpha82@gmail.com>
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
 .../iio/imu/inv_icm42607/inv_icm42607_temp.c  | 80 +++++++++++++++++++
 .../iio/imu/inv_icm42607/inv_icm42607_temp.h  | 33 ++++++++
 5 files changed, 135 insertions(+)
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
index adc361821ea2..2542ad1bee51 100644
--- a/drivers/iio/imu/inv_icm42607/inv_icm42607.h
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607.h
@@ -382,6 +382,9 @@ extern const struct dev_pm_ops inv_icm42607_pm_ops;
 
 u32 inv_icm42607_odr_to_period(enum inv_icm42607_odr odr);
 
+int inv_icm42607_set_temp_conf(struct inv_icm42607_state *st, bool enable,
+			       unsigned int *sleep_ms);
+
 int inv_icm42607_core_probe(struct regmap *regmap, const struct inv_icm42607_hw *hw,
 			    inv_icm42607_bus_setup bus_setup);
 
diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
index 29573d4fc0f0..5d9155e4c41f 100644
--- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
@@ -162,6 +162,24 @@ static int inv_icm42607_set_pwr_mgmt0(struct inv_icm42607_state *st,
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
index 000000000000..7e9cb072a011
--- /dev/null
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c
@@ -0,0 +1,80 @@
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
+	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
+		return -ENXIO;
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

