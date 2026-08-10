Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5975C44213B
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 19:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786390812; cv=none; b=QafAF9i39XM3w8++nBMt79QzQj5ecH2FFTQ8pN5kXNUCO4FaTf6O0AJK5YVMbMx0sOMRRH5etY7iQhKpldQ8x0xhVv6gYjL+kjsm/BCxfqogQ3qHN4bPDa+/b/W5BH0D56nqkrWw6E8zWPMl1LqWhM1zkKQzUAIeON2v/ROMSRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786390812; c=relaxed/simple;
	bh=p25ogiM2Sa8dkypvVtSH6kxWkficJn5eIY7C0S2Bxg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p9NuKwxr9IXvHSEq2zULSFhWEpdwFxpusXRHxQmRtX7FLBobJOmX5+wF/4fQ1lXoOP8lqDz04gTlsZ7EP4PEEro3t8aH9O5Z+8m3KEnreFYzILrU/NTXbfhl1reXu/V3ZjYBU/eefaf0jzMy8hUUrXE0xnSkqkaFkQnzdKlHojI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YaAbUBiJ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YaAbUBiJ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f7027ca11so1450243f8f.3
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 12:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786390806; x=1786995606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJn7ePOsurTlt5ccE+gZ6P4uZZ4odFFp/lRiM7gv8dM=;
        b=YaAbUBiJ2QwKZR0xUqPtjo9HB3fSEIgI6VIU6yCbjFNGnx5Z056rB3Jdvnil8eZayN
         0yhqTfxhw51P5iescM/68oaDgrEE9YT9dN/GySm9mstKBRxkoQzeSsj+5Xfyy6zicPLG
         J1MbYcGn+sIP9veBhQVFlOznjkjqPu7qyRaju9C7ReDNzbdidAWoXPZQogy/OoksCpPb
         JRsy8LtdtPSOfvrEgKvbYK8kd2vxFLx1Bgf+ix2dbhwsK81dKKGGzPRrIjrnZ/KFmRRW
         ZLYz8WtFI9VwKO81tBLYRUoRbKD33XttOHnUCPI6145WUjr4AeLay4sr3R6F+dDoE7mB
         UEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786390806; x=1786995606;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cJn7ePOsurTlt5ccE+gZ6P4uZZ4odFFp/lRiM7gv8dM=;
        b=QY/fvJCh7Lvkyj82aTecMPwhkqtHkTMxbxvcUeXpHA1X9gmPeayTBHGCmc9WpjE4Mi
         VDHRYrGd5ge+AnWsdDQ+wgRFD1J4ohPGPMb/jQW02SwWQ7jSB9B1xf15lvMWjqb4IFRP
         ipMoGzT8nOd/F+r8Ac5qAYyoI/1CMKb7JqCASZG72gvBnAGtYJuxckn92O5UnZVMu5nr
         3MU/SD8HWZ4wr98sOQ1dq9uhaPvw3e8GlNLhnhOgK5+XypQZcGcEtqVtKSagf0/sym/X
         q4eHqDcp1wcnVLyd0VppJ1GjFqkdIPrLvr3U3/Atg4kvvGMYi5bdj6G6RkZbTiFly/O3
         9NqA==
X-Forwarded-Encrypted: i=1; AHgh+RrZJr1qZKzWGhSCao9yGJ3v1KaHnyiPUe+5bD7tYRCffy9vSMHCMJJOQenM6be90JT+pX3i47vOqNaS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2yUtT/l6unwlvdTn20OPq2iKrKRCCDqDLGrukfRO6vulmyscN
	oG5q450XqJZwB/HOL6eCC3m/NIVp5iw8ZnHNdCrSMw/cBXH1E+NqieUK
X-Gm-Gg: AR+sD13ApkTNN/Li2zCKuEL4+58HKazCHg/127IALT7dD9/wIU+yf5vxQTECpqEIQnZ
	mBdvXXD8oLjqLnL8vc8utelHHVY4t3h9Yikxbf0I4IUmvT4gAVzFvzxxQCoeZ3AbtV/xIvUpRCy
	n4lh/euUIAI/Zamt0jDDBMGxX3Rjs0+D+N7iGnA0xxafx1DL3IIU32HaM/vabhxL+Ct+XDLPAVv
	YkxOePEh/07qT8G7tucYefuUkIT5+1DwhsD7wkX6k7mLxA/dBeXy4mRV2GS6y1X5Akb3eC/0fba
	zyKuAqipnnlORJs3t7UF9yzoq/76lGZ57LvDpjhxuNZ2JRMfm2zTFhUNZ0JmTCOaAPmiWFjEibA
	sUSBb5zqzQ+ZZAPZeHp0sfqBlrtZktdyHQMiRXqM92emcZ/CG6eKwfeXj1gWALpfr1sZyj1UiSd
	zgKY2z92IqABzGfw/M7AHJ1Y31HrBBGfeRbOnyWwRWSzIMfPbyqMc8B031J/3Y2xo=
X-Received: by 2002:a05:6000:608:b0:47f:9662:85fe with SMTP id ffacd0b85a97d-480026c8757mr35222263f8f.16.1786390806060;
        Mon, 10 Aug 2026 12:40:06 -0700 (PDT)
Received: from antoniarch ([78.213.94.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021506cbsm39291689f8f.14.2026.08.10.12.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 12:40:05 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v4 3/9] rtc: abx80x: add mutex protection for register writes
Date: Mon, 10 Aug 2026 21:38:20 +0200
Message-ID: <20260810193826.210683-4-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260810193826.210683-1-apokusinski01@gmail.com>
References: <20260810193826.210683-1-apokusinski01@gmail.com>
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
 drivers/rtc/rtc-abx80x.c | 45 +++++++++++++++++++++++++++++++++-------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index fdf9664ebb6f..0c8d3416fd5a 100644
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
@@ -539,16 +559,18 @@ static int abx80x_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 		return put_user(tmp, (unsigned int __user *)arg);
 
 	case RTC_VL_CLR:
-		status = i2c_smbus_read_byte_data(client, ABX8XX_REG_STATUS);
-		if (status < 0)
-			return status;
+		scoped_guard(mutex, &priv->lock) {
+			status = i2c_smbus_read_byte_data(client, ABX8XX_REG_STATUS);
+			if (status < 0)
+				return status;
 
-		status &= ~ABX8XX_STATUS_BLF;
+			status &= ~ABX8XX_STATUS_BLF;
 
-		tmp = i2c_smbus_write_byte_data(client, ABX8XX_REG_STATUS,
-						status);
-		if (tmp < 0)
-			return tmp;
+			tmp = i2c_smbus_write_byte_data(client, ABX8XX_REG_STATUS,
+							status);
+			if (tmp < 0)
+				return tmp;
+		}
 
 		return 0;
 
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

