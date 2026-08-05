Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3014D3F075D
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 09:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785920654; cv=none; b=JOkib1ibBkatJfsYFiGrrsul7vYBL1wx5pnXhwyCwJOr0kDZzbNzvZ/ty3OqAHyQk7xsvdXSTuQgVS9wHGhvQdbPMQpNVu1vQB79R0ZAIPOkHoGlRBaRz5MkJYElBrgtjxHW1gBuCd6sJvlbwmwyeLrqqehJfELwWL8RmXnJ02U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785920654; c=relaxed/simple;
	bh=f5l2YBiHkReBw6mWMyjaq6Gvj9uLpAZQHQ7JL9lOPpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HIQ2J7+OkCUtRdFtKRMpQHO4ZTmzNPAUjlENqCZmiuf+Ffr0F7zXENaOouo4sN6JR/AmJwI+bYfTVTuqL438mNOxIIdcy9q8H2y9VkRS9YTeCw8sMtfJZ4g28VpY8VeYN3lHSVaGHqQsgR+hdtP/176Vks58d1OiFTcVOCVvyj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ZxseBF7P; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ZxseBF7P"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-493b966dd74so4168315e9.3
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 02:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785920649; x=1786525449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsOh5BrhIIUs/llyHwp9VM8wWS+EomkE8Zt9vFaD5xw=;
        b=ZxseBF7PgYTecxQsK3HuLYWtyDyD2bHjpG7safwnSxdKzYfYpRqZaC4d55SWdNkFUH
         8zfbCUsuTXU+eB+AUZfFKHS1XD1t+EMAsmlNgliftHRfIWxXJ3IBXAgsNsuE1qUB3t65
         RTxtlmjioeZAOvU2TXvIa3/r6MKX/rBFThvux3JC4A9ZGDkzZCM3un/4YTU+a7IZI0CR
         /W9QA184NvHGvUbpyxwKH1uTo9U1mMNH86VVnzK28FVkNUQLLT4dG52/2i08tME2a8aT
         5z5SqtOL1ieOEBRhEo+Qkc7HXE5Pa3vh0rzdUR1qFSScqDe4TnbFwlCZh7Y3K2oRQkbu
         NbHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785920649; x=1786525449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NsOh5BrhIIUs/llyHwp9VM8wWS+EomkE8Zt9vFaD5xw=;
        b=Rq6hK5HW+XGevPiMPXlGdbRtIMkpu4Ul4F0rRtNb1s18G6LQtPKOOOnt6jq1Ne8Dnd
         C8gzkBYrQtdljW6T6YVftdurWltuALXDTxhi6sShJ6W/R5JUKTuJ1SJCWlM/UbI9hRUO
         NYM0M78ASbx8vrYQxWy5OLD5iNwuV3Bcn4n/zrr+2eaRIt12v2YAGRmdA4fDmTsJfGeL
         xyIvCFsriZ64hFTwP6IIKse26CTvMlsjWCkr3sVkEuSiP/ItCmYFlU/PbyWzW+67sto9
         IAg9c0WwMnL6if+9PC+EisrsQoZl7qqecRkptY2VLrGZAcUGUw120qinxyniixX5AKzr
         n7FQ==
X-Forwarded-Encrypted: i=1; AHgh+RrZGTasxf1npIjMKnr7GxDmYKQnCBGUlQUj/gvLljfi9M2mn8eTupkHeF2MHevUrHYSup89bZthCSbL@vger.kernel.org
X-Gm-Message-State: AOJu0YyE7rXHr8cVb0qyNli7/VZdl85Z+Uz55pPy/vdXkd7T1Zvgojrh
	yNOkYIiStNmVefiNKxO+kBxDCb2xRMPytkDNPCebMQW+IO5JPw2mt3NS6lG7dvs9Lp8=
X-Gm-Gg: AR+sD10k22EkOL5j+aE4KLZF1LdKASqXJzbFei9xXUZT4OkVGCSyALMeqlJQXL9HOVo
	Imm8KbOJudEMJXhKEPVpuzTySDwhrrPISGvJ7BYZZHAcREMQIsAlyaA8Xrf647xvm8CVPrdD4tp
	0uS0NBDLpKwYfU75W3TAaXx0UPZkgWKehzyiPdtjo0BJo5YG/snEZEOnyeUSK5SA7NvJ6LJJyE5
	KAJ0BPDxN7GsAcZe8ji7O+bsWIeh9blxs+6cSMTIoqacIsvb9A5hKAkNHtlS0aUKgAQ1IBVdGhx
	FCRbAVB+X6wWlI/s2XKijefjRDXsWi7UO0aT8+A4pNNxIc5ijOQq+vzHK7uK86kpMelLsoKpWIG
	VgCOO6bvzocElOP/piyjRutWnhxWUBE4i1dprh+nCt3y2bjDs2hahJ95eYz3pk+vg/9dTVOXTzZ
	A9UpWyziXWtcxDSrlfNPma71fJRHYa+7gd0KAebVH4J215+pFQfBKG+hNXstdYkpgq8WcCZV/n2
	DJeIl19gnN+eduY9BQ0hzQUVeOfz/tjQNvCBKmpyxCiJhC1K1ev/r06K0otp8okd6r5ZwA/Nk3D
	xLL2FLtVCDwmaWxrbgHdmoaS4p02ug==
X-Received: by 2002:a05:600c:4ba2:b0:493:b6ee:fcb7 with SMTP id 5b1f17b1804b1-4994e7d3434mr34191405e9.14.1785920648698;
        Wed, 05 Aug 2026 02:04:08 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e99319bsm34082105e9.3.2026.08.05.02.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 02:04:07 -0700 (PDT)
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
Subject: [PATCH v6 1/3] hwmon: (pmbus/tps25990): Rework driver for multi-device support
Date: Wed,  5 Aug 2026 12:03:55 +0300
Message-ID: <20260805090400.2059006-2-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805090400.2059006-1-sbogdanov@baylibre.com>
References: <20260805090400.2059006-1-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rework existing implementation to allow adding support for new
devices to the existing driver. chip_id is used to identify the
current device and differentiate logic where needed.

Changes include:
 - Add an enum listing supported chips
 - Add a structure to hold per-device m, b, R coefficients

Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
---
 drivers/hwmon/pmbus/tps25990.c | 123 +++++++++++++++++++--------------
 1 file changed, 70 insertions(+), 53 deletions(-)

diff --git a/drivers/hwmon/pmbus/tps25990.c b/drivers/hwmon/pmbus/tps25990.c
index 9d318e6509ab..7634ac743025 100644
--- a/drivers/hwmon/pmbus/tps25990.c
+++ b/drivers/hwmon/pmbus/tps25990.c
@@ -47,6 +47,15 @@
 					 PK_MIN_AVG_RST_AVG  | \
 					 PK_MIN_AVG_RST_MIN)
 
+enum chips {
+	tps25990,
+};
+
+struct tps25990_data {
+	struct pmbus_driver_info info;
+	enum chips chip_id;
+};
+
 /*
  * Arbitrary default Rimon value: 1kOhm
  * This correspond to an overcurrent limit of 55A, close to the specified limit
@@ -337,63 +346,65 @@ static const struct regulator_desc tps25990_reg_desc[] = {
 };
 #endif
 
-static const struct pmbus_driver_info tps25990_base_info = {
-	.pages = 1,
-	.format[PSC_VOLTAGE_IN] = direct,
-	.m[PSC_VOLTAGE_IN] = 5251,
-	.b[PSC_VOLTAGE_IN] = 0,
-	.R[PSC_VOLTAGE_IN] = -2,
-	.format[PSC_VOLTAGE_OUT] = direct,
-	.m[PSC_VOLTAGE_OUT] = 5251,
-	.b[PSC_VOLTAGE_OUT] = 0,
-	.R[PSC_VOLTAGE_OUT] = -2,
-	.format[PSC_TEMPERATURE] = direct,
-	.m[PSC_TEMPERATURE] = 140,
-	.b[PSC_TEMPERATURE] = 32100,
-	.R[PSC_TEMPERATURE] = -2,
-	/*
-	 * Current and Power measurement depends on the ohm value
-	 * of Rimon. m is multiplied by 1000 below to have an integer
-	 * and -3 is added to R to compensate.
-	 */
-	.format[PSC_CURRENT_IN] = direct,
-	.m[PSC_CURRENT_IN] = 9538,
-	.b[PSC_CURRENT_IN] = 0,
-	.R[PSC_CURRENT_IN] = -6,
-	.format[PSC_POWER] = direct,
-	.m[PSC_POWER] = 4901,
-	.b[PSC_POWER] = 0,
-	.R[PSC_POWER] = -7,
-	.func[0] = (PMBUS_HAVE_VIN |
-		    PMBUS_HAVE_VOUT |
-		    PMBUS_HAVE_VMON |
-		    PMBUS_HAVE_IIN |
-		    PMBUS_HAVE_PIN |
-		    PMBUS_HAVE_TEMP |
-		    PMBUS_HAVE_STATUS_VOUT |
-		    PMBUS_HAVE_STATUS_IOUT |
-		    PMBUS_HAVE_STATUS_INPUT |
-		    PMBUS_HAVE_STATUS_TEMP |
-		    PMBUS_HAVE_SAMPLES),
-	.read_word_data = tps25990_read_word_data,
-	.write_word_data = tps25990_write_word_data,
-	.read_byte_data = tps25990_read_byte_data,
-	.write_byte_data = tps25990_write_byte_data,
+static const struct pmbus_driver_info tps25990_base_info[] = {
+	[tps25990] = {
+		.pages = 1,
+		.format[PSC_VOLTAGE_IN] = direct,
+		.m[PSC_VOLTAGE_IN] = 5251,
+		.b[PSC_VOLTAGE_IN] = 0,
+		.R[PSC_VOLTAGE_IN] = -2,
+		.format[PSC_VOLTAGE_OUT] = direct,
+		.m[PSC_VOLTAGE_OUT] = 5251,
+		.b[PSC_VOLTAGE_OUT] = 0,
+		.R[PSC_VOLTAGE_OUT] = -2,
+		.format[PSC_TEMPERATURE] = direct,
+		.m[PSC_TEMPERATURE] = 140,
+		.b[PSC_TEMPERATURE] = 32100,
+		.R[PSC_TEMPERATURE] = -2,
+		/*
+		 * Current and Power measurement depends on the ohm value
+		 * of Rimon. m is multiplied by 1000 below to have an integer
+		 * and -3 is added to R to compensate.
+		 */
+		.format[PSC_CURRENT_IN] = direct,
+		.m[PSC_CURRENT_IN] = 9538,
+		.b[PSC_CURRENT_IN] = 0,
+		.R[PSC_CURRENT_IN] = -6,
+		.format[PSC_POWER] = direct,
+		.m[PSC_POWER] = 4901,
+		.b[PSC_POWER] = 0,
+		.R[PSC_POWER] = -7,
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
+		.read_word_data = tps25990_read_word_data,
+		.write_word_data = tps25990_write_word_data,
+		.read_byte_data = tps25990_read_byte_data,
+		.write_byte_data = tps25990_write_byte_data,
 
 #if IS_ENABLED(CONFIG_SENSORS_TPS25990_REGULATOR)
-	.reg_desc = tps25990_reg_desc,
-	.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
+		.reg_desc = tps25990_reg_desc,
+		.num_regulators = ARRAY_SIZE(tps25990_reg_desc),
 #endif
+	},
 };
 
 static const struct i2c_device_id tps25990_i2c_id[] = {
-	{ .name = "tps25990" },
-	{ }
+	{ .name = "tps25990", .driver_data = tps25990 },
+	{}
 };
 MODULE_DEVICE_TABLE(i2c, tps25990_i2c_id);
 
 static const struct of_device_id tps25990_of_match[] = {
-	{ .compatible = "ti,tps25990" },
+	{ .compatible = "ti,tps25990", .data = (void *)tps25990 },
 	{}
 };
 MODULE_DEVICE_TABLE(of, tps25990_of_match);
@@ -401,8 +412,9 @@ MODULE_DEVICE_TABLE(of, tps25990_of_match);
 static int tps25990_probe(struct i2c_client *client)
 {
 	struct device *dev = &client->dev;
-	struct pmbus_driver_info *info;
+	struct tps25990_data *data;
 	const char *propname;
+	enum chips chip_id;
 	u32 rimon;
 	int ret;
 
@@ -415,15 +427,20 @@ static int tps25990_probe(struct i2c_client *client)
 		rimon = TPS25990_DEFAULT_RIMON;
 	}
 
-	info = devm_kmemdup(dev, &tps25990_base_info, sizeof(*info), GFP_KERNEL);
-	if (!info)
+	chip_id = (enum chips)(unsigned long)i2c_get_match_data(client);
+
+	data = devm_kzalloc(dev, sizeof(struct tps25990_data), GFP_KERNEL);
+	if (!data)
 		return -ENOMEM;
 
+	data->info = tps25990_base_info[chip_id];
+	data->chip_id = chip_id;
+
 	/* Adapt the current and power scale for each instance */
-	tps25990_set_m(&info->m[PSC_CURRENT_IN], rimon);
-	tps25990_set_m(&info->m[PSC_POWER], rimon);
+	tps25990_set_m(&data->info.m[PSC_CURRENT_IN], rimon);
+	tps25990_set_m(&data->info.m[PSC_POWER], rimon);
 
-	return pmbus_do_probe(client, info);
+	return pmbus_do_probe(client, &data->info);
 }
 
 static struct i2c_driver tps25990_driver = {
-- 
2.43.0

