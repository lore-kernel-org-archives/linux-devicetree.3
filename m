Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139265221C7
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 20:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788813253; cv=none; b=VZqr/HbGZgKaDL8Yw5Sp/Y48MuDAfayBietl4D6O3yTgqQ1twq3OHoTbLBTA+Q3F8sfv4RuLxoWRSX++VagbB72QCQhtj/GSfFQqzd6DmI79gj8dldeqA32ZqOuLu4r+mzOzs0N4/OD75iK6lGmdqenvnohl8tP2hIxwFC1G5dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788813253; c=relaxed/simple;
	bh=Pc8AByMjSEUPU4qRRamFAyp8fdzecA/x0gsS3IoUfSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZNwbpqJ4UPEcDamaUNt4sQeZjCdAcSCiEYGI1d7XEE6u53xVZp+npXgLJGl4CQ5g+kiy7JjTff1/0eH4wQhXMmqlwXqytc1Tzh60PDg2GGVOJl8rnIGy/FbpnQLDcYfKIJyL7AzUjgGEIYka4RfD8Ue1BN1xva1vu6uCwSKeKu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tL+WdLvl; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tL+WdLvl"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-484374f54d0so2445419f8f.3
        for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 13:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788813248; x=1789418048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOxWsNxGR4Xn24fPORPxPNrQIFRGPR6rV/CUVrW8Whs=;
        b=tL+WdLvlVHeacyG7pNXCz+LBbWgzuCMfI8IL4/84KgpQPEZHpQTQW+JOwfObuzGhPE
         hD6HIBHNLfEfZgbpIRnaO2uhmred33RkG53ZoL0rZGqWdjvftK5xFclH3mFHO3W4P4hS
         XT7SJE8rLR5atiMNhuyy6kcfoc9TculGzrHFxGAn3HouzczRTU/m/IkP1LwsRV6dhokz
         YBuaxCy+R+A5MizNJKXmro0ag2xEyKzDhqDywe8d+oez72Cl+hzR2P1apSVhFahS2jXL
         cu4TBJZDNFG1Qk7z8i3gzKMEzEOzfvq0auL4n3IJqK7D0GLgRZbsGn9MR9bPiCXvek/0
         tQxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788813248; x=1789418048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AOxWsNxGR4Xn24fPORPxPNrQIFRGPR6rV/CUVrW8Whs=;
        b=BjS4BRJuo/KqUXeeU9JYjtReiabVMvW4lPW1aejtPixV4+s4nxaARCLvYl3DCydV5q
         uP5NE+ek7EOSt0al/yW7XD9MxzK8gLfo8ZZXUKX5wGMt3wVo09P41ERzpL9RYIDth/Bc
         +su+/4wiya3WZVVnSqFBbo17vfdmgsG49ZUWARNUcqM2KoVcUsnkP0D+PyOwr5pWulsw
         EvBRDE7X/1VFQ1kDwzOg8ECWuHk/Uq2araICCPiNBcpC555Ob3LXMMrEmldZn3/fYDbf
         j053xgaLF5dTK2/uA5C71UXugicAUF34gW8RDMrQTyKTt/gG8JENK4qFC53D87mrcp1H
         iMHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwMKC+GlCeRpSR6H0+pWtRqZxJoYuWd9KzkUzBpzB/b2YOu8dLbYB/uaNgC5oP9xLuswT/rmskvQrp7@vger.kernel.org
X-Gm-Message-State: AFuF++mpxpHDujgrTsKsxbf7cG0qqqb63624hnmvxbgC6QK5O2RTJlJS
	6jrQkmlGBuOh4VPCST965muMP7cgAzDkjst1Bj2S0ckMPtPCekF6Fd0d
X-Gm-Gg: AYBFou1eVt2gvIMBGCCCZK1ytg1LykJh/gr72glsODOT6OPuRHOyR0X1B5Ey3Ic1pvF
	AwIeNc/t6IuyXysR2AbPxzAcfrHW/imyAzA/Aa6ryCPdpIGRpMjM/fDmR00uWASHYDlyK4iHOmw
	+lGVsnD7qzrdhq544bkwSrtwRb+mDlVIDItfanEdwYlSxvcmNQEles/Bi8mDoyECoMwsHiqtpOY
	hR6Rt7oXRvHeXfOoMEFxoARCyzjqG3K9SDX/1rbHtsS2a83tMbu9Q5i0OkoPoMwNAw/XCCR2jk4
	O3Fu0za38wbiBkxpbzFpk5w4tPsg6OrsOB2taMdhIoeuRAvVB0fmBqs/1Qvojh2TscbnSFVy+Te
	kzOwvF8WbJQFF7w4TBFCzCs4ojvTV8qtsmmYyA3wwI4vGexuHsnCYTO+cG10N7KAFErTKBTcnlL
	6okJtCqQv9tWGvkKT3d0EG4kY+t/j3LiZKEsuA1CJiaWoP6zv5cu+rMRChQHfBmw==
X-Received: by 2002:a05:6000:420d:b0:485:8ebb:be1a with SMTP id ffacd0b85a97d-4858ebbbee4mr40491144f8f.4.1788813248126;
        Mon, 07 Sep 2026 13:34:08 -0700 (PDT)
Received: from antoniarch ([78.212.37.227])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858e239862sm25959116f8f.9.2026.09.07.13.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:34:07 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v6 4/9] rtc: abx80x: properly handle shared IRQs
Date: Mon,  7 Sep 2026 22:32:11 +0200
Message-ID: <20260907203216.53192-5-apokusinski01@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907203216.53192-1-apokusinski01@gmail.com>
References: <20260907203216.53192-1-apokusinski01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The abx80x RTC driver registers its interrupt handler with IRQF_SHARED,
but the handler always returned IRQ_HANDLED and cleared the status
register even when no interrupt source from the RTC was active.

This could cause the driver to claim interrupts belonging to other
devices sharing the same IRQ line and could also clear unrelated status
bits in the RTC status register.

Only handle the interrupt when the alarm or watchdog flags are set, and
clear only those interrupt status bits that were handled. Return
IRQ_NONE when the interrupt was not generated by the RTC.

Fixes: 718a820a303c ("rtc: abx80x: add alarm support")
Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 drivers/rtc/rtc-abx80x.c | 52 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 44de234efecf..8f9211bfb7e2 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -51,12 +51,18 @@
 #define ABX8XX_CTRL2_RSVD	BIT(5)
 
 #define ABX8XX_REG_IRQ		0x12
+#define ABX8XX_IRQ_EX1E		BIT(0)
+#define ABX8XX_IRQ_EX2E		BIT(1)
 #define ABX8XX_IRQ_AIE		BIT(2)
+#define ABX8XX_IRQ_TIE		BIT(3)
+#define ABX8XX_IRQ_BLIE		BIT(4)
 #define ABX8XX_IRQ_IM_1_4	(0x3 << 5)
 
 #define ABX8XX_REG_CD_TIMER_CTL	0x18
 
 #define ABX8XX_REG_OSC		0x1c
+#define ABX8XX_OSC_ACIE		BIT(0)
+#define ABX8XX_OSC_OFIE		BIT(1)
 #define ABX8XX_OSC_FOS		BIT(3)
 #define ABX8XX_OSC_BOS		BIT(4)
 #define ABX8XX_OSC_ACAL_512	BIT(5)
@@ -266,6 +272,7 @@ static irqreturn_t abx80x_handle_irq(int irq, void *dev_id)
 	struct i2c_client *client = dev_id;
 	struct abx80x_priv *priv = i2c_get_clientdata(client);
 	struct rtc_device *rtc = priv->rtc;
+	unsigned int status_flags_clear;
 	int status;
 
 	guard(mutex)(&priv->lock);
@@ -284,9 +291,15 @@ static irqreturn_t abx80x_handle_irq(int irq, void *dev_id)
 	if (status & ABX8XX_STATUS_WDT)
 		dev_alert(&client->dev, "watchdog timeout interrupt.\n");
 
-	i2c_smbus_write_byte_data(client, ABX8XX_REG_STATUS, 0);
+	status_flags_clear = status & (ABX8XX_STATUS_AF | ABX8XX_STATUS_WDT);
 
-	return IRQ_HANDLED;
+	if (status_flags_clear) {
+		i2c_smbus_write_byte_data(client, ABX8XX_REG_STATUS,
+					  ~status_flags_clear);
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
 }
 
 static int abx80x_read_alarm(struct device *dev, struct rtc_wkalrm *t)
@@ -952,6 +965,41 @@ static int abx80x_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
+	/* Disable unused interrupts */
+	data = i2c_smbus_read_byte_data(client, ABX8XX_REG_IRQ);
+	if (data < 0) {
+		dev_err(&client->dev, "Unable to read irq register\n");
+		return -EIO;
+	}
+
+	err = i2c_smbus_write_byte_data(client, ABX8XX_REG_IRQ,
+					data & ~(ABX8XX_IRQ_EX1E |
+						 ABX8XX_IRQ_EX2E |
+						 ABX8XX_IRQ_TIE |
+						 ABX8XX_IRQ_BLIE));
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to write irq register\n");
+		return -EIO;
+	}
+
+	data = i2c_smbus_read_byte_data(client, ABX8XX_REG_OSC);
+	if (data < 0) {
+		dev_err(&client->dev, "Unable to read Oscillator Control register\n");
+		return -EIO;
+	}
+
+	/* Unlock write access to Oscillator Control Register */
+	if (abx80x_write_config_key(client, ABX8XX_CFG_KEY_OSC) < 0)
+		return -EIO;
+
+	err = i2c_smbus_write_byte_data(client, ABX8XX_REG_OSC,
+					data & ~(ABX8XX_OSC_ACIE |
+						 ABX8XX_OSC_OFIE));
+	if (err < 0) {
+		dev_err(&client->dev, "Unable to write Oscillator Control register\n");
+		return -EIO;
+	}
+
 	if (client->irq > 0) {
 		dev_info(&client->dev, "IRQ %d supplied\n", client->irq);
 		err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
-- 
2.55.0

