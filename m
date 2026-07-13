Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8905338237F
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 22:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783980074; cv=none; b=mrU0iS24zrnGelHiKqSy1m0l4UOHhIMhJ/81lhflhcJWPXekL0chkmSCGd6xXYqIO4ZZdsEBYeqf03MJa9lbhESu7bFoA8saNlIiM7D9Jj4QJeWXOr9gb7IgdZ8wgi2Y0/biYsqPQM07z5Zs/V0/RWTZQK+0G3bok7L4thJOX14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783980074; c=relaxed/simple;
	bh=EDnZVjHdGWxN6x1n3beEdqt2gfYQ8sKlGkmfwlzU/Eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=spaZuvmXbtYhm/dQX2AUWBuGhKNAexcB33p38uiwTeUWyiXA+BVykEoyaS9ascowSHG+mrNqIy5eiB1aN0lRQDKOeAFLmVr/yarklU5VcYwBuqBlRX0xB8icztOgCeeioMIlX0pSjGKmaA+aAE8N11KlUPEKoqc8FdigZdXhJHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mDCTq+nW; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mDCTq+nW"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-489f3611e0cso2447666b6e.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 15:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783980071; x=1784584871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YbW8hHnJTyAHyKhzDJGM9luvU5Pl8RoVG668PLAoeGo=;
        b=mDCTq+nWLUm4yfTJfx+6Sl+Xww6hyI5QqZzw+zEgXWny8ThgTHlGL2LJFCOBonc8f7
         Og4hGZ1h+YDoOcQG8IdxTGjWet0Q7HcPQm7X9qejpheM+FCADP7/7MU3Rke1IHaC0lzY
         O1ulqNS+WIxTvYCGC0L5sMc01ppMExPLLwOTw/YMWX90Alv7LozozRPK8O+QSdqvPHcJ
         2Q5csr5snP8UVxt/8lrm/bIJHJkf1b0baLSqaBUGMGSvR3LBG9l8HLJ+PyxWanfhAANW
         Sb0+ik808OZBxSMou83nVSJqt8mYsxBu6Qbk0FPPs2mIQOBLvLCgxzJ+Fg7VkO2lLwbr
         650A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783980071; x=1784584871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YbW8hHnJTyAHyKhzDJGM9luvU5Pl8RoVG668PLAoeGo=;
        b=HunvI9iGhOX8cVgaSN6ZEqiDoeeYweiUofOK8kRQzb5K9c+jn+8M1kxVP8FjxUKZ7P
         I/TJPmi+qWpi2mIIxwM1TEESnw/qs1a+k03AQF+aK6fLWT0tLkn1QJVN5MXwYX93kVAK
         5MKOfHTKtCQEx7x/61Xe+eB/Gc3D9XTbwyZUCPRjfM313ulAGiPxvGJHBdaJI38ui7D0
         JIU4COqbftH9pDSIiPIDsi1Oq7Pgex9lL/VeZ8/cCcK5N/IMqYvX6sjexP0sBDna/txR
         Qkptxc83oaf0fykq1FOce4p90poLfFDK6CEi3vh6h46G9YprXrc32jGvN0gEFmzjw5pR
         +EHQ==
X-Forwarded-Encrypted: i=1; AFNElJ+F4UXJv5q3UhM6oG/f4P8sR9i6tTKiAFUIMKSrFT9bkB4b08yX2RyVovT1BVmna2Xu64ktrQKf5+PC@vger.kernel.org
X-Gm-Message-State: AOJu0YwDydFHyHxYp83OfjGBVd5Qv+J3G8c/I+c7f+fBY6YJncTY66Nl
	db5iRLnQi7yqC8tHfKZZDTO1XmDYb6g62VCNAnSCSvEuldp2QSd9Bv/g
X-Gm-Gg: AfdE7cmSTzWNpLYLHj8dlYvvxtRcJXKOZxlmNvDqD80VcV0Btnh7y8X9kNMBYTRVTqG
	SFg0AY8E75mmnz0BQpDopsDvOmkF3Qgkg3WMuDY2gxLQI0fTD4rvs0lbxdR15G5zsmXzaHUex/F
	SJVkIvwIy3gzOvjtodu5LXMxmLYc6e37Fo8/YZ7n1l1gEFCpGodQDnRnH67AMW0kLdbKUnKeDdE
	YG46uDqqXEy9+T7BVgmofiEIQx8H1y++fQvcVLFANt6KcPrgrBkTlT4zJdLFK9/UpAYY2MGwuUT
	24HrNynLJ+i0Z9JOJEeNEVQnKihYvNnZhjhWnz/W4tOL07WKlvfCxBtmGSUbcGIsCI/2d6Bt+te
	H3+m6uEQ28sSErP9rOyRDXzcmAQnG1+3QeoV7/wUs4nZxD505RPhonoc8Xd2j5nv1kPhziERtLa
	6aJlUemRt9+1k=
X-Received: by 2002:a05:6808:1409:b0:49a:a627:14ee with SMTP id 5614622812f47-4a42ad0542emr6636474b6e.15.1783980071033;
        Mon, 13 Jul 2026 15:01:11 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4a1acc82f3csm12939785b6e.3.2026.07.13.15.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 15:01:10 -0700 (PDT)
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
Subject: [PATCH v16 06/10] iio: imu: inv_icm42607: Add PM support for icm42607
Date: Mon, 13 Jul 2026 16:58:36 -0500
Message-ID: <20260713215842.69097-7-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713215842.69097-1-macroalpha82@gmail.com>
References: <20260713215842.69097-1-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Morgan <macromorgan@hotmail.com>

Add power management support for the ICM42607 device driver.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/iio/imu/inv_icm42607/inv_icm42607.h   |  21 +++
 .../iio/imu/inv_icm42607/inv_icm42607_core.c  | 165 ++++++++++++++++++
 .../iio/imu/inv_icm42607/inv_icm42607_i2c.c   |   1 +
 .../iio/imu/inv_icm42607/inv_icm42607_spi.c   |   1 +
 4 files changed, 188 insertions(+)

diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607.h b/drivers/iio/imu/inv_icm42607/inv_icm42607.h
index 169e848caf2e..cb6369cc1bfc 100644
--- a/drivers/iio/imu/inv_icm42607/inv_icm42607.h
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607.h
@@ -9,6 +9,7 @@
 #include <linux/bits.h>
 #include <linux/iio/iio.h>
 #include <linux/mutex.h>
+#include <linux/pm.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/time.h>
@@ -119,12 +120,19 @@ struct inv_icm42607_hw {
 	u8 whoami;
 };
 
+struct inv_icm42607_suspended {
+	enum inv_icm42607_sensor_mode gyro;
+	enum inv_icm42607_sensor_mode accel;
+};
+
 /**
  *  struct inv_icm42607_state - driver state variables
  *  @hw:		Hardware specific data.
  *  @lock:		lock for serializing multiple registers access.
  *  @map:		regmap pointer.
  *  @vddio_supply:	I/O voltage regulator for the chip.
+ *  @vddio_en:		I/O voltage status for runtime PM.
+ *  @suspended:		suspended sensors configuration.
  *  @conf:		chip sensors configurations.
  *  @orientation:	sensor chip orientation relative to main hardware.
  */
@@ -133,6 +141,8 @@ struct inv_icm42607_state {
 	struct mutex lock;
 	struct regmap *map;
 	struct regulator *vddio_supply;
+	bool vddio_en;
+	struct inv_icm42607_suspended suspended;
 	struct inv_icm42607_conf conf;
 	struct iio_mount_matrix orientation;
 };
@@ -352,11 +362,22 @@ struct inv_icm42607_state {
 #define INV_ICM42607_GYRO_STOP_TIME_US			(45 * USEC_PER_MSEC)
 #define INV_ICM42607_TEMP_STARTUP_TIME_US		77
 
+/*
+ * Suspend delay assumed from other icm42600 series device, not
+ * documented in datasheet.
+ */
+#define INV_ICM42607_SUSPEND_DELAY_MS			(2 * MSEC_PER_SEC)
+
 typedef int (*inv_icm42607_bus_setup)(struct inv_icm42607_state *);
 
 extern const struct regmap_config inv_icm42607_regmap_config;
 extern const struct inv_icm42607_hw inv_icm42607_hw_data;
 extern const struct inv_icm42607_hw inv_icm42607p_hw_data;
+extern const struct dev_pm_ops inv_icm42607_pm_ops;
+
+int inv_icm42607_get_pwr_mgmt0(struct inv_icm42607_state *st,
+			       enum inv_icm42607_sensor_mode *gyro,
+			       enum inv_icm42607_sensor_mode *accel);
 
 int inv_icm42607_core_probe(struct regmap *regmap,
 			    const struct inv_icm42607_hw *hw,
diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
index b90e578c3fb2..303a6a0b1b21 100644
--- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
@@ -4,16 +4,20 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/device/devres.h>
 #include <linux/err.h>
 #include <linux/iio/iio.h>
+#include <linux/ktime.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/time.h>
+#include <linux/timekeeping.h>
 #include <linux/types.h>
 
 #include "inv_icm42607.h"
@@ -102,6 +106,90 @@ const struct inv_icm42607_hw inv_icm42607p_hw_data = {
 };
 EXPORT_SYMBOL_NS_GPL(inv_icm42607p_hw_data, "IIO_ICM42607");
 
+int inv_icm42607_get_pwr_mgmt0(struct inv_icm42607_state *st,
+			       enum inv_icm42607_sensor_mode *gyro,
+			       enum inv_icm42607_sensor_mode *accel)
+{
+	unsigned int val;
+	int ret;
+
+	ret = regmap_read(st->map, INV_ICM42607_REG_PWR_MGMT0, &val);
+	if (ret)
+		return ret;
+
+	*gyro = FIELD_GET(INV_ICM42607_PWR_MGMT0_GYRO_MODE_MASK, val);
+	*accel = FIELD_GET(INV_ICM42607_PWR_MGMT0_ACCEL_MODE_MASK, val);
+
+	return 0;
+}
+
+static int inv_icm42607_set_pwr_mgmt0(struct inv_icm42607_state *st,
+				      enum inv_icm42607_sensor_mode gyro,
+				      enum inv_icm42607_sensor_mode accel)
+{
+	unsigned int oldaccel, oldgyro;
+	unsigned int sleepval_us;
+	unsigned int val;
+	s64 disable_wait;
+	int ret;
+
+	ret = inv_icm42607_get_pwr_mgmt0(st, &oldgyro, &oldaccel);
+	if (ret)
+		return ret;
+
+	if (gyro == oldgyro && accel == oldaccel)
+		return 0;
+
+	/*
+	 * Datasheet on page 14.26 says we need to ensure the gyro sensor is on
+	 * for a minimum of 45ms. So if we transition from an on state to an
+	 * off state make sure at least 45ms have passed before power off and
+	 * wait if it hasn't.
+	 */
+	if (!gyro && oldgyro) {
+		disable_wait = ktime_us_delta(st->conf.gyro_stop, ktime_get());
+		disable_wait = clamp(disable_wait,
+				     0, INV_ICM42607_GYRO_STOP_TIME_US);
+		fsleep(disable_wait);
+	}
+
+	val = FIELD_PREP(INV_ICM42607_PWR_MGMT0_GYRO_MODE_MASK, gyro) |
+	      FIELD_PREP(INV_ICM42607_PWR_MGMT0_ACCEL_MODE_MASK, accel);
+	ret = regmap_write(st->map, INV_ICM42607_REG_PWR_MGMT0, val);
+	if (ret)
+		return ret;
+
+	/*
+	 * If a state change occurs from off to on, sleep for the startup
+	 * time of the sensor, unless a sleep_ms is specified. Since more
+	 * than one sensor can be transitioned from off to on, select the
+	 * maximum time from each of the sensors changing from off to on.
+	 * The startup time for the temp sensor is considerably smaller
+	 * than the startup time for the other sensors and one or more are
+	 * required to be on for the temp sensor to function, so any start
+	 * delay should be enough.
+	 */
+	sleepval_us = 0;
+	if (accel && !oldaccel)
+		sleepval_us = max(sleepval_us, INV_ICM42607_ACCEL_STARTUP_TIME_US);
+
+	if (gyro && !oldgyro) {
+		sleepval_us = max(sleepval_us, INV_ICM42607_GYRO_STARTUP_TIME_US);
+		/* Track the earliest we can turn off the gyroscope. */
+		st->conf.gyro_stop = ktime_add_us(ktime_get(),
+						  INV_ICM42607_GYRO_STOP_TIME_US);
+	}
+
+	/* Only sleep if sleepval_us is greater than 0 in case some
+	 * platforms have issues with a 0 delay. The 0 delay can happen
+	 * if one or both sensors is shut down.
+	 */
+	if (sleepval_us > 0)
+		fsleep(sleepval_us);
+
+	return 0;
+}
+
 static int inv_icm42607_set_init_conf(struct inv_icm42607_state *st,
 				      const struct inv_icm42607_conf *conf)
 {
@@ -214,12 +302,17 @@ static int inv_icm42607_enable_vddio_reg(struct inv_icm42607_state *st)
 {
 	int ret;
 
+	if (st->vddio_en)
+		return 0;
+
 	ret = regulator_enable(st->vddio_supply);
 	if (ret)
 		return ret;
 
 	fsleep(INV_ICM42607_POWER_UP_TIME_US);
 
+	st->vddio_en = true;
+
 	return 0;
 }
 
@@ -227,7 +320,12 @@ static void inv_icm42607_disable_vddio_reg(void *_data)
 {
 	struct inv_icm42607_state *st = _data;
 
+	if (!st->vddio_en)
+		return;
+
 	regulator_disable(st->vddio_supply);
+
+	st->vddio_en = false;
 }
 
 int inv_icm42607_core_probe(struct regmap *regmap,
@@ -242,6 +340,8 @@ int inv_icm42607_core_probe(struct regmap *regmap,
 	if (!st)
 		return -ENOMEM;
 
+	dev_set_drvdata(dev, st);
+
 	ret = devm_mutex_init(dev, &st->lock);
 	if (ret)
 		return ret;
@@ -277,10 +377,75 @@ int inv_icm42607_core_probe(struct regmap *regmap,
 	if (ret)
 		return ret;
 
+	ret = devm_pm_runtime_set_active_enabled(dev);
+	if (ret)
+		return ret;
+
+	pm_runtime_set_autosuspend_delay(dev, INV_ICM42607_SUSPEND_DELAY_MS);
+	pm_runtime_use_autosuspend(dev);
+
 	return 0;
 }
 EXPORT_SYMBOL_NS_GPL(inv_icm42607_core_probe, "IIO_ICM42607");
 
+static int inv_icm42607_suspend(struct device *dev)
+{
+	struct inv_icm42607_state *st = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		return ret;
+
+	inv_icm42607_disable_vddio_reg(st);
+
+	return 0;
+}
+
+static int inv_icm42607_resume(struct device *dev)
+{
+	struct inv_icm42607_state *st = dev_get_drvdata(dev);
+	int ret;
+
+	ret = inv_icm42607_enable_vddio_reg(st);
+	if (ret)
+		return ret;
+
+	return pm_runtime_force_resume(dev);
+}
+
+static int inv_icm42607_runtime_suspend(struct device *dev)
+{
+	struct inv_icm42607_state *st = dev_get_drvdata(dev);
+
+	guard(mutex)(&st->lock);
+
+	/* save sensors state */
+	st->suspended.gyro = st->conf.gyro.mode;
+	st->suspended.accel = st->conf.accel.mode;
+
+	return inv_icm42607_set_pwr_mgmt0(st, INV_ICM42607_SENSOR_MODE_OFF,
+					  INV_ICM42607_SENSOR_MODE_OFF);
+}
+
+static int inv_icm42607_runtime_resume(struct device *dev)
+{
+	struct inv_icm42607_state *st = dev_get_drvdata(dev);
+
+	guard(mutex)(&st->lock);
+
+	/* restore sensors state */
+	return inv_icm42607_set_pwr_mgmt0(st, st->suspended.gyro,
+					  st->suspended.accel);
+}
+
+EXPORT_NS_GPL_DEV_PM_OPS(inv_icm42607_pm_ops, IIO_ICM42607) = {
+	SYSTEM_SLEEP_PM_OPS(inv_icm42607_suspend, inv_icm42607_resume)
+	RUNTIME_PM_OPS(inv_icm42607_runtime_suspend,
+		       inv_icm42607_runtime_resume,
+		       NULL)
+};
+
 MODULE_AUTHOR("InvenSense, Inc.");
 MODULE_DESCRIPTION("InvenSense ICM-42607 device driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c b/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c
index 87524e05c3fe..02f4e46caf69 100644
--- a/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c
@@ -84,6 +84,7 @@ static struct i2c_driver inv_icm42607_driver = {
 	.driver = {
 		.name = "inv-icm42607-i2c",
 		.of_match_table = inv_icm42607_of_matches,
+		.pm = pm_ptr(&inv_icm42607_pm_ops),
 	},
 	.id_table = inv_icm42607_id,
 	.probe = inv_icm42607_probe,
diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c b/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c
index 6072ed7adc86..137cd34582d8 100644
--- a/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c
@@ -95,6 +95,7 @@ static struct spi_driver inv_icm42607_driver = {
 	.driver = {
 		.name = "inv-icm42607-spi",
 		.of_match_table = inv_icm42607_of_matches,
+		.pm = pm_ptr(&inv_icm42607_pm_ops),
 	},
 	.id_table = inv_icm42607_spi_id_table,
 	.probe = inv_icm42607_probe,
-- 
2.43.0

