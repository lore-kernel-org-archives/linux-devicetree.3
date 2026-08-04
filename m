Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A113B3F0767
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 19:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785871745; cv=none; b=I3rLQEMSg6vO9ZVGQjocPOYe4qAlbLQNDnbtnvNfY26q4vQbCEeLH1c/ag86CWmV2zoCmWZGhFDuDau+TtmFDJMjp4WWreQNRT1e93vvqKSixPtDV05PrZgYUh9pGmzt2mbFWnHsw4iENYWk9bGE8E5U5GD+Aq2G2Y6p2f18K9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785871745; c=relaxed/simple;
	bh=76QCwkvLjpTNjpwCNJYPcQfLgvgI2+NS982c+ZcP5og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SXJTL8lMHtKsyVefPW+I4DMf1xp02abbDMjyyQuM/XS77e4iFzeislBzBeQJkCx2P5alTX98xWdIXKRCVWjR4B7gwMLvQPrOXEMOy7Bt8py3OZMoTQOK8balQn9XrucJS4ilyXxL70iAxkTQb52Rbjfg3rdM117RAeFVpggAbdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kvnB1GA5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kvnB1GA5"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-495635a85d2so1568095e9.0
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 12:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785871740; x=1786476540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7jfC6oMmw4ybJbMk+7Zxg2SHsWcWcLhL0RUip9Ku6DE=;
        b=kvnB1GA5Kl1kROUzvIPY3dkUgV4VKiz0FYXAswuvthX+Qk5HpS/3BKp/yFmxREQEsc
         u1/qN8+2lnXba/DuZNHcuGwyP9p43/ZNBcv2tF109nGJ7u7eQ8wrb70SMtGtIch9+Ond
         qJYPhJ2/mzTiwNwLouLSSJdx0yifG+1MyLGsHfaJ1XbWMSUslSrLp7Lp/w+/TErQ3ymi
         pQiaSagcx6SeOi43SLHTtV5/gCj7u1ZP/qZ30fSMypwxdO10QTBI/xmjR6oNp8Zc6Z5i
         yI0My+G7Jc5aghVNAjwJr7UvEAvlxuF5cYgfbQRQ93DmWrxSOI11xmPbGlQrToLcghLP
         lrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785871740; x=1786476540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7jfC6oMmw4ybJbMk+7Zxg2SHsWcWcLhL0RUip9Ku6DE=;
        b=fKUSQg9tCu7lRw9o5g8O4ntI2jXXRAdtXy8fe648aSfJxpN9gVXiLKyUKe94ULFvEh
         BjWIWzwJb47wyH7sJV6G8gWu4WbBmGmF+IRJSnsWk+sT1cFC54LrU0WTytmVLWD9dgyc
         AJE3ffLhp1NDRevCj3rgLOTfBt8ralgmq6i7uxc4Cy8OravEkVnE7wpAYN5VGa0MTsrC
         Pd74TCqAnFlsoP1OoCo5wv+OItVBixr7rGOse/EMCOeB1yKp34XAHci5lcgMLgoX7azA
         /vRZDxatw8Zs7jfhDoozc4hxwCh+qZ8IkJfbCrEKKWEKorSPgNLy8bwoWhts9YEbfhdl
         oGcw==
X-Forwarded-Encrypted: i=1; AHgh+RrSMUAZylJrF0UHMLqzgBALJzhCYCqxwbKv4FjpW6/Hd39Gyyh/BLHxigUVLWItwAoIWXGa/51hq5ZG@vger.kernel.org
X-Gm-Message-State: AOJu0YzhUA7D+6AGer3rQ47uWQjWmGu3OvxUlRdJPwqjh1VkwVxKfFqU
	mVQ91ex/t5krl9sNMflNBq+H9C2W8X6nVD7sLrUzP6GRNEYMGBoP5Dd3
X-Gm-Gg: AR+sD10E8bjTH1HtDQG1Tx5GsEBBtsaL5As9pgHNmLwWYRME3Dld0y9Q+82PfTA9ycA
	rd/C70vK1PH2I3NpH04v7kE/yz9K6Kdux7TWI+ez7/WUW7bjtA+LIMG2qs848GA+A+fht5F5nag
	MIakk0Hsgh9JjXyuqZ4beznivjh1Y0DDP3uTNIGorkIy5PNe2MFLe4/fMNZcJvnXGOIOuIgOdFW
	1WTPx+Ce+QgvBZvtDMkss455rGByXE1ORc39vZRbMB4foQmyQEAzscxSbxMlTH2uY9lLW3pjBYd
	+7XBK6jNS3QA0HGlrRsfPiFYojR31Kl6B0kBJjWG1gg3VcImfhto61/TXFMbaD/Ufgl8vG2D6bZ
	+O1MZ60S7y49T9U2HJlvJ2iT1j23Q+PDhCZwdAfu8KF0lykxAMIMatvUe5NzZajL7D5UocEUCk8
	fPD2VWnARbG5S7YnPmAq/g/KlR3kdBCHdOH1/xV37b2vXcXI87wfpkwTH0Q9k2c/0bnW+J+2coL
	1XKW04UrtmjUXTwjo4C31M=
X-Received: by 2002:a05:600c:4e87:b0:495:573e:1c54 with SMTP id 5b1f17b1804b1-4994e7c1122mr5440325e9.9.1785871739732;
        Tue, 04 Aug 2026 12:28:59 -0700 (PDT)
Received: from MSI-LINUX.kielce.vectranet.pl ([2a02:2a40:27ec:2900:68f0:30cb:8ca1:f965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e4bf820sm8248745e9.0.2026.08.04.12.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 12:28:59 -0700 (PDT)
From: Jakub Szczudlo <jakubszczudlo40@gmail.com>
To: linux-iio@vger.kernel.org
Cc: jic23@kernel.org,
	dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	marcelo.schmitt@analog.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mike.looijmans@topic.nl,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jorge.marques@analog.com,
	antoniu.miclaus@analog.com,
	mazziesaccount@gmail.com,
	jishnu.prakash@oss.qualcomm.com,
	duje@dujemihanovic.xyz,
	wens@kernel.org,
	sakari.ailus@linux.intel.com,
	linusw@kernel.org,
	Jakub Szczudlo <jakubszczudlo40@gmail.com>
Subject: [PATCH v9 1/3] iio: adc: ti-ads1100: Fix incorrect reading when datarate changed in single mode
Date: Tue,  4 Aug 2026 21:28:38 +0200
Message-ID: <20260804192840.29121-2-jakubszczudlo40@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260804192840.29121-1-jakubszczudlo40@gmail.com>
References: <20260804192840.29121-1-jakubszczudlo40@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When device is suspended and it is in single mode then changing
datarate doesn't make it actually wait for new measurement, so to
be sure that read after change is correct, functions that changes
datarate and gain will wait for a new data.

Fixes: 541880542f2b ("iio: adc: Add TI ADS1100 and ADS1000")
Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
---
 drivers/iio/adc/ti-ads1100.c | 108 +++++++++++++++++++++++++++++++++--
 1 file changed, 104 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1100.c b/drivers/iio/adc/ti-ads1100.c
index 9fe8d54cce83..288d209ecf92 100644
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
@@ -123,10 +128,87 @@ static int ads1100_get_adc_result(struct ads1100_data *data, int chan, int *val)
 	return 0;
 }
 
+static int ads1100_conversion_busy(struct ads1100_data *data)
+{
+	u8 buffer[3];
+	int ret;
+
+	ret = i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));
+	if (ret < 0) {
+		dev_err(&data->client->dev, "I2C read fail: %d\n", ret);
+		return ret;
+	}
+
+	return FIELD_GET(ADS1100_CFG_ST_BSY, buffer[2]);
+}
+
+static int ads1100_wait_single_conversion(struct ads1100_data *data)
+{
+	int data_rate_index = FIELD_GET(ADS1100_DR_MASK, data->config);
+	int data_rate_Hz = ads1100_data_rate[data_rate_index];
+	unsigned long poll_us = DIV_ROUND_CLOSEST(USEC_PER_SEC, data_rate_Hz) / 4;
+	int busy;
+	int ret;
+
+	ret = readx_poll_timeout(ads1100_conversion_busy, data,
+				 busy, busy <= 0,
+				 poll_us, ADS1100_MAX_DRDY_TIMEOUT_US);
+	if (busy < 0)
+		return busy;
+
+	return ret;
+}
+
+static int ads1100_start_single_conversion(struct ads1100_data *data)
+{
+	u8 config = data->config | ADS1100_CFG_SC;
+	int ret;
+
+	ret = i2c_master_send(data->client, &config, sizeof(config));
+	if (ret < 0) {
+		dev_err(&data->client->dev, "I2C write fail: %d\n", ret);
+		return ret;
+	}
+   /* Need to wait because of change from continuous to single mode */
+	ret = ads1100_wait_single_conversion(data);
+	if (ret)
+		return ret;
+
+	config |= ADS1100_CFG_ST_BSY;
+
+	ret = i2c_master_send(data->client, &config, sizeof(config));
+	if (ret < 0) {
+		dev_err(&data->client->dev, "I2C write fail: %d\n", ret);
+		return ret;
+	}
+
+	/* No need to cache it, it's status bit */
+	data->config = config & ~ADS1100_CFG_ST_BSY;
+
+	return 0;
+}
+
+static int ads1100_poll_data_ready(struct ads1100_data *data)
+{
+	int ret;
+
+	ret = ads1100_start_single_conversion(data);
+	if (ret)
+		return ret;
+
+	ret = ads1100_wait_single_conversion(data);
+	if (ret)
+		return ret;
+
+	return ads1100_set_config_bits(data, ADS1100_CFG_SC,
+			      ADS1100_CONTINUOUS);
+}
+
 static int ads1100_set_scale(struct ads1100_data *data, int val, int val2)
 {
 	int microvolts;
 	int gain;
+	int ret;
 
 	/* With Vdd between 2.7 and 5V, the scale is always below 1 */
 	if (val)
@@ -135,6 +217,11 @@ static int ads1100_set_scale(struct ads1100_data *data, int val, int val2)
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
@@ -149,22 +236,35 @@ static int ads1100_set_scale(struct ads1100_data *data, int val, int val2)
 
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
 		if (ads1100_data_rate[i] == rate)
-			return ads1100_set_config_bits(data, ADS1100_DR_MASK,
-						       FIELD_PREP(ADS1100_DR_MASK, i));
+			break;
 	}
 
-	return -EINVAL;
+	if (i == size)
+		return -EINVAL;
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(&data->client->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	ret = ads1100_set_config_bits(data, ADS1100_DR_MASK,
+				      FIELD_PREP(ADS1100_DR_MASK, i));
+	if (ret)
+		return ret;
+
+	return ads1100_poll_data_ready(data);
 }
 
 static int ads1100_get_vdd_millivolts(struct ads1100_data *data)
-- 
2.47.3

