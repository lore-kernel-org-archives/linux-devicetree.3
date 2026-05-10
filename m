Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD2B2D8DB0
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 19:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778442703; cv=none; b=Og3Zv8Ke/gOoC3QZyQWHhRmzGUPDHGZDNZGOwBEZ4GXIQaLaUSmDSM3REERf2udZYGzSPdHiC55U927pTADk90s6Ronr/mO7MZizRw+f3QKjUtVUGjUSOZZSPitZ3Ut/j3TMlcFpRX4yirV2Dc09/1pAUDeMzdsw7VM+D7qvQi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778442703; c=relaxed/simple;
	bh=RKcYTDaKrc2EbbrCjV+IAUASECpscP1hFKImsuDBjEc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fmI8RCXQIbteeIn41mixYQjfolzdZqVZ8rpnxMmWEp+uUcBTzEoQ4tlrtcNbjrzWgyPc8/IFIrioelvPjkmYQsahRJG//N8VzlOKFzqOqbSXnclSmb1GGKJ76xQSzhYC+qpZFBoVqM1+T6l0N7A7wu01K/X01RY8dVUrzXCBm7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIDjOwPz; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIDjOwPz"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c82471904fcso1474328a12.2
        for <devicetree@vger.kernel.org>; Sun, 10 May 2026 12:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778442702; x=1779047502; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEX4ePEk9PMDKzntsJeVXZmKgfsdGmW52YeAaYVtzew=;
        b=iIDjOwPzi6DIUCM23pSJ391a5DXkgCyqPPiGzVmKZL8LmjgMTrAOwd3zFXq15xiKBM
         G3Hk2mvXat3pnyDOK2yFnOUNlu/JsV/gvdQRc6h4dNnkrSwTlLF9TMSWRHOz5roMg+DQ
         TT2xlkHhwpquGzlANHLJLjGS6U5wzK+EPxkzS9xxPE9S2ncGGH0A/STnr9lbKnGJQFpC
         VoemMvEomq8NSdawV4NKuP1o4cy9ejLBrvRuVZViW8g/VuTPNxjJveTPopRdIeaIAphz
         908Dks97pIww4eYe48IF2/G4RLeHBXPQ2fzkBXkf5uapCEFquMgZp7O4hhJUeE2pzjCZ
         +LUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778442702; x=1779047502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uEX4ePEk9PMDKzntsJeVXZmKgfsdGmW52YeAaYVtzew=;
        b=bSp/ym/CURbK+EjoMDLT8KYUoquuLk2Ng1xso3y6RFJQkwrOsPH9MmyiMy216QU9a6
         jQ1ibzlIYWUbcXa7iiwi6sMzsIcQlVjisYgWypNvF/C2emp+C46plkym0A/e5ZhrSVpB
         R0yEboGTffFVQNpXG9272SrHYXyrk0KQujOe6KQZx5W89dYI5wCHfpp3srW1fF7c34Qa
         mT7MOdR5PMb/WgWH9EhYYLG335c1G4Y9PkrbbzHIpZgLVZlPnUM/VsH9JO8LTDoIZji9
         pTBQ3o4IqrIS1qR1Mhmp5sahjSo6uLNO7ehUmDs+zt5gvr+7TaZWOY1ZrxqRiJz2VGNr
         qPog==
X-Forwarded-Encrypted: i=1; AFNElJ9GEHjyzQFwb2wLOPtYV3wtdKcaLSMexOa54zcH4vbVz2m1PNtS1Mgympg5H0SHTOovfPhHBoPZlJAQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyH1XE1jQ+u7W7ovmxf0dknXudOgiYIRM9rNOcHFS2WYBB8sPLm
	4rmcD7c1JoCXWgkI2PULowo0aCgJZ9avD3DewBqMuXbeiNqg9fBheaBd
X-Gm-Gg: Acq92OE/Aioke0YEJDZa5Af4SilfEW5NOUVp0ouUkPyT2nAqVlZYoGbs2YxGHUw4RtW
	lJ2RTCGMlbxJkU+pXUzj2hmIiq2B2DhhXVD1u0IHPVBjU+3yyzNfPvnTN2RQ47JOnPuH+IRt+8C
	ySUHld7TGV3T6K0ceg9mYX+i25hQFGcgaWIx8BwmRf7m3ZBzDR7mwqHbm0EZPPLRBDPdKdZ4FKq
	3DD4qMIwX7sj0fIcVGPJm45f0OlaX2nkgTrWV3SKaEK9rOj8TLLoiInFdf+4vPiYS5sNPeR//Uu
	aqJv56ed787HffRU7SG6jUHSmHfH98Wp8Aa6X2o4VoqEggoUhwQ4pFRvoizpVLaU/xrjtcOPZny
	cNRzdVm2x4qTKfA9fO4VOVavaNI557zg4XhHBM6mxk2av6/eHkwWAoe2NYRe/V9Olmrq0gQxLgf
	rJvi6XnEKUja7yBdESCm0QDsZ06YxTW+FeuUZTJoM0028xrWRA9sogzsTDqFBqnD1sBl86PjNCG
	nkvGM1BISx7lMQQC6QSrLOSrQxFqcLnzIet4HW8IjFyYGiYiNk+jMu8utAk
X-Received: by 2002:a17:903:448d:b0:2ae:803e:6c12 with SMTP id d9443c01a7336-2ba79285d9fmr150394875ad.6.1778442701827;
        Sun, 10 May 2026 12:51:41 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.www.tendawifi.com ([14.139.108.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e358b2sm77065095ad.54.2026.05.10.12.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 12:51:41 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: ak@it-klinger.de,
	jic23@kernel.org
Cc: andriy.shevchenko@intel.com,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 06/11] iio: adc: hx711: introduce hx711_chip_info structure
Date: Mon, 11 May 2026 01:19:28 +0530
Message-ID: <20260510194947.31997-7-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260510194947.31997-1-piyushpatle228@gmail.com>
References: <20260510194947.31997-1-piyushpatle228@gmail.com>
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
index 01097e0fb848..331d47e1bbc4 100644
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

