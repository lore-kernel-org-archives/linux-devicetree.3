Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DBB3E16AD
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 12:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781268423; cv=none; b=OhO53EFBKGSIOs/BPl+b+IoEqwYO6vwIhqvEawbgKzKAO/C5iSXmErigwYEQpse89qy216WBt4OLKEWOLRnJyXut3ejvnYiglHidWXLdWIDKaNLTfGAZ/AjYOqlPqA3vemdBIfG05lewSnQQpBIBJIm8iyIuVXaX5NfuXYRa238=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781268423; c=relaxed/simple;
	bh=xah7VFRzlEFUau6mIgXs6EJoh2v1zXmwPgirU/EsoqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FHRrJ18IQqFXnr+rwZTiQHFI/DRNrQBEJR21bc9FmWhVWcRKFJgeuWH/0LOEmCTmyxQrlAfNSpJon7Tn3mUrfFGmEtb/2pspbc+CleGnZorEZYCkoqXs6aDbsIf64O5bbFgSvykryTV20PbB3HGyZTEtbU+iYk+9JwUL+dDp33w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sirat.me; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=sirat.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2bf1cda2b17so7413355ad.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 05:47:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781268421; x=1781873221;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8dFNczRq0wIo8VSVYeWK76HT6EIccHPqEp9QW39ONxQ=;
        b=Bc5wujVdoM7FWalBeslKsjvcNhFdUavQRFI0/RhSha8Qhn53vD7HB6MZHFOKjQTSkL
         kg/88jhXnK2mMEyTsmohMsRK4nwR2HSF4021pwv+aZirRMGM1cyaAspxa3TyzXzRSZ79
         p/DqEYGJCyZ6WIti2Barz2UUKF0lEXfQzFqRkqi3QyFToYRYuwGQLRjbkuqLX4kZnm+Z
         TONM4VJDq4KNGHn7hV3QvR48xiuRiF1s028umyWcZyyqzGKcoepL2zth1fxWQRJhM7Rv
         p/Z4xHkyc2vXoClslfWaNL4s3Aq4iAGNGf2INAMF28C5YoGjwgyxA6aY9ZdwWR1vzog6
         o6fQ==
X-Forwarded-Encrypted: i=1; AFNElJ8APzR2PqcYgfcFeFt9FYhj7Ax/ZHvq0uiT/NAafYqMMaHniRXyzoJ6Txc/cF+8faf/vbsnMvhdY/yy@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5YH0vCnvpcQ4HivarMrdL8Oogt3V+sRAozvX/S9YBSwoHoNRY
	jMyk4hGza1cvgCCZS9K2nMNC3xTD3P/O2DlVXsbq7O8h+7q0v5U0OGro5ed4JDCE
X-Gm-Gg: Acq92OFz/WI2rcTUusSRik3/8SAP7xxoaSje6ozWHssXPJQOUcCtRcLtphiXXZpDPXz
	kWq62hDIBvxlZTrOMqTETqYo4EX4E2S2rO5wA+1tnrylkYNG8p+XNWADN+l40XML8YJNSW8AstX
	UDuOSh+5cmXvRsul4RH94A0mNT33SsPl+ChFXU9Wx+GXnLikGzDQBPZ14Dj11OT0DYnY6h2UNzh
	ZWGmDiAHOoATF1I2qLxfm/Z0pjO5YA8lXKv0C80nHRLEsTLm9t2R230aHQMJ+BQP7msxeHI3z+U
	SzXXu6WuJc9ri97QLELBPFht6Ho3X8DztdzPKmTAurLhAVeZAN7W9JUTGsoM0u6ml1JsqTZmE3J
	uefxsqTJ1wBbxxzrL7eujC6K/SvKtRyYxqRS49Q4DrQJPhnu9Td5BF8HRwyd4kq/dDU1THD3NvE
	iZd8UAqkFkiz//QDJDBRIFPZPKOuavgd55pm9UM4o91ztjhG+48GFH+ke5lPGvinp7vr0xpDJlB
	aql60WS4TH5q9/XuXJ6RawGaUanEBX8Lk6VNrHZ3rBx9xabAksP5Mo+vCdhS0D83qRq0nEGpbLY
	IgI6ag==
X-Received: by 2002:a17:903:3b88:b0:2ba:6601:8e3d with SMTP id d9443c01a7336-2c3fb4ec4f4mr29212065ad.9.1781268421151;
        Fri, 12 Jun 2026 05:47:01 -0700 (PDT)
Received: from fedora ([42.0.4.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42fbb5411sm21115625ad.32.2026.06.12.05.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 05:47:00 -0700 (PDT)
From: Siratul Islam <email@sirat.me>
To: jic23@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siratul Islam <email@sirat.me>
Subject: [PATCH 3/3] iio: magnetometer: add driver for QST QMC5883L Sensor
Date: Fri, 12 Jun 2026 18:45:27 +0600
Message-ID: <20260612124557.13750-4-email@sirat.me>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612124557.13750-1-email@sirat.me>
References: <20260612124557.13750-1-email@sirat.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add driver for the QST QMC5883L 3-Axis Magnetic Sensor
connected via i2c.

Signed-off-by: Siratul Islam <email@sirat.me>
---
 MAINTAINERS                         |   1 +
 drivers/iio/magnetometer/Kconfig    |  11 +
 drivers/iio/magnetometer/Makefile   |   2 +
 drivers/iio/magnetometer/qmc5883l.c | 512 ++++++++++++++++++++++++++++
 4 files changed, 526 insertions(+)
 create mode 100644 drivers/iio/magnetometer/qmc5883l.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 310074b34072..f94da70b91af 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21792,6 +21792,7 @@ M:	Siratul Islam <email@sirat.me>
 L:	linux-iio@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/magnetometer/qstcorp,qmc5883l.yaml
+F:	drivers/iio/magnetometer/qmc5883l.c
 
 QT1010 MEDIA DRIVER
 L:	linux-media@vger.kernel.org
diff --git a/drivers/iio/magnetometer/Kconfig b/drivers/iio/magnetometer/Kconfig
index fb313e591e85..615564174086 100644
--- a/drivers/iio/magnetometer/Kconfig
+++ b/drivers/iio/magnetometer/Kconfig
@@ -198,6 +198,17 @@ config INFINEON_TLV493D
 	  To compile this driver as a module, choose M here: the module
 	  will be called tlv493d.
 
+config QMC5883L
+	tristate "QST QMC5883L 3-Axis Magnetic Sensor"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  Say Y here to add support driver for QST QMC5883L 3-Axis
+	  Magnetic Sensor.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called qmc5883l.
+
 config SENSORS_HMC5843
 	tristate
 	select IIO_BUFFER
diff --git a/drivers/iio/magnetometer/Makefile b/drivers/iio/magnetometer/Makefile
index 5bd227f8c120..552682555d86 100644
--- a/drivers/iio/magnetometer/Makefile
+++ b/drivers/iio/magnetometer/Makefile
@@ -26,6 +26,8 @@ obj-$(CONFIG_IIO_ST_MAGN_SPI_3AXIS) += st_magn_spi.o
 
 obj-$(CONFIG_INFINEON_TLV493D)		+= tlv493d.o
 
+obj-$(CONFIG_QMC5883L)			+= qmc5883l.o
+
 obj-$(CONFIG_SENSORS_HMC5843)		+= hmc5843_core.o
 obj-$(CONFIG_SENSORS_HMC5843_I2C)	+= hmc5843_i2c.o
 obj-$(CONFIG_SENSORS_HMC5843_SPI)	+= hmc5843_spi.o
diff --git a/drivers/iio/magnetometer/qmc5883l.c b/drivers/iio/magnetometer/qmc5883l.c
new file mode 100644
index 000000000000..055e51570635
--- /dev/null
+++ b/drivers/iio/magnetometer/qmc5883l.c
@@ -0,0 +1,512 @@
+// SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+/*
+ * Support for QST QMC5883L 3-Axis Magnetic Sensor on i2c bus.
+ *
+ * Copyright (C) 2026 Siratul Islam <email@sirat.me>
+ *
+ * Datasheet available at
+ * <https://www.qstcorp.com/upload/pdf/202512/13-52-04%20QMC5883L%20Datasheet%20Rev.%20B.pdf>
+ *
+ * Default 7-bit i2c slave address 0x0D.
+ *
+ */
+
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/bitfield.h>
+#include <linux/cleanup.h>
+#include <linux/delay.h>
+#include <linux/dev_printk.h>
+#include <linux/err.h>
+#include <linux/iio/iio.h>
+#include <linux/i2c.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/time.h>
+
+#include <asm/byteorder.h>
+
+#define QMC5883L_REG_X_LSB	0x00
+#define QMC5883L_REG_STATUS1	0x06
+#define QMC5883L_REG_CTRL1	0x09
+#define QMC5883L_REG_CTRL2	0x0A
+#define QMC5883L_REG_SET_RESET	0x0B
+#define QMC5883L_REG_ID		0x0D
+
+#define QMC5883L_CHIP_ID	0xFF
+
+#define QMC5883L_MODE_MASK	GENMASK(1, 0)
+#define QMC5883L_ODR_MASK	GENMASK(3, 2)
+#define QMC5883L_RNG_MASK	GENMASK(5, 4)
+#define QMC5883L_OSR_MASK	GENMASK(7, 6)
+
+#define QMC5883L_MODE_STANDBY	FIELD_PREP_CONST(QMC5883L_MODE_MASK, 0x00)
+#define QMC5883L_MODE_CONT	FIELD_PREP_CONST(QMC5883L_MODE_MASK, 0x01)
+
+#define QMC5883L_ODR_10HZ	FIELD_PREP_CONST(QMC5883L_ODR_MASK, 0x00)
+#define QMC5883L_ODR_50HZ	FIELD_PREP_CONST(QMC5883L_ODR_MASK, 0x01)
+#define QMC5883L_ODR_100HZ	FIELD_PREP_CONST(QMC5883L_ODR_MASK, 0x02)
+#define QMC5883L_ODR_200HZ	FIELD_PREP_CONST(QMC5883L_ODR_MASK, 0x03)
+
+#define QMC5883L_RNG_2G		FIELD_PREP_CONST(QMC5883L_RNG_MASK, 0x00)
+#define QMC5883L_RNG_8G		FIELD_PREP_CONST(QMC5883L_RNG_MASK, 0x01)
+
+#define QMC5883L_OSR_512	FIELD_PREP_CONST(QMC5883L_OSR_MASK, 0x00)
+#define QMC5883L_OSR_256	FIELD_PREP_CONST(QMC5883L_OSR_MASK, 0x01)
+#define QMC5883L_OSR_128	FIELD_PREP_CONST(QMC5883L_OSR_MASK, 0x02)
+#define QMC5883L_OSR_64		FIELD_PREP_CONST(QMC5883L_OSR_MASK, 0x03)
+
+#define QMC5883L_STATUS_DRDY	BIT(0)
+#define QMC5883L_STATUS_OVL	BIT(1)
+
+#define QMC5883L_SET_RESET_VAL	BIT(0)
+#define QMC5883L_INT_DISABLE	BIT(0)
+#define QMC5883L_SOFT_RESET	BIT(7)
+
+#define QMC5883L_SCALE_2G	83333
+#define QMC5883L_SCALE_8G	333333
+
+/* POR completion time max per datasheet */
+#define QMC5883L_PORT_US	350
+
+struct qmc5883l_data {
+	struct regmap *regmap;
+	struct mutex mutex; /* update and read regmap data */
+	u8 range;
+	u8 odr;
+	u8 osr;
+};
+
+enum qmc5883l_chan {
+	QMC5883L_AXIS_X,
+	QMC5883L_AXIS_Y,
+	QMC5883L_AXIS_Z,
+};
+
+static const int qmc5883l_odr_avail[] = { 10, 50, 100, 200 };
+
+static const int qmc5883l_osr_avail[] = { 512, 256, 128, 64 };
+
+static const int qmc5883l_rng_avail[] = {
+	0, QMC5883L_SCALE_2G,	/* 2G */
+	0, QMC5883L_SCALE_8G,	/* 8G */
+};
+
+static int qmc5883l_take_measurement(struct iio_dev *indio_dev, int index,
+				     int *val)
+{
+	struct qmc5883l_data *data = iio_priv(indio_dev);
+	unsigned int status;
+	__le16 buf[3];
+	int ret;
+
+	scoped_guard(mutex, &data->mutex)
+	{
+		/* 50ms headroom over the slowest ODR (10Hz) */
+		ret = regmap_read_poll_timeout(data->regmap,
+					       QMC5883L_REG_STATUS1, status,
+					       (status & QMC5883L_STATUS_DRDY),
+					       2 * USEC_PER_MSEC,
+					       150 * USEC_PER_MSEC);
+		if (ret)
+			return ret;
+
+		if (status & QMC5883L_STATUS_OVL)
+			return -ERANGE;
+
+		ret = regmap_bulk_read(data->regmap, QMC5883L_REG_X_LSB, buf,
+				       sizeof(buf));
+		if (ret)
+			return ret;
+
+		*val = (s16)le16_to_cpu(buf[index]);
+	}
+
+	return 0;
+}
+
+static int qmc5883l_read_raw(struct iio_dev *indio_dev,
+			     const struct iio_chan_spec *chan, int *val,
+			     int *val2, long mask)
+{
+	struct qmc5883l_data *data = iio_priv(indio_dev);
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_RAW:
+		if (!iio_device_claim_direct(indio_dev))
+			return -EBUSY;
+		ret = qmc5883l_take_measurement(indio_dev, chan->address, val);
+		iio_device_release_direct(indio_dev);
+		if (ret)
+			return ret;
+		return IIO_VAL_INT;
+	case IIO_CHAN_INFO_SCALE:
+		scoped_guard(mutex, &data->mutex)
+		{
+			*val = 0;
+			*val2 = data->range == QMC5883L_RNG_2G ?
+					QMC5883L_SCALE_2G :
+					QMC5883L_SCALE_8G;
+		}
+		return IIO_VAL_INT_PLUS_NANO;
+	case IIO_CHAN_INFO_SAMP_FREQ:
+		scoped_guard(mutex, &data->mutex)
+		{
+			switch (data->odr) {
+			case QMC5883L_ODR_200HZ:
+				*val = 200;
+				break;
+			case QMC5883L_ODR_100HZ:
+				*val = 100;
+				break;
+			case QMC5883L_ODR_50HZ:
+				*val = 50;
+				break;
+			case QMC5883L_ODR_10HZ:
+				*val = 10;
+				break;
+			default:
+				return -EINVAL;
+			}
+		}
+		return IIO_VAL_INT;
+	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
+		scoped_guard(mutex, &data->mutex)
+		{
+			switch (data->osr) {
+			case QMC5883L_OSR_64:
+				*val = 64;
+				break;
+			case QMC5883L_OSR_128:
+				*val = 128;
+				break;
+			case QMC5883L_OSR_256:
+				*val = 256;
+				break;
+			case QMC5883L_OSR_512:
+				*val = 512;
+				break;
+			default:
+				return -EINVAL;
+			}
+		}
+		return IIO_VAL_INT;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int qmc5883l_write_raw(struct iio_dev *indio_dev,
+			      const struct iio_chan_spec *chan, int val,
+			      int val2, long mask)
+{
+	struct qmc5883l_data *data = iio_priv(indio_dev);
+	u8 rng;
+	u8 osr;
+	u8 odr;
+	int ret;
+
+	switch (mask) {
+	case IIO_CHAN_INFO_SCALE:
+		if (val != 0)
+			return -EINVAL;
+
+		switch (val2) {
+		case QMC5883L_SCALE_2G:
+			rng = QMC5883L_RNG_2G;
+			break;
+		case QMC5883L_SCALE_8G:
+			rng = QMC5883L_RNG_8G;
+			break;
+		default:
+			return -EINVAL;
+		}
+		scoped_guard(mutex, &data->mutex)
+		{
+			ret = regmap_update_bits(data->regmap,
+						 QMC5883L_REG_CTRL1,
+						 QMC5883L_RNG_MASK, rng);
+			if (ret)
+				return ret;
+			data->range = rng;
+		}
+		break;
+	case IIO_CHAN_INFO_SAMP_FREQ:
+		switch (val) {
+		case 200:
+			odr = QMC5883L_ODR_200HZ;
+			break;
+		case 100:
+			odr = QMC5883L_ODR_100HZ;
+			break;
+		case 50:
+			odr = QMC5883L_ODR_50HZ;
+			break;
+		case 10:
+			odr = QMC5883L_ODR_10HZ;
+			break;
+		default:
+			return -EINVAL;
+		}
+		scoped_guard(mutex, &data->mutex)
+		{
+			ret = regmap_update_bits(data->regmap,
+						 QMC5883L_REG_CTRL1,
+						 QMC5883L_ODR_MASK, odr);
+			if (ret)
+				return ret;
+			data->odr = odr;
+		}
+		break;
+	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
+		switch (val) {
+		case 64:
+			osr = QMC5883L_OSR_64;
+			break;
+		case 128:
+			osr = QMC5883L_OSR_128;
+			break;
+		case 256:
+			osr = QMC5883L_OSR_256;
+			break;
+		case 512:
+			osr = QMC5883L_OSR_512;
+			break;
+		default:
+			return -EINVAL;
+		}
+		scoped_guard(mutex, &data->mutex)
+		{
+			ret = regmap_update_bits(data->regmap,
+						 QMC5883L_REG_CTRL1,
+						 QMC5883L_OSR_MASK, osr);
+			if (ret)
+				return ret;
+			data->osr = osr;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int qmc5883l_read_avail(struct iio_dev *indio_dev,
+			       struct iio_chan_spec const *chan,
+			       const int **vals, int *type, int *length,
+			       long mask)
+{
+	switch (mask) {
+	case IIO_CHAN_INFO_SAMP_FREQ:
+		*vals = qmc5883l_odr_avail;
+		*type = IIO_VAL_INT;
+		*length = ARRAY_SIZE(qmc5883l_odr_avail);
+		return IIO_AVAIL_LIST;
+	case IIO_CHAN_INFO_OVERSAMPLING_RATIO:
+		*vals = qmc5883l_osr_avail;
+		*type = IIO_VAL_INT;
+		*length = ARRAY_SIZE(qmc5883l_osr_avail);
+		return IIO_AVAIL_LIST;
+	case IIO_CHAN_INFO_SCALE:
+		*vals = qmc5883l_rng_avail;
+		*type = IIO_VAL_INT_PLUS_NANO;
+		*length = ARRAY_SIZE(qmc5883l_rng_avail);
+		return IIO_AVAIL_LIST;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int qmc5883l_write_raw_get_fmt(struct iio_dev *indio_dev,
+				      struct iio_chan_spec const *chan,
+				      long mask)
+{
+	switch (mask) {
+	case IIO_CHAN_INFO_SCALE:
+		return IIO_VAL_INT_PLUS_NANO;
+	default:
+		return IIO_VAL_INT;
+	}
+}
+
+static const struct iio_info qmc5883l_info = {
+	.read_raw = qmc5883l_read_raw,
+	.write_raw = qmc5883l_write_raw,
+	.read_avail = qmc5883l_read_avail,
+	.write_raw_get_fmt = qmc5883l_write_raw_get_fmt,
+};
+
+static int qmc5883l_init(struct qmc5883l_data *data)
+{
+	unsigned int reg;
+	int ret;
+
+	ret = regmap_read(data->regmap, QMC5883L_REG_ID, &reg);
+	if (ret)
+		return ret;
+
+	/* Not failing because rev 1.0 had this register reserved */
+	if (reg != QMC5883L_CHIP_ID)
+		dev_warn(regmap_get_device(data->regmap),
+			 "unknown chip id: 0x%02x, continuing\n", reg);
+
+	ret = regmap_write(data->regmap, QMC5883L_REG_CTRL2,
+			   QMC5883L_SOFT_RESET);
+	if (ret)
+		return ret;
+
+	fsleep(QMC5883L_PORT_US);
+
+	/* DRDY pin no used in this version of the driver */
+	ret = regmap_write(data->regmap, QMC5883L_REG_CTRL2,
+			   QMC5883L_INT_DISABLE);
+	if (ret)
+		return ret;
+
+	ret = regmap_write(data->regmap, QMC5883L_REG_SET_RESET,
+			   QMC5883L_SET_RESET_VAL);
+	if (ret)
+		return ret;
+
+	data->odr = QMC5883L_ODR_50HZ;
+	data->range = QMC5883L_RNG_2G;
+	data->osr = QMC5883L_OSR_64;
+
+	ret = regmap_write(data->regmap, QMC5883L_REG_CTRL1,
+			   (QMC5883L_MODE_CONT | data->odr | data->range |
+			    data->osr));
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static bool qmc5883l_volatile_reg(struct device *dev, unsigned int reg)
+{
+	return reg <= QMC5883L_REG_STATUS1;
+}
+
+static bool qmc5883l_writable_reg(struct device *dev, unsigned int reg)
+{
+	switch (reg) {
+	case QMC5883L_REG_CTRL1:
+	case QMC5883L_REG_CTRL2:
+	case QMC5883L_REG_SET_RESET:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static const struct regmap_config qmc5883l_regmap_config = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = QMC5883L_REG_ID,
+	.cache_type = REGCACHE_MAPLE,
+	.volatile_reg = qmc5883l_volatile_reg,
+	.writeable_reg = qmc5883l_writable_reg
+};
+
+#define QMC5883L_CHANNEL(_axis)                                \
+	{                                                      \
+		.type = IIO_MAGN,                              \
+		.modified = 1,                                 \
+		.channel2 = IIO_MOD_##_axis,                   \
+		.address = QMC5883L_AXIS_##_axis,              \
+		.info_mask_separate = BIT(IIO_CHAN_INFO_RAW),  \
+		.info_mask_shared_by_type =                    \
+			BIT(IIO_CHAN_INFO_SCALE) |             \
+			BIT(IIO_CHAN_INFO_SAMP_FREQ) |         \
+			BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO), \
+		.info_mask_shared_by_type_available =          \
+			BIT(IIO_CHAN_INFO_SCALE) |             \
+			BIT(IIO_CHAN_INFO_SAMP_FREQ) |         \
+			BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO), \
+	}
+
+static const struct iio_chan_spec qmc5883l_channels[] = {
+	QMC5883L_CHANNEL(X),
+	QMC5883L_CHANNEL(Y),
+	QMC5883L_CHANNEL(Z),
+};
+
+static int qmc5883l_probe(struct i2c_client *client)
+{
+	struct iio_dev *indio_dev;
+	struct regmap *regmap;
+	struct qmc5883l_data *data;
+	struct device *dev = &client->dev;
+	int ret;
+
+	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
+	if (!indio_dev)
+		return -ENOMEM;
+
+	regmap = devm_regmap_init_i2c(client, &qmc5883l_regmap_config);
+	if (IS_ERR(regmap)) {
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "regmap initialization failed\n");
+	}
+
+	ret = devm_regulator_get_enable(dev, "vdd");
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to enable VDD regulator\n");
+
+	ret = devm_regulator_get_enable(dev, "vddio");
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to enable VDDIO regulator\n");
+
+	fsleep(QMC5883L_PORT_US);
+
+	data = iio_priv(indio_dev);
+	data->regmap = regmap;
+	ret = devm_mutex_init(dev, &data->mutex);
+	if (ret)
+		return ret;
+
+	indio_dev->name = "qmc5883l";
+	indio_dev->info = &qmc5883l_info;
+	indio_dev->channels = qmc5883l_channels;
+	indio_dev->num_channels = ARRAY_SIZE(qmc5883l_channels);
+	indio_dev->modes = INDIO_DIRECT_MODE;
+
+	ret = qmc5883l_init(data);
+	if (ret)
+		return dev_err_probe(dev, ret, "qmc5883l init failed\n");
+
+	return devm_iio_device_register(dev, indio_dev);
+}
+
+static const struct of_device_id qmc5883l_match[] = {
+	{ .compatible = "qstcorp,qmc5883l" },
+	{ },
+};
+MODULE_DEVICE_TABLE(of, qmc5883l_match);
+
+static const struct i2c_device_id qmc5883l_id[] = {
+	{ "qmc5883l" },
+	{ },
+};
+MODULE_DEVICE_TABLE(i2c, qmc5883l_id);
+
+static struct i2c_driver qmc5883l_driver = {
+	.driver = {
+		.name = "qmc5883l",
+		.of_match_table = qmc5883l_match,
+	},
+	.id_table = qmc5883l_id,
+	.probe = qmc5883l_probe,
+};
+
+module_i2c_driver(qmc5883l_driver);
+
+MODULE_DESCRIPTION("QST QMC5883L 3-Axis Magnetic Sensor driver");
+MODULE_AUTHOR("Siratul Islam <email@sirat.me>");
+MODULE_LICENSE("Dual BSD/GPL");
-- 
2.54.0

