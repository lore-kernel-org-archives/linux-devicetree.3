Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF29A346A1F
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 03:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780111223; cv=none; b=n9+eV46HAQiRnxGyx/YXEAxdc77QFkSJNL/LZAx9E/mNqbjQ/6YtR4GIUnwGy7Ukjo/zAPllnRcnSPqNfCedFyfZru7evGUDLGAu1KGoCvZGQkuqMoC59BncIOxtbYhSci7nnqIiEn7cYKvqYNrBG+X6lm0NgDVvr+JM1K4oj8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780111223; c=relaxed/simple;
	bh=5bETJ6iI669F8s5LAmhygLMaNvqZjrkeDbmSAFHfn0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ns+Qzb1knFpwkJ6SxO0c8pHTKSkaA6+Sbr2EWmQEH4KWDHMbohTgI3fDbxFBPL3QOWz7eoex/Qfowz+GrnJ4+WNPtl7Zp93XYk8WbXy0YK8O5622pjzJDfQLarhwAhkAeg0gmWPn/aNLRSEsl6xeieCMJXI2tnbi+Wx3TzhLmiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SvZgU8Zm; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SvZgU8Zm"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-69d6e5c4bcfso4907399eaf.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 20:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780111221; x=1780716021; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JYZ9Hm8Lf/HQhtQVgZ7/T9QD8Q+iGUVzRElNt4yyXx4=;
        b=SvZgU8ZmJleVSH2N9om88RESRwe0cE0ldvjiQJIGs0JEvpHse+3giItXK30IpJLeGg
         DgVSFm6LcbfDgdQ74eNukJJ1+4R7cDyfii3HY8lE6VxHti5B2DA6FoqCg2h2cawd4L81
         6kjlPwfux77Ok5ze5Ohce1/wbPAev9b9t+UB+3zSs7SwSnKJavEH4GJJFMXw2y/wmyKb
         AySEKiW1xv/Uy5JfLNsDUi/ITx6hk/iWua5k3MGbAJ5QfDPZVqtxwyUAQtQR8rMSJQpD
         0djbYLuNMRpZDWYPI2eE1l7JmJTiY15tbFGONK6m6Ku7vdmwyFVzRGaNeg3FKEZH3VgM
         iczA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780111221; x=1780716021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JYZ9Hm8Lf/HQhtQVgZ7/T9QD8Q+iGUVzRElNt4yyXx4=;
        b=UHmesW9sp3RqobYVv/snePEfLOvTQmGfHDZmIjwUk/vqIKXnceIoVdkA84l6JPn68t
         PS0zvioW3hMBEqBup6D6565mHuFACnEa7wnebthKHJ+N43Cd90HnMBPwAJLPZ+6OTbaC
         rF+veZEnh/YUYtjGNZiffHATZrNl1d8+kh/BWz86Z3YWwzw3DENr+PnxSx7ZON0Npebc
         lMjXFOMsQmf6RcSFv4hmmShrVqLpPTAMjKxBpuhshehWeWlWtZ9mI3AX2wKroXT4K5Hv
         ccHyZyXVrB3pbs40+Iuwu0V+zPzF//kVOlFlPN/VS2ajOeSRm9ZCIvb+DtsMbwbX0Pvj
         M61w==
X-Forwarded-Encrypted: i=1; AFNElJ9v18gb8PW0Ps4D0zwUi495Tq5KnPRQOv8qFGkRnFXNT7kVQyfhQnyAErgAPzC6Ot5A8Wz2XgnHyhLD@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0JdKcHg9y3/fLSP808QZY0OV29I8SPbjEnpDWZu/7E7Zlkxa8
	stRxGWxS8H6lpAA/+18Gh7g7Tz9t7JxxE+ujYFkT8rNKDo+AMnVD+LE2
X-Gm-Gg: Acq92OGpZlKSMNu+pTNar+GkQ90EvTK+8SX85YkPFbEo/Nuqy3aAELV2hN8xnfJpesG
	pJGg+Ycp3fxa0EikW+SarI9bHxAcOuH2GGzGyKg39payKM3zL3AyPhaZGvCmL6b8kpCUnZ7MMCn
	+4wKZ6P624H+btYq6UsKwwKGTiHrHd8kZvXsNXv+Ctg+3av9Ny3GUffPl5T6k+y03gw6xALqjdS
	3pNvkbXM1a1qY3r63WZtgqmrtqgjVFhNAuPjOKaG3k7S2D5b6/VFrB/cniJeq+9iyBK06IeDkw4
	pBhKR4ozFfp3XYkUSD9h7EHhw/n0wtasbLWcx4wiZWYBshQjWIXxw5i73upoBbDkoQQ3Kv7I9Nc
	07UUDJpm466BHHrc9C/0wtPhhJwxF1UsE64+qGp1931u0yIJUeNKRwmZHtGlWOi9lW8R5CPEsK2
	us02zjlyEjB4H7pBXejHzvC5FbkxgFYwvIhV5wVBRA5A==
X-Received: by 2002:a05:6820:1849:b0:69e:2fd:408e with SMTP id 006d021491bc7-69e103852d4mr1013272eaf.37.1780111220952;
        Fri, 29 May 2026 20:20:20 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69e067e911csm2130737eaf.5.2026.05.29.20.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 20:20:20 -0700 (PDT)
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
Subject: [PATCH V9 05/11] iio: imu: inv_icm42607: Add PM support for icm42607
Date: Fri, 29 May 2026 22:17:32 -0500
Message-ID: <20260530031739.109063-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260530031739.109063-1-macroalpha82@gmail.com>
References: <20260530031739.109063-1-macroalpha82@gmail.com>
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
 drivers/iio/imu/inv_icm42607/inv_icm42607.h   |  10 ++
 .../iio/imu/inv_icm42607/inv_icm42607_core.c  | 144 ++++++++++++++++++
 .../iio/imu/inv_icm42607/inv_icm42607_i2c.c   |   1 +
 .../iio/imu/inv_icm42607/inv_icm42607_spi.c   |   1 +
 4 files changed, 156 insertions(+)

diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607.h b/drivers/iio/imu/inv_icm42607/inv_icm42607.h
index 7a73c917fe8a..00c8dfe20717 100644
--- a/drivers/iio/imu/inv_icm42607/inv_icm42607.h
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607.h
@@ -10,6 +10,7 @@
 #include <linux/bitops.h>
 #include <linux/iio/iio.h>
 #include <linux/mutex.h>
+#include <linux/pm.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
@@ -109,6 +110,7 @@ struct inv_icm42607_hw {
  *  @hw:		Hardware specific data.
  *  @map:		regmap pointer.
  *  @vddio_supply:	I/O voltage regulator for the chip.
+ *  @vddio_en:		I/O voltage status for runtime PM.
  *  @irq:		chip irq, required to enable/disable and set wakeup
  *  @orientation:	sensor chip orientation relative to main hardware.
  *  @conf:		chip sensors configurations.
@@ -118,6 +120,7 @@ struct inv_icm42607_state {
 	const struct inv_icm42607_hw *hw;
 	struct regmap *map;
 	struct regulator *vddio_supply;
+	bool vddio_en;
 	int irq;
 	struct iio_mount_matrix orientation;
 	struct inv_icm42607_conf conf;
@@ -339,11 +342,18 @@ struct inv_icm42607_state {
 #define INV_ICM42607_GYRO_STARTUP_TIME_MS		30
 #define INV_ICM42607_TEMP_STARTUP_TIME_MS		77
 
+/*
+ * Suspend delay assumed from other icm42600 series device, not
+ * documented in datasheet.
+ */
+#define INV_ICM42607_SUSPEND_DELAY_MS			2000
+
 typedef int (*inv_icm42607_bus_setup)(struct inv_icm42607_state *);
 
 extern const struct regmap_config inv_icm42607_regmap_config;
 extern const struct inv_icm42607_hw inv_icm42607_hw_data;
 extern const struct inv_icm42607_hw inv_icm42607p_hw_data;
+extern const struct dev_pm_ops inv_icm42607_pm_ops;
 
 int inv_icm42607_core_probe(struct regmap *regmap,
 			    const struct inv_icm42607_hw *hw,
diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
index 3dd4cc8c6b1d..cfdce70ce25d 100644
--- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
@@ -10,6 +10,7 @@
 #include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
@@ -73,6 +74,51 @@ const struct inv_icm42607_hw inv_icm42607p_hw_data = {
 };
 EXPORT_SYMBOL_NS_GPL(inv_icm42607p_hw_data, "IIO_ICM42607");
 
+static int inv_icm42607_set_pwr_mgmt0(struct inv_icm42607_state *st,
+				      enum inv_icm42607_sensor_mode gyro,
+				      enum inv_icm42607_sensor_mode accel,
+				      bool temp, unsigned int *sleep_ms)
+{
+	enum inv_icm42607_sensor_mode oldgyro = st->conf.gyro.mode;
+	enum inv_icm42607_sensor_mode oldaccel = st->conf.accel.mode;
+	bool oldtemp = st->conf.temp_en;
+	unsigned int sleepval;
+	unsigned int val;
+	int ret;
+
+	if (gyro == oldgyro && accel == oldaccel && temp == oldtemp)
+		return 0;
+
+	val = FIELD_PREP(INV_ICM42607_PWR_MGMT0_GYRO_MODE_MASK, gyro);
+	val |= FIELD_PREP(INV_ICM42607_PWR_MGMT0_ACCEL_MODE_MASK, accel);
+	if (!temp)
+		val |= INV_ICM42607_PWR_MGMT0_ACCEL_LP_CLK_SEL;
+	ret = regmap_write(st->map, INV_ICM42607_REG_PWR_MGMT0, val);
+	if (ret)
+		return ret;
+
+	st->conf.gyro.mode = gyro;
+	st->conf.accel.mode = accel;
+	st->conf.temp_en = temp;
+
+	sleepval = 0;
+	if (temp && !oldtemp)
+		sleepval = max(sleepval, INV_ICM42607_TEMP_STARTUP_TIME_MS);
+
+	if (accel != oldaccel)
+		sleepval = max(sleepval, INV_ICM42607_ACCEL_STARTUP_TIME_MS);
+
+	if (gyro != oldgyro)
+		sleepval = max(sleepval, INV_ICM42607_GYRO_STARTUP_TIME_MS);
+
+	if (sleep_ms)
+		*sleep_ms = sleepval;
+	else if (sleepval)
+		fsleep(sleepval * 1000);
+
+	return 0;
+}
+
 static int inv_icm42607_set_conf(struct inv_icm42607_state *st,
 				 const struct inv_icm42607_conf *conf)
 {
@@ -182,12 +228,17 @@ static int inv_icm42607_enable_vddio_reg(struct inv_icm42607_state *st)
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
 
@@ -195,7 +246,12 @@ static void inv_icm42607_disable_vddio_reg(void *_data)
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
@@ -253,10 +309,98 @@ int inv_icm42607_core_probe(struct regmap *regmap,
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
+	guard(mutex)(&st->lock);
+
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret)
+		return ret;
+
+	ret = inv_icm42607_set_pwr_mgmt0(st, INV_ICM42607_SENSOR_MODE_OFF,
+					 INV_ICM42607_SENSOR_MODE_OFF,
+					 false, NULL);
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
+	guard(mutex)(&st->lock);
+
+	if (pm_runtime_suspended(dev))
+		return 0;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret)
+		return ret;
+
+	ret = inv_icm42607_enable_vddio_reg(st);
+	if (ret)
+		return ret;
+
+	/* Nothing else to restore at this time. */
+
+	return 0;
+}
+
+static int inv_icm42607_runtime_suspend(struct device *dev)
+{
+	struct inv_icm42607_state *st = dev_get_drvdata(dev);
+	int ret;
+
+	guard(mutex)(&st->lock);
+
+	ret = inv_icm42607_set_pwr_mgmt0(st, INV_ICM42607_SENSOR_MODE_OFF,
+					 INV_ICM42607_SENSOR_MODE_OFF, false,
+					 NULL);
+	if (ret)
+		return ret;
+
+	inv_icm42607_disable_vddio_reg(st);
+
+	return 0;
+}
+
+static int inv_icm42607_runtime_resume(struct device *dev)
+{
+	struct inv_icm42607_state *st = dev_get_drvdata(dev);
+
+	guard(mutex)(&st->lock);
+
+	return inv_icm42607_enable_vddio_reg(st);
+}
+
+EXPORT_NS_GPL_DEV_PM_OPS(inv_icm42607_pm_ops, IIO_ICM42607) = {
+	SYSTEM_SLEEP_PM_OPS(inv_icm42607_suspend, inv_icm42607_resume)
+	RUNTIME_PM_OPS(inv_icm42607_runtime_suspend,
+		       inv_icm42607_runtime_resume, NULL)
+};
+
 MODULE_AUTHOR("InvenSense, Inc.");
 MODULE_DESCRIPTION("InvenSense ICM-42607x device driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c b/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c
index 22ac51108cd3..cd08bb9514f2 100644
--- a/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c
@@ -82,6 +82,7 @@ static struct i2c_driver inv_icm42607_driver = {
 	.driver = {
 		.name = "inv-icm42607-i2c",
 		.of_match_table = inv_icm42607_of_matches,
+		.pm = pm_ptr(&inv_icm42607_pm_ops),
 	},
 	.id_table = inv_icm42607_id,
 	.probe = inv_icm42607_probe,
diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c b/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c
index 421d3ec1cded..8a82e1610531 100644
--- a/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c
@@ -94,6 +94,7 @@ static struct spi_driver inv_icm42607_driver = {
 	.driver = {
 		.name = "inv-icm42607-spi",
 		.of_match_table = inv_icm42607_of_matches,
+		.pm = pm_ptr(&inv_icm42607_pm_ops),
 	},
 	.id_table = inv_icm42607_spi_id_table,
 	.probe = inv_icm42607_probe,
-- 
2.43.0

