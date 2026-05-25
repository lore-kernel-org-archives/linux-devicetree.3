Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42703DD872
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779706331; cv=none; b=Kwh2DcGYdTeqBZYb+j82QahQT5Bq2Z6clGQ69zPK8Flfh6BhcQy6R7xwcjaF5oKwmbO09hRyAeNp94CoSXsiuy99x3WrN589leDM97kBAIixGhxMhi6ChgL5NPnCJ/cy0ECUbboPrp5RsjRKnHrUBD7yJ9MmMQc8vPT/ih4nFGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779706331; c=relaxed/simple;
	bh=GP/zXsIk7W/qQ+UNS2wJhazgPEjZIr5oEO/HNA2gsAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ApmsY2Z+ipKzUi1NIdSBV6YEF0jv1ZRz316HaJYav6SXL97xLnYs8dbCkSby/Y7biL75QJlUiI58OfAxOtbcVttK6W6Nbq/tdH65neDj2hD8OHmTmZDBuUUyFNTCcMb6dDfBp+Jj43MOQ+DwG6NC+y8xWasUSPU4W2AJIx6Pays=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W5omaTn1; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5omaTn1"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36a7bbb9698so1597517a91.2
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 03:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779706328; x=1780311128; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2d3GApoepHVx+uh3La4WWn+PmYLbQZlFvom3bYXI8VQ=;
        b=W5omaTn1Kuq7YRrg3sxDP92r72DQ/MHSWPFT82vziYYoerkSM1GW+vrdv/J/t2DIkc
         HBtu2vtsJYvezz0e8IbEGMnhiFOKkGiMSnBgSNKXf4jh8uF8Ja0OAejh5RXO6Y/5CZwL
         vfw44dNgKCVyu2hRWYd2BxMsQje+2qSCIlKFsHvkWi12XlmH77hpSIbshjzgVNarBbCo
         A2ButPQROKCi+lI2dbrRiPkFVuIah8252aWhiA8MCuCOWqpCuC1WJwZ73VbKDUSZemeR
         inuwh9NYMWTkao7+WEDc4fA63gH+OGHjJjahHrjGq3Z3JannqBlxVc9NhecfU1J5EqvM
         JKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779706328; x=1780311128;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2d3GApoepHVx+uh3La4WWn+PmYLbQZlFvom3bYXI8VQ=;
        b=gw88DcHQPkOhNvu84ojM5SdWr5YrsHc2iRnk/EmLqN0lX3/VEZ4r4oiT4363fyo9E5
         UfM7IuJ1pXsPLKaftWcnbpZ/UmvvWQgLg06L5sr6k3drZ/MS8lRy8AiqoZJPACR/cYF0
         3wMha88+sn/tLTd2GSO9lwNl25mO8+/utzvUF689P3/5lclmDNMEYFI4WaZ9uum3FX5C
         QHQwHxQAj5G2J7i2G6J/zKbXJ1yPBlFfjYUzswSg9XuwkkQ/BzkAZriYBgAi/eUZgHOL
         guJsafflE7njaN1ld3oqEaIm6lnz5SDno7M1UTeSehKGy16oCYiim4rBPQquHPVOxVTv
         fQHg==
X-Forwarded-Encrypted: i=1; AFNElJ91tGylRe+V+rKrzFp6borQ3h2XAOIf0WlKRMwn3fG45Qwa0x/wB6wTu4ExCwFC+crvx6z2AQXVXTB3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6fpxpVvHThN+y3ImNqs8MWmtNs/RuVjcFklhRgSm5yCfn/GGn
	aD6Kbkm99AKGXhI62GPjY1+x6qeHgXiHtVEw4OjPwUuuijWugxvu4Bxe
X-Gm-Gg: Acq92OEgM52bV+076cjLPveL3zTNQt1eFiExsrfCzxsCwqCnvv+DX6mpyZ29ES2rNUI
	t0cHEz0s9UAurfxjAGZYH7ROFxRwbL2IhpRjtnPMdyKSb2UEIGRtSt0g19Et1UT9ER0CIcysFYx
	Qqv5akg3gvsxIeA7kqdnKoTFVr/T3a53m9+6a+B5o4H3FX1dDZdPaMwdC5k/B3daxtCd1Z2ArnR
	7Se/vEJdNs+w6Jp2DlgRArY1Fub7/0h1ngZqpBgivilRXw7G90mk2MzUqY+B+09hF7WXDlZY6aC
	AsMETeJbH1QZAcxvHqWonHYXm7ignqBF9Al13hLllq7ZwkhSEw8wAMq6XmJEChEgrPUODk6Z/lE
	m0F4qrwThW3R6+C3R7Rb1cy4JrASd09/3sY4BaFXkgJIIJKvAlB99imaReDP/5R6iYpbZo2Cfvo
	hFnqewcu3P7LWF9lcJ8GXB3eYWUATCh+gK6H2olv+JaYdQgSGA+XehUMFuldw6RRhE66+6arlVj
	sn5SsdN4sYyOBpxsydbNS393WfrqBIbOstHzp3xtK1xL2Klz8Af
X-Received: by 2002:a17:90b:38cd:b0:369:2e00:1ff0 with SMTP id 98e67ed59e1d1-36a6749e96amr13533601a91.6.1779706327843;
        Mon, 25 May 2026 03:52:07 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:2011:e829:fadd:33b:8fc3:b2c8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a7265a001sm9302388a91.7.2026.05.25.03.52.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:52:07 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: jic23@kernel.org,
	ak@it-klinger.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andy@kernel.org,
	nuno.sa@analog.com,
	dlechner@baylibre.com
Subject: [PATCH v10 06/11] iio: adc: hx711: introduce hx711_chip_info structure
Date: Mon, 25 May 2026 16:21:22 +0530
Message-ID: <20260525105127.180156-7-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260525105127.180156-1-piyushpatle228@gmail.com>
References: <20260525105127.180156-1-piyushpatle228@gmail.com>
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

