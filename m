Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90AD440A2A
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 18:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785523811; cv=none; b=WSgafBQk1rVp3UBiaiffFswkyA7hYrWmidjV//Kt9+bxD6UPdX5SBvWkkxEDftKnYc7JtLC6OcgqVTgB2GomI2Dh2Vadx2zJvocj8k/omCKzTPXlu8pj0zPMYzonl93x4m2KhgM++QhwY2ReOMpTGOPwZFUUzgcSxXaAUaVNd1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785523811; c=relaxed/simple;
	bh=sViFzWJhXIbtkeyCwXiwWrDna0ysqKKTQtJUPl/9D3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HXlGrx/Pf+/kwQP+6N8oPL0NKUHG3F6QtdoGdPaABxTcsj+Qa02Yuf79lFeJb/gUxetNYMaob3qXwWHK6N2N5OG3SMoKfSfyLuy7LW3/KJM1vQr3u22z9Rpq95bJP94IacBl2jd/OlyHl9Wtj5N+AORBWSPNg5Xmb/hRAGJ75XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SIoMW777; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SIoMW777"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f904e80eeso1218565f8f.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785523808; x=1786128608; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbHCFTYG93Y1dCLgcimL0oosJgOI0iKbHqRlXM74gC4=;
        b=SIoMW777UvOv5VvH1kR+PwbRJwDG1ZhnqkD+ca82sZ5/s5PwhWFvpbnvQvA3M9RXGm
         Z9dbAfDtuEjdDDLxIECeVEJKKnJ+xOpUcSqjjSgctVO6VDgNd0lb16IKs4aZmS3EZqA1
         Sz3ev/Ydxizu6vKkyPPtvxIf5zItDsWtTjzlmeDXvSMY9hYlzewL4RmmzhdcWD5ocUJ4
         sLkwu4J7js6p9mTuzsUuWSDqRv+ydd2XC0wKCeRVhlQ/AtkuqhiyQPwujLXZlsc7o+y3
         kQglrcG2f2SXHlOHxykc4nfadXzAVJfc4jmOK5UCiMVtvVam+1zTSweIGTqP58fPUiPx
         4ksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785523808; x=1786128608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IbHCFTYG93Y1dCLgcimL0oosJgOI0iKbHqRlXM74gC4=;
        b=Nx+BOfxPo1HQdN6478tQzNJgXY3eOcUQUjBzpXb/CO9tR/8epLjBnS0cXwD1X014+U
         5IKZSd0rvitssgCeF/RlO4//d9IqF9enxs6JLTx1ikADJ5eDA72cbxUhigWvdjFcSu0b
         6eKxFfxBplDCKYFsdsg87wVePo1guZRovRr3Xj18TR+iiB6Haab/CpjYeRlVgRQzZrLz
         AgFp/r3Whj+Gbb4j9cm3b0Xr9YGfSqJJHbQ7OHOjukDSnLxoKN58fh3hRQ5V6ppmzc/h
         LV79Dw8axKsRh457asbq5SA8Wt/a5vxQnXIocVpPiN9VRz+/UVC7H8yI6zUP7FvOF9C8
         rMOw==
X-Forwarded-Encrypted: i=1; AHgh+Roke+M9C1v1nwAu+0Nl+Pk3wc8GMAAkJEkQL2mfj/VTpUo47arSXt8C+4rpK4ZcCwDcU2Fvjfrk4DZd@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5VH+nEQf6PxZE4kk/oyzghHCIyDM1igdIjqswXW0ReR4+8foo
	APgp/7yUb2dOxULsdHxbqohhBmvBtykRRDOjPBBHKcVmyAe87EYqQ7YX
X-Gm-Gg: AR+sD11e+oJZEYg1q8Gd4z2cQP6bbcAYFVaNeZQ57z2nICz5f5RdYDSnYQMhso9vYA2
	4QBhr0U5lHtVHBJKfro6vFL0WiM9vNvqBD9lAIyff6UMW6lk26mrPdSxgMNhHbowzROrCDl+hXb
	CSuJz5Vi79OxwbhTCFYDiB6DHpkBVsN32SM5pA/dJhOozLhnXYwezrpjZdCEwFQhLxgr/Mki43p
	Xs6HnqAcnoYU3tZA22n7+Hr6COBXxXuIxIX7nLYFa2f9G7eE1fu7XVb22aJdYsQwnTO1ym3fzuE
	49SDNTrDw80wxI7tj26mRsSlcBNQqigaP7Y4TBb82zQVga77qvJVvB9h7+7RNK+byfDCcESI0h6
	ZYUyx5p2djtmdcpTdE+dFgKiOyuK9r2yYRpcUJXHiExYkwiG/z3No5Xrc0n/XHabLAeIBhepJTX
	+M+DQpyrscc5vztu9bPVmsl/f7MR0FVUJvxFaNppMILhZtDezdlBh4DHI6x6bLpUVv
X-Received: by 2002:a05:6000:470f:b0:47d:f445:9490 with SMTP id ffacd0b85a97d-47fd7335076mr1541099f8f.60.1785523808054;
        Fri, 31 Jul 2026 11:50:08 -0700 (PDT)
Received: from antoniarch ([78.211.133.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91b3sm8741488f8f.14.2026.07.31.11.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:50:07 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v3 3/8] rtc: abx80x: properly handle shared IRQs
Date: Fri, 31 Jul 2026 20:48:26 +0200
Message-ID: <20260731184831.44037-4-apokusinski01@gmail.com>
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
 drivers/rtc/rtc-abx80x.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 8d791b9ec7d2..b84fce0ef294 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -266,27 +266,34 @@ static irqreturn_t abx80x_handle_irq(int irq, void *dev_id)
 	struct i2c_client *client = dev_id;
 	struct abx80x_priv *priv = i2c_get_clientdata(client);
 	struct rtc_device *rtc = priv->rtc;
+	irqreturn_t handled = IRQ_NONE;
 	int status;
 
 	guard(mutex)(&priv->lock);
 
 	status = i2c_smbus_read_byte_data(client, ABX8XX_REG_STATUS);
 	if (status < 0)
-		return IRQ_NONE;
+		return handled;
 
-	if (status & ABX8XX_STATUS_AF)
+	if (status & ABX8XX_STATUS_AF) {
 		rtc_update_irq(rtc, 1, RTC_AF | RTC_IRQF);
+		handled = IRQ_HANDLED;
+	}
 
 	/*
 	 * It is unclear if we'll get an interrupt before the external
 	 * reset kicks in.
 	 */
-	if (status & ABX8XX_STATUS_WDT)
+	if (status & ABX8XX_STATUS_WDT) {
 		dev_alert(&client->dev, "watchdog timeout interrupt.\n");
+		handled = IRQ_HANDLED;
+	}
 
-	i2c_smbus_write_byte_data(client, ABX8XX_REG_STATUS, 0);
+	if (handled == IRQ_HANDLED)
+		i2c_smbus_write_byte_data(client, ABX8XX_REG_STATUS,
+					  status & ~(ABX8XX_STATUS_AF | ABX8XX_STATUS_WDT));
 
-	return IRQ_HANDLED;
+	return handled;
 }
 
 static int abx80x_read_alarm(struct device *dev, struct rtc_wkalrm *t)
-- 
2.55.0

