Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD57B4DE711
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 20:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592021; cv=none; b=Ckg7i6G+9q5B0DlZCpMDPjz7BUBxCTaKkiSnIf1/LiZflZASxqHzVKWj5QGur79eCqRb0ctAI6ui6Qj/1zsz5wybfpRc8dNtK40Rg5cU/mW/o0KXyW6t1BNOr8nPZwFYJtZbzegMB1D8ZCLrH6N0BraKxLT67c7YkIIzUAZUToI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592021; c=relaxed/simple;
	bh=pI6wT2AVh5yAvV66BledWhgr6biNtXsQP6dV0Cf2EOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r5Zuxbq9W3h+yTts/pIHGGlW0az4m9ZTUoBe7fqtiwgc2WRoNjXo37av+peed7QNoSDExMNnWwoIufcbGmlAZ3yvJZVhPkfYsOXaVRe8r5l8jOwz03gaYrFDDyqH9SHHFjhHCJkQ5qqE+0hCg3tjeiG45ia0GX/UO9RtaxdLbSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qWCLFauk; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qWCLFauk"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f633ecdeso154008f8f.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789592013; x=1790196813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vQCQCsXRyOMK2lxbcg+U/XVY1PZxvpDAiiCFQ6+e0aY=;
        b=qWCLFauku+QrSmjWXbodOKbkW7XrPKG5pYD61LeUZK9V8LLDFhCYpaboZO3hnIbCw9
         WdqPMlnpEC4v6PsRBm+MDwlmde7K4rpki7vmjKsW27IxNaL+RkSpplZeCemt3Kr9PiyA
         QYoXDLpgutSonA/1rdhMonvWl1XsZY1iZsd2Bt0bARNULBonTUEG4MoQTDosNkqKYnNS
         jFaDnUraHYWQ71nqUa/ZM2+QvspnLec37/qfmcE2lGP9j4SkxiHqHJaemRYwstJ7fdM5
         3kE9IFl1IK8qETf6cWrAqv/5zBexGW5O/MLOXpbwbKMWr5GEiagpX4BupcO929luz7cA
         lw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789592013; x=1790196813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vQCQCsXRyOMK2lxbcg+U/XVY1PZxvpDAiiCFQ6+e0aY=;
        b=IbgyKYxMf4z2rfo+7539ynX1ZeOL2kNfo8VuADKqHWtMEw+R3r8OJ54/mx6PjQOn9N
         45OVPLv5xLuT7h6h7yv0HV5KSGXawDI71wgiR4KSbMl7TEKsxlPyfWw6G+Iqla/PF/Gy
         LCh7bR3MMzLlv41D0zzxWN+7dKvGzwyxdNvd8QQMHEELJ+gau0PCa/mhu0JuLMIWhtNN
         ENpM7ZilxN9uR3c3KedSQ7IKDagH2P7yJyZgoQ75iK7dza+6th63eHLaJzYSgYx4uKmH
         Cc/VJ/PiFJ7ydn3xlT9EHWTSYK6J+mNwq/Tzgf8yJcaHhkOn+I4QnvybS8Gt/wjNfG31
         2vsA==
X-Forwarded-Encrypted: i=1; AKwUvBzSV9yLgLUdv3RbBbeLEbOcHQV5fc+wXvpjOAPj1dZU7MuB3vcI832xq5TEkpHAvMXEVQmDwkXsj6N3@vger.kernel.org
X-Gm-Message-State: AFuF++naEi1V/WPJwvRsvdZI6j0hvx6AoadEUlqbIX9zdXpxfzXOuADn
	Fq5Jo/XWZbggtHLKgVPXtWtU199vUznmhz//tnqkkJ36DoVNjYFYmnNy
X-Gm-Gg: AYBFou1OxNF3xkeVI3OcRP6nWuF+fSPiEPGV+BE6VVg1wMpPNFJwRjHy1uNCjtxOV/e
	3TCuir935JywatnQpfy4I2yV+YZ//WPs4eyfCpxkBrBt63/sVtRPC3Sxn8Y9BtwlQSVd6fxR31G
	3gvox+h2IYAWlKb+gSjKW7k66zqa4GdmXvdZLPdEgqQ4N2uj6GSfrM9RJ71J1iIfK6ixhhsk98T
	wbzqeD4FAvsC5kwzDroVbI/n/rfMrWDXC9VYbQqtYb0YdYRU3oFpal7K6z+74R9AgbIES5Onwye
	LDFQJZn8pwfKGRWKRDIcYWY9mErOGwbNRk3wYsgMlhwb8OH58Q9HPo0AaPavac86pJtln+hnOTT
	W18b6lGTX3jP8QfV+58vlQiYgFXiKV+B/yGdWV29LffuwxPwPHWDUmJ0wkFd2q+9ldduRGT+reU
	Gfj7DPkDJ+qSAKi0cJvSRl9nRaejJu1t9WLJoeSu3L1exdUH7pFaKFy4erqUV02JWzXkXnmQ==
X-Received: by 2002:a05:6000:1a8b:b0:486:fed8:8710 with SMTP id ffacd0b85a97d-4870d16b67fmr5230115f8f.38.1789592013464;
        Wed, 16 Sep 2026 13:53:33 -0700 (PDT)
Received: from antoniarch ([78.210.41.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7678sm11086166f8f.2.2026.09.16.13.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:53:33 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v7 4/9] rtc: abx80x: properly handle shared IRQs
Date: Wed, 16 Sep 2026 22:51:33 +0200
Message-ID: <20260916205138.16771-5-apokusinski01@gmail.com>
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
index 44de234efecf..2fd0079b7c51 100644
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
+					  status & ~status_flags_clear);
+		return IRQ_HANDLED;
+	}
+
+	return IRQ_NONE;
 }
 
 static int abx80x_read_alarm(struct device *dev, struct rtc_wkalrm *t)
@@ -942,6 +955,41 @@ static int abx80x_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, priv);
 
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
 	if (abx80x_caps[part].has_wdog) {
 		err = abx80x_setup_watchdog(priv);
 		if (err)
-- 
2.55.0

