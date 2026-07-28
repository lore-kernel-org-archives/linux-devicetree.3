Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D666E2E7631
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 01:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785203949; cv=none; b=XbgeksKQEM4ihq92yE2Bo2ul/+nIQJYORTEK3vnJKMvfDkGjHKr7yn+l3S+6kubJwC4eiyJ8Oi3wNxGi1WXzQzisxvvp1ceEWMbP7SUMneIXuL0HNuWrfG09Ax+f9THnk845A5LntOjKoX9QLkmIS6KiGReWr3yVzMvxWJGDJqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785203949; c=relaxed/simple;
	bh=WLubSJnK1lH3E3SqhojYZmqtUZ/AuVEmxpP5LIx1NI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ORuusne/N5E16JRF354aJBsnNrlYiiRlnUW58KFt6PzS7grwLPhQhuuuVD9BMxJW1cMyCLFlTHJFj0adl4ybmBb88uEch9NjA7w5JA8M7n5FKqMguKv6mk8qbLRxiNny9w8hec+qCv6LhkO3w+MPEWTihmt5zMLhxOdMcw1A6DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=SUUMFRKV; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="SUUMFRKV"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-472326ca506so2225407f8f.2
        for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785203944; x=1785808744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9BXefn9YkCGaSly50U2hcwiUfqXNtCoLrI+IDcpsBXc=;
        b=SUUMFRKVp4i2mmpafD+4eIG2K98tiTFtUkk0xL2HfbkBolTJMnmNBLHefQ3jm6V1bS
         sriJXRPYYbcmGDo3LLm5E125rpipcI/pIL7eCc4V5+IC8wSj6vtn7yvGbYK6BbZ0a6cx
         YKhL5ddKHOeKRjhdsCIRqOd972ZiG0sKprU+kchSwsmw9mdxTSj0URmSsFd9uZRwAv1U
         2mb4lD0Pyy1y9tciZbRkjH82JXQ0GyDM+Z5MoFovkIpBBJ7ZDx2qxImAddPmSCoxlHTX
         PMm3U6ykK89Ln/XxFSSOipQdT3PCRgPNKStiCRvF92IqQgrDznuEsYOV1F7MCwz2pnJp
         Iqjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785203944; x=1785808744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9BXefn9YkCGaSly50U2hcwiUfqXNtCoLrI+IDcpsBXc=;
        b=SN5B3NGmCpO7FRGm+NqtAXVJB18pHLW9gAbdcgnvjnG5fhqOmScUX4EoWthb2Z1MvV
         yXT3ojoyr9ahmJ23GubkBCQw6WKydG8Ub42GAThZG6KGm+OPQ5gho4/PnE7UchtOpkG9
         v4B5Hi0lpTKgNAwE81fWtMrWUNLW5bexJ/tQC5d28Ge1meh5PYqN4nhoBIoSCA5S8xxa
         avYcTXIunjc3IdBDqw9ZrsZQZmFsGRRdneZi/l4H1SobTr09c6bnBWKL9OheV88rrK+a
         XalHwe5C+fYYnekeK1ue6L59Z3Z2q5SmTXJGvZfOa++q0cVWMW0syZzH0Cv2n3K0wNNr
         jLmA==
X-Forwarded-Encrypted: i=1; AHgh+RooBj7/0f3pT5VoCTTpu6M4TGbKKUoas7pjco6b8joufxuHG4PMvAOtRPmkMYH6L5di5H4QxglXFplw@vger.kernel.org
X-Gm-Message-State: AOJu0YzNm7S1tUyCRANuAwZfI8l+uavbk9Bt82joPdQmDGcQeao+MkKR
	XrOvT2Md2uL5OzsnpDgbBDGArxjbEQNW65yXxagn9+id1V7cIsU/eULVeblwByi07D0=
X-Gm-Gg: AR+sD12Du37jv53TgvnY9husJ2k+XhbRFd/2DTtX7FJbybdrnUQ/7XjF2F9DcYe+kxr
	FnhIbEp2ZKssXMNLdk5BXlBwllCNxjAeX8DsVNmg9goIHB8LZpZToUTUJrZ0UvvbxUCF1WkOcnb
	/eI1r7xTxia8wmq1MTLvbsXZ5lzxS1AhHXqmZSNHxYxGN3s9DQGRsUhju1dKuWgNPdDGnHfeGl4
	6h7tWy5nYj2lWZC26jBvAwZckKCAi82QxqiGrAtIdNKEIL3HoylhelHryL7Ln7vrtLwDcM9/ZHP
	8nUogz4TxNJR7qnsMK7tiXuV9nnIAItYF00gruwHr9bp+yNGNm3A4zPhsWIMQ8mPzcX3HBW2D3f
	PnRbfNL3s4wPGqMcQ1UzGxe9zWTiYA/9KLyUrFIrI+e1q8nPjqEMwitNwIi0b0FtRpwtLCOxprJ
	LSTGl98NQMrnZYsoLMvzcowzi+9VoPb+7H/Ya3L2iDoGc4blz4LiRgx8HVxI+xVZ889q408ecyo
	4d+2hQzLGEcBZDicwXHSQjXjsM7BX8dx7Kxi+gXiWiZNFw=
X-Received: by 2002:a05:6000:2011:b0:47f:962a:9f4d with SMTP id ffacd0b85a97d-47fb1ed97bdmr338114f8f.15.1785203943778;
        Mon, 27 Jul 2026 18:59:03 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85bdac28sm52380930f8f.16.2026.07.27.18.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 18:59:03 -0700 (PDT)
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
Subject: [PATCH v5 1/3] hwmon: (pmbus/tps25990): Rework driver for multi-device support
Date: Tue, 28 Jul 2026 04:58:46 +0300
Message-ID: <20260728015857.193890-2-sbogdanov@baylibre.com>
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
index 9d318e6509ab..490dcd2a5fa5 100644
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
+static struct pmbus_driver_info tps25990_base_info[] = {
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
+	{ "tps25990", tps25990 },
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

