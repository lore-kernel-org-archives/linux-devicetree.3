Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3081E368282
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 19:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784058947; cv=none; b=CyqFrwfEXs9p5oKjGoQOddcrtpNMyNRzcEd426wvUsRgIc12/GAYgIGdTLn/vQ3NIUoNiQHZ2nGJ2aL0M8J9VohE/+tVv9cq1XmNks9C4aOOcxvC1G67oqnt66aPXcpjoF2j66HzGOnBivll84NmQNGvAXVrl/hslz8LHk6OZY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784058947; c=relaxed/simple;
	bh=r/XQGH/yp0z7+A9uwbCk2tceFw3oDx5VYnS38/gSh2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fpfZg/3P2JygdJUd5cGWEf0yTicGhOP2vO7Yh/LOd92ZvMhvNF2SirCvOn0yoKSZyyOYWZoV5/pk4Vp8Bf6xbiKlRCEvmO+Uro93ujlcOqLtSAE/NLImQ0HRioisbfz/2Ie2RrJuTpVux6QJ3CSEqfPhssPCXu10P0tw1zoa4tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZGF4rVNw; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZGF4rVNw"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b015b2d792so5410479e87.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 12:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784058943; x=1784663743; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/ji6cByUOnY3CtiRZ9zb9jnxCe1/JgaItNeBfbBs8U=;
        b=ZGF4rVNwmhoazZP0FRyP4Lj0Ti/xI7yPkZCGQC2h3yWOKQof5RjOgYGC9vxUPTaDoI
         6EDuFLq3m//Ew/nx5gtk1+H+HlHwF2oX8joROZbAxpUS6onrZ6Bnxblf2oxP81i0Wm+w
         //7JPq3tjaSymKQsTlrN9OxS64rJzqtM78H+ARuZgslb5pWCJinP9fNdSCtNThtJ+OwE
         xgBaF2e9b4LHH2nCGwIIGF/cvPgG/dJkfvTqyUoSveo459G9fy4qJYL58laNDs4GiZCr
         offVe+w0BH7PLdqpt5nqHPutXG0f/pRVAA3W02P9bE1I6qZU3IMkbv+mDEgR56q/FQDp
         d60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784058943; x=1784663743;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a/ji6cByUOnY3CtiRZ9zb9jnxCe1/JgaItNeBfbBs8U=;
        b=OYFZDovMe7Vf+zYg0Bg0FGcr5Jo9kya4eRUR31TCbxD+hLYqdO2HooTD0QA8jj2BGP
         v1PdVFlrwaTfbzGXGHvnFU6uSfq688eIJyk//CgpGooehPK49uty+e+VudjMz+1webtn
         6CbGIscpo8JSYDc0Z+zaNOnbzy71IIxL1TeSZqMSrX0P7ldsI6gxCijLgEvmGYDOvUBY
         aNvZfB4Q8vOWZHKirHyLm0Z96LciZOnCz4aXcHf+TLZU5Zx+W1B34+H9dh0Q0Io6KOTG
         MOHuIe5VfdHtr0EdYYvVexQUUc24Am9AGWIrRTZXT6N1+2MXwrUfSTRp7hqKganuKE5j
         wwqQ==
X-Forwarded-Encrypted: i=1; AHgh+RqWQBRFLGK/AnfFzVvouepuVnq01NYOAsvFHTQ7+nqpeM/m9oPLH9u65jnEulboe7nHzIC6RFC2a3yx@vger.kernel.org
X-Gm-Message-State: AOJu0Yyqe3kBlZyjEL8O5GD//8bSnFjBrX5sn3pGd0wnFvEEup2n0SPm
	y3XJCWojKGd9nFAOqDZ20XPARYitayB2qIqHEc3cO+tiD/jZxGgxP9cd
X-Gm-Gg: AfdE7clD37sFFLaCKjtwEX4MLHm0BDXC/3SpYhM1B89/ZSoN7Q/3sjxxvrTaBZ/QnAR
	RDxXwSVK1qxcF+rPXVm8XmcTDGk7wH0o/7HBSDluqYKkJzo/kVeGZlER5fflkbXDWVqvsubEoKX
	nn3WbDKhPIJZRifIdy1+9w/i2bH99mkLx2qYZ56XJEDFeXCFiVkVV5anbUJ/hX3ic1p1+ZON9kC
	XJY9x20EUCJRVGbdRQFcyI3lac/hk4lrmU83gp4j3E2yQpPiE3kV+P9oLxNqj4jdE0LSNHixaCy
	m07625EZpjG90fG/fB4XlwP3XjOGs3r6YYYIO7ksOUJMdR16u+0/LB3RgWdsfOeaGYbur4S/x/B
	4r7fJptZq4iMOzPX1yr63RKXuwGOI3Hs7VA4AFHX46IMn1vakMzq4M3JeAA/GS/X6AsWyaVgwZX
	s1zwphURL3caAte7FOKdL5GhQwZKHejGtBZhJs/dw7098TaqWQ1KYl58Qspw==
X-Received: by 2002:a05:6512:4205:b0:5b1:543f:f5c4 with SMTP id 2adb3069b0e04-5b159b88f35mr639383e87.43.1784058943177;
        Tue, 14 Jul 2026 12:55:43 -0700 (PDT)
Received: from MSI-LINUX.kielce.vectranet.pl ([2a02:2a40:27ec:2900:822e:374d:22e8:16cf])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca501bfsm3693490e87.26.2026.07.14.12.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:55:42 -0700 (PDT)
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
Subject: [PATCH v7 1/3] iio: adc: ti-ads1100: Fix incorrect reading when datarate changed in single mode
Date: Tue, 14 Jul 2026 21:55:26 +0200
Message-ID: <20260714195528.597753-2-jakubszczudlo40@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260714195528.597753-1-jakubszczudlo40@gmail.com>
References: <20260714195528.597753-1-jakubszczudlo40@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When device is suspended and it is in single mode then changing
datarate doesn't make it actually wait for new measurement, so to
be sure that read after change is correct functions that changes
datarate and gain will wait for a new data.

Fixes: 541880542f2b ("iio: adc: Add TI ADS1100 and ADS1000")
Signed-off-by: Jakub Szczudlo <jakubszczudlo40@gmail.com>
---
 drivers/iio/adc/ti-ads1100.c | 71 ++++++++++++++++++++++++++++++++++--
 1 file changed, 67 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1100.c b/drivers/iio/adc/ti-ads1100.c
index 9fe8d54cce83..f0a30ae139af 100644
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
@@ -123,10 +128,50 @@ static int ads1100_get_adc_result(struct ads1100_data *data, int chan, int *val)
 	return 0;
 }
 
+static int ads1100_new_data_is_ready(struct ads1100_data *data)
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
+static int ads1100_poll_data_ready(struct ads1100_data *data)
+{
+	int data_rate_Hz = ads1100_data_rate[FIELD_GET(ADS1100_DR_MASK, data->config)];
+	/* To be sure we wait 5 times more than data rate */
+	unsigned long wait_time_us = DIV_ROUND_CLOSEST(USEC_PER_SEC, 5 * data_rate_Hz);
+	int data_ready;
+	u8 buffer[3];
+	int ret;
+
+	/* To be sure that polled value will have value after config change */
+	ret = i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));
+	if (ret < 0) {
+		dev_err(&data->client->dev, "I2C read fail: %d\n", ret);
+		return ret;
+	}
+
+	ret = readx_poll_timeout(ads1100_new_data_is_ready, data,
+				 data_ready, data_ready != 0,
+				 wait_time_us, ADS1100_MAX_DRDY_TIMEOUT_US);
+	if (ret)
+		return ret;
+
+	return data_ready < 0 ? data_ready : 0;
+}
+
 static int ads1100_set_scale(struct ads1100_data *data, int val, int val2)
 {
 	int microvolts;
 	int gain;
+	int ret;
 
 	/* With Vdd between 2.7 and 5V, the scale is always below 1 */
 	if (val)
@@ -135,6 +180,11 @@ static int ads1100_set_scale(struct ads1100_data *data, int val, int val2)
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
@@ -149,22 +199,35 @@ static int ads1100_set_scale(struct ads1100_data *data, int val, int val2)
 
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

