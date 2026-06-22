Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8497D378D8B
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 22:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782166576; cv=none; b=D0ktNuCJ7HluRPvGLQiebQ0s449Cs5rFLjzpQc1PrXOxYrmJqarRTqvf1Jc1KugV8cflPf2+UPErb7sHfrLpnfRJT7Ab9JMMQSCNGqbQDCF83l2qV4LsEYCSyOcV7tzFEn+TXCMmR69eFtxlvYm3adGcir1TQIgpjv+Ac5j2lVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782166576; c=relaxed/simple;
	bh=Kn4F5KWEk/qmEp4CXKmcI43JoTG6Txr3sNUChHnbdmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ThIHuo2Ux243GxgudGJNOUrhaF23TpO6hu8WzcOttmEWLJZ7v4kX0LleaFO7ZcHllIXq/BKDRykT4a9YPNm8Yvo3LRDC58bz0CDcBP6kgMjTC3G1x15X8Q+/0fbsHUZEwB4wXfSDMk425pbKjEODyG7O9mFobM1doiKrIkvKgZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E1+oKhRz; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E1+oKhRz"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-462ebd5d37dso4761182f8f.1
        for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 15:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782166573; x=1782771373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQgx3z51gSeAl7SybMiSanpyxKloY3+DDUxB8bVZDcg=;
        b=E1+oKhRzLVjB535Za/2rD1L+Y0me9H6KnMiY6CBmrVuVLGAJl6FTQDFnBCS04MHJV9
         3ixzA8LomwwQ4JCaOHlLPFRJlprvFR/TOPzgOQo0c+6JAuOgiq04WgzRAjbdyz8+Fxvd
         Le7Ob3pkq83nOsqiRKogbALsIgVfsy6KUV/IjvnVxizvsqUSV8YjbCC7us3fWTxgAhXa
         41V0ewJUgGWkv6ySELX5RihL4Us13+VrPXtM0p8kcFKoJnwuuIKTQ33tb09DG5+4BlWY
         RkRf5MGlu6b/kdeqRklowBHcMciL0b0qIx9NFdOSBXtKEh8udANJJpwa4l0ieU2n8RNo
         G8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782166573; x=1782771373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fQgx3z51gSeAl7SybMiSanpyxKloY3+DDUxB8bVZDcg=;
        b=D/ddshtO97bprCQQa6xdTnQy0tCiSq6utmuav7DWJkqvAkTrHv61xisoE0EktSxibD
         vAQJ3joLaI93cvlFGCSqZa8c35CsKbWXdoNl4VPcbpi58rC8klMb4hUuq2t/TmTlwYHv
         XiZGVXSHRxscZZsLlTpt9Ausb1ouB0O87kmXMhTAvPBH20sddlOvP7/kezsLMCNYBMJ8
         WwWeRoRBjaFBRsMvk8cn/Qb626fipzP0bTUsVb+utfc7Ng+PoK42jfS+wqj0XUpUuSgx
         0yyP0nTOFPhfSBp80e3jfIDY5rmHiCHAIiV/ZEAjApC6rQF9RYLEE7ZZqAXrPJyiV98/
         sjaw==
X-Forwarded-Encrypted: i=1; AHgh+RomA64SemkhZ8kafzYlSUHmRc3vUAL28drKuYaXvL68TUqa1UO8eUVGLyJZkqKJHu7TFjHcl5JRzzHq@vger.kernel.org
X-Gm-Message-State: AOJu0YxPjBDE3yAnZeHgHV1aMe1aUt4BsS0elDWsGqgnq6mlM+TJUif9
	PMyKY4UWiDWFc4o+Zx6W4Xx6lFEuNAXCv711UzdeFzKMjonfzODxFpme19YXnb5x
X-Gm-Gg: AfdE7cmkey5cIGGjxSorrKwt2G312ZLFJ7l0HdQZL+hAZZ6zgXCW2nNNV4RcZ2yIze2
	T2i5z//2cKeIkGQ4C9Aw09mdXsmVY0iBvZqPMnkKUmvqyZQiJOfz5NZcxcDA3UgTMKWWkhhAgx+
	fjL3xTNlTKPYiBgUlFM/Qf12qpf4+EQxC6ydJEbZR2wyo9XRZQrMVmU4UM/87BoSzM2dsTs0OmD
	H18LV913wty4HPNX1gWpbRPQbKDXsRuXMY+zmBTOTg5kGdeZmSIH7OwGV7+V/+Gumuc24cfZc1m
	eJyBeiwxrLuXfEgWTdyDuZEJzS6dCBKS+ld31WgJmFa8yBpf1/GfldcC5uaSt6XbASi9E8CUz4r
	HdV89DzjXXp6y3h4lVtAPwX+KqETswwrrqEWtfXH3DAqHjAPhIz5MTvn5DGpkdRrVg3Rt+rPgPR
	IgfJ+m7iwS5r0ols603mRrxRUaH18Q
X-Received: by 2002:a05:6000:184c:b0:461:e27d:5690 with SMTP id ffacd0b85a97d-46adcda85e1mr43430f8f.26.1782166572948;
        Mon, 22 Jun 2026 15:16:12 -0700 (PDT)
Received: from Nitro5-JS.kielce.vectranet.pl ([2a02:2a40:27ec:2900::3ab6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c53fdsm31319845f8f.10.2026.06.22.15.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 15:16:12 -0700 (PDT)
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
Subject: [PATCH v4 1/3] iio: adc: Fix incorrect reading when datarate changed in single mode
Date: Tue, 23 Jun 2026 00:15:48 +0200
Message-ID: <20260622221550.374235-2-jakubszczudlo40@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260622221550.374235-1-jakubszczudlo40@gmail.com>
References: <20260622221550.374235-1-jakubszczudlo40@gmail.com>
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
 drivers/iio/adc/ti-ads1100.c | 74 ++++++++++++++++++++++++++++++++++--
 1 file changed, 70 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1100.c b/drivers/iio/adc/ti-ads1100.c
index 9fe8d54cce83..e3c801381434 100644
--- a/drivers/iio/adc/ti-ads1100.c
+++ b/drivers/iio/adc/ti-ads1100.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/i2c.h>
+#include <linux/iopoll.h>
 #include <linux/mutex.h>
 #include <linux/property.h>
 #include <linux/pm_runtime.h>
@@ -43,6 +44,9 @@
 static const int ads1100_data_rate[] = { 128, 32, 16, 8 };
 static const int ads1100_data_rate_bits[] = { 12, 14, 15, 16 };
 
+/* Timeout based on the minimum sample rate of 8 SPS (7.5s) */
+#define ADS1100_MAX_DRDY_TIMEOUT_US	7500000
+
 struct ads1100_data {
 	struct i2c_client *client;
 	struct regulator *reg_vdd;
@@ -123,10 +127,49 @@ static int ads1100_get_adc_result(struct ads1100_data *data, int chan, int *val)
 	return 0;
 }
 
+static bool ads1100_new_data_not_ready(struct ads1100_data *data)
+{
+	int ret;
+	u8 buffer[3];
+
+	ret = i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));
+	if (ret < 0) {
+		dev_err(&data->client->dev, "I2C read fail: %d\n", ret);
+		return true;
+	} else if (ret < 3) {
+		dev_err(&data->client->dev, "Short I2C read\n");
+		return true;
+	}
+
+	return FIELD_GET(ADS1100_CFG_ST_BSY, buffer[2]);
+}
+
+static int ads1100_poll_data_ready(struct ads1100_data *data)
+{
+	int ret;
+	u8 buffer[3];
+	bool data_ready;
+	int datarate = ads1100_data_rate[FIELD_GET(ADS1100_DR_MASK, data->config)];
+	/* To be sure we wait 5 times more than datarate */
+	unsigned long wait_time = DIV_ROUND_CLOSEST(MICRO, 5 * datarate);
+
+	/* To be sure that polled value will have value after config change */
+	ret = i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));
+	if (ret < 0) {
+		dev_err(&data->client->dev, "I2C read fail: %d\n", ret);
+		return ret;
+	}
+
+	return read_poll_timeout(ads1100_new_data_not_ready, data_ready,
+				 !data_ready, wait_time,
+				 ADS1100_MAX_DRDY_TIMEOUT_US, false, data);
+}
+
 static int ads1100_set_scale(struct ads1100_data *data, int val, int val2)
 {
 	int microvolts;
 	int gain;
+	int ret;
 
 	/* With Vdd between 2.7 and 5V, the scale is always below 1 */
 	if (val)
@@ -135,6 +178,12 @@ static int ads1100_set_scale(struct ads1100_data *data, int val, int val2)
 	if (!val2)
 		return -EINVAL;
 
+	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(&data->client->dev, pm);
+
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	microvolts = regulator_get_voltage(data->reg_vdd);
 	/*
 	 * val2 is in 'micro' units, n = val2 / 1000000
@@ -149,19 +198,36 @@ static int ads1100_set_scale(struct ads1100_data *data, int val, int val2)
 
 	ads1100_set_config_bits(data, ADS1100_PGA_MASK, ffs(gain) - 1);
 
-	return 0;
+	ret = ads1100_poll_data_ready(data);
+
+	return ret;
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
+		if (ads1100_data_rate[i] != rate)
+			continue;
+
+		PM_RUNTIME_ACQUIRE_AUTOSUSPEND(&data->client->dev, pm);
+
+		ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+		if (ret)
+			return ret;
+
+		ret = ads1100_set_config_bits(data, ADS1100_DR_MASK,
+					      FIELD_PREP(ADS1100_DR_MASK, i));
+		if (ret)
+			return ret;
+
+		ret = ads1100_poll_data_ready(data);
+
+		return ret;
 	}
 
 	return -EINVAL;
-- 
2.47.3

