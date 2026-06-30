Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B106305E3B
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782828200; cv=none; b=DIXUJXbbsE4oBPaZRVIjuCfIlcwSM/F+1xL7slqjO5ajDpGqytMD81FTlD4Vdzb5aI6eGV7sGqFeAOVqZR2AzCuLsXKoNK0Lti02FtTgDJ/1UVFToU8rU5BXJ42pqVG5s92rtse+gP3NzoWYUSf2T86xeIIknAW9gXol/YbteA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782828200; c=relaxed/simple;
	bh=po3COWFszNAtHg/FiLPFwHJpIObgB+387d63dUpoWhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SJLCkHTJJ8/D8XjssCC+crNz5MY69tywFeot005sLH/X3Bm7M5g1G0HEjStVbAie4rz7iBlN4wcoHduc0Cbf17sDm+Jqb0CwT2AFFS0hkboLpzb6MRaQvRi25ZkooFj+euPOsGdcxbbsIzGETNG3ZPu1AB5a2Tx30vmLUEQ9rXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jk+DQqG8; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jk+DQqG8"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aea9d606f0so3879326e87.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782828197; x=1783432997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QxKEVibAuq5JcxKPpfH+trz2fBw+NxJxo/qyWOaaL7g=;
        b=jk+DQqG8dhqg4BCkgmrV8orljfDLGyY4nFqqS29GmEoHFV4tkLe8B7cc6Lu/vfw9KU
         ekB8UQkX09u+HnwUD6wrPjeGWpgQB/gzestamqiS5e9bfEvYQW1lQzUakX5EJWZAvA9x
         7tgFQAdhlrSlurGKnJ9gkrt5fZ+AGJPjivjIQB4srNz9N04/IJoTIe3WL6zFZlgpGDC9
         uXzEHlRAzvkfPXE1KojfukoWSBVX+RQX9h4BYXrIUpDmLqUJMhf6ALCBTS0blQs9Ev8r
         uicyWFqx6YzBQyQ5GGDw90Y/it8aC/FgrErF/Ft3sJEBGIL1qJL8ovORLMkftPmaAKBr
         m5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782828197; x=1783432997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QxKEVibAuq5JcxKPpfH+trz2fBw+NxJxo/qyWOaaL7g=;
        b=ELVpzndIO83QPuNY+hckV+UbLDnvV+QTMs48UsUMjcbtXWCoE50TF6ab/R50ZMXMHd
         ErNT6Wj9T5y+y8jFqqf6+tfT2vz+bfG5cXxdUnLoaKBpQ09PcSkA/lCsQXbz3ZeGzE2n
         5TpHIOkZoEIb1qeyhEsae6Oz3eJue1tYPGtcpPhTCXJEG6pbj8j4gsqwFN6XwRAHSlXW
         vAGY3TDv2VWkyRnNnkvNA2Ykl4/Vs6mXqlgOadA1t4iGGf5azjgHkH+FtwaRdJUBaZfe
         JWvoEn1zZNFre7eQLLuFmnsSOKaE2JUsX6iVSEtyjrLXC3bQ/UqpYtSQPnhFHIy6h4zV
         TL8w==
X-Forwarded-Encrypted: i=1; AHgh+RqFKA2gVkPWOxN5Xkzgix8wgABSDBWUdz7pL8IP+Uk7fj5HA77ScH0wgKosAuL44KJ54ZTbgAp6laqR@vger.kernel.org
X-Gm-Message-State: AOJu0YzDjLyBn9Ijz4oITigYyeE27hA/u6hYx7One6V3twMdeXlj9I7F
	470jGpWUPLriU/PZF2BaezuI9uck0yZkrZ1ARSkLokN15xtW85zXfpF9
X-Gm-Gg: AfdE7cmB/5cmdPyZ2HV13BQwTsQbd6ovczT6GKhhxNhN7nasatyjKwwfmeDKIGdO0/L
	L1PLhdtAKl01t2NTubxg94YkvqA3srkdk+oYDtZDeVG6o54b50KvQ9T+oXxY2tFc7celSU/JM/f
	BFyKrbRpojoayYEqx5snyLYXxLyvQ4DVZHmrzgcDLiJQlrcFWmt+esx4zYA2lnKJjTn/zi5Ftjg
	/XxqC8FyqfpiN/UVm2YafoMpz60XF7baGOGIyflUWHA6xwLe8enZvlJf3GiJxFEVSzgHU/n3mfW
	skdefwSwhQr1ugUMN06oxhGv2Qt1T3Vg7te2nWEAZVfWOflAm4XqtAKxxV8fBl7V6EiJWSWY+Bd
	EgUxiPABFoBKJXxxXXz7dSglvXzli2B3JrFOGAM1Q0TRD10b+2WF9IfwZ8tdIOxjgvDeL0Yss5T
	qJ1WgCJWpF55t67Am/4tuR0xj7xtwVVGoHQ6HTXEmc0mSQ8g==
X-Received: by 2002:a05:6512:8041:b0:5ae:bcd7:c87c with SMTP id 2adb3069b0e04-5aec10aba1amr195749e87.26.1782828196163;
        Tue, 30 Jun 2026 07:03:16 -0700 (PDT)
Received: from Shofiq.home (87-92-251-137.rev.dnainternet.fi. [87.92.251.137])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aebe4aa01fsm599564e87.75.2026.06.30.07.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:03:15 -0700 (PDT)
From: Md Shofiqul Islam <shofiqtest@gmail.com>
To: linux-iio@vger.kernel.org
Cc: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mike.looijmans@topic.nl,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Md Shofiqul Islam <shofiqtest@gmail.com>
Subject: [PATCH 2/2] iio: adc: ti-ads1298: add ADS1299 EEG ADC family support
Date: Tue, 30 Jun 2026 17:03:11 +0300
Message-ID: <20260630140311.1473031-2-shofiqtest@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260630140311.1473031-1-shofiqtest@gmail.com>
References: <20260630140311.1473031-1-shofiqtest@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADS1299, ADS1299-4 and ADS1299-6 are 8/4/6-channel, 24-bit
biopotential (EEG) ADCs from Texas Instruments.  They share the same
SPI interface, command set and register map as the ADS1298 ECG family,
making it straightforward to support them in this driver.

Key differences from the ADS1298:
- PGA gain range is 1/2/4/6/8/12/24 (vs 6/1/2/3/4/8/12 for ADS1298)
- Internal voltage reference is always 2.4V (no 4V option)
- Channel count is encoded differently in the ID register: bits [4:3]
  identify the ADS1299 family (both bits set), bits [1:0] encode the
  channel count as (bits + 2) * 2

Detect the chip family in ads1298_init() by checking bits [4:3] of
the ID register.  Store the result in the is_ads1299 flag and use it
to select the correct PGA table in ads1298_get_scale() and to skip
the 4V reference option in the CONFIG3 initialisation.

Signed-off-by: Md Shofiqul Islam <shofiqtest@gmail.com>
---
 drivers/iio/adc/ti-ads1298.c | 88 ++++++++++++++++++++++++++++--------
 1 file changed, 69 insertions(+), 19 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1298.c b/drivers/iio/adc/ti-ads1298.c
index 579200e06cbd..8c48a72e6c61 100644
--- a/drivers/iio/adc/ti-ads1298.c
+++ b/drivers/iio/adc/ti-ads1298.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
-/* TI ADS1298 chip family driver
+/* TI ADS1298/ADS1299 biopotential ADC driver
  * Copyright (C) 2023 - 2024 Topic Embedded Products
+ * Copyright (C) 2026 Md Shofiqul Islam <shofiqtest@gmail.com>
  */
 
 #include <linux/bitfield.h>
@@ -43,6 +44,20 @@
 #define ADS1298_MASK_ID_CHANNELS		GENMASK(2, 0)
 #define ADS1298_ID_FAMILY_ADS129X		0x90
 #define ADS1298_ID_FAMILY_ADS129XR		0xd0
+/*
+ * ADS1299 family is identified by bits [4:3] = 0b11.  Bits [7:5] encode
+ * the silicon revision and vary between production lots, so only bits [4:3]
+ * are checked for family identification.
+ */
+#define ADS1299_MASK_ID_FAMILY			GENMASK(4, 3)
+#define ADS1299_ID_FAMILY_EEG			GENMASK(4, 3)
+/*
+ * ADS1299 channel count is encoded in bits [1:0] of the ID register:
+ * 00 -> 4 channels (ADS1299-4)
+ * 01 -> 6 channels (ADS1299-6)
+ * 10 -> 8 channels (ADS1299)
+ */
+#define ADS1299_MASK_ID_CHANNELS		GENMASK(1, 0)
 
 #define ADS1298_REG_CONFIG1	0x01
 #define ADS1298_MASK_CONFIG1_HR			BIT(7)
@@ -101,6 +116,7 @@
 struct ads1298_private {
 	const struct ads1298_chip_info *chip_info;
 	struct spi_device *spi;
+	bool is_ads1299;
 	struct regulator *reg_avdd;
 	struct regulator *reg_vref;
 	struct clk *clk;
@@ -276,7 +292,10 @@ static int ads1298_set_samp_freq(struct ads1298_private *priv, int val)
 				  cfg);
 }
 
+/* ADS1298 PGA: register bits [6:4] -> gain (000=6, 001=1, 010=2, ...) */
 static const u8 ads1298_pga_settings[] = { 6, 1, 2, 3, 4, 8, 12 };
+/* ADS1299 PGA: register bits [6:4] -> gain (000=1, 001=2, 010=4, ...) */
+static const u8 ads1299_pga_settings[] = { 1, 2, 4, 6, 8, 12, 24 };
 
 static int ads1298_get_scale(struct ads1298_private *priv,
 			     int channel, int *val, int *val2)
@@ -291,12 +310,15 @@ static int ads1298_get_scale(struct ads1298_private *priv,
 			return ret;
 
 		*val = ret / MILLI; /* Convert to millivolts */
+	} else if (priv->is_ads1299) {
+		/* ADS1299 internal reference is always 2.4V */
+		*val = 2400;
 	} else {
 		ret = regmap_read(priv->regmap, ADS1298_REG_CONFIG3, &regval);
 		if (ret)
 			return ret;
 
-		/* Reference in millivolts */
+		/* ADS1298 reference in millivolts: 2.4V or 4V */
 		*val = regval & ADS1298_MASK_CONFIG3_VREF_4V ? 4000 : 2400;
 	}
 
@@ -304,7 +326,8 @@ static int ads1298_get_scale(struct ads1298_private *priv,
 	if (ret)
 		return ret;
 
-	gain = ads1298_pga_settings[FIELD_GET(ADS1298_MASK_CH_PGA, regval)];
+	gain = (priv->is_ads1299 ? ads1299_pga_settings : ads1298_pga_settings)
+		[FIELD_GET(ADS1298_MASK_CH_PGA, regval)];
 	*val /= gain; /* Full scale is VREF / gain */
 
 	*val2 = ADS1298_BITS_PER_SAMPLE - 1; /* Signed, hence the -1 */
@@ -600,20 +623,39 @@ static int ads1298_init(struct iio_dev *indio_dev)
 	if (ret)
 		return ret;
 
-	/* Fill in name and channel count based on what the chip told us */
-	indio_dev->num_channels = 4 + 2 * (val & ADS1298_MASK_ID_CHANNELS);
-	switch (val & ADS1298_MASK_ID_FAMILY) {
-	case ADS1298_ID_FAMILY_ADS129X:
-		suffix = "";
-		break;
-	case ADS1298_ID_FAMILY_ADS129XR:
-		suffix = "r";
-		break;
-	default:
-		return dev_err_probe(dev, -ENODEV, "Unknown ID: 0x%x\n", val);
+	/*
+	 * Detect chip family from the ID register.  The ADS1299 EEG family
+	 * is identified by bits [4:3] = 0b11; the ADS1298 ECG family uses
+	 * bits [7:3] for family identification.
+	 */
+	if (FIELD_GET(ADS1299_MASK_ID_FAMILY, val) == ADS1299_ID_FAMILY_EEG) {
+		/*
+		 * ADS1299 family: channel count from bits [1:0].
+		 * 00 -> 4ch, 01 -> 6ch, 10 -> 8ch.
+		 */
+		priv->is_ads1299 = true;
+		indio_dev->num_channels =
+			(FIELD_GET(ADS1299_MASK_ID_CHANNELS, val) + 2) * 2;
+		indio_dev->name = devm_kasprintf(dev, GFP_KERNEL, "ads1299%s",
+			indio_dev->num_channels == 4 ? "-4" :
+			indio_dev->num_channels == 6 ? "-6" : "");
+	} else {
+		/* ADS1298 family: channel count from bits [2:0], name from family */
+		indio_dev->num_channels = 4 + 2 * (val & ADS1298_MASK_ID_CHANNELS);
+		switch (val & ADS1298_MASK_ID_FAMILY) {
+		case ADS1298_ID_FAMILY_ADS129X:
+			suffix = "";
+			break;
+		case ADS1298_ID_FAMILY_ADS129XR:
+			suffix = "r";
+			break;
+		default:
+			return dev_err_probe(dev, -ENODEV,
+					     "Unknown ID: 0x%x\n", val);
+		}
+		indio_dev->name = devm_kasprintf(dev, GFP_KERNEL, "ads129%u%s",
+						 indio_dev->num_channels, suffix);
 	}
-	indio_dev->name = devm_kasprintf(dev, GFP_KERNEL, "ads129%u%s",
-					 indio_dev->num_channels, suffix);
 	if (!indio_dev->name)
 		return -ENOMEM;
 
@@ -621,8 +663,9 @@ static int ads1298_init(struct iio_dev *indio_dev)
 	if (!priv->reg_vref) {
 		/* Enable internal reference */
 		val |= ADS1298_MASK_CONFIG3_PWR_REFBUF;
-		/* Use 4V VREF when power supply is at least 4.4V */
-		if (regulator_get_voltage(priv->reg_avdd) >= 4400000)
+		/* ADS1298 only: use 4V VREF when supply is at least 4.4V */
+		if (!priv->is_ads1299 &&
+		    regulator_get_voltage(priv->reg_avdd) >= 4400000)
 			val |= ADS1298_MASK_CONFIG3_VREF_4V;
 	}
 	return regmap_write(priv->regmap, ADS1298_REG_CONFIG3, val);
@@ -739,12 +782,18 @@ static int ads1298_probe(struct spi_device *spi)
 
 static const struct spi_device_id ads1298_id[] = {
 	{ "ads1298" },
+	{ "ads1299" },
+	{ "ads1299-4" },
+	{ "ads1299-6" },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, ads1298_id);
 
 static const struct of_device_id ads1298_of_table[] = {
 	{ .compatible = "ti,ads1298" },
+	{ .compatible = "ti,ads1299" },
+	{ .compatible = "ti,ads1299-4" },
+	{ .compatible = "ti,ads1299-6" },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, ads1298_of_table);
@@ -760,5 +809,6 @@ static struct spi_driver ads1298_driver = {
 module_spi_driver(ads1298_driver);
 
 MODULE_AUTHOR("Mike Looijmans <mike.looijmans@topic.nl>");
-MODULE_DESCRIPTION("TI ADS1298 ADC");
+MODULE_AUTHOR("Md Shofiqul Islam <shofiqtest@gmail.com>");
+MODULE_DESCRIPTION("TI ADS1298/ADS1299 biopotential ADC");
 MODULE_LICENSE("GPL");
-- 
2.51.1

