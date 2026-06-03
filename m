Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403B9477E53
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 18:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780512582; cv=none; b=kFkE+l6xt9ttQTyZrIDBXD4pQJMTnV0Erh9M7shsWLWHA6dVtQ6LSihwzLkajtyRmdQ2vFB5Jbg2M3Dw5tqQ9qBE/rUWqsBJ2S+EjYhf0xZFJZNOeQ5OAVyerxWAhB2iyItNljNfugO0b606fjV1vJh9mSXOBD5sfcrQo7Dolvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780512582; c=relaxed/simple;
	bh=GP/zXsIk7W/qQ+UNS2wJhazgPEjZIr5oEO/HNA2gsAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iLuLIlguPZ6mYQoyn4NrFXN59BDhmBZNAROnWq8UyQ7aNmh2Z2AR2g8OuaXtXn9f9OgbVZg/WmYc/HJi9DGRL/tVOvmZpaeKcrwfn+F22x/L+6UwAIepkxA1PDcWWezjo1U2GQUYjLA2FfX9O+MeI+RRB/WLgiS0E63TrF5WPVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=omYHZ2SM; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="omYHZ2SM"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c168baac83so5477455ad.2
        for <devicetree@vger.kernel.org>; Wed, 03 Jun 2026 11:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780512580; x=1781117380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2d3GApoepHVx+uh3La4WWn+PmYLbQZlFvom3bYXI8VQ=;
        b=omYHZ2SM0ACQiBUEAzyuKr44yVdvGKcTl848iXfq5dZvKywtqVHm43wdA6qwjWRDE3
         aTVb+w5bMg8UjaJ93wkwQ0tTXKOqzxcLNqDc3GBugBfMqBnLNtNRMcsUx4DUgAIRiu4F
         hTPWiW0PiSxaj4tB9hlSOJ9YhWu2f/QXc7wl+RR8vGCB5BzNN8fCE8ofmeh/fxItfkY1
         b+Wrt0WBkWfZNSlvZX4SfJTCgjU23rw5Kvaqttw4M2qtRB/i5vIk95Al6+NFJnjQoagr
         TaaBpwQKoZIbxWKbyh/Umfcx3cQI5kwexPktagUuS342MNyRM8VaHnY7hAXR2xeoMOOL
         PjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780512580; x=1781117380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2d3GApoepHVx+uh3La4WWn+PmYLbQZlFvom3bYXI8VQ=;
        b=D0A9CkiQ2I8ESCqDT7npEX14Lv2h26VHJaXDd+HeHocb3EYnZTz2CCKv+vV65RBkrF
         Nf2lciUWAltK4K00qv18a6548xXdeEjG2Pym/O5XhrUZKvgrT6gsYrhSRIZeNQ/HAb/P
         K/gxTxbexidGaqwltZhEMpvbA6+N+DbnSh20kpEotXeW/zPK2dIc8/LCqvMNAXr6J6Tp
         LCmdkOtxtg6A1DtqscsMNu+IzLogB2UjBcgtDoojX0/O79cCnxQsUTUtbSOBnfd4dvbk
         /HzEVgD4syRfNz4Xzx8wJnySX2Afl9W/5zR4NU2BKQAgXQDEqSYDvx7/QzYxGz+EEG3t
         4RLQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Jku6SkTas4oq9AsqUfc22E/W69k4SNpg9wl7aynN/7KCf/l4Ldytx4TtYFtAMaihdRznjoNCbuM+g@vger.kernel.org
X-Gm-Message-State: AOJu0YwqA3wsAxO0psPipXHUocUeeaPS6p+0CgSO6mdX4aNlknTKyoVg
	IpK3Cva9Ozt1SGmd4DtZaNUoRReI6F88XR4NpaB+bE4wob0std4ntji/
X-Gm-Gg: Acq92OEfi+yD1RDC/7mLn96Cygc8+plPbiJFrsYfAuUTJ+4stuZb89fSGdddBI17DAv
	aV3/LV82hG5H2BIY7qRCisPISvrhloy3FV8KBSr/O1Q1qACapUAMiBXcdFStoY+M0t50GrREN6l
	3tdZ7sLpmttqCUjbLaha3EgE9Md+ck8tTLdykg+TNQOM/iYHMhCPI3MzqixDn0YsG9mO9nwpxb3
	r7CmnYepYBlV6HC1YB4FQWBXTsQ5YxCsVIkv2gRw4LyLrFI/ORsU/IQlzziGcVBa/tC2MfCwUQS
	nlNrezBvQ4k142LjlQ09fXC23Q9ZfhwFx1DxvTO4N+leuf4GA63n3BXkeR5vBWQGIRgREfa9g/h
	3fwg6OuXGgle3IrrxzsIcwCPM+twjgcwbOi11bHOJZS+PhM05vln+neDv26TSjydDsJDmnPphCp
	ZhS+J60Le3fei6D8TkeGvPktPatbX6dpl4O7+tntnpeUnxWTZyDjM6gUJh9JH9jeb38hBgKX6eo
	wDdX3XAoeLu4WJSf+RvpuzcMip97U/4ORlPw6GAGsB2Z9UNOQrLsQ==
X-Received: by 2002:a17:903:acd:b0:2c0:ab82:6b99 with SMTP id d9443c01a7336-2c1644ec5cemr45165205ad.33.1780512580507;
        Wed, 03 Jun 2026 11:49:40 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2409:40c1:4015:6e6f:ee79:7998:9a6f:65e3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f6d59csm32139675ad.4.2026.06.03.11.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 11:49:40 -0700 (PDT)
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
Subject: [PATCH v11 06/11] iio: adc: hx711: introduce hx711_chip_info structure
Date: Thu,  4 Jun 2026 00:18:54 +0530
Message-ID: <20260603184859.89693-7-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260603184859.89693-1-piyushpatle228@gmail.com>
References: <20260603184859.89693-1-piyushpatle228@gmail.com>
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

