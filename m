Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2492540BCAB
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 20:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784750456; cv=none; b=ekDKH4EAXgH6/chBULIvY5i5mTUlXOpecN0u3E6iRDVjCw17LcDXfp+iVB5HBl80V2qSINJZ1gQudltpbY85sPjvgdugRxlR579J81EMlvt7J8QCXUmzD2ssh2ZRqeeZoIBODcozTnCmlcNB+mh1zXF85c85QNK0WdmUZ4omKng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784750456; c=relaxed/simple;
	bh=qMJGANLLeJN5aJYGLw3k+K4atK9jwtSuuysXt9++2WU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l/81vFrO9TqXlPdii23L/RA4bPW3vEk+hd5JlKl4zP511edf1AMfX5IMeKYXFgz8xd0ctBo+IoUQyI7b7+sQJB+4mRnMXY8cfd3giUs0vXegkQgeU4o9bXsVlL70IjAgk3lyfQDLVnNUgIIznRrGzn8Pa2QfCf+3soPdqP9v6Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GtKiIsoS; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtKiIsoS"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-476a130c138so9454001f8f.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784750450; x=1785355250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OTMGum6yp7PCDuuQ58Six53iQI5SthybixPx4tQNUyI=;
        b=GtKiIsoSwQU4V7vvJ3Uv238aAEHPaZpT9FoY9Obif9nBkLrQ6RrvxYzEqNechKzqYo
         JIJmthMh6BI/enf+uGcSmrrsRsUrNWJ7rar7dbpCPw2cj7/0/aWkWziDMwsSOuiAcVj7
         OPp+8CbjWii+TF8F1yWJowvkN17d8Kr+XiACRcYVsKzRR2E6UMkUlSABvfiVeDnmcnR+
         MXxvbIM4raqkvuBYosQ2djcUQ1HeVXBEmR430EPFUyDi5M12jXdhz8/p0iBY4cK/JQou
         CqPhsRcx/HsU5wahe/LboAi8zEVSUtbTWiEeJ6QD1SRZPn6BLx3mAtmnN6pDRW4w/B90
         reig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784750450; x=1785355250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OTMGum6yp7PCDuuQ58Six53iQI5SthybixPx4tQNUyI=;
        b=s0C+eKynJW2HiJPxdxHKZHnJD8SwFDkFgFQj6AqsXEFkA/0caK1p/5NsAksHcI2XdU
         J6PnDpm+IgRR73NRt/go3pa6nbYRSkjt/LaTx6radEGUhG3EYWpa5+MLtP5VTkiyZRcF
         1M/w9YgMPHceU0JEfmLid3c8i2QBUpaBzqkBzWkrCxjzYjUKPnm7FKpk1FEnJ1D7pKT/
         9M3akaJ/92fjkwchprk0tq6CFYL/Sl24ab8g6WA3jVwR7J/At3pml6w9zkghCdl74H5C
         Sm7P3yUwJX1iv4PsbYOqOVi+RJJAA6AqabP6ndi1wrLkCB8uOGmrXc+CmUyIMfh2CGlC
         cyyA==
X-Forwarded-Encrypted: i=1; AHgh+RpF9gb/9I8PjR73nOKThvmjYCRjzg+Kj3SDBXx5NaOIKMYjPXn7h/GsZqICfYIktuPby5k0CsRu3Mzw@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ6wJG3zaEzjEK5JwFyyjDdLVJSSq2lEqV1jNr2nmyE8U/60hD
	65dErejR7qC3FwUf2F7erGZhBPde3EOhWHHl1zahzF5hVDmX45LZuDDK
X-Gm-Gg: AR+sD13J1oPmIGya9RFKUz9Zp2HQIZFgHEow33EI2cG3YKB2ClfDtAY+sQuMEPliuHc
	g+nzyOdxW6bUeFVUbSsXt1WLEz9jTICRx/9AetN/wbygZfs1kM4MJ7YlUH+Xmrj5Rtme1JkS3p3
	OZ8janB9Npja7ZrwGbRBAAUrvY/0ZY5mf1US2u1F9Ge0Nh9+dcStojvdHkaldn0txA7utof8oND
	BHXYOJyNVHUxSQwHUEYNlStc81Rk+4VPOZotKPreTfsOdQSXhKNFJ1eT8xDdDzqF1f/I6Pg8Voz
	cJI+nf3htcQgwiMTkq6UQ+MmWhDK+YvrwbqFU2j/mOhTc/mGSXpfDMIBz3kjbNi/5DqcO8UG3ID
	CH9XMsafi++Sh5/UD+YcXVQ+E6d5zGsRP4PR8RHbggLDzwqL/codEXGWY4wzUpFwKogbyFYfxlq
	XQg+hvMQ==
X-Received: by 2002:a05:6000:18a2:b0:47f:7531:3e6d with SMTP id ffacd0b85a97d-47f8dc8cc77mr289835f8f.38.1784750449660;
        Wed, 22 Jul 2026 13:00:49 -0700 (PDT)
Received: from antoniarch ([78.210.252.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm9532851f8f.20.2026.07.22.13.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:00:49 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH 4/6] rtc: abx80x: replace read-modify-write pattern with regmap helpers
Date: Wed, 22 Jul 2026 21:58:12 +0200
Message-ID: <20260722195814.298552-5-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722195814.298552-1-apokusinski01@gmail.com>
References: <20260722195814.298552-1-apokusinski01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before introducing the regmap usage in the driver, updating specific
bits of a register was performed using the read-modify-write pattern.
Now, the functions regmap_update_bits() and regmap_write_bits() can
be used to simplify the code.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 drivers/rtc/rtc-abx80x.c | 105 +++++++++++----------------------------
 1 file changed, 28 insertions(+), 77 deletions(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index e5ba821a6768..7761cb353994 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -222,7 +222,7 @@ static int abx80x_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	struct abx80x_priv *priv = dev_get_drvdata(dev);
 	unsigned char buf[8];
-	int err, flags;
+	int err;
 
 	if (tm->tm_year < 100)
 		return -EINVAL;
@@ -244,18 +244,11 @@ static int abx80x_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	}
 
 	/* Clear the OF bit of Oscillator Status Register */
-	err = regmap_read(priv->regmap, ABX8XX_REG_OSS, &flags);
+	err = regmap_update_bits(priv->regmap, ABX8XX_REG_OSS, ABX8XX_OSS_OF, 0);
 	if (err < 0)
-		return err;
-
-	err = regmap_write(priv->regmap, ABX8XX_REG_OSS,
-			   flags & ~ABX8XX_OSS_OF);
-	if (err < 0) {
 		dev_err(dev, "Unable to write oscillator status register\n");
-		return err;
-	}
 
-	return 0;
+	return err;
 }
 
 static irqreturn_t abx80x_handle_irq(int irq, void *dev_id)
@@ -352,7 +345,7 @@ static int abx80x_rtc_set_autocalibration(struct device *dev,
 					  int autocalibration)
 {
 	struct abx80x_priv *priv = dev_get_drvdata(dev);
-	int retval, flags = 0;
+	int flags = 0;
 
 	if ((autocalibration != 0) && (autocalibration != 1024) &&
 	    (autocalibration != 512)) {
@@ -360,10 +353,6 @@ static int abx80x_rtc_set_autocalibration(struct device *dev,
 		return -EINVAL;
 	}
 
-	retval = regmap_read(priv->regmap, ABX8XX_REG_OSC, &flags);
-	if (retval < 0)
-		return retval;
-
 	if (autocalibration == 0) {
 		flags &= ~(ABX8XX_OSC_ACAL_512 | ABX8XX_OSC_ACAL_1024);
 	} else if (autocalibration == 1024) {
@@ -379,9 +368,9 @@ static int abx80x_rtc_set_autocalibration(struct device *dev,
 	if (abx80x_write_config_key(dev, ABX8XX_CFG_KEY_OSC) < 0)
 		return -EIO;
 
-	retval = regmap_write(priv->regmap, ABX8XX_REG_OSC, flags);
-
-	return retval;
+	return regmap_write_bits(priv->regmap, ABX8XX_REG_OSC,
+				 ABX8XX_OSC_ACAL_1024 | ABX8XX_OSC_ACAL_512,
+				 flags);
 }
 
 static int abx80x_rtc_get_autocalibration(struct device *dev)
@@ -443,7 +432,7 @@ static ssize_t oscillator_store(struct device *dev,
 				const char *buf, size_t count)
 {
 	struct abx80x_priv *priv = dev_get_drvdata(dev->parent);
-	int retval, flags, rc_mode = 0;
+	int retval, rc_mode = 0;
 
 	if (strncmp(buf, "rc", 2) == 0) {
 		rc_mode = 1;
@@ -454,24 +443,14 @@ static ssize_t oscillator_store(struct device *dev,
 		return -EINVAL;
 	}
 
-	retval = regmap_read(priv->regmap, ABX8XX_REG_OSC, &flags);
-	if (retval < 0)
-		return retval;
-
-	if (rc_mode == 0)
-		flags &= ~(ABX8XX_OSC_OSEL);
-	else
-		flags |= (ABX8XX_OSC_OSEL);
-
 	/* Unlock write access on Oscillator Control register */
 	if (abx80x_write_config_key(dev->parent, ABX8XX_CFG_KEY_OSC) < 0)
 		return -EIO;
 
-	retval = regmap_write(priv->regmap, ABX8XX_REG_OSC, flags);
-	if (retval < 0) {
+	retval = regmap_write_bits(priv->regmap, ABX8XX_REG_OSC, ABX8XX_OSC_OSEL,
+				   rc_mode == 0 ? 0 : (ABX8XX_OSC_OSEL));
+	if (retval < 0)
 		dev_err(dev, "Failed to write Oscillator Control register\n");
-		return retval;
-	}
 
 	return retval ? retval : count;
 }
@@ -537,17 +516,8 @@ static int abx80x_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 		return put_user(tmp, (unsigned int __user *)arg);
 
 	case RTC_VL_CLR:
-		err = regmap_read(priv->regmap, ABX8XX_REG_STATUS, &status);
-		if (err < 0)
-			return err;
-
-		status &= ~ABX8XX_STATUS_BLF;
-
-		err = regmap_write(priv->regmap, ABX8XX_REG_STATUS, status);
-		if (err < 0)
-			return err;
-
-		return 0;
+		return regmap_update_bits(priv->regmap, ABX8XX_REG_STATUS,
+					  ABX8XX_STATUS_BLF, 0);
 
 	default:
 		return -ENOIOCTLCMD;
@@ -799,7 +769,7 @@ static int abx80x_probe(struct i2c_client *client)
 	struct regmap *regmap;
 	struct device_node *np = client->dev.of_node;
 	struct abx80x_priv *priv;
-	int i, data, err, trickle_cfg = -EINVAL;
+	int i, err, trickle_cfg = -EINVAL;
 	char buf[7];
 	unsigned int part = (uintptr_t)i2c_get_match_data(client);
 	unsigned int partnumber;
@@ -846,14 +816,9 @@ static int abx80x_probe(struct i2c_client *client)
 	dev_info(&client->dev, "model %04x, revision %u.%u, lot %x, wafer %x, uid %x\n",
 		 partnumber, majrev, minrev, lot, wafer, uid);
 
-	err = regmap_read(regmap, ABX8XX_REG_CTRL1, &data);
-	if (err < 0) {
-		dev_err(&client->dev, "Unable to read control register\n");
-		return -EIO;
-	}
-
-	err = regmap_write(regmap, ABX8XX_REG_CTRL1,
-			   (data & ~(ABX8XX_CTRL_12_24 | ABX8XX_CTRL_ARST)) | ABX8XX_CTRL_WRITE);
+	err = regmap_update_bits(regmap, ABX8XX_REG_CTRL1,
+				 ABX8XX_CTRL_12_24 | ABX8XX_CTRL_ARST | ABX8XX_CTRL_WRITE,
+				 ABX8XX_CTRL_WRITE);
 	if (err < 0) {
 		dev_err(&client->dev, "Unable to write control register\n");
 		return -EIO;
@@ -867,30 +832,10 @@ static int abx80x_probe(struct i2c_client *client)
 		 * register is set. RV-1805-C3 datasheet indicates that
 		 * the bit should be cleared in section 11h - Control2.
 		 */
-		err = regmap_read(regmap, ABX8XX_REG_CTRL2, &data);
-		if (err < 0) {
-			dev_err(&client->dev,
-				"Unable to read control2 register\n");
-			return -EIO;
-		}
-
-		err = regmap_write(regmap, ABX8XX_REG_CTRL2,
-				   data & ~ABX8XX_CTRL2_RSVD);
-		if (err < 0) {
-			dev_err(&client->dev,
-				"Unable to write control2 register\n");
-			return -EIO;
-		}
-
-		/*
-		 * Avoid extra power leakage. The RV1805 uses smaller
-		 * 10pin package and the EXTI input is not present.
-		 * Disable it to avoid leakage.
-		 */
-		err = regmap_read(regmap, ABX8XX_REG_OUT_CTRL, &data);
+		err = regmap_update_bits(regmap, ABX8XX_REG_CTRL2,
+					 ABX8XX_CTRL2_RSVD, 0);
 		if (err < 0) {
-			dev_err(&client->dev,
-				"Unable to read output control register\n");
+			dev_err(&client->dev, "Unable to write control2 register\n");
 			return -EIO;
 		}
 
@@ -901,8 +846,14 @@ static int abx80x_probe(struct i2c_client *client)
 		if (abx80x_write_config_key(&client->dev, ABX8XX_CFG_KEY_MISC) < 0)
 			return -EIO;
 
-		err = regmap_write(regmap, ABX8XX_REG_OUT_CTRL,
-				   data | ABX8XX_OUT_CTRL_EXDS);
+		/*
+		 * Avoid extra power leakage. The RV1805 uses smaller
+		 * 10pin package and the EXTI input is not present.
+		 * Disable it to avoid leakage.
+		 */
+		err = regmap_write_bits(regmap, ABX8XX_REG_OUT_CTRL,
+					ABX8XX_OUT_CTRL_EXDS,
+					ABX8XX_OUT_CTRL_EXDS);
 		if (err < 0) {
 			dev_err(&client->dev,
 				"Unable to write output control register\n");
-- 
2.55.0

