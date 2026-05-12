Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0ACF39EF3D
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 22:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778624350; cv=none; b=Jn0W/TcHYlzCTgAUG9kiN6ECbk6CHh40hERVx7LaghV26PAh9Kg1Bnvn19SnBqP2od9ERiVQLyKfCbZJhnbFI01svtomtPBYhm60fPQgmqwEh1EiXX1IE2P29AaXYxKZr/VtOtFHAccm9/vyFzI64aeSqUGHcw7sUSsC5m5VKVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778624350; c=relaxed/simple;
	bh=dzZsUgiRD0g6OZc0wGzlO02dFRjNtQKx4D9LNXQXc8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pb3cmDhNGPp3BSDZ6FjKyqqKZoLmd9cr4aoDAJyKq3stoi+kb3uRyK1C/7Trn2fDAwDedNgVNe3gqhGkBu+euQ6t1exx6io1fVZCiU107echda43yYZZ/CCc2t5ADw2bA32y+TLrdauRrJCivDnN9wzTFjfYhNpvymPSCWiFuhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=giTHWPQK; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="giTHWPQK"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-48270ea6dd1so1673421b6e.3
        for <devicetree@vger.kernel.org>; Tue, 12 May 2026 15:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778624347; x=1779229147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1kN0dKWRj4ob0c4aSpEOl+jsXwCbydR+VRen1sSmJEI=;
        b=giTHWPQKRMorbKcCwL/6QOcvfkZCQodY0QDW+J27txxT1p+x7cwVRiHWbDtlFkSavF
         z0lVLeMuMZtpOqECzeiKloonk2uxznNFl8PLU/xpCXN4mTEWaijryDmxikt5WVVcFIQL
         xfM0n1rhtIiUP9n21jH7TJC4W50tUVuIUPJtelDEzUcFI+9mTSs1vhY6JAgDaZntHMWB
         6o/ncrGGdIWj5sVY3NiLcqSzek8igrRpbc2YWmr4+djh1QZQdMZyfc0ZFqmPLfo2UTmZ
         G2x8iRObMu+VmWXHYwELqxYklmOSDVDf5BAwi3V7Cap0KcXaDjwaFJIL2Xl/cX7QqgW7
         O4Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778624347; x=1779229147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1kN0dKWRj4ob0c4aSpEOl+jsXwCbydR+VRen1sSmJEI=;
        b=ZjA4xze8JO2A2ZRUcuM8UwFIJEURojnU90noztM/ZuhtkFTnxQXYx8UdpwLo5gxhI+
         rf7crR483yaD4sj6DdxVIr18a+F76hQHyloEpBjccDTSdC46dSWQV4uHSAhaFzkcUty4
         Gee52fcgpzf7jafvtp1GbISUjYTJ4QZl7W9YY3LuiKTC5aFUirl8uXO4hQZrKwY40plL
         ybjkMmGF+dGEjehYWRZhIhhgXTaWK32FO5OIWOeAlKASX6qcOvnIeaxZ3ex8iyq3XIn8
         fLn3dqy//UhI7CL1ZPDuy2aiBbrxlsA2fHYkfsJ0iJE3nYB4TOkWoUDiVfeeHDjyh1ay
         yCsw==
X-Forwarded-Encrypted: i=1; AFNElJ9ppsNk1baiqzlgJHoVcyKKYdOxMX3K5Mfhj9TT/Jm1ewcFe6nJ3bleTJppeRyA4zmIVHUx4E/HiQk/@vger.kernel.org
X-Gm-Message-State: AOJu0YxG5OWMtir7OhwFTqiYHDOIc76mQtXvrh0wfBAJUiMVRQ/3S20+
	GxpCWAfCjfiVQveAaCvJHzGGo+ZLpNkwkP1g9ZUIWUSuDPUCQ9vUBR8A
X-Gm-Gg: Acq92OHfBZW8lrw0D70nb9tBlSyefLc708GzRQa9kXxJXgfVUL0Ts46EmfwBvpIOYxr
	1VZA+J0TTB4YtCO6RflRn3NytBuFC3ZYZpc95ZvuZLajzgTY5fXLc4MeXA5EH41iXMXghaL8pOn
	ML0/oPilK8nqTjLssiFrNH17Lv9KMNkMWDu5wIBmLyg6SZkuR79M/6ZLF8EFsdjxauA1CH164vH
	smKh8csRh5LZvKyUCTH9mATzL2RyqTi3wJ848+kSJ7x8Dc0vLXjLDkghEouTfQAyb4mDqtWC6W5
	vbaqrF9ju5+KnWeya0qX22i6NCPrZgHnM7Vd9oEryzeDwVInq9M4BsD9o9eWhTDmh+RaG/R2iPZ
	Jj9++Rt2edLlGxl9/zPOb80IB5c5Fi6Gf+zo9CY+Q/cF7st7yhsO1SgqgOjx7VES8bD2OR/cX9S
	JcxE7ntF2DDu5j+Md6TAPZ
X-Received: by 2002:a05:6808:448d:b0:482:a71b:95ca with SMTP id 5614622812f47-482b28fa894mr763500b6e.18.1778624347516;
        Tue, 12 May 2026 15:19:07 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bc0::54])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47c76986f87sm23291473b6e.13.2026.05.12.15.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 15:19:07 -0700 (PDT)
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
Subject: [PATCH V6 05/11] iio: imu: inv_icm42607: Add PM support for icm42607
Date: Tue, 12 May 2026 17:16:26 -0500
Message-ID: <20260512221634.256747-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512221634.256747-1-macroalpha82@gmail.com>
References: <20260512221634.256747-1-macroalpha82@gmail.com>
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
 drivers/iio/imu/inv_icm42607/inv_icm42607.h   |  12 ++
 .../iio/imu/inv_icm42607/inv_icm42607_core.c  | 151 ++++++++++++++++++
 .../iio/imu/inv_icm42607/inv_icm42607_i2c.c   |   1 +
 .../iio/imu/inv_icm42607/inv_icm42607_spi.c   |   1 +
 4 files changed, 165 insertions(+)

diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607.h b/drivers/iio/imu/inv_icm42607/inv_icm42607.h
index 2c20e95b237a..5f37999e39a5 100644
--- a/drivers/iio/imu/inv_icm42607/inv_icm42607.h
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607.h
@@ -10,6 +10,7 @@
 #include <linux/bitops.h>
 #include <linux/iio/iio.h>
 #include <linux/mutex.h>
+#include <linux/pm.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 
@@ -96,24 +97,34 @@ struct inv_icm42607_hw {
 	const struct inv_icm42607_conf *conf;
 };
 
+struct inv_icm42607_suspended {
+	enum inv_icm42607_sensor_mode gyro;
+	enum inv_icm42607_sensor_mode accel;
+	bool temp;
+};
+
 /**
  *  struct inv_icm42607_state - driver state variables
  *  @lock:		lock for serializing multiple registers access.
  *  @hw:		Hardware specific data.
  *  @map:		regmap pointer.
  *  @vddio_supply:	I/O voltage regulator for the chip.
+ *  @vddio_en:		I/O voltage status for runtime PM.
  *  @irq:		chip irq, required to enable/disable and set wakeup
  *  @orientation:	sensor chip orientation relative to main hardware.
  *  @conf:		chip sensors configurations.
+ *  @suspended:		suspended sensors configuration.
  */
 struct inv_icm42607_state {
 	struct mutex lock;
 	const struct inv_icm42607_hw *hw;
 	struct regmap *map;
 	struct regulator *vddio_supply;
+	bool vddio_en;
 	int irq;
 	struct iio_mount_matrix orientation;
 	struct inv_icm42607_conf conf;
+	struct inv_icm42607_suspended suspended;
 };
 
 /* Virtual register addresses: @bank on MSB (4 upper bits), @address on LSB */
@@ -339,6 +350,7 @@ typedef int (*inv_icm42607_bus_setup)(struct inv_icm42607_state *);
 extern const struct regmap_config inv_icm42607_regmap_config;
 extern const struct inv_icm42607_hw inv_icm42607_hw_data;
 extern const struct inv_icm42607_hw inv_icm42607p_hw_data;
+extern const struct dev_pm_ops inv_icm42607_pm_ops;
 
 int inv_icm42607_core_probe(struct regmap *regmap, const struct inv_icm42607_hw *hw,
 			    inv_icm42607_bus_setup bus_setup);
diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
index 6119379ca6a8..dfd2fed7bf1e 100644
--- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
@@ -9,6 +9,7 @@
 #include <linux/irq.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
@@ -72,6 +73,62 @@ const struct inv_icm42607_hw inv_icm42607p_hw_data = {
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
+	if (temp && !oldtemp) {
+		if (sleepval < INV_ICM42607_TEMP_STARTUP_TIME_MS)
+			sleepval = INV_ICM42607_TEMP_STARTUP_TIME_MS;
+	}
+	if (accel != oldaccel && oldaccel == INV_ICM42607_SENSOR_MODE_OFF) {
+		usleep_range(200, 300);
+		if (sleepval < INV_ICM42607_ACCEL_STARTUP_TIME_MS)
+			sleepval = INV_ICM42607_ACCEL_STARTUP_TIME_MS;
+	}
+	if (gyro != oldgyro) {
+		if (oldgyro == INV_ICM42607_SENSOR_MODE_OFF) {
+			usleep_range(200, 300);
+			if (sleepval < INV_ICM42607_GYRO_STARTUP_TIME_MS)
+				sleepval = INV_ICM42607_GYRO_STARTUP_TIME_MS;
+		} else if (gyro == INV_ICM42607_SENSOR_MODE_OFF) {
+			if (sleepval < INV_ICM42607_GYRO_STOP_TIME_MS)
+				sleepval = INV_ICM42607_GYRO_STOP_TIME_MS;
+		}
+	}
+
+	if (sleep_ms)
+		*sleep_ms = sleepval;
+	else if (sleepval)
+		msleep(sleepval);
+
+	return 0;
+}
+
 static int inv_icm42607_set_conf(struct inv_icm42607_state *st,
 				 const struct inv_icm42607_conf *conf)
 {
@@ -185,11 +242,15 @@ static int inv_icm42607_enable_vddio_reg(struct inv_icm42607_state *st)
 {
 	int ret;
 
+	if (st->vddio_en)
+		return 0;
+
 	ret = regulator_enable(st->vddio_supply);
 	if (ret)
 		return ret;
 
 	fsleep(INV_ICM42607_POWER_UP_TIME_US);
+	st->vddio_en = 1;
 
 	return 0;
 }
@@ -198,7 +259,10 @@ static void inv_icm42607_disable_vddio_reg(void *_data)
 {
 	struct inv_icm42607_state *st = _data;
 
+	if (!st->vddio_en)
+		return;
 	regulator_disable(st->vddio_supply);
+	st->vddio_en = 0;
 }
 
 int inv_icm42607_core_probe(struct regmap *regmap, const struct inv_icm42607_hw *hw,
@@ -256,10 +320,97 @@ int inv_icm42607_core_probe(struct regmap *regmap, const struct inv_icm42607_hw
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
 
+/*
+ * Suspend saves sensors state and turns everything off.
+ * Check first if runtime suspend has not already done the job.
+ */
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
+	ret = inv_icm42607_set_pwr_mgmt0(st, INV_ICM42607_SENSOR_MODE_OFF,
+					 INV_ICM42607_SENSOR_MODE_OFF,
+					 false, NULL);
+	if (ret)
+		return ret;
+	inv_icm42607_disable_vddio_reg(st);
+
+	return 0;
+}
+
+/*
+ * System resume gets the system back on and restores the sensors state.
+ * Manually put runtime power management in system active state.
+ */
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
+	int ret = 0;
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
index 8631579a609a..a51c764bf1dc 100644
--- a/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_i2c.c
@@ -77,6 +77,7 @@ static struct i2c_driver inv_icm42607_driver = {
 	.driver = {
 		.name = "inv-icm42607-i2c",
 		.of_match_table = inv_icm42607_of_matches,
+		.pm = pm_ptr(&inv_icm42607_pm_ops),
 	},
 	.id_table = inv_icm42607_id,
 	.probe = inv_icm42607_probe,
diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c b/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c
index 49438fa6f867..9ba3dd0c689a 100644
--- a/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c
+++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c
@@ -90,6 +90,7 @@ static struct spi_driver inv_icm42607_driver = {
 	.driver = {
 		.name = "inv-icm42607-spi",
 		.of_match_table = inv_icm42607_of_matches,
+		.pm = pm_ptr(&inv_icm42607_pm_ops),
 	},
 	.id_table = inv_icm42607_spi_id_table,
 	.probe = inv_icm42607_probe,
-- 
2.43.0

