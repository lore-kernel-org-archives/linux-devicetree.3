Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E992547729E
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 19:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786477346; cv=none; b=PA0Kp1MMvLBxzgqq0oBOy2mlaykI731Iz5kWJBfrKRoCjNQWpN5NKUSvrTScoMthd39bv47J9ysB/igk01nZXZABy1L/EPdGm53xAgSvg4X4PrYxGbbLwNOJRYabK4x1OwInwEOPnm0Uw0uwxU7WpBrulUjaV2jHr3+DvFmqkV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786477346; c=relaxed/simple;
	bh=p25ogiM2Sa8dkypvVtSH6kxWkficJn5eIY7C0S2Bxg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qSh58Nkxqc/eEtedkux07wCw5bZdz4qbXNL5uiW6gj+uKKLAHXw3ZCYN6J7iXHR8dVCJAoi8zmHN0ak28LGuJqiFRchfzCLVe9k8WdKMo9mGpoLJnNEZUPBwXNqfGJ28X+VvhS8kZSGed1Ga4tw3Zm9DfqpDcQFRYBWpH000/dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pTk5fbZP; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pTk5fbZP"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4954df200ddso1196645e9.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 12:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786477342; x=1787082142; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cJn7ePOsurTlt5ccE+gZ6P4uZZ4odFFp/lRiM7gv8dM=;
        b=pTk5fbZPsQpstlfgPL/3DlgIz1MuygqnL+Z4caDmgyugtWAVtaFkXnVMsrYDZwUfvc
         oHDDq5WAPp4ImqP0blIyArHffrLcSd3z30CewANGrF6HWWOx0jZNFHqFRKc6+bpeE/0X
         vbTZAQTytCIrHn3fe6ZhXnn6vm4BNJD71uMKoaA5x31h1O4L471TuFYDYlcfW+wb2Psb
         WybbzLCpbEtJL4hCQ6259vUuWFdgHzy7Y32GqLgidU/oeELi6kCfUFqVKm4PgGsWlSM1
         cUCp0nJAuVfToGvGKErl0xALd67DDhGn7jBGSQ9XAHI9tEUdqucYrOiTJAst7yeOLbRP
         oXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786477342; x=1787082142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cJn7ePOsurTlt5ccE+gZ6P4uZZ4odFFp/lRiM7gv8dM=;
        b=GXv+u+1IZuzDi1NnURkd//jYHJnsUpc3au00ULqiVLOhIA3uCfBvbF/Cpoe/I6RYUM
         4nCZICP7QGLnWRJWk7ZzqtFO2ObnEsH7WV+IvWktgG/NqxGj2TqysA7s/JRa4L9tmtF0
         zgEOY+9k+eC7BNmnd35jJfS3HFAvDCodWmkz0ERC8+hMCNjAGYZQf8JHD/ZomPbnUNMn
         OjxWZbzLTcI/FrxsD6NzTXWpnCNwX48Rmb3DQt89JaXnpk/A1+QAf++jveAefWmqIr/V
         Jd+Hs2O2KQLQ7ctWVRJpszQRIrosx5SmDPX78yTMu86dDEEjotkBO5g+PQVjxI5guwyC
         5nZA==
X-Forwarded-Encrypted: i=1; AHgh+RoRqjNNzNxd29NvEsxR5QrmFRFS4AUEC40ertV2LAzsLopVddSEpRpKXxFEQttrAtfA8sxxvwXTTtin@vger.kernel.org
X-Gm-Message-State: AOJu0YyxYP5Sr/1tMcTUy7emx9EZWWLgycLVwWNsFsg/+PPMsMFkP/mv
	2DDAk4c8Cr0Ntc8c8oQSsLWVmx05z9VJAeCatC/aGbem05Fzp3RVYklL
X-Gm-Gg: AR+sD137whSSjoIiFD/+AEN5QRIPwr/y/ItuVF1iw6BNg11glLbiJUpadSHDD8Cu8Vg
	0hZx22DO/z40ebJevIYniJ85bUj08QxvZUPW6md3EWE1goVna3L1X5kEsGMii4vteuu0k1z3tXq
	jpI6I9bUaAvk2URPm7yXSAdwuW2985h0p7HvAFUFndfpohdQzagq2ZS6J2MwR0rvHgbsxIptnUo
	VH40Vp8/iJyzk4XgqhfgDbDRwgepFl/Y9bQ82noaEheXXqOGpSb3I0yx0hLAN2TPpHq9RBiVRV0
	rMOd06SdPbHIKG/ZBYxuz5Db2UAoXuSYRMERANS4pncLCxb7naAiohssG4KcRq/9MTxuQLYjFyY
	dMUybbqBgtONQEQ7M/fjF9gCZzgP3DhTB46ZzRXu45Oz9f5bvBjsOemcNxl9meO+JZynAgFGKcS
	CKdU3/Z6E7UumO4ugo0frKZA49YdzQziS591ZNaxlPRh6lsAJRr16/gzk/VBhdEJfwUibu4M/nx
	Cs=
X-Received: by 2002:a05:600c:154c:b0:499:79b9:e226 with SMTP id 5b1f17b1804b1-49979b9e359mr45810255e9.0.1786477341678;
        Tue, 11 Aug 2026 12:42:21 -0700 (PDT)
Received: from antoniarch ([78.213.143.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997b22784fsm2606535e9.2.2026.08.11.12.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 12:42:21 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v5 3/9] rtc: abx80x: add mutex protection for register writes
Date: Tue, 11 Aug 2026 21:40:28 +0200
Message-ID: <20260811194034.28937-4-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260811194034.28937-1-apokusinski01@gmail.com>
References: <20260811194034.28937-1-apokusinski01@gmail.com>
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

