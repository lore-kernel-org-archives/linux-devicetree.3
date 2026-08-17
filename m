Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE5F3AAF5B
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 10:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786961706; cv=none; b=jKTL0xVf3ZgVBA2BbLApUK5wDLQFqot3ZzAs2Li1ZQLqKz2ptC+fY3VP213ToXY2/YW4SfwBiD7evlVRG4Cuhno6KmAdiu4+MZWQJpGxrizBIdmz4tLMrFnylNJPIBiHoXAKnMq40Xsds2Iw/9Sqywt77XjlW6wyMximQ1Jt9YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786961706; c=relaxed/simple;
	bh=f5l2YBiHkReBw6mWMyjaq6Gvj9uLpAZQHQ7JL9lOPpM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IkTmPLrCgFeGVYqdIlCik+XxDzbZznsasR0plEArhqI5q/Ww75ICiqc6cNyWpLdriqhaOtjVwMQtkftfI+FE4WIWjtQhfwICcr/sq7w5ox0Es29gKHgHaN6amBky+BpH/13KuusUF7dDuE05f2Ea1iCGUqmIQKRFeQr/y9lBjW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Qxqtvd7r; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Qxqtvd7r"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-499840a2575so23909755e9.3
        for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 03:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786961703; x=1787566503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsOh5BrhIIUs/llyHwp9VM8wWS+EomkE8Zt9vFaD5xw=;
        b=Qxqtvd7rT81y/Y0ZH0wCx1SqG12II1z7nkNE5YwiVTFiutRPLCbVbNIFy+xfZKwhF0
         RUU/PivdVAvv60LgQdBI7pPuDJQTbIMyjoNoaTGpTMj7Qm/wColgA7UlO4DrFZE+5IeJ
         tFpmg75DCah+k9xhJG30AYANlAB3LlrqtFBPUHd8Y9psZx/9mdkF3UbFNB6Wxki4v4ya
         25jaWp6f+Bg4Nhqy1UFEW2iDkaXXOSHn1s3yxm8QbMgYUCehZ8ItY4ircR34Hs5X/Htp
         Eq09VrOuZOXVx6urMarjS6YlKQrE+Pq9Vliks3NJKaNprPIurc4FNyikYg/gGyDmuPkE
         3Xcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786961703; x=1787566503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NsOh5BrhIIUs/llyHwp9VM8wWS+EomkE8Zt9vFaD5xw=;
        b=DCM4ttkhRyqK8lntsLZZXo7VpePFpQ7EafHqouThamosy6OTp6X46n31eBLnfAnPLr
         uIiejODMinU1bR+qNf43xLVQy0JuYuroAi8xQSBdLWLp/5y2ZBO9qaCipk6rhFYXWZQc
         7i/86xcxs5d3GFnukrlbYm3pq5eSxuHY6u/pdZo+Wle2zAsq6S/2pHTIVORaB8gsASvW
         Vy6ehfibjprqjMPDbCXox9D5sCsV3/Y8thGaWFRlI02u8ao6P2oAWkeQ5J01NG1TTVvp
         6wP8zyUt68eXZlCuTDtjaINcDQxOypfEnCY94186vCImjzsAhYBkBNd2mOG4YAYMfUNe
         dauw==
X-Forwarded-Encrypted: i=1; AHgh+Rohj4SruweyHdS/ArZsNZS5MmXd7Si9TIHGV8LyxVsCoxm/rSPw8GeK3E2l8F8YSspYktvSmms2v62J@vger.kernel.org
X-Gm-Message-State: AOJu0YzCyMX1yOso6EJ1faY/kL4RYmyoQLFvP+GPB0LUlbPUKuijj70q
	+oPl2XoSwVW+SQK8C9+NReFlSemJ8u4HlosoapgfDN+9iMBSZrRn84PO31sQP25Fffo=
X-Gm-Gg: AR+sD13gWN1VaD2EoovBAfPXG8upaVCRxYwiSuTsN026dsD+LZ2xc+6StJtFgR8KnRW
	uUpTC5tb23n6fZ09I03+iCGnswv+dtD2pPFLt88YTAhRUlD3ee6B8jUPZFrTAs1VQFXq2wfsWTH
	OqroxKSostlqlMOmJzCbtStmAAbhUioHgraD4hBsJnYQo1Mz2zDV2tzTzmL89HX7GRoPnvkFTm6
	bHDkESX0Oa7EOMgAD54PG9P5ecxXcH4d2fdChWFgw8leUHyNktCFdNbLxFEe2HGD6yNavJjnot9
	9dy1I5PeoXh1KQhePoM90ietXJRgWcbKdixf7X/MW2dAogJdZo0y4Nb3eVOLxIcwuzbVxp2k5Se
	34ft8ifVjKx5sYet3xxyuMs4S6dfftRPJ1jKd7Z3jV1IUL0XuQWo6rMDLtuFHo6VttWeUnc5p7X
	5UzSzX8gHRJTczrIZFB4ht88levcmTjKc84/y/ai55qWgOCCdO4BTNYRailWFA92MRdRGEqnCOY
	bsPgwUZ2ffDDxyBzAjf0MCNUgJrJD0f6wPFL9fXKWNG9WNBgokXni0T5j323bs/GYkAtSuNuer8
	/Btva5l8achSVwpqK1oG7w9A5B15PK1IHocHEITt
X-Received: by 2002:a7b:c015:0:b0:499:80d0:8b73 with SMTP id 5b1f17b1804b1-49987927ebfmr303753805e9.4.1786961703220;
        Mon, 17 Aug 2026 03:15:03 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999d06167csm29542255e9.3.2026.08.17.03.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:15:02 -0700 (PDT)
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
Subject: [PATCH v7 1/3] hwmon: (pmbus/tps25990): Rework driver for multi-device support
Date: Mon, 17 Aug 2026 13:14:43 +0300
Message-ID: <20260817101455.3526260-2-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817101455.3526260-1-sbogdanov@baylibre.com>
References: <20260817101455.3526260-1-sbogdanov@baylibre.com>
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

