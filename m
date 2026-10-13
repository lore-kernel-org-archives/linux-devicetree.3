Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D9BB4ED1A9
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 11:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890514; cv=none; b=cooKv4WzadyYN6HSB6Qk32X6VwkAR+8WvLO2BGj3qiNfL1wO5FMBGVd+GBQx7G2G9iLnB95argbK2BOT1o8gKWjOquua4Wp4SpgV0zmj8VFViu7/HjsSZLVdPx7wNkNQobgUBjar/TDThnqHFjXKmojfOhP1Dkb+YTnpBNZEbPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890514; c=relaxed/simple;
	bh=PORQCIEb1meIMWwZwjyqyYApPHgHJQkfRo4Bm7PxMd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oUIF9mSkZ3mOf9JIpk0wokvqOPW3HXRAIftPLg9HYWNgym72O0sF7UueWGYsX7xTDU3fcfCkGRMxI1q7rDvRaZRJduIFfN6YcCBASWPVtUPI5PQBoz/3uPPMDPA5RpYuOUYnpaVKGFG4MA4WL717K3I8Ogul/q9ny0vUNRzZhzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CawLYsez; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CawLYsez"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5ba3b1199f6so2447081e87.3
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 04:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791890509; x=1792495309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HdB4o2VSACwWE9ohOEzKPVPVDc5/vqu6bZ3fvhwm0Xg=;
        b=CawLYsezVS9MpWvPz1gj1F8rRtrwNgwSX5sJTQeZE4w49WxuNif1YPi8F6o3UY3H8w
         JnBptkiM+xMqPVubYdrzJLhMvwsxS2I3KSn1/l9aQDeoRYWSBF2E8hf7zmO41Ds+7tFR
         JsPVyW0otlU0tu7kzXLdn5aKaUDIpcC3N++FAmNaJ0v71Ogt8eQ0oS4w4qleAa1vuyDI
         6QmAHu8tpFj4BfjaxQ/J5rMO5X5ru2hEa/URPip+MDZRDNpZ1Nn9AnwDTsC7PzT1YsHR
         6Jk0kAVl2wzeGljZowmuH3h76hJY5RyvncubZGSMpUYIGLEdjtaeJFy6F6Y31tfUf85R
         9M9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791890509; x=1792495309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HdB4o2VSACwWE9ohOEzKPVPVDc5/vqu6bZ3fvhwm0Xg=;
        b=CnaRQ7WGrLVp9NYG+8ldFLx+IKiDr9kC87W6pknpd3O22HLlQSYtfFA2lYJavp3Vhh
         Qd00CrEGmdl49EC49IYQHJYo/mEqgPuDga2/vgOmEG0sLLuo4f9XXkJ0dob5jBR8NN5x
         YO+d0vPm0aC/fBE0O+NIx+VyPyfVqw1wc0s/mgtXrW+iwoBgzlPySy13K+uIchTvVPj3
         DU1ZLSqpFaKiN1/sbpYpiboia5IFkcSqq/A4Q98sOc8aP9uJU5HNUqehBqAznr38YTQn
         /4HvYF23P7p0dqlLaX/CEg6H+YLFFQbnR6WkblDpRg9FJmo0dKDV4QNVHq/n4KcfMQ8Z
         Fqiw==
X-Forwarded-Encrypted: i=1; AKwUvByqc1wIxyt5f7pq9Q336cfeiJq8CNfdCHD0j4Lsk2GVnB7uh1ttyJjcvrqwLypa6MzvruQu/wAfQ81X@vger.kernel.org
X-Gm-Message-State: AFq9FYLBxow0YAMWH3mwPqHSLpk2N1/JujWSvHMH3qGuh7Tu6VxN3SOs
	nQ7D7jewOpzNY9cbBMWfE87NrLR6AMkKZhcWkJhFoXcLlEjffr2VhaQx
X-Gm-Gg: AYBFou0Uzgbe1ARCTkwDav++Xr8fiK0A/L+lbGkzl0sREiFTLsWfgHeXSm6WIfkBGz+
	OAo0xB/GgKwYykNnE15fpyv7ycMWMCBM+g4t2sU5mUFwTEoGm3SgY4wLUe/ZMf0J5bI8wPw65oi
	UqstDQ/thT2jdsJ324DY1PFS+mgOGAqVSoxc9X3oqcbyv5jC5i5N0WH85nyo3Mu5kqWgTDSQ+vp
	fcNSHt+W5TJYyjA0Yzw2Ks75EEIO63H2C5d5nIIaEEHsAXBVY/wDrVHbUglNHiQAfYxZiI+ldiL
	vHF+UYv6PtRXvPopN8oHPgD3YxGcpQlyyVmzV1J8Qa0wa3k0XXeBz04UqrQdI4Henbvsc5F3JWK
	uzpALF4azJ+i9zfaNjwA8dYweQYW4BK2y4uu+1OLbkVWck6wtz4FN/qG1EhqgYc4C2q0KZ0OTjw
	ZFGqbNmCqQpIFTZHr4i8Eh5w/mm0zFuAKZgP6yJUYj0FQfc+uEjY45Wiw+WDoF+iD5LCdfTohVB
	4eBBL8o8uYk2BJ6PjEWA+EuOBd0amllFNvGbK+aMJmeJQBZyiQaw3lVGYySbP3gMqB+FPyIe/Rk
	OyOXwM42NBgFKJ63O/4XcehSxek=
X-Received: by 2002:a05:6512:3045:b0:5bc:bb39:1b2b with SMTP id 2adb3069b0e04-5bcde8c1e35mr4217997e87.50.1791890508824;
        Tue, 13 Oct 2026 04:21:48 -0700 (PDT)
Received: from M-K2012N0113010.localdomain ([88.119.128.229])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcf8a3970asm1116148e87.79.2026.10.13.04.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 04:21:48 -0700 (PDT)
From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: Eddie James <eajames@linux.ibm.com>,
	Joel Stanley <joel@jms.id.au>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Rupesh Majhi <zoone.rupert@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paulius Zaleckas <paulius.zaleckas@gmail.com>
Subject: [PATCH v2 4/6] iio: pressure: dps310: add per-chip data
Date: Tue, 13 Oct 2026 14:21:22 +0300
Message-ID: <20261013112124.1878296-5-paulius.zaleckas@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261013112124.1878296-1-paulius.zaleckas@gmail.com>
References: <20261013112124.1878296-1-paulius.zaleckas@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the coefficient count, the TMP_CFG startup value and the IIO device
name into a per-chip structure, passed through the I2C and ACPI match
data. This prepares for the Zilltek ZTS8032, which has two more
coefficients and a different TMP_CFG layout.

No functional change.

Assisted-by: LLM
Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 drivers/iio/pressure/dps310.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/pressure/dps310.c b/drivers/iio/pressure/dps310.c
index 3bc690cc8609..0d558edff5ab 100644
--- a/drivers/iio/pressure/dps310.c
+++ b/drivers/iio/pressure/dps310.c
@@ -61,6 +61,7 @@
 #define DPS310_RESET		0x0c
 #define  DPS310_RESET_MAGIC	0x09
 #define DPS310_COEF_BASE	0x10
+#define DPS310_COEF_LEN		18
 
 /* Make sure sleep time is <= 30ms for usleep_range */
 #define DPS310_POLL_SLEEP_US(t)		min(30000, (t) / 8)
@@ -85,10 +86,23 @@ static const int scale_factors[] = {
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
 struct dps310_data {
 	struct i2c_client *client;
 	struct regmap *regmap;
 	struct mutex lock;	/* Lock for sequential HW access functions */
+	const struct dps310_chip_info *info;
 
 	s32 c0, c1;
 	s32 c00, c10, c20, c30, c01, c11, c21;
@@ -148,13 +162,13 @@ static const struct iio_chan_spec dps310_channels[] = {
 static int dps310_get_coefs(struct dps310_data *data)
 {
 	int rc;
-	u8 coef[18];
+	u8 coef[DPS310_COEF_LEN];
 	u32 c0, c1;
 	u32 c00, c10, c20, c30, c01, c11, c21;
 
 	/* Read all sensor calibration coefficients from the COEF registers. */
 	rc = regmap_bulk_read(data->regmap, DPS310_COEF_BASE, coef,
-			      sizeof(coef));
+			      data->info->coef_len);
 	if (rc < 0)
 		return rc;
 
@@ -251,10 +265,10 @@ static int dps310_startup(struct dps310_data *data)
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
 
@@ -983,7 +997,11 @@ static int dps310_probe(struct i2c_client *client)
 	data->client = client;
 	mutex_init(&data->lock);
 
-	iio->name = DPS310_DEV_NAME;
+	data->info = i2c_get_match_data(client);
+	if (!data->info)
+		return -ENODATA;
+
+	iio->name = data->info->name;
 	iio->channels = dps310_channels;
 	iio->num_channels = ARRAY_SIZE(dps310_channels);
 	iio->info = &dps310_info;
@@ -1022,13 +1040,13 @@ static int dps310_probe(struct i2c_client *client)
 }
 
 static const struct i2c_device_id dps310_id[] = {
-	{ .name = DPS310_DEV_NAME },
+	{ .name = "dps310", .driver_data = (kernel_ulong_t)&dps310_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, dps310_id);
 
 static const struct acpi_device_id dps310_acpi_match[] = {
-	{ "IFX3100" },
+	{ "IFX3100", (kernel_ulong_t)&dps310_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, dps310_acpi_match);
-- 
2.55.0

