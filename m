Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFF035E95E
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 19:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782675846; cv=none; b=DAg8hXRKYqZ7C74qSmAxntBylNd7hinLvGlQ5MX5hRD9InaciGuXKi1wo9587wZcniQdwPxRFYHTEyweWX3NpMF1N3IQaxaWawLKegRw8LotPmANVdLGEe07af7EWMoOz9+nnmRjXL6GnF62hSaUQTwfnysdBmhWwbauWRSC9ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782675846; c=relaxed/simple;
	bh=BekuQp34RPIEDTAN/hGuucJcNNL6f9HKPvtZ1H3dt6c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hhxl0DkFBrxML2UAJFumghxdm/VPM5ybfTelQ3TZ2sJqZ8mknz3agFmyoD7YAVT3glcKeKUWftvTB/jYDmGljHWMcRb6UMUsEnltVjnPpSSeXm3vG8JQvgse/6TmTFHUI7XDlPgRwecfc1W/HtD7Tq/ScVegh8/X2Blbi+BLHoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYDbCgbs; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYDbCgbs"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso804864e87.2
        for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 12:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782675843; x=1783280643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hljajWSuSUCzzxGGPxmcsygBvc1QWTNgEXZ+3gqfdFU=;
        b=YYDbCgbs3CE+1NrgfXaEsu97qWjOaY57e2jMMWhsjFrfKqEhknUQHAeK4fwUXhWQx6
         8RlyZ4KpM50Dqd1/wYwJ5I/o0QfyjiuQBZSUbSBK9vEi9NnXHqcYZrC2n+aMLERSssnE
         VSpM0Fvu/nox+5qD7M/Hm3Wk0hkO95ho5PjHDdbZpFS9Rr7m/pfx+qAGsp+e3pW/de1t
         b0t6P9zA4PTI4fsF+zHNNlr+QBA57cxGhHqId9aUOPlGRSMoo/abng/hdbaq7nKJ+rS8
         PwVL1Ohgk08WTHpPKeF/SF/kDQDNUAVo0O87G16NyROo1NetDCYCRxgX4VX9EK+vDoi0
         sfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782675843; x=1783280643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hljajWSuSUCzzxGGPxmcsygBvc1QWTNgEXZ+3gqfdFU=;
        b=qsMWMgTIEQ1dTxUzgXg+BFR1Wlk4lgmGR8ou+V9PNVgYODHxT6DS3mKdsR140Gmw0e
         91KAwnw7qxmdXTt61XX/4eUPjNhc36FqO7XZywgSp00POd2rrpEdtSbdmgKCXWBd4RLM
         P7o8LUCvup6OsUB+FdGunRlx+G0w40UJUq1Qo9dbMLEPtej56WnSJxIwXMZ1w4slwb1F
         i4bE/EBXA8BlrbBai142LHI+WJ1dwyA1Fw9r2XkX+toUYmUwoa8KzIRxJQtdfzy+5qr/
         mkIhIYDwOY1fbs3NIzDOrceyfY8pf2xn2uQUBdX32aHuml3bSpcsk8CIlc83s+yHPCpF
         2zfA==
X-Forwarded-Encrypted: i=1; AHgh+RpnDG1CJyCb4fGaPVq8N0mgQKaH1UH4A/ajVEakIvWHWLQufOe8Y/QB557E+Ifx5hztEW52cUNBAzao@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4MUWTdXqKX6TLb4lB9oU4q5MrsBDA99fGMxgSitd8qHArpcKN
	lLL7+ytcjzRZFA/eWIg3WffjgGEaj9eQt5DaiCdc7Xn2QhwVvOgeF3lw
X-Gm-Gg: AfdE7ckv7S3xLrL1om6fU1txvmIEGgeS2aKG2E1Iyh6emeTkKl7gzRXLvZIdaN0o+YA
	maznrXyrfh+tzVStbNQHtLgEThNdRPVw1+88j0CyiF6CwZmTigfYF6gV5pGIpKx07Ky3e9TUhAI
	K/kAOpxIsJYykiiwKt/tuNsBE8snKEW+wPYu8h/R0WTnb0lLcKvNxas2ilW5sMUkWrn4OcGcBTk
	40zMJH+6RSQ0IeVZvNCfq66/ZcJmN1tctspUHFaHo9F2kvptAaAA2J332+7b3HnHsGHh1ZjOR8Z
	f5yJvqbkI2WY4hmU2obkDo7nJFc0Qz/+LX3JKi3Mk3A1vlOvo7NQMGLsF4S3Q7MSIQFpuxAjx2N
	lL17jsktCiDBqaJgf4O8EllAJP9VmBij/SpPeH0RmvwXj/PHCNdSW2PAicDHx8Z04L1iXEVem5g
	721EhuPORWhpe4e98qyflHNkU+RIAB
X-Received: by 2002:a05:6512:ba6:b0:5ae:b78c:da1 with SMTP id 2adb3069b0e04-5aeb78c0e05mr561592e87.28.1782675843210;
        Sun, 28 Jun 2026 12:44:03 -0700 (PDT)
Received: from Nitro5-JS.kielce.vectranet.pl ([2a02:2a40:27ec:2900::3ab6])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69551002sm5221688e87.24.2026.06.28.12.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 12:44:01 -0700 (PDT)
From: Jakub Szczudlo <jakubszczudlo40@gmail.com>
To: linux-iio@vger.kernel.org
Cc: andy@kernel.org,
	antoniu.miclaus@analog.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlechner@baylibre.com,
	duje@dujemihanovic.xyz,
	jic23@kernel.org,
	jishnu.prakash@oss.qualcomm.com,
	jorge.marques@analog.com,
	joshua.crofts1@gmail.com,
	krzk+dt@kernel.org,
	linusw@kernel.org,
	jakubszczudlo40@gmail.com,
	linux-kernel@vger.kernel.org,
	marcelo.schmitt@analog.com,
	mazziesaccount@gmail.com,
	mike.looijmans@topic.nl,
	nuno.sa@analog.com,
	robh@kernel.org,
	sakari.ailus@linux.intel.com,
	wens@kernel.org
Subject: [PATCH v5 1/3] iio: adc: Fix incorrect reading when datarate changed in single mode
Date: Sun, 28 Jun 2026 21:43:39 +0200
Message-ID: <20260628194341.66752-2-jakubszczudlo40@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260628194341.66752-1-jakubszczudlo40@gmail.com>
References: <20260628194341.66752-1-jakubszczudlo40@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When device is suspended and it is in single mode then changing
datarate doesn't make it actual wait for new measurement, so to
be sure that read after change is correct functions that changes
datarate and gain will wait for new data.

Fixes: 541880542f2b ("iio: adc: Add TI ADS1100 and ADS1000")
Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
---
 drivers/iio/adc/ti-ads1100.c | 66 +++++++++++++++++++++++++++++++++---
 1 file changed, 62 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1100.c b/drivers/iio/adc/ti-ads1100.c
index 9fe8d54cce83..71b31adeba3c 100644
--- a/drivers/iio/adc/ti-ads1100.c
+++ b/drivers/iio/adc/ti-ads1100.c
@@ -15,10 +15,12 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/i2c.h>
+#include <linux/iopoll.h>
 #include <linux/mutex.h>
 #include <linux/property.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/time.h>
 #include <linux/units.h>
 
 #include <linux/iio/iio.h>
@@ -43,6 +45,9 @@
 static const int ads1100_data_rate[] = { 128, 32, 16, 8 };
 static const int ads1100_data_rate_bits[] = { 12, 14, 15, 16 };
 
+/* Timeout based on the minimum sample rate of 8 SPS (7500ms) */
+#define ADS1100_MAX_DRDY_TIMEOUT_US	(7500 * USEC_PER_MSEC)
+
 struct ads1100_data {
 	struct i2c_client *client;
 	struct regulator *reg_vdd;
@@ -123,10 +128,46 @@ static int ads1100_get_adc_result(struct ads1100_data *data, int chan, int *val)
 	return 0;
 }
 
+static bool ads1100_new_data_not_ready(struct ads1100_data *data)
+{
+	u8 buffer[3];
+	int ret;
+
+	ret = i2c_master_recv(data->client, buffer, sizeof(buffer));
+	if (ret < 0) {
+		dev_err(&data->client->dev, "I2C read fail: %d\n", ret);
+		return true;
+	}
+
+	return FIELD_GET(ADS1100_CFG_ST_BSY, buffer[2]);
+}
+
+static int ads1100_poll_data_ready(struct ads1100_data *data)
+{
+	int data_rate_hz = ads1100_data_rate[FIELD_GET(ADS1100_DR_MASK, data->config)];
+	/* To be sure we wait 5 times more than data rate */
+	unsigned long wait_time_us = DIV_ROUND_CLOSEST(USEC_PER_SEC, 5 * data_rate_hz);
+	bool data_ready;
+	u8 buffer[3];
+	int ret;
+
+	/* To be sure that polled value will have value after config change */
+	ret = i2c_master_recv(data->client, buffer, sizeof(buffer));
+	if (ret < 0) {
+		dev_err(&data->client->dev, "I2C read fail: %d\n", ret);
+		return ret;
+	}
+
+	return readx_poll_timeout(ads1100_new_data_not_ready, data,
+				 data_ready, data_ready != 0, wait_time_us,
+				 ADS1100_MAX_DRDY_TIMEOUT_US);
+}
+
 static int ads1100_set_scale(struct ads1100_data *data, int val, int val2)
 {
 	int microvolts;
 	int gain;
+	int ret;
 
 	/* With Vdd between 2.7 and 5V, the scale is always below 1 */
 	if (val)
@@ -135,6 +176,11 @@ static int ads1100_set_scale(struct ads1100_data *data, int val, int val2)
 	if (!val2)
 		return -EINVAL;
 
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(&data->client->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	microvolts = regulator_get_voltage(data->reg_vdd);
 	/*
 	 * val2 is in 'micro' units, n = val2 / 1000000
@@ -149,19 +195,31 @@ static int ads1100_set_scale(struct ads1100_data *data, int val, int val2)
 
 	ads1100_set_config_bits(data, ADS1100_PGA_MASK, ffs(gain) - 1);
 
-	return 0;
+	return ads1100_poll_data_ready(data);
 }
 
 static int ads1100_set_data_rate(struct ads1100_data *data, int chan, int rate)
 {
 	unsigned int i;
 	unsigned int size;
+	int ret;
 
 	size = data->supports_data_rate ? ARRAY_SIZE(ads1100_data_rate) : 1;
 	for (i = 0; i < size; i++) {
-		if (ads1100_data_rate[i] == rate)
-			return ads1100_set_config_bits(data, ADS1100_DR_MASK,
-						       FIELD_PREP(ADS1100_DR_MASK, i));
+		if (i == size)
+			return -EINVAL;
+
+		PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(&data->client->dev, pm);
+		ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+		if (ret)
+			return ret;
+
+		ret = ads1100_set_config_bits(data, ADS1100_DR_MASK,
+					      FIELD_PREP(ADS1100_DR_MASK, i));
+		if (ret)
+			return ret;
+
+		return ads1100_poll_data_ready(data);
 	}
 
 	return -EINVAL;
-- 
2.47.3

