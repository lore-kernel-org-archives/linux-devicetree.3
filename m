Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A8A4C9544
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 19:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778526715; cv=none; b=JsvyvpjBoovkQW4mitXgQQ5JcGY8vXdQlEo9ET+itQRPTU+AuDntF+s73ggMny0ScssoO25ONku31z3bg0738BLQpdYOpoj0jpafcdD7eRODEWb5W8niE9rSTlYAy87ZnHjQ+/zyVmViG0J2GBiLfMS6NLWm1ckuu3Y/105ZWK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778526715; c=relaxed/simple;
	bh=kizY/bjSKPIeHkXTLPn9W5UzcqrnxWoRWxoyuCduT/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IPJiWyhKof01PSUFbsimqk/T6HDQnwDb9QV3zq/W2j0nliuizTj1Clr/wecKqSoQoSIvJ8iFu72ZnOwCgeZfLIuFsm64gl9cO+iVbj1wlsWxwEZrZCuH/PkDxR+JEL0wJQRNs62vGpymT+fhjUb64mVGkE8E+xsWAHrrPg/BU6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZLw8ckk; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZLw8ckk"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-452169ae568so3538041f8f.3
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 12:11:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778526712; x=1779131512; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfLv0ZKs/Pa8ClM6+hdaILiLzqWvmS72aMdvUzpTUHA=;
        b=PZLw8ckkneixUMvaGtvvb49U5OVSWbpXVWbUfRbsq76P3skNtchsSZIH+If0KEidEX
         IqkHgA4s2h5xnO1zSTH9GB7GS/2D3VPaOF9SZzHu6D0Sh5WKK1N5yfk1zv/AjsWdeFGt
         N3mxz0Qekowxy0CJquAgyJGT5xCLdLdPLqL5fBwB9DCpcRXZFga1hgbt0GUEMB4b3CMS
         MnpnLKPhMR9za/jTN4u4KV0/F30B0m7ML9MF+NEfBhwfUmrJAxqACikXh7gDrkYqzDaK
         5T7bAclp/rroNv2k07veuj5O8h37lGdLZn3viWAgnGmaJGv+IXu82kLLUpEckd2nfN/L
         4RfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778526712; x=1779131512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lfLv0ZKs/Pa8ClM6+hdaILiLzqWvmS72aMdvUzpTUHA=;
        b=b1cBNzrh6jNutPWnlSlCfkqaYmpJDB0Qo9ejF0v1jg3xKXWa+7fFPVW/2jPTGD2rqv
         gl5cZuAMADndeVYAYDlSwJM/gv4KvYl46om0K57d9DtwcGj3aeHNfVsJBTIlw+/7iS8+
         aVvdfOIQWUZCrWahZ3MQkGWrCmoj6Y2CY1X73BhCm7lSSei/21Z18pwtkXm6rT9d5OmE
         Jebqn86a3M/VgNIZzIuy3cDdk3/c26D/Fvbk0xq4AjwHjJzxk7TTz7mJYM2gyq98CcNZ
         MU0gvvE0PnYbXeY1ucEzufv66k3ZAplG2MQGdl2bhnHO7hU2nDMOxlDw951X56tUSXYa
         Vo9g==
X-Forwarded-Encrypted: i=1; AFNElJ8Pya/PR/dngvROXAS/1Vt6308BTbHAHfkKr9PqlRIAYzSmR06ytbYmv06L9ZsNxwe+EV7NLM7UMiUZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyIXhMsbAMNt1NfQfmY0hB6PZW1QXt4fMNvBHpCiZ3eNd4qqMR8
	FSfsq558pAhkjxD+tEmp9dxPwGH3+PwrPHFkkXD6EGcH6E1my4AEp9qj
X-Gm-Gg: Acq92OEo5wEG7jA+adrkdNtNQ+CoE7YSsvmpImWhKCA+lRHdqWnuaASsXHcQcGH0xpu
	HmjpLoWQY0pw05mUXxoCWruW/6yjRU6NQQB2TPcB/9mkQGwoOwwk/LguTltkH0o+EDc0L6xLqXg
	kudhU8ESy8wxELMhhCjonXezFXy20t8fK0XTIv3cQK/URPLBM8dPX8A9WbERGt06jgRfAgrR1Yx
	oZ15bs8lOWl0jz2vxiDpFegHcLIDlKGIq8cGM5qS+EZm+vA8I5eR7yx9zQC9t6K4/TW1TJy85zZ
	lvwBKG8IdXfSZUi04BC9CJCskuc36EqN/2VaUSDziB69QMQG4tQB4274FPXSX31iwtuwBA4s/yE
	yoGvOltBOB2RSd3nc8nN1xPlMM8uWuRHZxPx5BRRCU/iVBpoI/pw2DsFZTfnteHg0k28sU+xHdy
	IB+sNzNFMZQ/dO3Wjd5RM26o/1fX9DzyjkSX93aBKlTuTbuwaz6G40zxrKvkXLHh03QiX413kTl
	+w5eKnu4Y/6/57+RyA=
X-Received: by 2002:a5d:5c84:0:b0:43d:1bf6:30f7 with SMTP id ffacd0b85a97d-4515b9f3935mr41022387f8f.18.1778526711695;
        Mon, 11 May 2026 12:11:51 -0700 (PDT)
Received: from ai-node.taila4f726.ts.net (89-139-15-25.bb.netvision.net.il. [89.139.15.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548e6a5b65sm28541785f8f.8.2026.05.11.12.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 12:11:51 -0700 (PDT)
From: Vladislav Kulikov <vlad.kulikov.c@gmail.com>
To: jic23@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vladislav Kulikov <vlad.kulikov.c@gmail.com>
Subject: [PATCH v3 2/2] iio: magnetometer: add driver for MEMSIC MMC5983MA
Date: Mon, 11 May 2026 19:11:35 +0000
Message-ID: <20260511191135.36691-3-vlad.kulikov.c@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511191135.36691-1-vlad.kulikov.c@gmail.com>
References: <20260511191135.36691-1-vlad.kulikov.c@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the MEMSIC MMC5983MA 3-axis magnetometer. The driver
provides raw magnetic field readings via IIO sysfs with SET/RESET
offset cancellation for each measurement.

Reviewed-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Vladislav Kulikov <vlad.kulikov.c@gmail.com>
---
 MAINTAINERS                        |   1 +
 drivers/iio/magnetometer/Kconfig   |  11 +
 drivers/iio/magnetometer/Makefile  |   1 +
 drivers/iio/magnetometer/mmc5983.c | 345 +++++++++++++++++++++++++++++
 4 files changed, 358 insertions(+)
 create mode 100644 drivers/iio/magnetometer/mmc5983.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 952fbf3020a4..b1d9d7b586a1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17175,6 +17175,7 @@ M:	Vladislav Kulikov <vlad.kulikov.c@gmail.com>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/magnetometer/memsic,mmc5983.yaml
+F:	drivers/iio/magnetometer/mmc5983.c
 
 MEN A21 WATCHDOG DRIVER
 M:	Johannes Thumshirn <morbidrsa@gmail.com>
diff --git a/drivers/iio/magnetometer/Kconfig b/drivers/iio/magnetometer/Kconfig
index fb313e591e85..ea2697fb5ab6 100644
--- a/drivers/iio/magnetometer/Kconfig
+++ b/drivers/iio/magnetometer/Kconfig
@@ -151,6 +151,17 @@ config MMC5633
 	  To compile this driver as a module, choose M here: the module
 	  will be called mmc5633
 
+config MMC5983
+	tristate "MEMSIC MMC5983 3-axis magnetic sensor"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  Say yes here to build support for the MEMSIC MMC5983 3-axis
+	  magnetic sensor.
+
+	  To compile this driver as a module, choose M here: the module
+	  will be called mmc5983
+
 config IIO_ST_MAGN_3AXIS
 	tristate "STMicroelectronics magnetometers 3-Axis Driver"
 	depends on (I2C || SPI_MASTER) && SYSFS
diff --git a/drivers/iio/magnetometer/Makefile b/drivers/iio/magnetometer/Makefile
index 5bd227f8c120..7fd9b3fd914e 100644
--- a/drivers/iio/magnetometer/Makefile
+++ b/drivers/iio/magnetometer/Makefile
@@ -16,6 +16,7 @@ obj-$(CONFIG_MAG3110)	+= mag3110.o
 obj-$(CONFIG_HID_SENSOR_MAGNETOMETER_3D) += hid-sensor-magn-3d.o
 obj-$(CONFIG_MMC35240)	+= mmc35240.o
 obj-$(CONFIG_MMC5633)	+= mmc5633.o
+obj-$(CONFIG_MMC5983)	+= mmc5983.o
 
 obj-$(CONFIG_IIO_ST_MAGN_3AXIS) += st_magn.o
 st_magn-y := st_magn_core.o
diff --git a/drivers/iio/magnetometer/mmc5983.c b/drivers/iio/magnetometer/mmc5983.c
new file mode 100644
index 000000000000..400406c824d7
--- /dev/null
+++ b/drivers/iio/magnetometer/mmc5983.c
@@ -0,0 +1,345 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * MMC5983 - MEMSIC 3-axis Magnetic Sensor
+ *
+ * Copyright (c) 2026, Vlad Kulikov <vlad.kulikov.c@gmail.com>
+ *
+ * IIO driver for MMC5983
+ */
+
+#include <linux/bits.h>
+#include <linux/cleanup.h>
+#include <linux/delay.h>
+#include <linux/i2c.h>
+#include <linux/iio/iio.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/regmap.h>
+#include <linux/time.h>
+#include <linux/types.h>
+
+#define MMC5983_REG_XOUT0	0x00
+#define MMC5983_REG_XOUT1	0x01
+#define MMC5983_REG_YOUT0	0x02
+#define MMC5983_REG_YOUT1	0x03
+#define MMC5983_REG_ZOUT0	0x04
+#define MMC5983_REG_ZOUT1	0x05
+#define MMC5983_REG_XYZOUT2	0x06
+
+#define MMC5983_REG_STATUS	0x08
+
+#define MMC5983_REG_CTRL0	0x09
+#define MMC5983_REG_CTRL1	0x0A
+#define MMC5983_REG_CTRL2	0x0B
+#define MMC5983_REG_CTRL3	0x0C
+
+#define MMC5983_REG_ID		0x2F
+
+#define MMC5983_PRODUCT_ID	0x30
+
+#define MMC5983_STATUS_MEAS_M_DONE_BIT	BIT(0)
+#define MMC5983_STATUS_OTP_RD_DONE_BIT	BIT(4)
+
+#define MMC5983_CTRL0_TM_M_BIT		BIT(0)
+#define MMC5983_CTRL0_SET_BIT		BIT(3)
+#define MMC5983_CTRL0_RESET_BIT		BIT(4)
+#define MMC5983_CTRL0_OTP_RD_BIT	BIT(6)
+
+#define MMC5983_CTRL1_SW_RST_BIT	BIT(7)
+
+enum mmc5983_axis {
+	MMC5983_AXIS_X,
+	MMC5983_AXIS_Y,
+	MMC5983_AXIS_Z,
+};
+
+struct mmc5983_data {
+	struct regmap *regmap;
+	/* Protects chip access during SET/RESET measurement sequence */
+	struct mutex mutex;
+};
+
+#define MMC5983_CHANNEL(_axis) { \
+	.type = IIO_MAGN, \
+	.modified = 1, \
+	.channel2 = IIO_MOD_##_axis, \
+	.address = MMC5983_AXIS_##_axis, \
+	.info_mask_separate = BIT(IIO_CHAN_INFO_RAW), \
+	.info_mask_shared_by_type = BIT(IIO_CHAN_INFO_SCALE), \
+}
+
+static const struct iio_chan_spec mmc5983_channels[] = {
+	MMC5983_CHANNEL(X),
+	MMC5983_CHANNEL(Y),
+	MMC5983_CHANNEL(Z),
+};
+
+static int mmc5983_pulse_coil(struct mmc5983_data *data, unsigned int coil_bit)
+{
+	int ret;
+
+	ret = regmap_write(data->regmap, MMC5983_REG_CTRL0, coil_bit);
+	if (ret)
+		return ret;
+
+	/*
+	 * Datasheet page 15: SET/RESET coil pulse is 500 ns.
+	 * Vendor sample code waits 500 us before the next operation.
+	 */
+	fsleep(500);
+
+	return 0;
+}
+
+static int mmc5983_take_measurement(struct mmc5983_data *data, int m[3])
+{
+	unsigned int status;
+	u8 buf[7];
+	int ret;
+
+	ret = regmap_write(data->regmap, MMC5983_REG_CTRL0,
+			   MMC5983_CTRL0_TM_M_BIT);
+	if (ret)
+		return ret;
+
+	/*
+	 * Datasheet page 15: measurement time is 8 ms at BW=00 (default,
+	 * slowest setting). Use a 50 ms timeout for margin.
+	 */
+	ret = regmap_read_poll_timeout(data->regmap, MMC5983_REG_STATUS,
+				       status,
+				       status & MMC5983_STATUS_MEAS_M_DONE_BIT,
+				       10 * USEC_PER_MSEC,
+				       50 * USEC_PER_MSEC);
+	if (ret)
+		return ret;
+
+	ret = regmap_bulk_read(data->regmap, MMC5983_REG_XOUT0, buf,
+			       sizeof(buf));
+	if (ret)
+		return ret;
+
+	m[0] = (buf[0] << 10) | (buf[1] << 2) | ((buf[6] >> 6) & 0x3);
+	m[1] = (buf[2] << 10) | (buf[3] << 2) | ((buf[6] >> 4) & 0x3);
+	m[2] = (buf[4] << 10) | (buf[5] << 2) | ((buf[6] >> 2) & 0x3);
+
+	return 0;
+}
+
+static int mmc5983_read_raw(struct iio_dev *indio_dev,
+			     const struct iio_chan_spec *chan, int *val,
+			     int *val2, long mask)
+{
+	struct mmc5983_data *data = iio_priv(indio_dev);
+	int m1[3], m2[3];
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW: {
+		guard(mutex)(&data->mutex);
+
+		/* SET: magnetize sensor elements in forward direction */
+		ret = mmc5983_pulse_coil(data, MMC5983_CTRL0_SET_BIT);
+		if (ret)
+			return ret;
+
+		ret = mmc5983_take_measurement(data, m1);
+		if (ret)
+			return ret;
+
+		/* RESET: magnetize sensor elements in reverse direction */
+		ret = mmc5983_pulse_coil(data, MMC5983_CTRL0_RESET_BIT);
+		if (ret)
+			return ret;
+
+		ret = mmc5983_take_measurement(data, m2);
+		if (ret)
+			return ret;
+
+		*val = (m1[chan->address] - m2[chan->address]) / 2;
+		return IIO_VAL_INT;
+	}
+	case IIO_CHAN_INFO_SCALE:
+		*val = 0;
+		*val2 = 61035;
+		return IIO_VAL_INT_PLUS_NANO;
+	default:
+		return -EINVAL;
+	}
+}
+
+static const struct iio_info mmc5983_info = {
+	.read_raw = mmc5983_read_raw,
+};
+
+static bool mmc5983_is_writeable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MMC5983_REG_CTRL0:
+	case MMC5983_REG_CTRL1:
+	case MMC5983_REG_CTRL2:
+	case MMC5983_REG_CTRL3:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool mmc5983_is_readable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MMC5983_REG_XOUT0:
+	case MMC5983_REG_XOUT1:
+	case MMC5983_REG_YOUT0:
+	case MMC5983_REG_YOUT1:
+	case MMC5983_REG_ZOUT0:
+	case MMC5983_REG_ZOUT1:
+	case MMC5983_REG_XYZOUT2:
+	case MMC5983_REG_STATUS:
+	case MMC5983_REG_CTRL0:
+	case MMC5983_REG_CTRL1:
+	case MMC5983_REG_CTRL2:
+	case MMC5983_REG_CTRL3:
+	case MMC5983_REG_ID:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static bool mmc5983_is_volatile_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case MMC5983_REG_XOUT0:
+	case MMC5983_REG_XOUT1:
+	case MMC5983_REG_YOUT0:
+	case MMC5983_REG_YOUT1:
+	case MMC5983_REG_ZOUT0:
+	case MMC5983_REG_ZOUT1:
+	case MMC5983_REG_XYZOUT2:
+	case MMC5983_REG_STATUS:
+	case MMC5983_REG_CTRL0:
+	case MMC5983_REG_CTRL1:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config mmc5983_regmap_config = {
+	.name = "mmc5983_regmap",
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = MMC5983_REG_ID,
+	.writeable_reg = mmc5983_is_writeable_reg,
+	.readable_reg = mmc5983_is_readable_reg,
+	.volatile_reg = mmc5983_is_volatile_reg,
+};
+
+static int mmc5983_init(struct mmc5983_data *data)
+{
+	struct regmap *regmap = data->regmap;
+	struct device *dev = regmap_get_device(regmap);
+	unsigned int reg_id, status;
+	int ret;
+
+	ret = regmap_read(regmap, MMC5983_REG_ID, &reg_id);
+	if (ret)
+		return dev_err_probe(dev, ret, "Error reading product id\n");
+
+	if (reg_id != MMC5983_PRODUCT_ID)
+		dev_info(dev, "unexpected product id 0x%02x\n", reg_id);
+
+	ret = regmap_write(regmap, MMC5983_REG_CTRL1, MMC5983_CTRL1_SW_RST_BIT);
+	if (ret)
+		return ret;
+
+	/* Datasheet page 15: power-on time after SW_RST is 10 ms */
+	fsleep(10 * USEC_PER_MSEC);
+
+	ret = regmap_write(regmap, MMC5983_REG_CTRL0, MMC5983_CTRL0_OTP_RD_BIT);
+	if (ret)
+		return ret;
+
+	/*
+	 * Datasheet page 15: OTP read completes and self-clears. No separate
+	 * OTP refresh timeout is specified, so use the 10 ms power-on time as
+	 * a conservative upper bound.
+	 */
+	ret = regmap_read_poll_timeout(regmap, MMC5983_REG_STATUS, status,
+				       status & MMC5983_STATUS_OTP_RD_DONE_BIT,
+				       USEC_PER_MSEC,
+				       10 * USEC_PER_MSEC);
+	if (ret)
+		return ret;
+
+	/* SET: magnetize sensor elements in forward direction */
+	ret = mmc5983_pulse_coil(data, MMC5983_CTRL0_SET_BIT);
+	if (ret)
+		return ret;
+
+	/* RESET: magnetize sensor elements in reverse direction */
+	return mmc5983_pulse_coil(data, MMC5983_CTRL0_RESET_BIT);
+}
+
+static int mmc5983_probe(struct i2c_client *i2c)
+{
+	struct device *dev = &i2c->dev;
+	struct mmc5983_data *data;
+	struct iio_dev *indio_dev;
+	int ret;
+
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	data = iio_priv(indio_dev);
+
+	ret = devm_mutex_init(dev, &data->mutex);
+	if (ret)
+		return ret;
+
+	data->regmap = devm_regmap_init_i2c(i2c, &mmc5983_regmap_config);
+	if (IS_ERR(data->regmap))
+		return dev_err_probe(dev, PTR_ERR(data->regmap),
+				     "failed to allocate register map\n");
+
+	indio_dev->info = &mmc5983_info;
+	indio_dev->modes = INDIO_DIRECT_MODE;
+	indio_dev->name = "mmc5983";
+	indio_dev->channels = mmc5983_channels;
+	indio_dev->num_channels = ARRAY_SIZE(mmc5983_channels);
+
+	ret = mmc5983_init(data);
+	if (ret)
+		return dev_err_probe(dev, ret, "mmc5983 chip init failed\n");
+
+	return devm_iio_device_register(dev, indio_dev);
+}
+
+static const struct of_device_id mmc5983_of_match[] = {
+	{ .compatible = "memsic,mmc5983" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mmc5983_of_match);
+
+static const struct i2c_device_id mmc5983_id[] = {
+	{ "mmc5983" },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, mmc5983_id);
+
+static struct i2c_driver mmc5983_driver = {
+	.driver = {
+		.name = "mmc5983",
+		.of_match_table = mmc5983_of_match,
+	},
+	.probe = mmc5983_probe,
+	.id_table = mmc5983_id,
+};
+module_i2c_driver(mmc5983_driver);
+
+MODULE_AUTHOR("Vladislav Kulikov <vlad.kulikov.c@gmail.com>");
+MODULE_DESCRIPTION("MEMSIC MMC5983 magnetic sensor driver");
+MODULE_LICENSE("GPL");
-- 
2.43.0

