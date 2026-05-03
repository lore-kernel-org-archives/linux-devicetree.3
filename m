Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9DE40DFA3
	for <devicetree@vger.kernel.org>; Sun,  3 May 2026 12:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777810239; cv=none; b=U8WghcEI+Dm0R0ByJfuFYcOqdCgDrZMZeS7smU+/aJlaSJ2vBH2LwfZuCAImQPUIk3HYm8N/CVVMehdg8fhf+KiiqRu5m3CIrJ+qagT9c0+FtMnSD4GIgfqgwEeJwYIm6mZwAK8GWx6Uqp4uAUNepFbGo7r+8QmLjyfj5G2GQEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777810239; c=relaxed/simple;
	bh=P64uRrZ7ZmO3sOlQxIgx97yRzn4q043tWEzhnD3RF+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sMoq6q27kgh1TGeGlcD82/x09DSwzdsIbj8uS8JbQjGMnK2etm1KBtbKFiIarEtppxI+MwuHp1MPcREhr1y5dadK0NvM2CQAIb4dE/ji0M7WmJuLhEI8+g9xBxlGrtlfDwDRESoBxRYmSRgYQPQwguCZ3hJxDlFSqKm8mVAOp84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LskTw1vr; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LskTw1vr"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-82f8b60e485so1512294b3a.0
        for <devicetree@vger.kernel.org>; Sun, 03 May 2026 05:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777810238; x=1778415038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RMaRNLqWzuSGKC5pBOc/ZA5KEyrFd0iuihOG00TOr+w=;
        b=LskTw1vrJIgEW9aVD92gG0C41aTxoX6P6SD8Fonoua7nig/yKQ60KjE0Qokk3SFCiZ
         n4xncuFjdkvopiSaN5rO+xQH1VtnObsczTOKBobXvCBnNppiZhMVJf/sRVsK9vuPCblV
         hIuQiJOLXsqxXUKNpCrbtiNSGtCnTLhp1MJUZtc1jEQlEGrZ7gYDSOzGBqAk+DMt2jlJ
         xnfvR6T4MWBVfAu39WTaquuQh4UU0d1JaTnN1JhT5peArDHcawCHiIP/+9R08sD+KDNb
         ZJvZl8AU72VLtkT9u7YJ6l/Wa+FyweFaDI8GkRc2xIAZTFcX4yaiFMWbVQTo1mSD+egf
         cbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777810238; x=1778415038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RMaRNLqWzuSGKC5pBOc/ZA5KEyrFd0iuihOG00TOr+w=;
        b=qsHS0XBV05nPZdNNAvw55EMq4JAezjc9qqjtrATHGZjj1DtiP5azAlvGtpFhDb7qda
         4+dvHDIy+GFjftuzg50DKruln49nA93XMdWvChq7XMwD1MR8RYxPWjMTjxauYdR5nwsa
         24WNWS+3hGfzUlJIXX2su95CwxznSda6Ttk3RkG10499qptNap0ha9RqclavnNATXYxp
         OPnfEDV6lOp/HOuoDp0+zCrA3r/aG1YYXx8G5wO+vPHZw0OIOmbDd4cBvIiWwcQggXET
         2k4iT6I1b4W2m3ZsB+Q7HV4+9Wiz6jtRN2rFrVFMiZ2M9q/B0CBpZPlg8QpB0HIGJp+y
         6uCg==
X-Forwarded-Encrypted: i=1; AFNElJ+CEy4H3dDRVtbrvKjanfevUWwJVvkSdW0Yp9Oz1M9IfJpzy/hJINcDJJFZB7ouD/6pjdo7A04SQOIm@vger.kernel.org
X-Gm-Message-State: AOJu0YycoeDbknAOpCV7PsDpWtts0UCTHMILPd7cSrYDaGOn9+VI3KaR
	wh//cSjL4EVbR3GPTIX6AOCWXNYafss3C10T+pBvY0TxBi+0JyfIzR/4
X-Gm-Gg: AeBDietvXWc5gp3jYLqK785Sr1j4he/1ZSond0ZTss7W8/ImDwx8o61Zvs+/GOprxzF
	ijwyZDs9lqifOA4SQUPS2yRIt+tiQwW4Kr4Npow47lHyLtqCzgLmnEgV3K42sGNvyr0PyOMHhsY
	LIWJqhpdFLRJhJE8cBFeA23LX/62XDcxiuYT72nc7QuI/RFrAYUlRf6nGOdtjWoIiL7LYy2c0cl
	zWrZ/eB7KOdZOZ5PIQxodakgd0klGIhruHLGKMapKV4xdZcGcId+Bei9zEdUT64gl9lZObT1NXY
	RwP/n2kk7lqVj5oM5IAeyOyhGNOO7CHsKRVfRuKh/znegaaC7jyR38HPzHNwJZ/v3NEtpYhmUay
	IG6GLlhHPnFSkfPP5z4pCFkfe8v3Y2SVw6OtgpkUxWEDQAbFpTkK8I5VWftIRSWvds5rgMB2Pyh
	HIOLWeU3PWZb2mpof5jgegGfDZMbcDcwMoun/to7xcqEj9F9tgNhQaUQdaVjY6jBuUBx8D46E+k
	Yi7KevNCPsvkB2t2bua++u8IpiaJfSnES4afc6w65st0uIjcuETX50xrGskwO2Drs5LSCs=
X-Received: by 2002:aa7:8f91:0:b0:835:3949:3c29 with SMTP id d2e1a72fcca58-83539494429mr2685123b3a.23.1777810238087;
        Sun, 03 May 2026 05:10:38 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8357c4f4530sm1474364b3a.9.2026.05.03.05.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 05:10:36 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Andreas Klinger <ak@it-klinger.de>,
	Jonathan Cameron <jic23@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 06/11] iio: adc: hx711: introduce hx711_chip_info structure
Date: Sun,  3 May 2026 17:39:35 +0530
Message-ID: <20260503120949.80292-7-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260503120949.80292-1-piyushpatle228@gmail.com>
References: <20260503120949.80292-1-piyushpatle228@gmail.com>
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
---
 drivers/iio/adc/hx711.c | 41 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 36 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
index 8485e18c949d..534b73fcaab8 100644
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
+ * @iio_info: IIO info ops for this variant
+ * @num_channels: number of entries in @channels
+ */
+struct hx711_chip_info {
+	const char			*name;
+	const struct iio_chan_spec	*channels;
+	const struct iio_info		*iio_info;
+	unsigned int			num_channels;
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

