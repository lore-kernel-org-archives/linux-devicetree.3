Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD67479897
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 19:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786477353; cv=none; b=oFGEp1A5djfXeQ25ATONxRJpuLbWUjDgIt4bhOolEVhK5SBViY6hiQpop9+TghkM8jBU1y4timLW29vXflNUFGI2VbH37TImWakdig/h4qvyeLoJFqcZfDmibSpNA+GuU+j7Fezh+OqscROEBpNkrI+KC9E+zV5f1i2IEvoV0bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786477353; c=relaxed/simple;
	bh=7zftsifT1TeOCwtPU5cqKvqhs764DJUWLd8kYg26RIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nrr+xcOK/VyXIc2X4u0Fk1MAovUfpquYHR9bKqRmyA5+TS6QXySgKa2RL2aPoGV2+rRrpsTGVjjynEjuPet9hHNqYqHo7Fao+ZG4HnwTswhGjgyV4UQ0D+TpSMDBafPCM7krQZNwuRthf5b1i0o9JvPpVe4zK5mWw8FLnWIZV1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C4mnptJc; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C4mnptJc"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4956869750eso922035e9.2
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 12:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786477348; x=1787082148; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Km3JbJM3tHI5y78m8g9L0NcliILGFksyyeAC4KOBDJY=;
        b=C4mnptJct4IlgE3gUwy91DHCBPT31w/3u8NPEEFdtPHa8c46azdtMdMYjkQYptmQtL
         /2ocncWYkPewsg26XtDdX4v4fXJCXcWOCLzcB3rOY1+cEdC+jsZg7T/Rgr8vREGjEQgn
         Idchy5xOVdquyJATS1/M25efpfG+Ar8vG7uc5GxbGZRQVCA53knfu9nGoi3XB6MbLqfk
         PVjxC/NVJFyUZEpKnX7xF59o5psoJGp90pu/UVOTyidvkMSfO3OP++A4lk9yJy9oi0ay
         hufrXThK/One3Uu3GJkOEh33qWLYV/Ke2VYmLL4KAqKsqMDuxYoEMRgc/6ZJE8gheH1T
         DdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786477348; x=1787082148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Km3JbJM3tHI5y78m8g9L0NcliILGFksyyeAC4KOBDJY=;
        b=HetVasiFvs7ZVOmTLgblspkNxvWSx+7PvoldTs2ChYAX0/V6e0c9GekokwfS8jc8K8
         BG19OlHETOlS8T6go7hF0Y9b9oSe0dcgzQ0OdwNd4tVFic4ioMw/P8l+LBbHDSrqUgfP
         0bAKO0YXJAKk2c+XlrM0b6g9tf8+Xrx9d2O+v3QaKICz54fRfhavJNFBgHvMgIhvJCQT
         EZUipuPkEqNJPJtBTm+l+zd/Z1oji/3Wd5KCYCNq9HrGzeXRJnBlM1gl/Olj8z4lJe69
         DJpI84OPBQuwGnn/3In2999UqXoCJO8My3unZvCCLmIdOfi3HeY9L8DIh6h5V2k1zAzZ
         x3zw==
X-Forwarded-Encrypted: i=1; AHgh+RrwIyHVUAXcmzsMjCQ9MqWt5Nt4VQgX3hJkghQgIpIbmBbeDh0c7BAIFBGHOW/cD6G/d5Dv10XsUmoq@vger.kernel.org
X-Gm-Message-State: AOJu0YxBZvHgFVUA3S9K3kW6fsKxnZHUpfzU3rKDPdGRLUELHyFKt9bS
	RMl+DGetdH75eycoEPV4PdIKcm0pizwk/7fLpVbXaeHmcsX7NhZhl8+x2LA+Nw==
X-Gm-Gg: AR+sD12dlXVbSof9tFxxR3/OUBPtv9rqY6Ogom+I8x8PAAK/e3aPvAlC8/EZPXaEGga
	ZJ8d9TIQbeb1xKmScPpP5V5ba2cao4sLjbE1lFlLpEyZajUSZnV6wzTaIeVPXxItZ7nrUqFcfGD
	0HftfJlGy7h0cqQweHkVZaih7q0oo96UQKsribwGO/y/kreYy+roVAQBttZtad3YdAmEja9I9qw
	SG52gLBNpRAoYdvC3A1HhE2dP130GkUm1Hs8n3EWKNeyKoUPl5r8qAXRG4m3FvDd5i7FuharIej
	M26vnBV9XKMaCvjOk7+t44eZkGzY3vrEXzbOT1xn+ZzhP3buA49hN6CGRVLnBw7vPansNT/ZrGv
	A+Ff2S7TVNDlJaMDmvtHohIhqUqbz7OJ+3Xlkih5Uhg156TpgHwPADEoZ0efELFjnEklR1+Gbrc
	oHbMtK7Z6gtG+1Fe9manVRqT97qUrVuceht63gsl7oMKc3+erTGprFPeDiMHX3paVW
X-Received: by 2002:a05:600c:1d02:b0:496:b3a0:1cfe with SMTP id 5b1f17b1804b1-4997845f3femr88998265e9.12.1786477347680;
        Tue, 11 Aug 2026 12:42:27 -0700 (PDT)
Received: from antoniarch ([78.213.143.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997b22784fsm2606535e9.2.2026.08.11.12.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 12:42:27 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v5 7/9] rtc: abx80x: replace read-modify-write pattern with regmap helpers
Date: Tue, 11 Aug 2026 21:40:32 +0200
Message-ID: <20260811194034.28937-8-apokusinski01@gmail.com>
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

Before introducing the regmap usage in the driver, updating specific
bits of a register was performed using the read-modify-write pattern.
Now, the functions regmap_update_bits() and regmap_write_bits() can
be used to simplify the code.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 drivers/rtc/rtc-abx80x.c | 135 ++++++++++-----------------------------
 1 file changed, 35 insertions(+), 100 deletions(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 5d41882f3c70..ab88af43b4fa 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -232,7 +232,7 @@ static int abx80x_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	struct abx80x_priv *priv = dev_get_drvdata(dev);
 	unsigned char buf[8];
-	int err, flags;
+	int err;
 
 	if (tm->tm_year < 100)
 		return -EINVAL;
@@ -256,18 +256,11 @@ static int abx80x_rtc_set_time(struct device *dev, struct rtc_time *tm)
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
@@ -378,7 +371,6 @@ static int abx80x_rtc_set_autocalibration(struct device *dev,
 {
 	struct abx80x_priv *priv = dev_get_drvdata(dev);
 	unsigned int flags = 0;
-	int retval;
 
 	if ((autocalibration != 0) && (autocalibration != 1024) &&
 	    (autocalibration != 512)) {
@@ -386,12 +378,6 @@ static int abx80x_rtc_set_autocalibration(struct device *dev,
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
@@ -403,13 +389,15 @@ static int abx80x_rtc_set_autocalibration(struct device *dev,
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
@@ -473,7 +461,6 @@ static ssize_t oscillator_store(struct device *dev,
 {
 	struct abx80x_priv *priv = dev_get_drvdata(dev->parent);
 	int retval, rc_mode = 0;
-	unsigned int flags;
 
 	if (strncmp(buf, "rc", 2) == 0) {
 		rc_mode = 1;
@@ -486,24 +473,14 @@ static ssize_t oscillator_store(struct device *dev,
 
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
@@ -573,18 +550,11 @@ static int abx80x_ioctl(struct device *dev, unsigned int cmd, unsigned long arg)
 
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
@@ -841,7 +811,6 @@ static int abx80x_probe(struct i2c_client *client)
 	struct device_node *np = client->dev.of_node;
 	struct abx80x_priv *priv;
 	int i, err, trickle_cfg = -EINVAL;
-	unsigned int data;
 	char buf[7];
 	unsigned int part = (uintptr_t)i2c_get_match_data(client);
 	unsigned int partnumber;
@@ -891,14 +860,9 @@ static int abx80x_probe(struct i2c_client *client)
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
@@ -912,30 +876,10 @@ static int abx80x_probe(struct i2c_client *client)
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
 
@@ -946,8 +890,14 @@ static int abx80x_probe(struct i2c_client *client)
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
@@ -998,33 +948,18 @@ static int abx80x_probe(struct i2c_client *client)
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
 
-	err = regmap_write(regmap, ABX8XX_REG_OSC,
-			   data & ~(ABX8XX_OSC_ACIE |
-				    ABX8XX_OSC_OFIE));
+	err = regmap_update_bits(regmap, ABX8XX_REG_OSC,
+				 ABX8XX_OSC_ACIE | ABX8XX_OSC_OFIE, 0);
 	if (err < 0) {
-		dev_err(&client->dev, "Unable to write Oscillator Control register\n");
+		dev_err(&client->dev, "Unable to update Oscillator Control register\n");
 		return -EIO;
 	}
 
-- 
2.55.0

