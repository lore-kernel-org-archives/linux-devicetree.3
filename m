Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8B346C858
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 18:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785523810; cv=none; b=ZYoHRDEHh+enpJJhohjIGrgnuuw8ehMA9MV8dYpqdj8cPGd7mGhCBFvbMhT1L6BUP//eqGpY2+XPZgLctLRJwkIWg41ARAZ8B4WSFA1xcfgRE7G1E/3EswTMHzlU9CD8TVQEd9M53CTv6OJjD1l2BmpR0Y4jMhkGzoo5lNiZByU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785523810; c=relaxed/simple;
	bh=RpLGJzjfjUhtL8XYbyg+kOLTlA9zREGH8M7NrVzP42I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GDNlSMxh9eydy2oH9Towxanus5Trka3U8HgS0gLFRkzpLZDQtnkvAA+6kaWvRl3+CnZ+53ysubbz+Pj9eAfrRQ3H5E+77GQaZkOOoMgCc0U3dBQoAtgkVnme/DXYWvA+yXESJDlrNoTF+tzMd5nMd3DznSUsVse8CbnGti2u7cQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dviN8f0u; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dviN8f0u"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f84023916so1380040f8f.3
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785523806; x=1786128606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5WsKr0prhzS0c+WDr3jcpRTlguXTYe8/7OUltENh29I=;
        b=dviN8f0upT8mSDKUZ7JDo3k9Ep7x0aBpqsJnaAdeOYftJr5d22GQcZLvuSETUYXtH9
         WMhKCepTHksA36pE+QqHVNPcLI0qf+GlzG2DbjdHL8pxzwWQkvimkDAfEBULjhmdDrZd
         Y3X+q6saXs5F24j/cLwUzeCLH5yLQl87+QVqR1eP4rfBf5ElOAsUn8ckZ6PWYKrtZl3v
         at8QeajH4DL00K0uHyk3rZH8xyT5R5jdyPGa7/wVj3a3KZ+c+XJBnM0z013M1kLB/GIe
         3BoMXVLYSSe2T1ZAGJdQc+Yho6VkFA0YGm5wlVMWVGIV4w7AqPE3nIt0LPhg5OQ6yQ0x
         t7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785523806; x=1786128606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5WsKr0prhzS0c+WDr3jcpRTlguXTYe8/7OUltENh29I=;
        b=g/VCgF51BMGFwf1DvvSbnL+m3M2SYS2gZ8AstVQqpt6zAXnmg1oPpflvvcsSC3DqJ/
         /l/qIa2xKXbbU8O6vA6QEJgGcou1gO4lBIDjPA7L3rktzWc7geGxDhlbbjh7ofkecYGY
         IOSD5NwTr+uklYd+c2vi9y0yLnjzlvOA6dOv3Y0B5Ev2fyCbH+TUFubz5vEWSPbhaB6k
         JJyelVREGcKWrCAgJj3PPlHv8t2EJpR1Q+LxRNIYWl0u8y93hbNI2l6jRKwvFqQefrN0
         FMZQX5m4HLnlTKJgBiwgBtyc28/MyB7HMc1yUwwWS5X3pFXjk+fT5DwZacQb2W66XhUv
         Hpgg==
X-Forwarded-Encrypted: i=1; AHgh+RpdvzdIa5qNF+8rWVDkJTCA8lpBlfcj8X7eK4C98XVX1RyCn0G9lHBxHafq6z4mTS8XXntLg4HZTwNf@vger.kernel.org
X-Gm-Message-State: AOJu0YxRVsoLCu8P7YEHhnEMTb+xZm3QVj7DowrNapsxukQHVe9TOG9Q
	P0DlIbEG9T7u8QwsN+tiADJebEYn7vmDYFqwxW2ClI/IucmAxmT1kfKe
X-Gm-Gg: AR+sD11MPZqnd6Y1fFyMydB6iLc8UoWGmAQu55a6kIATcURpIiReFgClsudtN+IEVml
	rAZlbGH5DSGeXjuQ/jSoIwgiX1XbeAmjaQ+6z7mLanre4iGmq7VHPvLK9KNi7l5HOoSK3Ms83g0
	juhNoP8hHejPO15BIMxYf8RrbM72BTzmGc7GpEyv2oykhfjmm1TnoWUWJpbeUqZcLXnV9tlj0nZ
	KYZf1cxfyT8B2aSivyFx4mcQSYfOl7tSM0k4pFmdZAWDxdUFqesHWvgOi9ykE88rMRyoafaG4iF
	d5uO56VdRKc56wNoXN+cdIxC/VZ9Pg51iZfrWSsXRFFN7s2uVr/LkbQF/V7yGVCSASxKk7I6Qm1
	Xc3lPGfMWca/S9CdDTPYm8SfDHfENM0PB8eCHU4RYgbtqj4rUqM3aEhEakEYQ6IE1xwjeW7oMbM
	j3tm2bpNsdWLQaVd48qf3D9wnk1QBZOKkzCnZ+u/i24bWiwLaA9fGPARTDu3TeTDIvWUvmg+F/Q
	VA=
X-Received: by 2002:a05:6000:40c9:b0:47f:7005:2893 with SMTP id ffacd0b85a97d-47fd7331119mr1532747f8f.58.1785523806473;
        Fri, 31 Jul 2026 11:50:06 -0700 (PDT)
Received: from antoniarch ([78.211.133.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91b3sm8741488f8f.14.2026.07.31.11.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:50:06 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v3 2/8] rtc: abx80x: add mutex protection for register writes
Date: Fri, 31 Jul 2026 20:48:25 +0200
Message-ID: <20260731184831.44037-3-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731184831.44037-1-apokusinski01@gmail.com>
References: <20260731184831.44037-1-apokusinski01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ABX80X RTC driver performs multi-step register operations such as
NVMEM transfers or register writes preceded by a configuration key
write. Add a mutex to serialize all the register writes to protect
these sequences against race conditions.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 drivers/rtc/rtc-abx80x.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 5486d9d0b1e5..8d791b9ec7d2 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -15,6 +15,7 @@
 #include <linux/i2c.h>
 #include <linux/kstrtox.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/rtc.h>
 #include <linux/watchdog.h>
@@ -127,6 +128,7 @@ struct abx80x_priv {
 	struct rtc_device *rtc;
 	struct i2c_client *client;
 	struct watchdog_device wdog;
+	struct mutex lock;
 };
 
 static int abx80x_write_config_key(struct i2c_client *client, u8 key)
@@ -219,6 +221,7 @@ static int abx80x_rtc_read_time(struct device *dev, struct rtc_time *tm)
 static int abx80x_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	struct abx80x_priv *priv = i2c_get_clientdata(client);
 	unsigned char buf[8];
 	int err, flags;
 
@@ -234,6 +237,8 @@ static int abx80x_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	buf[ABX8XX_REG_YR] = bin2bcd(tm->tm_year - 100);
 	buf[ABX8XX_REG_WD] = tm->tm_wday;
 
+	guard(mutex)(&priv->lock);
+
 	err = i2c_smbus_write_i2c_block_data(client, ABX8XX_REG_HTH,
 					     sizeof(buf), buf);
 	if (err < 0) {
@@ -263,6 +268,8 @@ static irqreturn_t abx80x_handle_irq(int irq, void *dev_id)
 	struct rtc_device *rtc = priv->rtc;
 	int status;
 
+	guard(mutex)(&priv->lock);
+
 	status = i2c_smbus_read_byte_data(client, ABX8XX_REG_STATUS);
 	if (status < 0)
 		return IRQ_NONE;
@@ -317,6 +324,7 @@ static int abx80x_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 static int abx80x_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	struct abx80x_priv *priv = i2c_get_clientdata(client);
 	u8 alarm[6];
 	int err;
 
@@ -330,6 +338,8 @@ static int abx80x_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 	alarm[4] = bin2bcd(t->time.tm_mday);
 	alarm[5] = bin2bcd(t->time.tm_mon + 1);
 
+	guard(mutex)(&priv->lock);
+
 	err = i2c_smbus_write_i2c_block_data(client, ABX8XX_REG_AHTH,
 					     sizeof(alarm), alarm);
 	if (err < 0) {
@@ -352,6 +362,7 @@ static int abx80x_rtc_set_autocalibration(struct device *dev,
 					  int autocalibration)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	struct abx80x_priv *priv = i2c_get_clientdata(client);
 	int retval, flags = 0;
 
 	if ((autocalibration != 0) && (autocalibration != 1024) &&
@@ -360,6 +371,8 @@ static int abx80x_rtc_set_autocalibration(struct device *dev,
 		return -EINVAL;
 	}
 
+	guard(mutex)(&priv->lock);
+
 	flags = i2c_smbus_read_byte_data(client, ABX8XX_REG_OSC);
 	if (flags < 0)
 		return flags;
@@ -443,6 +456,7 @@ static ssize_t oscillator_store(struct device *dev,
 				const char *buf, size_t count)
 {
 	struct i2c_client *client = to_i2c_client(dev->parent);
+	struct abx80x_priv *priv = i2c_get_clientdata(client);
 	int retval, flags, rc_mode = 0;
 
 	if (strncmp(buf, "rc", 2) == 0) {
@@ -454,6 +468,8 @@ static ssize_t oscillator_store(struct device *dev,
 		return -EINVAL;
 	}
 
+	guard(mutex)(&priv->lock);
+
 	flags =  i2c_smbus_read_byte_data(client, ABX8XX_REG_OSC);
 	if (flags < 0)
 		return flags;
@@ -511,8 +527,11 @@ static const struct attribute_group rtc_calib_attr_group = {
 static int abx80x_alarm_irq_enable(struct device *dev, unsigned int enabled)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	struct abx80x_priv *priv = i2c_get_clientdata(client);
 	int err;
 
+	guard(mutex)(&priv->lock);
+
 	if (enabled)
 		err = i2c_smbus_write_byte_data(client, ABX8XX_REG_IRQ,
 						(ABX8XX_IRQ_IM_1_4 |
@@ -526,6 +545,7 @@ static int abx80x_alarm_irq_enable(struct device *dev, unsigned int enabled)
 static int abx80x_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	struct abx80x_priv *priv = i2c_get_clientdata(client);
 	int status, tmp;
 
 	switch (cmd) {
@@ -539,6 +559,8 @@ static int abx80x_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 		return put_user(tmp, (unsigned int __user *)arg);
 
 	case RTC_VL_CLR:
+		guard(mutex)(&priv->lock);
+
 		status = i2c_smbus_read_byte_data(client, ABX8XX_REG_STATUS);
 		if (status < 0)
 			return status;
@@ -617,6 +639,8 @@ static int __abx80x_wdog_set_timeout(struct watchdog_device *wdog,
 	struct abx80x_priv *priv = watchdog_get_drvdata(wdog);
 	u8 val = ABX8XX_WDT_WDS | timeout_bits(timeout);
 
+	guard(mutex)(&priv->lock);
+
 	/*
 	 * Writing any timeout to the WDT register resets the watchdog timer.
 	 * Writing 0 disables it.
@@ -701,6 +725,8 @@ static int abx80x_nvmem_xfer(struct abx80x_priv *priv, unsigned int offset,
 		len = min(lower + bytes, (size_t)ABX8XX_SRAM_WIN_SIZE) - lower;
 		len = min_t(u8, len, I2C_SMBUS_BLOCK_MAX);
 
+		guard(mutex)(&priv->lock);
+
 		ret = i2c_smbus_write_byte_data(priv->client, ABX8XX_REG_EXTRAM,
 						extram);
 		if (ret)
@@ -908,6 +934,9 @@ static int abx80x_probe(struct i2c_client *client)
 
 	priv->rtc->ops = &abx80x_rtc_ops;
 	priv->client = client;
+	err = devm_mutex_init(&client->dev, &priv->lock);
+	if (err)
+		return err;
 
 	i2c_set_clientdata(client, priv);
 
-- 
2.55.0

