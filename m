Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD4A2EEE7C
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 01:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785203955; cv=none; b=qFyQM5r6qtlaeEMgISKGfJLZ/MX5glA0WPD0ZSHEuCcFifB+yb0Mcn8OD3aLrbQmOYuYTcRfyA9/ukmOLCvJi6K2rM0Q/Iuiwgupk8G/uHKxdZjz4iEIfumf9XpURZNx9Ozn7K5e/2SG4Wx+oKu0TGqr2aEuZdB8ojG7N+g+DAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785203955; c=relaxed/simple;
	bh=FEC0rKzwmLUQ/orvcXtfoZYdSjj9hpDU7A6Seo0HC48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=II8UeXNZJ2yWK3Ks7f6cpb9PJLRhy1+FjJjOf4QEQSFL/g4gQ1RF1m6mLgE1hqDHKmFM0J/a5Q7U49KGoQt62lpU4jsUv/qhsoQKKZhrm7xlQULKfqDym0TqISJQVaBR5soT0w5q0nci3Um9GLL3EOYmJqGhhnYFhUanT10eOS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QARdIHAz; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QARdIHAz"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47f9ab7ee38so1664064f8f.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785203948; x=1785808748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6rV6KeBm1ayj5wr3qIujHsDgsty2nYjcbwF0ZIeud6k=;
        b=QARdIHAzjEM4+0D5n3M/HgoWCgYoiT73MJ1FxxbI/RrFeIdVi+l/BkaZXXzO01m0Yo
         NjlEP/KD6ckyLTY7FlmuTvgiC1gG0/dd95nLxO+rdcPQaQfL6xMXv5p7YixBZjOzCk/L
         MrYreksCSLxOz6WwBkCKEiiNdkNyfxDUXjeuILHBVDt48X+iuHnc3x2yy3pqvlRElf2+
         wAsb66PhYiwFBnhJBm9sZ2zE6MSDUm5US/lsI6/WyCTsGklmxXWiVCtw2sRnZQNDuIRk
         cRqxQ+qDYwJNBr6ZaUOozD8/fRRthzsM0ojLMf2q/Wuah13kW4ncZDmjJHqcUsl7PtLh
         uDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785203948; x=1785808748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6rV6KeBm1ayj5wr3qIujHsDgsty2nYjcbwF0ZIeud6k=;
        b=cmZI7qpne8fE1oKPJSOuI6WydUTk757J6F52ocYCiV2ngya+89dZ6NnqUlInS886Hh
         a+7BgH4AR9KmQXl3fPO/Sm89Yq6bl8iUTCcMaoNHzjBgwhIaiCHq0AcZvy//V8Cls0Gi
         ym5SP4vBqO/54Fmf/C8fwoVtwr9A08ibVOfyTFXmnr7DeSJV4UemUybzN50k65TkSAwo
         sINP+glzEu2tU1XWnYjrwaj0JgzvCXJAZeB6j79O5R7GmewtqKS/3d2Y307zYqU/dtri
         rZazMz1V61AkjolFDnGTfkBKhpDThadY/L1g3xKFutIaoCmt2tXeV1/Z6D3RgzrIQayf
         P9sA==
X-Forwarded-Encrypted: i=1; AHgh+RquXXGHzCcm0DsOGe/Jbb2SYiz+72LDZvLD3ECeBj4u+A2otBX2B6nIkEyZ3EWv5QVBCC0s4x6c3dOM@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/l+qHpLOEdOoXqNJLD8ZU7NvF26WBT5XjT3rTQs7mt6CfzQ6o
	PHV1zVB74VpKLpIK+aX2rfihXmPIpLAUB5MDpO218p5BpaZBQs7zLqgrHdhDMkHDeJA=
X-Gm-Gg: AR+sD12P8lir/KBQvlujkLmBmuyCoyDoFQJvgogVzyXFBeGGmxCInZNYOAX0bTKHLsU
	mK65pGtPhz3PGChqIIo5pg3DjbPd/XfvE00bfcAujX8QVE6dwEYH73yMeGjuFq43kz4IrJkU0fB
	Q5FMLgqw0eMkfNzl48KlWGu5906wRRF3YsO/lvJzoTD0hm233E7DvZnrAxtuqAWMG/okc07rvbN
	MrvFSOOiKn1pk24YtsutbfvwwPf0jBoXhEmBIeWwPUnS3O/D9ReKrLYRGnqftr7lmkZzDXWNvqA
	+awxOfL7IKw9K9TaqrtfyaU8DjtiMfXNXtwjrOwor7ynRWqUR1X5OrKsKkyyhEo/c7uXRy15mfS
	xq6mwWGo5GqkgD9b3Jb21Y0ObKBqPwYQBXfYGlSzcqU/oIrIGdSn/Jnsb9p92qzv6PfNjiX1hZM
	tyuq0DCkpxAHJcYApnvyGYIykZ9xD1ywSKNH0w1LLKPTDTSknkCGz1lil4CJaEAHB50nv3jnMTO
	Ms5Erm7Fdpq7HN3w+nUY9mJmqWc86liOpzGlBoHl0FVJN8=
X-Received: by 2002:a05:6000:2c02:b0:47f:943a:a7f4 with SMTP id ffacd0b85a97d-47fb1f394f0mr277406f8f.61.1785203948210;
        Mon, 27 Jul 2026 18:59:08 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bdac28sm52380930f8f.16.2026.07.27.18.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 18:59:07 -0700 (PDT)
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
To: jbrunet@baylibre.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stoyan Bogdanov <sbogdanov@baylibre.com>
Subject: [PATCH v5 3/3] hwmon: (pmbus/tps25990): Add TPS1689 support
Date: Tue, 28 Jul 2026 04:58:48 +0300
Message-ID: <20260728015857.193890-4-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728015857.193890-1-sbogdanov@baylibre.com>
References: <20260728015857.193890-1-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the existing TPS25990 driver to support the TPS1689 eFuse,
as both devices share the same command interface and functionality.

Update the documentation to include TPS1689 support.

Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
---
 Documentation/hwmon/tps25990.rst | 15 +++--
 drivers/hwmon/pmbus/tps25990.c   | 98 ++++++++++++++++++++++++++------
 2 files changed, 92 insertions(+), 21 deletions(-)

diff --git a/Documentation/hwmon/tps25990.rst b/Documentation/hwmon/tps25990.rst
index 04faec780d26..e8bc9a550bda 100644
--- a/Documentation/hwmon/tps25990.rst
+++ b/Documentation/hwmon/tps25990.rst
@@ -9,26 +9,31 @@ Supported chips:
 
     Prefix: 'tps25990'
 
-  * Datasheet
+    Datasheet: Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps25990
 
-    Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps25990
+  * TI TPS1689
+
+    Prefix: 'tps1689'
+
+    Datasheet: Publicly available at Texas Instruments website: https://www.ti.com/lit/gpn/tps1689
 
 Author:
 
 	Jerome Brunet <jbrunet@baylibre.com>
+	Stoyan Bogdanov <sbogdanov@baylibre.com>
 
 Description
 -----------
 
-This driver implements support for TI TPS25990 eFuse.
+This driver implements support for TI TPS25990 and TI TPS1689 eFuse chips.
 This is an integrated, high-current circuit protection and power
 management device with PMBUS interface
 
-Device compliant with:
+Devices are compliant with:
 
 - PMBus rev 1.3 interface.
 
-Device supports direct format for reading input voltages,
+Devices supports direct format for reading input voltages,
 output voltage, input current, input power and temperature.
 
 Due to the specificities of the chip, all history reset attributes
diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25990.c
index 490dcd2a5fa5..7e2991a85da1 100644
--- a/drivers/hwmon/pmbus/tps25990.c
+++ b/drivers/hwmon/pmbus/tps25990.c
@@ -48,6 +48,7 @@
 					 PK_MIN_AVG_RST_MIN)
 
 enum chips {
+	tps1689,
 	tps25990,
 };
 
@@ -105,6 +106,8 @@ static int tps25990_mfr_write_protect_get(struct i2c_client *client)
 static int tps25990_read_word_data(struct i2c_client *client,
 				   int page, int phase, int reg)
 {
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct tps25990_data *data = container_of(info, struct tps25990_data, info);
 	int ret;
 
 	switch (reg) {
@@ -193,9 +196,11 @@ static int tps25990_read_word_data(struct i2c_client *client,
 		ret = pmbus_read_word_data(client, page, phase, reg);
 		if (ret < 0)
 			break;
-		ret = DIV_ROUND_CLOSEST(ret * TPS25990_VIN_OVF_NUM,
-					TPS25990_VIN_OVF_DIV);
-		ret += TPS25990_VIN_OVF_OFF;
+		if (data->chip_id == tps25990) {
+			ret = DIV_ROUND_CLOSEST(ret * TPS25990_VIN_OVF_NUM,
+						TPS25990_VIN_OVF_DIV);
+			ret += TPS25990_VIN_OVF_OFF;
+		}
 		break;
 
 	case PMBUS_IIN_OC_FAULT_LIMIT:
@@ -207,9 +212,11 @@ static int tps25990_read_word_data(struct i2c_client *client,
 		ret = pmbus_read_byte_data(client, page, TPS25990_VIREF);
 		if (ret < 0)
 			break;
-		ret = DIV_ROUND_CLOSEST(ret * TPS25990_IIN_OCF_NUM,
-					TPS25990_IIN_OCF_DIV);
-		ret += TPS25990_IIN_OCF_OFF;
+		if (data->chip_id == tps25990) {
+			ret = DIV_ROUND_CLOSEST(ret * TPS25990_IIN_OCF_NUM,
+						TPS25990_IIN_OCF_DIV);
+			ret += TPS25990_IIN_OCF_OFF;
+		}
 		break;
 
 	case PMBUS_VIRT_SAMPLES:
@@ -238,6 +245,8 @@ static int tps25990_read_word_data(struct i2c_client *client,
 static int tps25990_write_word_data(struct i2c_client *client,
 				    int page, int reg, u16 value)
 {
+	const struct pmbus_driver_info *info = pmbus_get_driver_info(client);
+	struct tps25990_data *data = container_of(info, struct tps25990_data, info);
 	int ret;
 
 	switch (reg) {
@@ -253,20 +262,23 @@ static int tps25990_write_word_data(struct i2c_client *client,
 		value = clamp_val(value, 0, 0xff);
 		ret = pmbus_write_word_data(client, page, reg, value);
 		break;
-
 	case PMBUS_VIN_OV_FAULT_LIMIT:
-		value -= TPS25990_VIN_OVF_OFF;
-		value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_VIN_OVF_DIV,
-					  TPS25990_VIN_OVF_NUM);
-		value = clamp_val(value, 0, 0xf);
+		if (data->chip_id == tps25990) {
+			value -= TPS25990_VIN_OVF_OFF;
+			value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_VIN_OVF_DIV,
+						  TPS25990_VIN_OVF_NUM);
+			value = clamp_val(value, 0, 0xf);
+		}
 		ret = pmbus_write_word_data(client, page, reg, value);
 		break;
 
 	case PMBUS_IIN_OC_FAULT_LIMIT:
-		value -= TPS25990_IIN_OCF_OFF;
-		value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_IIN_OCF_DIV,
-					  TPS25990_IIN_OCF_NUM);
-		value = clamp_val(value, 0, 0x3f);
+		if (data->chip_id == tps25990) {
+			value -= TPS25990_IIN_OCF_OFF;
+			value = DIV_ROUND_CLOSEST(((unsigned int)value) * TPS25990_IIN_OCF_DIV,
+						  TPS25990_IIN_OCF_NUM);
+			value = clamp_val(value, 0, 0x3f);
+		}
 		ret = pmbus_write_byte_data(client, page, TPS25990_VIREF, value);
 		break;
 
@@ -347,6 +359,59 @@ static const struct regulator_desc tps25990_reg_desc[] = {
 #endif
 
 static struct pmbus_driver_info tps25990_base_info[] = {
+	[tps1689] = {
+		.pages = 1,
+		.format[PSC_VOLTAGE_IN] = direct,
+		.m[PSC_VOLTAGE_IN] = 1166,
+		.b[PSC_VOLTAGE_IN] = 0,
+		.R[PSC_VOLTAGE_IN] = -2,
+		.format[PSC_VOLTAGE_OUT] = direct,
+		.m[PSC_VOLTAGE_OUT] = 1166,
+		.b[PSC_VOLTAGE_OUT] = 0,
+		.R[PSC_VOLTAGE_OUT] = -2,
+		.format[PSC_TEMPERATURE] = direct,
+		.m[PSC_TEMPERATURE] = 140,
+		.b[PSC_TEMPERATURE] = 32103,
+		.R[PSC_TEMPERATURE] = -2,
+		/*
+		 * Current and Power measurement depends on the ohm value
+		 * of Rimon. m is multiplied by 1000 below to have an integer
+		 * and -3 is added to R to compensate.
+		 */
+		.format[PSC_CURRENT_IN] = direct,
+		.m[PSC_CURRENT_IN] = 9548,
+		.b[PSC_CURRENT_IN] = 0,
+		.R[PSC_CURRENT_IN] = -6,
+		.format[PSC_CURRENT_OUT] = direct,
+		.m[PSC_CURRENT_OUT] = 24347,
+		.b[PSC_CURRENT_OUT] = 0,
+		.R[PSC_CURRENT_OUT] = -3,
+		.format[PSC_POWER] = direct,
+		.m[PSC_POWER] = 2775,
+		.b[PSC_POWER] = 0,
+		.R[PSC_POWER] = -4,
+		.func[0] = (PMBUS_HAVE_VIN |
+			    PMBUS_HAVE_VOUT |
+			    PMBUS_HAVE_VMON |
+			    PMBUS_HAVE_IIN |
+			    PMBUS_HAVE_PIN |
+			    PMBUS_HAVE_TEMP |
+			    PMBUS_HAVE_STATUS_VOUT |
+			    PMBUS_HAVE_STATUS_IOUT |
+			    PMBUS_HAVE_STATUS_INPUT |
+			    PMBUS_HAVE_STATUS_TEMP |
+			    PMBUS_HAVE_SAMPLES),
+
+		.read_word_data = tps25990_read_word_data,
+		.write_word_data = tps25990_write_word_data,
+		.read_byte_data = tps25990_read_byte_data,
+		.write_byte_data = tps25990_write_byte_data,
+
+#if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
+		.reg_desc = tps25990_reg_desc,
+		.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
+#endif
+		},
 	[tps25990] = {
 		.pages = 1,
 		.format[PSC_VOLTAGE_IN] = direct,
@@ -389,7 +454,6 @@ static struct pmbus_driver_info tps25990_base_info[] = {
 		.write_word_data = tps25990_write_word_data,
 		.read_byte_data = tps25990_read_byte_data,
 		.write_byte_data = tps25990_write_byte_data,
-
 #if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
 		.reg_desc = tps25990_reg_desc,
 		.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
@@ -398,12 +462,14 @@ static struct pmbus_driver_info tps25990_base_info[] = {
 };
 
 static const struct i2c_device_id tps25990_i2c_id[] = {
+	{ "tps1689", tps1689 },
 	{ "tps25990", tps25990 },
 	{}
 };
 MODULE_DEVICE_TABLE(i2c, tps25990_i2c_id);
 
 static const struct of_device_id tps25990_of_match[] = {
+	{ .compatible = "ti,tps1689", .data = (void *)tps1689 },
 	{ .compatible = "ti,tps25990", .data = (void *)tps25990 },
 	{}
 };
-- 
2.43.0

