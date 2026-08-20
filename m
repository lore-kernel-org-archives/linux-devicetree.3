Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8246935C6AD
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 14:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787236360; cv=none; b=HL1esFHXrn2f92slyQdCOEeQVbbogLb90qDGcya6mOMxo2UYAkYDfsRRiwNQw9+lge9eKvQlkDrgsEq1uW6OqWAjgK8ejwskWiEKiHb/MxYn/ad8E7IymYSqyhqpKtNcZAKj+ourRucvH2av4JauossLq/Wx6iRlB8Oo9NVrwXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787236360; c=relaxed/simple;
	bh=UYAG8scIKHog05RozGPXp8+bn3honIbHODh1cjp75xY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GWzyfPeprH8Zri6/GH2lO86Ekosf6Cj+lracWbfhS8q+J3MyRkXCuhvRaZ0oFx8tEyecG0kcPy3DxSbtEDpJqMFE98jV1rp0eLCEfqkfwxaKakODz/PUYhZR8vfOsjqqykGf9gpoirTSuiebGxidkdGkyclHR1ph8V2Au6d6LSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RB+ZEdfq; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RB+ZEdfq"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5c276bfce7eso1992927e0c.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 07:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787236357; x=1787841157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dMAMky95vhwY2GpQOZwt4ADrs1Y3YEhuvL0J2CFisxE=;
        b=RB+ZEdfqQp/jMqNjx2X2d9nV1ritf1f8U+oT5acVEqTYA1w7nOOzik0DznI/eqC41g
         XqBPQ5deafAJQaiiAaWibVnzUcrehGiClT65dWCn7vfCYDIT9Y5zYee4PzMW7U4EJHe1
         6iOMzsKnrJd9R+nRQsHzPvB9ClwkTkEObVdSLNiBGDch6VWZtgjOdh1DJYME7u8RnRPh
         w5BBXeNA3uV/4um8Ov2a+l2wzYNHfcy1+5zAYJMNf4NAC8XarZBWv6fLxqfxT3DZzh3Q
         3B/VnemDFyhzgdQGlAoQzJgd7Q2hriidFQxb0AdSd321RScnteiWoeDdMN5YyiIKJSoO
         WGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787236357; x=1787841157;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dMAMky95vhwY2GpQOZwt4ADrs1Y3YEhuvL0J2CFisxE=;
        b=IsntVMI5pcowcLaBH6Q9z0zzd/leFDqcYmOCrn8jEpPyMOtJQH4C0eQ+GvZLkVZjvD
         7g4OO9ll/gYVnNBcSKqfA0M8i4rZxlKBlSALDOz7Gxtp21fRNwZhc+fNCBLv5chol7A6
         dRVB0iXptij1ZvCUvuUeGeOO82JVAneIZ3A4l335ZpUzCQVdmMTZZUssv2pwsJaY1hqx
         CCxc+aojyfWo7QQUdbATnwqSamGtTutHW0jj9HkxkslnbUjz8B5e4HCLdnlJim7tuJbU
         89iRf2sAxTA+WqJmtPs3VHeC+r3SiMnSWvh0jZ2PyUPrs3NvJHzl+cVA63MKsx0Rd2zl
         M61w==
X-Forwarded-Encrypted: i=1; AHgh+Rq/Kqrz+3Wk0WIUAu3X5TnNaSNeJA1RdyHvj7DmyZsTr8Acf9t9w705I+TV800KebhPHUO+Bft/t6Cy@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4cazwhUxLE9wmiD/ZF31+VqbFCBRmdZ1EE9LcP+ZDA85kYm/N
	12i64MUmSTFuRSg3zCkQJosKh5EkClz6bXNJCOeg0kT5TZ9XKrlvPz2hoZzlOro=
X-Gm-Gg: AR+sD13ep8P7BuRH/lm4pjhUb7+YX9SDb2q2iJSW/ERO2VMtlNnhqXWTaiT5D6H/k56
	Ovp4pCXrJY9GmZhBsrvfxSmTAw3WV9q0l0Ej9XFaBBpV9HYMrM7oSmjIU7ioVQlrQv+zkVPkaB7
	tY8XRWTXzLzuLF3IvdxZBgLBx9ttgsNyprOhM17784578XS5nZTfy6CNCmAUebgmAe4xjkgY2Zi
	Qox5Pe2sTgZP8+fi3WO8eNIa2YLM8XZemL8+fPN1laBKrXUz0zFikuD7/O6xgkQOLVZCTJrCL8T
	XmCreLhKVJsuqZlS3TMCFNOlnp9eEejSDyOjpDYXMltUzHiltIurXEvV8+Azwoq/YT9BKBXNv77
	eAaflsN5DE7sqZjNUmd568ov4I6x4sH31y/96FCsfAoU2Rf2jlDTaKftvVRKErDL93W30NJE+O/
	meU9mhUFXLaYlGFsKr/hF3oHMFCUzDztphRUbWBzlVytVoZfvuXjOQFYB3VF3fDQATHYDxYOacV
	8TZbz1UqwFP7bwPC7dx4xX2lrHVV6hDKfYZKL6s
X-Received: by 2002:a05:6122:4f99:b0:5bf:9bfa:53a0 with SMTP id 71dfb90a1353d-5c5e3b676admr6134085e0c.1.1787236357265;
        Thu, 20 Aug 2026 07:32:37 -0700 (PDT)
Received: from localhost.localdomain ([186.158.238.108])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5e25e3459sm6393922e0c.4.2026.08.20.07.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 07:32:36 -0700 (PDT)
From: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: =?UTF-8?q?Nicol=C3=A1s=20Antinori?= <nico.antinori.7@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Brigham Campbell <me@brighamcampbell.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Jori Koolstra <jkoolstra@xs4all.nl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marcelo Schmitt <marcelo.schmitt1@gmail.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Rob Herring <robh@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v4 2/2] iio: humidity: am2315: add support for am2320
Date: Thu, 20 Aug 2026 11:31:10 -0300
Message-ID: <e831d50c53b4c4c0fc0f201c6ef6bf90c0a15629.1786973355.git.nico.antinori.7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1786973355.git.nico.antinori.7@gmail.com>
References: <cover.1786973355.git.nico.antinori.7@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The AM2320 design is fully compatible with AM2315 in terms of I2C
communication protocol and measurement conversions.

Add the "am2320" entry to the i2c_device_id table and register a
of_device_id table to match against devices declared in device tree.

Reviewed-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Nicolás Antinori <nico.antinori.7@gmail.com>
---
 drivers/iio/humidity/Kconfig  |  8 +++++---
 drivers/iio/humidity/am2315.c | 34 +++++++++++++++++++++++++++++-----
 2 files changed, 34 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/humidity/Kconfig b/drivers/iio/humidity/Kconfig
index 54f11f000b6f..13e267943f67 100644
--- a/drivers/iio/humidity/Kconfig
+++ b/drivers/iio/humidity/Kconfig
@@ -5,13 +5,15 @@
 menu "Humidity sensors"

 config AM2315
-	tristate "Aosong AM2315 relative humidity and temperature sensor"
+	tristate "Aosong AM2315 and similar relative humidity and temperature sensor"
 	depends on I2C
 	select IIO_BUFFER
 	select IIO_TRIGGERED_BUFFER
 	help
-	  If you say yes here you get support for the Aosong AM2315
-	  relative humidity and ambient temperature sensor.
+	  If you say yes here you get support for the Aosong relative
+	  humidity and ambient temperature sensors:
+	  - AM2315
+	  - AM2320

 	  This driver can also be built as a module. If so, the module will
 	  be called am2315.
diff --git a/drivers/iio/humidity/am2315.c b/drivers/iio/humidity/am2315.c
index f29baa251f9f..5c7582f3a4f9 100644
--- a/drivers/iio/humidity/am2315.c
+++ b/drivers/iio/humidity/am2315.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Aosong AM2315 relative humidity and temperature
+ * Aosong AM2315 and similar relative humidity and temperature
  *
  * Copyright (c) 2016, Intel Corporation.
  *
@@ -27,7 +27,17 @@
 #define AM2315_TEMP_OFFSET			4
 #define AM2315_ALL_CHANNEL_MASK			GENMASK(1, 0)

-#define AM2315_DRIVER_NAME			"am2315"
+struct am2315_chip_info {
+	const char *name;
+};
+
+static const struct am2315_chip_info am2315_chip_info = {
+	.name = "am2315",
+};
+
+static const struct am2315_chip_info am2320_chip_info = {
+	.name = "am2320",
+};

 struct am2315_data {
 	struct i2c_client *client;
@@ -220,9 +230,14 @@ static const struct iio_info am2315_info = {
 static int am2315_probe(struct i2c_client *client)
 {
 	int ret;
+	const struct am2315_chip_info *chip_info;
 	struct iio_dev *indio_dev;
 	struct am2315_data *data;

+	chip_info = i2c_get_match_data(client);
+	if (!chip_info)
+		return -ENODATA;
+
 	indio_dev = devm_iio_device_alloc(&client->dev, sizeof(*data));
 	if (!indio_dev)
 		return -ENOMEM;
@@ -233,7 +248,7 @@ static int am2315_probe(struct i2c_client *client)
 	mutex_init(&data->lock);

 	indio_dev->info = &am2315_info;
-	indio_dev->name = AM2315_DRIVER_NAME;
+	indio_dev->name = chip_info->name;
 	indio_dev->modes = INDIO_DIRECT_MODE;
 	indio_dev->channels = am2315_channels;
 	indio_dev->num_channels = ARRAY_SIZE(am2315_channels);
@@ -249,8 +264,16 @@ static int am2315_probe(struct i2c_client *client)
 	return devm_iio_device_register(&client->dev, indio_dev);
 }

+static const struct of_device_id am2315_of_match[] = {
+	{ .compatible = "aosong,am2315", .data = &am2315_chip_info },
+	{ .compatible = "aosong,am2320", .data = &am2320_chip_info },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, am2315_of_match);
+
 static const struct i2c_device_id am2315_i2c_id[] = {
-	{ .name = "am2315" },
+	{ .name = "am2315", .driver_data = (kernel_ulong_t)&am2315_chip_info },
+	{ .name = "am2320", .driver_data = (kernel_ulong_t)&am2320_chip_info },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, am2315_i2c_id);
@@ -258,6 +281,7 @@ MODULE_DEVICE_TABLE(i2c, am2315_i2c_id);
 static struct i2c_driver am2315_driver = {
 	.driver = {
 		.name = "am2315",
+		.of_match_table = am2315_of_match,
 	},
 	.probe =        am2315_probe,
 	.id_table =         am2315_i2c_id,
@@ -266,5 +290,5 @@ static struct i2c_driver am2315_driver = {
 module_i2c_driver(am2315_driver);

 MODULE_AUTHOR("Tiberiu Breana <tiberiu.a.breana@intel.com>");
-MODULE_DESCRIPTION("Aosong AM2315 relative humidity and temperature");
+MODULE_DESCRIPTION("Aosong AM2315 and similar relative humidity and temperature");
 MODULE_LICENSE("GPL v2");
--
2.47.3

