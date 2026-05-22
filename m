Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F94D3A874F
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779438261; cv=none; b=Nr01GwRPHeQyKtN8MCsKmjnVvISypkftLRTf3yVqmsgoa4HAAW7DjxRMv6+33+Xuf7ph1xBMBJSci72KO7oWvjGFWPNiQlHmSj0cmOnIfXXai+bx0wOjL8WT6c2UoUk+CxlR1NUE1MiB8Bfoc+xrBLi5oGIo73kIYk6siiSlnP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779438261; c=relaxed/simple;
	bh=nvoZzgLKNXyyA9Qu+BYUaw0xIV5oHjJo4xG/UZBMSUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cPrFp66hlOmDrtlVQQ/FIavczFSCgu67skvAaz058BjHQhApHXG0dbLnvZkyOcBEIOBl6G7TPrzTmJgG0lsJmvyRijS5nHhJUgwvEBrG6tGoZvHyACjAzLArXE+tZiIkHi/15SmUPsT8htEHRWzABPIwLwc9r0q8ywcDJ2M+Tx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=AbxvUWpp; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="AbxvUWpp"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d75312379so5880801f8f.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 01:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779438258; x=1780043058; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajkpOnllBA6VWst7K0wBn9ryhYnCMIs37638sf6d/vg=;
        b=AbxvUWppdP5P0d+4gGDx0lziNxJqIJdIz+W8+57Xg5rkV7OPXse9lIJchlVwYttu42
         pruByG38vxeH6IbDfify+MvXDHvl8QeW0MOrkn9RT7KPLneBErQb6sZbwyrsac9IN3DA
         RJrmOuuKYpZE45/x3jNPmoZIZNdIqiL53m3Eb/pKq3M5CPee2yQvnZvov4gaH8O2wcbN
         J8WE4Gg7lOsf5fayKWjpfdgHYODbvPfnCCN0Q/H822MhytKa/hg02pfFNrLpKHqfdIh5
         r0WlIInBemjeGQhJjndPNk1hD2x9wx+owcHtkuWRlZw/vRnjG6MYHEQdEjU0uQECHebW
         mBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779438258; x=1780043058;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ajkpOnllBA6VWst7K0wBn9ryhYnCMIs37638sf6d/vg=;
        b=P/9eYYriaikOjDWQJQ8nh8xqJrkgcrF3sR/u4UxZeRxquS+qmFSgwT5LY1PT5tqalp
         kn6u8Z+BSG6egpED9wVjUsCL3inIG69VD5pxJ4Z0KT0t13RZSEkT6gGa2h+1bNjaM7Mm
         fWa7N2aHW1mcuM4zC7P0QjsfjkTebv3mqzpx6Wq8psulO2LKUaKj9l+eJHFoGMTUr6X+
         RpiWvB0NeLUOaA9Szpvi6oP97qC7IKfEru54JmlWHU5vgQtrYk7xSugyPlE+KqEwtLBD
         a+2C6vi2m1Ciz9XSgJut2ib9U0NQLwS3/a2fRsRAV+6eLdUoiT0AG4p2COKy8wo3L2er
         D2YQ==
X-Forwarded-Encrypted: i=1; AFNElJ8aTMseo9nN0ZH8KvDIR4UE/9wkR9rIreMU6y4T8D9k6zKbWV3ujGUAPosGECTko/jnIbqrUpG2OWv+@vger.kernel.org
X-Gm-Message-State: AOJu0Yww2YzuMsjO/BG4euGBCgEqXU3wpONVcjnPtCcAXdK9Fz10DQRr
	V6pILLx5TalykH15cyY22qJNqKLtnZ4ngG6yiY/oS8RyR8xCabVMlBVcuj6kGFOOdVM=
X-Gm-Gg: Acq92OEERL56WSM17k6P6NoDUMAMRRdILmgYPne2VMRB8pHNcD+zBCKTAWCSjZcYvTq
	m+MZFiQDV8rmY7+tB2zELjh6w9XPKuCOXVP1hLMGr89jusI5Jv9OsHZ5Rj3Gz0OQarne13BlCXS
	YITpwguDKFIrjhTXVzp6aPUfHk2QVbfm8AuUH8Q2g9YyZkfjYPuGnPNcWtpxPO6OSHlIZT9WSgq
	kMuVh/alKz8iw6PKgjyb0hFsrA2BAhCV1WxcIrt192Eut8iYG5sEcoZu98L231/wFGWtDqTsJnK
	3vYPnn7HgkFjVDmdFw7QAJ0x2Ho5psMMqW7DnG941TvWZUMhyA03EB6/5sxF6+vtljr1aIXcUc5
	/xEPON1AwMmxg39WHQcBwnqmk6x7fLI5C6DRoxxwv7crJDgjLSkktT6EpTUsgMijKLERdScF2cI
	EH8jkaEp7Pdi+HXcNiCg/mQddFYXiZtvO8wfdUj8hxgCEGEgSTrXlL5aRkAcyVyZXV2529OmiOl
	lU8OYLKqv3ol1ZcTPHUwA==
X-Received: by 2002:a05:6000:1889:b0:45e:8edc:dacc with SMTP id ffacd0b85a97d-45ea31ce398mr10002323f8f.27.1779438257542;
        Fri, 22 May 2026 01:24:17 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f58dsm2398471f8f.5.2026.05.22.01.24.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 01:24:17 -0700 (PDT)
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
Subject: [PATCH v4 4/4] hwmon: (pmbus/tps25990): Add TPS1689 support
Date: Fri, 22 May 2026 11:23:39 +0300
Message-ID: <20260522082349.2749970-5-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522082349.2749970-1-sbogdanov@baylibre.com>
References: <20260522082349.2749970-1-sbogdanov@baylibre.com>
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
 Documentation/hwmon/tps25990.rst | 15 +++++---
 drivers/hwmon/pmbus/tps25990.c   | 66 +++++++++++++++++++++++++++++++-
 2 files changed, 74 insertions(+), 7 deletions(-)

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
index 1e252844217b..720e134f1892 100644
--- a/drivers/hwmon/pmbus/tps25990.c
+++ b/drivers/hwmon/pmbus/tps25990.c
@@ -42,6 +42,7 @@
 					 PK_MIN_AVG_RST_MIN)
 
 enum chips {
+	tps1689,
 	tps25990,
 };
 
@@ -286,7 +287,6 @@ static int tps25990_write_word_data(struct i2c_client *client,
 		value = clamp_val(value, 0, 0xff);
 		ret = pmbus_write_word_data(client, page, reg, value);
 		break;
-
 	case PMBUS_VIN_OV_FAULT_LIMIT:
 		value = tps25990_data2reg_direct(client, TPS25990_VIN_OVF, value);
 		value = clamp_val(value, 0, 0xf);
@@ -376,6 +376,14 @@ static const struct regulator_desc tps25990_reg_desc[] = {
 #endif
 
 static struct tps25990_local_direct_value tps25990_local_info[] = {
+	[tps1689] = {
+		.m[TPS25990_VIN_OVF] = 3984,
+		.b[TPS25990_VIN_OVF] = -63750,
+		.R[TPS25990_VIN_OVF] = -3,
+		.m[TPS25990_IIN_OCF] = 7111,
+		.b[TPS25990_IIN_OCF] = -2133,
+		.R[TPS25990_IIN_OCF] = -2,
+	},
 	[tps25990] = {
 		.m[TPS25990_VIN_OVF] = 10163,
 		.b[TPS25990_VIN_OVF] = -30081,
@@ -387,6 +395,59 @@ static struct tps25990_local_direct_value tps25990_local_info[] = {
 };
 
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
@@ -429,7 +490,6 @@ static struct pmbus_driver_info tps25990_base_info[] = {
 		.write_word_data = tps25990_write_word_data,
 		.read_byte_data = tps25990_read_byte_data,
 		.write_byte_data = tps25990_write_byte_data,
-
 #if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
 		.reg_desc = tps25990_reg_desc,
 		.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
@@ -438,12 +498,14 @@ static struct pmbus_driver_info tps25990_base_info[] = {
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

