Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D453939D2
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 11:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805598; cv=none; b=RUgOdiqSsZEsGD/gRtuRjpaB/dZsNfNqVuS7VjKug4Up8dgpciZWeJcdJfgVCHLVWmOucpXYCwfjoudQMGGyH5rYhMcj5qqFWlKPSKRNN6aqEXGuiB66QpdJv9dygODPVGvr98zEAfFu0Z8FPOwLtfty0J7g1mZ1zSyY/M2sFic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805598; c=relaxed/simple;
	bh=/MClBcFFjzb1UV1X+b6vMuWTiQR1wV36scm/CU99LvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pt3DZ9/p5mhZ61qnjieOzp9o0GtxwvZRM+TGYrAsvwaM+KxuRI31tuylRGS9BDjzEu3XbgSoKsPhxwhUmaPVWmznHqpjb14vULX9WL65Q/IDirHK2S4BxzqGiH41k7ExZq7gHWeonkfQul29Ku+2NDry25cKdEbTXX0GcZ45jdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eYOF1F3w; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eYOF1F3w"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2055573c8cso209565566b.3
        for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 04:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791805593; x=1792410393; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8zyFINpGFxmx+oJRqd9dNRUlZz1plXXbZjqXBAW1mDI=;
        b=eYOF1F3w+AS3+TqFYKsvpeiEc3nWIdp938vCHS5F6zkH0oKnWwbgOwm+t2R0YocSDn
         RaNca9hTvD7nSluz+Q03uNtkWYCSGUAlZE6VUnffIDkakBH3SnYkOo/yxTwRrMVCpuAh
         WtSM9Y9RdDnxA3/wOFy5bEAkhGnvit9Frz1Aho3HHYsk6TXI+Bc4l2PDjK0iLs83EL8Q
         8qbdTGMWo+Cy0eNxSDmSa8wobK/Z+pjYEuV6ReCDDMBrTuFQ5nxHp7M5pK63uTz6/JJ1
         co7RT/c9uRVNkTdD/7R12SLKYsYQDSbT0y1dvHy3TMHVBQvHuIRw3IGqKlG9cYCXZHUB
         97Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791805593; x=1792410393;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8zyFINpGFxmx+oJRqd9dNRUlZz1plXXbZjqXBAW1mDI=;
        b=BoI2qpNA7KuzGAsBMud26LS+LONft/Jih1rKgZxELZ5yP0FeagL2FmVCysQ7J5zoaF
         8bS5uNJ1d4B/Yxrs/vXXvT5KhWSFK3IeevaU8jtBO2V0ud14wQEuOWHx/S0JRIRCsvwd
         qRzAHUU3X18MYr1d9RCwsx/EQYXuWeioUNjK4i2vXB2dlYHcgbTkDdrZ0g6oplg6d5uC
         nRDPu9y5ta6lBWo8hyqZDM4q1P6UznuRs6Z0f4w6apw7lc+5mMZ4VlItyVvzquruNT5w
         EdoV7Ir8EcyuIwv3qAH1wjNd/hSBwuNnQi3Tuo24yy88q188KQa0l2JUn1rHpNw3mvdM
         fT8A==
X-Forwarded-Encrypted: i=1; AKwUvBy7XcyeeVuPIqTRKaLAfSYSs/YvpnO993MIshj01nEtNVR7u/j/pmMsZBXNBA1tdYj1RhsBr7+rGLRh@vger.kernel.org
X-Gm-Message-State: AFq9FYIkn92LYS1yWliVQ4zK6JnP5V4LiXk533R7RIxG5kWjTiczUQt5
	vU2uc3NozayBQL0+83N7bRZoDXYI8vAFbzDiC1Dm+QrakokJF5m4EAh5
X-Gm-Gg: AYBFou0RhQ6goagKt8gflN247tcaObvhv3JqUjb8lG1OJebP4GdvOHDw2GAA8Gmhcg/
	i2S2AdbAtShzuq/tpQyo7qfcnzn4JWf1dtqqEehQ6FEujoKbD2P7KNGPIvuKQ5KYCE+1iyCn2n2
	n6w96NYV7SGLZHCYwQUgQ8LAHtFE2rjUmq9J9nBwRb/2Q9PmvCgK94yfHn41YWl/8y8+fIx9beY
	C+lmxp4nhkAEJJJORc7YQKap9Ncu7IZZWGabCgID8IJ8QMX+HOmBLrAESm7DEFo4kWNwhLFaOtl
	f1HkpoXybiQHXmPbOGT3Bbp0ISMS8P4Rcs+0O5yxk7r/WXBY8iu+2jP9Lk+rLfhJvDPwMkVirJ4
	HV5K74JRFLjvu9KvsJVFEJsyfIYmWYflfK1QoSsYZ/GG5sAVKpj8yoD+Pz75GQeElzkpdd/hl3s
	PEymqDln35rrrzITFugo+q0JjMN0o53rqzlQRw3Vw4cpT3B4PqG/Ty+oojw3NqU/PMhwnbFKHlD
	ozFsMJ3gYq6szDD5vmNztJWdyx5PPurJE1DnU2bmsyKtYZk+uzFbSZQAdHKBfqDPI0f2YE2e5nW
	K24zbM9+UymK0HTNNJTKip8=
X-Received: by 2002:a17:907:3fa9:b0:c26:1649:47af with SMTP id a640c23a62f3a-c31a9fb6451mr912074566b.37.1791805592423;
        Mon, 12 Oct 2026 04:46:32 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c34d011dfccsm118669266b.42.2026.10.12.04.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 04:46:31 -0700 (PDT)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
X-Google-Original-From: Paulius Zaleckas <paulius.zaleckas@ui.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH 4/4] iio: pressure: dps310: add Zilltek ZTS8032 support
Date: Mon, 12 Oct 2026 14:45:50 +0300
Message-ID: <20261012114550.1680054-5-paulius.zaleckas@ui.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012114550.1680054-1-paulius.zaleckas@ui.com>
References: <20261012114550.1680054-1-paulius.zaleckas@ui.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paulius Zaleckas <paulius.zaleckas@gmail.com>

The Zilltek ZTS8032 has the DPS310 register map, scale factors and
compensation, with these differences:

- two more pressure coefficients, c31 and c40 at 0x22-0x25, adding
  c40 * Praw_sc^4 + c31 * Traw_sc * Praw_sc^3 to the polynomial
- TMP_EXT is MEAS_CFG bit 3, and the temperature coefficients are for
  the internal sensor (COEF_SRCE reads 0x06). TMP_CFG bit 7 is the top
  bit of a 4-bit TMP_RATE, so the DPS310 TMP_EXT write would select a
  25/16 Hz background rate instead of the external sensor.
- product ID 0x11 instead of 0x10, the driver does not check it

Add a per-chip table holding the coefficient count and the TMP_CFG
startup value, and an OF match table to select it.

Tested on a ZTS8032 at 0x76 over I2C: in_pressure_input is within 1 Pa
of the datasheet formula evaluated from the raw and coefficient
registers at every oversampling rate from 1 to 128, and TMP_CFG reads
0x00 after probe.

Assisted-by: LLM
Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 drivers/iio/pressure/Kconfig  |  4 +--
 drivers/iio/pressure/dps310.c | 66 ++++++++++++++++++++++++++++++-----
 2 files changed, 60 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/pressure/Kconfig b/drivers/iio/pressure/Kconfig
index cef8b90b9ae7..e407243e131c 100644
--- a/drivers/iio/pressure/Kconfig
+++ b/drivers/iio/pressure/Kconfig
@@ -115,8 +115,8 @@ config DPS310
 	select IIO_BUFFER
 	select IIO_TRIGGERED_BUFFER
 	help
-	  Support for the Infineon DPS310 digital barometric pressure sensor.
-	  It can be accessed over I2C bus.
+	  Support for the Infineon DPS310 and Zilltek ZTS8032 digital
+	  barometric pressure sensors. They can be accessed over I2C bus.
 
 	  This driver can also be built as a module.  If so, the module will be
 	  called dps310.
diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 3bc690cc8609..3b0f6d344409 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -7,6 +7,10 @@
  *
  * https://www.infineon.com/dgdl/?fileId=5546d462576f34750157750826c42242
  *
+ * The Zilltek ZTS8032 is register compatible, with two more pressure
+ * calibration coefficients (c31, c40) and temperature calibrated against
+ * the internal sensor.
+ *
  * Temperature calculation:
  *   c0 * 0.5 + c1 * T_raw / kT °C
  *
@@ -18,6 +22,7 @@
 #include <linux/i2c.h>
 #include <linux/limits.h>
 #include <linux/math64.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/unaligned.h>
@@ -61,6 +66,8 @@
 #define DPS310_RESET		0x0c
 #define  DPS310_RESET_MAGIC	0x09
 #define DPS310_COEF_BASE	0x10
+#define DPS310_COEF_LEN		18
+#define ZTS8032_COEF_LEN	22
 
 /* Make sure sleep time is <= 30ms for usleep_range */
 #define DPS310_POLL_SLEEP_US(t)		min(30000, (t) / 8)
@@ -85,13 +92,34 @@ static const int scale_factors[] = {
 	2088960,
 };
 
+struct dps310_chip_info {
+	const char *name;
+	u8 tmp_cfg;	/* TMP_CFG at startup: sensor the coefficients are for */
+	u8 coef_len;
+};
+
+static const struct dps310_chip_info dps310_chip_info = {
+	.name = "dps310",
+	.tmp_cfg = DPS310_TMP_EXT,
+	.coef_len = DPS310_COEF_LEN,
+};
+
+/* TMP_CFG bit 7 is a rate bit here; the internal sensor is the default */
+static const struct dps310_chip_info zts8032_chip_info = {
+	.name = "zts8032",
+	.tmp_cfg = 0,
+	.coef_len = ZTS8032_COEF_LEN,
+};
+
 struct dps310_data {
 	struct i2c_client *client;
 	struct regmap *regmap;
 	struct mutex lock;	/* Lock for sequential HW access functions */
+	const struct dps310_chip_info *info;
 
 	s32 c0, c1;
 	s32 c00, c10, c20, c30, c01, c11, c21;
+	s32 c31, c40;
 	s32 pressure_raw;
 	s32 temp_raw;
 	bool timeout_recovery_failed;
@@ -148,13 +176,13 @@ static const struct iio_chan_spec dps310_channels[] = {
 static int dps310_get_coefs(struct dps310_data *data)
 {
 	int rc;
-	u8 coef[18];
+	u8 coef[ZTS8032_COEF_LEN];
 	u32 c0, c1;
 	u32 c00, c10, c20, c30, c01, c11, c21;
 
 	/* Read all sensor calibration coefficients from the COEF registers. */
 	rc = regmap_bulk_read(data->regmap, DPS310_COEF_BASE, coef,
-			      sizeof(coef));
+			      data->info->coef_len);
 	if (rc < 0)
 		return rc;
 
@@ -194,6 +222,11 @@ static int dps310_get_coefs(struct dps310_data *data)
 	c30 = (coef[16] << 8) | coef[17];
 	data->c30 = sign_extend32(c30, 15);
 
+	if (data->info->coef_len == ZTS8032_COEF_LEN) {
+		data->c31 = sign_extend32((coef[18] << 8) | coef[19], 15);
+		data->c40 = sign_extend32((coef[20] << 8) | coef[21], 15);
+	}
+
 	return 0;
 }
 
@@ -251,10 +284,10 @@ static int dps310_startup(struct dps310_data *data)
 		return rc;
 
 	/*
-	 * Set up external (MEMS) temperature sensor in single sample, one
-	 * measurement per second mode
+	 * Set up the temperature sensor the coefficients are for in single
+	 * sample, one measurement per second mode
 	 */
-	rc = regmap_write(data->regmap, DPS310_TMP_CFG, DPS310_TMP_EXT);
+	rc = regmap_write(data->regmap, DPS310_TMP_CFG, data->info->tmp_cfg);
 	if (rc)
 		return rc;
 
@@ -682,6 +715,7 @@ static int dps310_calculate_pressure(struct dps310_data *data, int *val)
 	s64 ts;
 	s64 x2;
 	s64 x3;
+	s64 x4;
 
 	rc = dps310_get_pres_k(data, &kp);
 	if (rc)
@@ -702,6 +736,7 @@ static int dps310_calculate_pressure(struct dps310_data *data, int *val)
 	ts = div_s64(t * DPS310_Q_ONE, kt);
 	x2 = dps310_mul_q(ps, ps);
 	x3 = dps310_mul_q(x2, ps);
+	x4 = dps310_mul_q(x3, ps);
 
 	pressure = data->c00 * DPS310_Q_ONE;
 	pressure += div_s64(p * data->c10 * DPS310_Q_ONE, kp);
@@ -709,6 +744,8 @@ static int dps310_calculate_pressure(struct dps310_data *data, int *val)
 	pressure += dps310_mul_q(data->c11 * ps, ts);
 	pressure += data->c20 * x2 + data->c30 * x3;
 	pressure += dps310_mul_q(data->c21 * x2, ts);
+	/* ZTS8032 only, c31 and c40 are zero on the DPS310 */
+	pressure += data->c40 * x4 + dps310_mul_q(data->c31 * x3, ts);
 	pressure >>= DPS310_Q;
 	if (pressure < 0LL)
 		return -ERANGE;
@@ -983,7 +1020,11 @@ static int dps310_probe(struct i2c_client *client)
 	data->client = client;
 	mutex_init(&data->lock);
 
-	iio->name = DPS310_DEV_NAME;
+	data->info = i2c_get_match_data(client);
+	if (!data->info)
+		return -ENODEV;
+
+	iio->name = data->info->name;
 	iio->channels = dps310_channels;
 	iio->num_channels = ARRAY_SIZE(dps310_channels);
 	iio->info = &dps310_info;
@@ -1022,13 +1063,21 @@ static int dps310_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id dps310_id[] = {
-	{ .name = DPS310_DEV_NAME },
+	{ .name = "dps310", .driver_data = (kernel_ulong_t)&dps310_chip_info },
+	{ .name = "zts8032", .driver_data = (kernel_ulong_t)&zts8032_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, dps310_id);
 
+static const struct of_device_id dps310_of_match[] = {
+	{ .compatible = "infineon,dps310", .data = &dps310_chip_info },
+	{ .compatible = "zilltek,zts8032", .data = &zts8032_chip_info },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, dps310_of_match);
+
 static const struct acpi_device_id dps310_acpi_match[] = {
-	{ "IFX3100" },
+	{ "IFX3100", (kernel_ulong_t)&dps310_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, dps310_acpi_match);
@@ -1036,6 +1085,7 @@ MODULE_DEVICE_TABLE(acpi, dps310_acpi_match);
 static struct i2c_driver dps310_driver = {
 	.driver = {
 		.name = DPS310_DEV_NAME,
+		.of_match_table = dps310_of_match,
 		.acpi_match_table = dps310_acpi_match,
 	},
 	.probe = dps310_probe,
-- 
2.55.0

