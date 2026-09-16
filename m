Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC424E06FD
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 20:53:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592041; cv=none; b=ldT8TgFad2dRrxQn1uh3bTxvSojeHme9IiCmA8NjwjidO0SUUagVuA1mPjf+X0GUE8pzivuEfjyhiz4Z3dRfd/CJohvveHPP8+eZnAfdUChTzdDAAlEULxNR6TdYQzmZ9OwZ5DR59tdlSk8DGScxgKYcC1tTlENoAZNFeDZvQ3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592041; c=relaxed/simple;
	bh=gEm5kNIUAVODvt1ngQh4yFfp++uRUhaIQalJ2281BLU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J/fW0lZe1oTTakZzD8fh8fBUG1aQQvUcQVdh4zF5gcT1NYMjs+h1FIRz3Yk4mEg5Q71YiiSqJCpXDTmUW4gVW+0MFxYuWbqPE+P/+gtFJyUb1fwq7KF50ifShkXgX4DD6jADGuDJz8vsxN7HGiW7cSCUky44uyCbWZPDAtbVEE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PvWKTXZ7; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PvWKTXZ7"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485933b2522so119667f8f.0
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:53:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789592018; x=1790196818; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HY9de3s2a2HQ6JLLTz8+XgwKcZHke3p8zXjlyHlDwyU=;
        b=PvWKTXZ7lRGu1xylgyR8lbBl5TyhYfpyshc74jJ+jRoZB6EA5+RiiqmGVYrUk6wsjY
         lHjD/DofXWa9EIYYlK2mn0+v//6Q0Mn/A0wBUZhsRDv/tCKJOxaIQQrqMxcTtON5p51N
         QHeWsdWvT3MEeLqGWWcJLQVrqycimto0WHfQn+tmzQCQYOXYMhi+KHlDtQUwzu/X7O+c
         Xgw0/Ti+hiHfwD7DwrweVAJeTIgP6KmZtffL8I0b32zuieecmNPS7U0ZE3ENrZo9yjld
         UNSzXJlM0GKgZQIDhre9DrHBwkRJOd0Q0b+AzZAWsvJxBVn5bIS+ATJ8vwRbRCrzyW7V
         bHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789592018; x=1790196818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HY9de3s2a2HQ6JLLTz8+XgwKcZHke3p8zXjlyHlDwyU=;
        b=kAEZyJQ4Xbh1IfzXvtdefGmHv6lIfSyMwsI+J7VyWpQa9EimdcmNTRnJqT7keFoVeT
         HDYH+W+lZeMiRBZKo85hCpalmXAXI8Hy385CCdWOhaiA4Fa3ZkRzbyjmzQSRiJaNO3l8
         Kkt3Qhcvm6vKIscPJ5Inzl6lVRMED2Qcm4yvA3MZQD3HrHOxVOF1Kvt1sKlF2F20ILUs
         dXM7xc4bNu3+w8KfTtJd+FLa2FWnxc5wi9uCzkC/2AcIm+8m0kRMdXEaodsZlGYsp4gN
         HOoEed1g+ZIFr7kAt2amBqLT+wwfe48YUk5FkAILa5QCuVLQSruOvdZyTQf6dXPeDlOV
         OpBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwqDcCmLDCE1cbd04CP1b9A8AyCasQ/i+Xek3SQF5gkhKFdWFIMjpL9VI/r+ye2Ljf4XgxWEYmBV1d7@vger.kernel.org
X-Gm-Message-State: AFuF++m5ORea+FM12pl7kE/mbixGDUBt+AdU8ALS2qnbNr1D5oDWjOZ9
	uDvFHG0idDRC/TXL7pxpgBUL5lTKTnGowwIr5XZJ5Q6V0upMZrRNs4dN
X-Gm-Gg: AYBFou2ZoNLlnoGobA+smVkiU8Vuu1haRTRtPim6NMWKbpe2hY1J8r44/mXgmqiy5z6
	NJfZcj3R78+Gru4GaIkHFnmTouZn/eorBFHlAJxNGGFfHilJVDNoxx4qfZ7UNo6ajJu/xIUb37k
	HJ4L8564QBUf2yW4Yo7kIjSVblEQLjy9b3WzxjipOmW4badJQ9HUFFl6clunvenOYGmHRpQEo52
	B1a6qhvW2pYIhYCItjZQMnLPAQhF8O8wgvevnItWI7BpmcOyMMKsH7LTR2bjrHwY3Cz4HSmA3yt
	r+CjPvlIfdFDofNdwTUNF2wv9NqN3Rq8Cce0ADH6r/BgTZSWBUjFc16R1dJhnvd2wguUdzai14d
	hsARTY8PYvQ2bNzVidF03uPQoboiJL9+NzeCwr/8BHqTeSI0MsIWihDU6JE/OGzEyU0itYswOwV
	xl8vkh3LnqEpQKSVA3HAbXjk0p7ui5LVOafzfbgkjaeVSzk5M3AwrkvOCUNkFqKgG3FXe5qA==
X-Received: by 2002:a05:6000:410a:b0:485:ac96:7251 with SMTP id ffacd0b85a97d-4870d05876cmr10637772f8f.21.1789592017846;
        Wed, 16 Sep 2026 13:53:37 -0700 (PDT)
Received: from antoniarch ([78.210.41.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7678sm11086166f8f.2.2026.09.16.13.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:53:37 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v7 7/9] rtc: abx80x: replace read-modify-write pattern with regmap helpers
Date: Wed, 16 Sep 2026 22:51:36 +0200
Message-ID: <20260916205138.16771-8-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916205138.16771-1-apokusinski01@gmail.com>
References: <20260916205138.16771-1-apokusinski01@gmail.com>
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
 drivers/rtc/rtc-abx80x.c | 134 ++++++++++-----------------------------
 1 file changed, 34 insertions(+), 100 deletions(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index d41656a4d518..53fc788cbf96 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -232,7 +232,6 @@ static int abx80x_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	struct abx80x_priv *priv = dev_get_drvdata(dev);
 	unsigned char buf[8];
-	unsigned int flags;
 	int err;
 
 	if (tm->tm_year < 100)
@@ -257,18 +256,11 @@ static int abx80x_rtc_set_time(struct device *dev, struct rtc_time *tm)
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
@@ -378,7 +370,6 @@ static int abx80x_rtc_set_autocalibration(struct device *dev,
 {
 	struct abx80x_priv *priv = dev_get_drvdata(dev);
 	unsigned int flags = 0;
-	int retval;
 
 	if ((autocalibration != 0) && (autocalibration != 1024) &&
 	    (autocalibration != 512)) {
@@ -386,12 +377,6 @@ static int abx80x_rtc_set_autocalibration(struct device *dev,
 		return -EINVAL;
 	}
 
-	guard(mutex)(&priv->lock);
-
-	retval = regmap_read(priv->regmap, ABX8XX_REG_OSC, &flags);
-	if (retval < 0)
-		return retval;
-
 	if (autocalibration == 0) {
 		flags &= ~(ABX8XX_OSC_ACAL_512 | ABX8XX_OSC_ACAL_1024);
 	} else if (autocalibration == 1024) {
@@ -403,13 +388,15 @@ static int abx80x_rtc_set_autocalibration(struct device *dev,
 		flags |= (ABX8XX_OSC_ACAL_1024 | ABX8XX_OSC_ACAL_512);
 	}
 
+	guard(mutex)(&priv->lock);
+
 	/* Unlock write access to Oscillator Control Register */
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
@@ -473,7 +460,6 @@ static ssize_t oscillator_store(struct device *dev,
 {
 	struct abx80x_priv *priv = dev_get_drvdata(dev->parent);
 	int retval, rc_mode = 0;
-	unsigned int flags;
 
 	if (strncmp(buf, "rc", 2) == 0) {
 		rc_mode = 1;
@@ -486,24 +472,14 @@ static ssize_t oscillator_store(struct device *dev,
 
 	guard(mutex)(&priv->lock);
 
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
@@ -573,18 +549,11 @@ static int abx80x_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 
 	case RTC_VL_CLR:
 		scoped_guard(mutex, &priv->lock) {
-			err = regmap_read(priv->regmap, ABX8XX_REG_STATUS, &status);
-			if (err < 0)
-				return err;
-
-			status &= ~ABX8XX_STATUS_BLF;
-
-			err = regmap_write(priv->regmap, ABX8XX_REG_STATUS, status);
-			if (err < 0)
-				return err;
+			err = regmap_update_bits(priv->regmap, ABX8XX_REG_STATUS,
+						 ABX8XX_STATUS_BLF, 0);
 		}
 
-		return 0;
+		return err;
 
 	default:
 		return -ENOIOCTLCMD;
@@ -841,7 +810,6 @@ static int abx80x_probe(struct i2c_client *client)
 	struct device_node *np = client->dev.of_node;
 	struct abx80x_priv *priv;
 	int i, err, trickle_cfg = -EINVAL;
-	unsigned int data;
 	char buf[7];
 	unsigned int part = (uintptr_t)i2c_get_match_data(client);
 	unsigned int partnumber;
@@ -891,14 +859,9 @@ static int abx80x_probe(struct i2c_client *client)
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
@@ -912,30 +875,10 @@ static int abx80x_probe(struct i2c_client *client)
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
 
@@ -946,8 +889,14 @@ static int abx80x_probe(struct i2c_client *client)
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
@@ -988,25 +937,11 @@ static int abx80x_probe(struct i2c_client *client)
 		return err;
 
 	/* Disable unused interrupts */
-	err = regmap_read(regmap, ABX8XX_REG_IRQ, &data);
-	if (err < 0) {
-		dev_err(&client->dev, "Unable to read irq register\n");
-		return -EIO;
-	}
-
-	err = regmap_write(regmap, ABX8XX_REG_IRQ,
-			   data & ~(ABX8XX_IRQ_EX1E |
-				    ABX8XX_IRQ_EX2E |
-				    ABX8XX_IRQ_TIE |
-				    ABX8XX_IRQ_BLIE));
-	if (err < 0) {
-		dev_err(&client->dev, "Unable to write irq register\n");
-		return -EIO;
-	}
-
-	err = regmap_read(regmap, ABX8XX_REG_OSC, &data);
+	err = regmap_update_bits(regmap, ABX8XX_REG_IRQ,
+				 ABX8XX_IRQ_EX1E | ABX8XX_IRQ_EX2E |
+				 ABX8XX_IRQ_TIE | ABX8XX_IRQ_BLIE, 0);
 	if (err < 0) {
-		dev_err(&client->dev, "Unable to read Oscillator Control register\n");
+		dev_err(&client->dev, "Unable to update irq register\n");
 		return -EIO;
 	}
 
@@ -1014,11 +949,10 @@ static int abx80x_probe(struct i2c_client *client)
 	if (abx80x_write_config_key(client, ABX8XX_CFG_KEY_OSC) < 0)
 		return -EIO;
 
-	err = regmap_write(regmap, ABX8XX_REG_OSC,
-			   data & ~(ABX8XX_OSC_ACIE |
-				    ABX8XX_OSC_OFIE));
+	err = regmap_write_bits(regmap, ABX8XX_REG_OSC,
+				ABX8XX_OSC_ACIE | ABX8XX_OSC_OFIE, 0);
 	if (err < 0) {
-		dev_err(&client->dev, "Unable to write Oscillator Control register\n");
+		dev_err(&client->dev, "Unable to update Oscillator Control register\n");
 		return -EIO;
 	}
 
-- 
2.55.0

