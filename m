Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C35309DDB
	for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 18:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782325975; cv=none; b=fWQ6PDWkGXKQj1zyS2gPbivUdal1pjyNmMWtYFd/N+i9JsLYs5y/ELV4/VkMg+27DNXccqpWqO1/aHoxAgN2QVhwhSyaZpTCBZnIgoiVsEfUfUYD746MramBRrp0wC9Xcsh553dzhPJZHSzoGk5EFTyKIKqzL6+2HuBFh5YDx5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782325975; c=relaxed/simple;
	bh=EwUhbadN1Im2bkZ9VoB16JK4sibWepdJ2O+0o+fboIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AuFpTgKG0nNUIMD1JfzljlSxaHNUif2iiHHPVF1uxv+ypWMAz/iXXuBokVZFUd5dvDpnb7WNbaPzD/XFH8PsOJJN2ai3Fap2UrC7wGLFFVygz+Re6E3xfGeK8LnM2JehvmnZed+DvyFdTmOZodJ4wPmRhj3X6Dk3v3O1/cqNMJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BH3EK1MK; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BH3EK1MK"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4479ab2e41eso913781fac.2
        for <devicetree@vger.kernel.org>; Wed, 24 Jun 2026 11:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782325973; x=1782930773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amfAVbQez/BN+/HnY0UUcI6hhhMwwGWjngaLvflxCvM=;
        b=BH3EK1MKvSmGT4wy+YBMoo9Z1gIMDQPoTpwkRsWhOdKT6LvFEqZl1E0I9YdNtm8bge
         40M8J2Fanh/V55n34MFCM1Irpsmcd6DrcKrGQ2zqGzIyQa0nMYMpgyh+xZSfQiZbraKd
         6f6JzcfmJHnrtuLJTcD1FEUkaIysO7/TG9QvfUc2FsJvEtT4uT+xJ+t5oq2qUi3GN9Xg
         c1wWpPnsjMK2TlZFJUobdCebIGWSpnEgL0dRTke0Dg0h6fW4HaFu1gcY7DdVXTSrRlZ4
         qiRhXeSGD07IVCFGpCpOEZbNlvBBJiIh9HaHw45FWplWNZ+7o0FBEAosqS9r6jbDu7b7
         kkEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782325973; x=1782930773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=amfAVbQez/BN+/HnY0UUcI6hhhMwwGWjngaLvflxCvM=;
        b=IGbwXMvaxKG4PHl7mbGtVyUxrOGQyU6ucmAe56ALHvYkTdNmhY92AHjxSy3WKulqly
         RZMU+BPHwhL9obAos04luyE3w8pPTgSEFnudGBL42lOZSlm1TuI5VnQHfqcNIAU0Lxkz
         VEyOqcBKOrHQZKZ7TKvHu7a7A+/UFZt5G1bQgSUYjAbP3VQ25Cn5Yf7UbdzANdMkbEjf
         MU4ljcDp0zkYIA8gN9qiYsN5TwGt6ATkspeGTFvLIPoc/M8jXYhzB19oFhzU1UAcFTmd
         R46lMvA/RTtn5Yooti4nEv5wc7NtM/8n+r/hZqXmJjwEWQSbGKgFRia358+Qw37dUiAe
         HRIQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Tqpgw43jeB5oKtHE6DUBYXaqqA6VjNPoFaIpnUCuj0r8dZ52yzCFxhQIaUog4+Xc759J3NJBIFFWk@vger.kernel.org
X-Gm-Message-State: AOJu0YxCyx3DEk+4hLIqCV9ynmKI75hdxFPHPkI6dfV+GepUxyGwmW/r
	tUDe+A1XF7iRVeLus0VRMAvE5bs/07O7J2nW8jhgu35dMJbAyhQAg0SV
X-Gm-Gg: AfdE7cmC3aPS3pPMLhGuNM38j88koMiqMPDnHEBPMFXEW6zP1S+wTHjZHzjcAjH2vEO
	xOZtP+SUzdkhNqAhI3rRPduCgI8ognMIzdwA5oR9ni5LMXgqtqFWJbrtzPvMXX4Cv/sj7S5Vo/z
	UFsshZcjNIvGqnt72jQhvbsxHLp2HV5o86RKpGyaNA1s7EmAkfEh/s40zJXkuUfOhq0oBpY9uMq
	hOIIkA5Tbf2zJBQSidh7+L+P643+PbCmGp+FkVV8ifAK/Gt273gX7X15ssN2II9jXguM2fZYnN2
	MMSx5DXLAujOn66pHlLnvn1Nl0Dsq26qbJKdRKsn1/euuUv19ifNpQbcJtutP5jSuB+PBYTUciK
	nBuRFTsTS4LsHZciqbEKCT0tg71ehG9G3+0Ws3qjURCabVF7aFvxjB73VMZUQx62836OLVPxDla
	w/4SzSVqQApMA=
X-Received: by 2002:a05:6870:9e83:b0:441:f3f6:622b with SMTP id 586e51a60fabf-447b5ab20a6mr6482443fac.5.1782325973322;
        Wed, 24 Jun 2026 11:32:53 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4472f042517sm9968060fac.13.2026.06.24.11.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 11:32:53 -0700 (PDT)
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
Subject: [PATCH V14 8/9] iio: imu: inv_icm42607: Add Temp Support in icm42607
Date: Wed, 24 Jun 2026 13:23:47 -0500
Message-ID: <20260624182350.50467-9-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624182350.50467-1-macroalpha82@gmail.com>
References: <20260624182350.50467-1-macroalpha82@gmail.com>
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
 .../iio/imu/inv_icm42607/inv_icm42607_accel.c |  8 ++
 .../iio/imu/inv_icm42607/inv_icm42607_gyro.c  |  8 ++
 .../iio/imu/inv_icm42607/inv_icm42607_temp.c  | 99 +++++++++++++++++++
 .../iio/imu/inv_icm42607/inv_icm42607_temp.h  | 37 +++++++
 5 files changed, 153 insertions(+)
 create mode 100644 drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c
 create mode 100644 drivers/iio/imu/inv_icm42607/inv_icm42607_temp.h

diff --git a/drivers/iio/imu/inv_icm42607/Makefile b/drivers/iio/imu/inv_icm42607/Makefile
index 8e73385c8f4b..7b907e019601 100644
--- a/drivers/iio/imu/inv_icm42607/Makefile
+++ b/drivers/iio/imu/inv_icm42607/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_INV_ICM42607) += inv-icm42607.o
 inv-icm42607-y += inv_icm42607_core.o
 inv-icm42607-y += inv_icm42607_gyro.o
 inv-icm42607-y += inv_icm42607_accel.o
+inv-icm42607-y += inv_icm42607_temp.o
 
 obj-$(CONFIG_INV_ICM42607_I2C) += inv-icm42607-i2c.o
 inv-icm42607-i2c-y += inv_icm42607_i2c.o
diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c b/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
index 8ef9fdae1bc8..5ff6756b9515 100644
--- a/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_accel.c
@@ -15,6 +15,7 @@
 #include <linux/types.h>
 
 #include "inv_icm42607.h"
+#include "inv_icm42607_temp.h"
 
 #define INV_ICM42607_ACCEL_CHAN(_modifier, _index, _ext_info)			\
 {										\
@@ -40,6 +41,7 @@ enum inv_icm42607_accel_scan {
 	INV_ICM42607_ACCEL_SCAN_X,
 	INV_ICM42607_ACCEL_SCAN_Y,
 	INV_ICM42607_ACCEL_SCAN_Z,
+	INV_ICM42607_ACCEL_SCAN_TEMP,
 };
 
 static const struct iio_chan_spec_ext_info inv_icm42607_accel_ext_infos[] = {
@@ -54,6 +56,7 @@ static const struct iio_chan_spec inv_icm42607_accel_channels[] = {
 				inv_icm42607_accel_ext_infos),
 	INV_ICM42607_ACCEL_CHAN(IIO_MOD_Z, INV_ICM42607_ACCEL_SCAN_Z,
 				inv_icm42607_accel_ext_infos),
+	INV_ICM42607_TEMP_CHAN(INV_ICM42607_ACCEL_SCAN_TEMP),
 };
 
 static const int inv_icm42607_accel_scale_nano[][2] = {
@@ -186,6 +189,11 @@ static int inv_icm42607_accel_read_raw(struct iio_dev *indio_dev,
 	switch (chan->type) {
 	case IIO_ACCEL:
 		break;
+	case IIO_TEMP:
+		if (mask != IIO_CHAN_INFO_SAMP_FREQ)
+			return inv_icm42607_temp_read_raw(indio_dev, chan,
+							  val, val2, mask);
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c b/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c
index c7215b3826ad..4e5db5e19e9f 100644
--- a/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c
@@ -15,6 +15,7 @@
 #include <linux/types.h>
 
 #include "inv_icm42607.h"
+#include "inv_icm42607_temp.h"
 
 #define INV_ICM42607_GYRO_CHAN(_modifier, _index, _ext_info)			\
 {										\
@@ -40,6 +41,7 @@ enum inv_icm42607_gyro_scan {
 	INV_ICM42607_GYRO_SCAN_X,
 	INV_ICM42607_GYRO_SCAN_Y,
 	INV_ICM42607_GYRO_SCAN_Z,
+	INV_ICM42607_GYRO_SCAN_TEMP,
 };
 
 static const struct iio_chan_spec_ext_info inv_icm42607_gyro_ext_infos[] = {
@@ -54,6 +56,7 @@ static const struct iio_chan_spec inv_icm42607_gyro_channels[] = {
 			       inv_icm42607_gyro_ext_infos),
 	INV_ICM42607_GYRO_CHAN(IIO_MOD_Z, INV_ICM42607_GYRO_SCAN_Z,
 			       inv_icm42607_gyro_ext_infos),
+	INV_ICM42607_TEMP_CHAN(INV_ICM42607_GYRO_SCAN_TEMP),
 };
 
 static const int inv_icm42607_gyro_scale_nano[][2] = {
@@ -182,6 +185,11 @@ static int inv_icm42607_gyro_read_raw(struct iio_dev *indio_dev,
 	switch (chan->type) {
 	case IIO_ANGL_VEL:
 		break;
+	case IIO_TEMP:
+		if (mask != IIO_CHAN_INFO_SAMP_FREQ)
+			return inv_icm42607_temp_read_raw(indio_dev, chan,
+							  val, val2, mask);
+		break;
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c b/drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c
new file mode 100644
index 000000000000..f7e286ecb5cd
--- /dev/null
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_temp.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2026 InvenSense, Inc.
+ */
+
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/iio/iio.h>
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
+
+#include "inv_icm42607.h"
+#include "inv_icm42607_temp.h"
+
+static int inv_icm42607_temp_read(struct inv_icm42607_state *st, s16 *temp)
+{
+	struct inv_icm42607_sensor_conf conf = INV_ICM42607_SENSOR_CONF_INIT;
+	struct device *dev = regmap_get_device(st->map);
+	int ret, gyro_mode, accel_mode;
+	unsigned int val;
+	u8 raw[2];
+
+	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&st->lock);
+
+	/*
+	 * Check if both the gyro and accel are off and if so, enable one
+	 * of them. The temp sensor cannot be read if both the gyro and
+	 * accel sensor are off. Prefer to enable the accel over the gyro
+	 * as the datasheet says the gyro uses 5x more power and it has
+	 * a minimum run time of 45ms.
+	 */
+	ret = regmap_read(st->map, INV_ICM42607_REG_PWR_MGMT0, &val);
+	if (ret)
+		return ret;
+
+	accel_mode = FIELD_GET(INV_ICM42607_PWR_MGMT0_ACCEL_MODE_MASK, val);
+	gyro_mode = FIELD_GET(INV_ICM42607_PWR_MGMT0_GYRO_MODE_MASK, val);
+	if (!gyro_mode && !accel_mode) {
+		/* enable accel sensor */
+		conf.mode = INV_ICM42607_SENSOR_MODE_LOW_NOISE;
+//		ret = inv_icm42607_set_accel_conf(st, &conf);
+		ret = inv_icm42607_set_sensor_conf(st, &conf, IIO_ACCEL);
+		if (ret)
+			return ret;
+	}
+
+	ret = regmap_bulk_read(st->map, INV_ICM42607_REG_TEMP_DATA1,
+			       raw, sizeof(raw));
+	if (ret)
+		return ret;
+
+	*temp = get_unaligned_be16(raw);
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
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		ret = inv_icm42607_temp_read(st, &temp);
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
index 000000000000..cb7b460ffb44
--- /dev/null
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_temp.h
@@ -0,0 +1,37 @@
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
+	.info_mask_shared_by_all =				\
+		BIT(IIO_CHAN_INFO_SAMP_FREQ),			\
+	.info_mask_shared_by_all_available =			\
+		BIT(IIO_CHAN_INFO_SAMP_FREQ),			\
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

