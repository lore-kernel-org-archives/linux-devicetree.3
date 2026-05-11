Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E7D46AF1D
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 17:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778521500; cv=none; b=VIAieTwOkly6f31MyglpeiterbJeoTkfFFLh0Ia6x5jU+s+GjxxvebhsPkWt98lEZluXHLYe/hJd5j08SU656v2pxwwW9nJVMmbcBPU5GJxn28EvlEuRj4ploleFwskgjPA1nMvlzeDobN8SOwatbv64NNBDwCVYbEWxzgy4tfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778521500; c=relaxed/simple;
	bh=GP/zXsIk7W/qQ+UNS2wJhazgPEjZIr5oEO/HNA2gsAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RRnIwLBJ9JKwTLydtFa5Bf5iciZNzAJkEhJaAS/iDEMOC/X2VXfOqpmL6OtlHbR/4mL1zVPGUlIye0Z84EjVypZYqrfeyF07dfgSZ2N6LEZkkJFNClRN048rW2fK+NYkscVkog2YVOXi86ISCtDEotjp9QPRbbJqhabJfwfai6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjAGoCLJ; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjAGoCLJ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2b9ec9443c2so30025435ad.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 10:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778521498; x=1779126298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2d3GApoepHVx+uh3La4WWn+PmYLbQZlFvom3bYXI8VQ=;
        b=hjAGoCLJuEf2aGGeWU62QC2wysc3X0Sf0rehXA+tqdSXxob0PwvksRpRy7yY1UBl3l
         UGXhl4V6CqIpAku8z20Mo0GQFK2VLUZON8uqa8y+vzbKA2wUGGEBd16Xr1hgIEtNuo0F
         xPBqaNePt8Ml0mx7jqzca7kgKmxbQks0+JXF6S3RQJWnkgjkWxOi0HySk1yJR3dBOjOS
         XBo7tn2aKorqYTB7tMXAGh1+A9b63zq3Zw6Zl4H+5gakYjWWu+7LJIwMcQvzP0Vwsy4O
         TJk+WNRipPEt2rSa0ldj8ySDdNaYtwlLZmdo0KXe1wn2xUcOTXSKL84DHuG4OPnG7HmS
         5ZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778521498; x=1779126298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2d3GApoepHVx+uh3La4WWn+PmYLbQZlFvom3bYXI8VQ=;
        b=Dl91rObPvhX5DhE07P2vIxQP9S6VDYUDCdEbwiFS64ye4JWXzRyo+iHJs7QwgF1/Kw
         BMTDg6+6j1ymyTUC8KHrnB8cR8+KKxiHFerd//e/w/UXuKkhBXskmab1989cFyzRuR6/
         hdsfrXDqPTY56HeGsPf40ER8jHdfoYKW/AP2/hZt32Ah7DMjyrh2sSqBdLewTbeTyFPG
         HS420dNaqnFh4l1uRM5Ma8LfwPpP53VRaSUJ9LVxRMzauddlMBvalqd3rvOZX6RmrsWN
         NCOuOGqZHrVqZDcpAIMP+lmDvkPIsm7V6CUqwmMtw2qXwplTgRJ2MFDp+76JXXRbPlKB
         ItnQ==
X-Forwarded-Encrypted: i=1; AFNElJ8rCOXPR1NLoy6THtJ91zHmztE/DUm+cm/1l7NkIAh/zUk6Fve/uXngPe01HPMm9e75UCs7FQojsfDk@vger.kernel.org
X-Gm-Message-State: AOJu0YxSgqlMkYnpXenuR6AMqURzdRQ7QUGI8/cKmkoP0AlbSPUwLzGu
	7PMFP2kW96s/7c/CTgxMRBsiDM6BJH3b2DYsD4KQKE3d+V8L2gjwXqvF
X-Gm-Gg: Acq92OGLeppok4jn5PdHQfNqWPw2aYqUW6XfzoKOKWCYG5u7785SG33/+joFTMqNUPn
	l+elOf6di74pDbO6eW5H6ggn/yymeyjBSdyJOT+xhsu3NTo2a6dO+QwlFuhRLqIdB9Rj0TYULGo
	sO3ihEE8ZPU1GIwj2l7AV57v9LIizAUJKRpHAqmMnZUHmBnzDfkKlTqCPN+3eiiEhv/nYqobuw3
	u2M/Ml9lLqi5jDGXAeeY7JHlac4vvC9k69dwzgwZTVUsE8MCi/WI9Lp5vxMKPJQ1hyw3JZpU6NW
	+GPvEsZAduxk9cpdO8c0RS7hIlFI1+J2yolkYYhrfgUQowSqIfuhHMsJWd+TVCi7jNzHrrdm5y3
	/h0rEOnrxP2jGmRlCfneQRxquT6jTf9cdkx8Bms1tz4UcrIXs0+bo5UL1om2dBKCHOfSq8xvG9e
	myna8NUcRolv5FgYVYdR/EE9zGOaBWHFKfR2qcXJVA9sd5+uT0FAcfW0Ugjog7XUKdCjgQLk2k+
	kQJeiKsSFMDer1OenVvAPnhkKFQ/hsqoPC+peO6pXdmtFvS62bGFcnCaHcm
X-Received: by 2002:a17:903:388c:b0:2ba:6601:8e3d with SMTP id d9443c01a7336-2bcfcc3d69bmr4310255ad.9.1778521497694;
        Mon, 11 May 2026 10:44:57 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e365a1sm106838425ad.44.2026.05.11.10.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:44:57 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: jic23@kernel.org
Cc: ak@it-klinger.de,
	andriy.shevchenko@linux.intel.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 v8 06/11] iio: adc: hx711: introduce hx711_chip_info structure
Date: Mon, 11 May 2026 23:13:31 +0530
Message-ID: <20260511174342.123820-7-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260511174342.123820-1-piyushpatle228@gmail.com>
References: <20260511174342.123820-1-piyushpatle228@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a per-variant static configuration structure and populate the IIO
device fields from it at probe time.

This is a preparatory change for adding support for more HX711-compatible
hardware variants without duplicating the probe-time setup.

No functional change for existing HX711 users.

Signed-off-by: Piyush Patle <piyushpatle228@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/iio/adc/hx711.c | 41 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 86d2a70dd3de..10ccc69f209b 100644
--- a/drivers/iio/adc/hx711.c
+++ b/drivers/iio/adc/hx711.c
@@ -4,6 +4,8 @@
  *
  * Copyright (c) 2016 Andreas Klinger <ak@it-klinger.de>
  */
+#include <linux/array_size.h>
+#include <linux/dev_printk.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
@@ -74,6 +76,20 @@ static int hx711_get_scale_to_gain(const int *gain_scale, int scale)
 	return -EINVAL;
 }
 
+/**
+ * struct hx711_chip_info - per-variant static configuration
+ * @name: IIO device name
+ * @channels: channel specification array
+ * @num_channels: number of entries in @channels
+ * @iio_info: IIO info ops for this variant
+ */
+struct hx711_chip_info {
+	const char			*name;
+	const struct iio_chan_spec	*channels __counted_by_ptr(num_channels);
+	unsigned int			num_channels;
+	const struct iio_info		*iio_info;
+};
+
 struct hx711_data {
 	struct device		*dev;
 	struct gpio_desc	*gpiod_pd_sck;
@@ -81,6 +97,7 @@ struct hx711_data {
 	int			gain_set;	/* gain set on device */
 	int			gain_chan_a;	/* gain for channel A */
 	int			gain_scale[HX711_GAIN_MAX];
+	const struct hx711_chip_info	*chip_info;
 	struct mutex		lock;
 	/*
 	 * triggered buffer
@@ -456,8 +473,16 @@ static const struct iio_chan_spec hx711_chan_spec[] = {
 	IIO_CHAN_SOFT_TIMESTAMP(2),
 };
 
+static const struct hx711_chip_info hx711_chip = {
+	.name		= "hx711",
+	.channels	= hx711_chan_spec,
+	.iio_info	= &hx711_iio_info,
+	.num_channels	= ARRAY_SIZE(hx711_chan_spec),
+};
+
 static int hx711_probe(struct platform_device *pdev)
 {
+	const struct hx711_chip_info *chip_info;
 	struct device *dev = &pdev->dev;
 	struct hx711_data *hx711_data;
 	struct iio_dev *indio_dev;
@@ -473,6 +498,12 @@ static int hx711_probe(struct platform_device *pdev)
 
 	mutex_init(&hx711_data->lock);
 
+	chip_info = device_get_match_data(dev);
+	if (!chip_info)
+		return dev_err_probe(dev, -ENODEV, "missing driver data\n");
+
+	hx711_data->chip_info = chip_info;
+
 	/*
 	 * PD_SCK stands for power down and serial clock input of HX711
 	 * in the driver it is an output
@@ -534,11 +565,11 @@ static int hx711_probe(struct platform_device *pdev)
 	hx711_data->data_ready_delay_ns =
 				1000000000 / hx711_data->clock_frequency;
 
-	indio_dev->name = "hx711";
-	indio_dev->info = &hx711_iio_info;
+	indio_dev->name = chip_info->name;
+	indio_dev->info = chip_info->iio_info;
 	indio_dev->modes = INDIO_DIRECT_MODE;
-	indio_dev->channels = hx711_chan_spec;
-	indio_dev->num_channels = ARRAY_SIZE(hx711_chan_spec);
+	indio_dev->channels = chip_info->channels;
+	indio_dev->num_channels = chip_info->num_channels;
 
 	ret = devm_iio_triggered_buffer_setup(dev, indio_dev,
 					      iio_pollfunc_store_time,
@@ -555,7 +586,7 @@ static int hx711_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id of_hx711_match[] = {
-	{ .compatible = "avia,hx711", },
+	{ .compatible = "avia,hx711", .data = &hx711_chip },
 	{ }
 };
 
-- 
2.43.0

