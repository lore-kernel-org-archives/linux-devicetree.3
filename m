Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB9C44236C
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 19:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786390816; cv=none; b=PoSysZrMuPMTWnaRZaNUk3URx0uz0BnJbZ2IzVSb4BgudZeY8hHxzlvFmEzNxplNkCh1IGmjQFD+nolTdJk3OdSFFk4uc68aFcaG1CI8mweR4VRP2MzMkL3EjPfVua3cLrbKr+g63S0F7A6/0kmEcp9PHwS8gDSE5qjspn1OAPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786390816; c=relaxed/simple;
	bh=08UtlehfK03KUSQwevWJqiUxLKsv8IURriGU2uZB4o8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WuWnY2jvOOe2ZzzsWHondPwNMLbkgg5oqAHFiakrMBSeNy3hWL+eFr5/3C3wV+mKzpkbsJvQ8gdWiF5JFtUtSqTp+JJ40M8AMebDH0AZSwYkFW6z1ohsNH2wWVf68ut10ZsFjo1wRkdhOTGAxo8KmTRUjbNrBpfHFTN6EOvBSNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pQK58+xt; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pQK58+xt"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4798bea72f9so1345369f8f.1
        for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 12:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786390809; x=1786995609; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yFhi9f2vBNbbKbsB00RQsZsEKX9ezsH2FMVXNlaSZW0=;
        b=pQK58+xtN8eLJbFkYRVM3lKUfL+OHC5eLpP9fLBoYWpTfQUXbZ7Kgv8RUGPSYNPQJM
         EP/EMryHMrIrLoo6bQSNmi4StUMVyD3rTml80e3x9iyiWs/1/uqr4xwbEEQsRfnyGWbC
         NGB+CDC8L69OH/tqtDWSnfUo8Vk7VgOJAxWmU1Yn5685/wYue/MfFjbaL7Sfa+LQK8n0
         sqL1yMNPxTQ08QBHZ8m+WJDurdeK4R6uYNC11daVlrRSTKsrTv8pExjuypxPm32OIlWU
         SG3P6Me7YIFRBRzDxwNaeJyQ4JzFndUws6EfPjP1W+oF9fvv1XCnIXLeId4I3Ujf3mAl
         7JgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786390809; x=1786995609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yFhi9f2vBNbbKbsB00RQsZsEKX9ezsH2FMVXNlaSZW0=;
        b=Ym35aDa8gY+pwh+pOQMPOEuEsJXx/9fFw/us4/GKIYLS2aWr1wCWvkY4bsyXYWqKHW
         Voa07FdRmyKpHakUrkaYMwsELewvYByA8HzG0Xun+uLlEgfjjcvudG+V6DUoq8x55ohJ
         /Hql09L2Pm3/pEsHKg8USxnGyuvPCO3kho1mo70sHGhaTNY4kRMKLB+75zc4suJO9VFh
         dQItM7fAOVSWl29CUETuq5kOID30U4v26f8JTuo/x5irlbbKx654odPZxpOVq+UBNfEy
         VgLXogCKDOg8NEbXDn+KMNszR0bfFFd9gRR0EMVat/HVKLVs2pu9jBwtrIweG2Y4ZGR7
         L3+w==
X-Forwarded-Encrypted: i=1; AHgh+Rpk3YRtPM62KPi7zdI8h2LiOgy4waXQhHndy5mVkZzvGMyQtbHVgmb3iEIqK57W+sQ/kQ/AkUWte5zw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/cCqB76wtkcIiv1GZSG2G3niX0C2Plq5VjCN7+2M/Re4542+x
	IjcfuM8OAmO1iP4kLilvNoTihbYplODcMSfNbBpmI1KDAzo4s3tmD/OU
X-Gm-Gg: AR+sD10eC2m0UDQBbhODOd0mtc8lZpx47+WXWChM1KyNiNL/TaUi5c+SXFx7+jKxnqK
	7xqKKK8oHXo7fFvybuqp/s+jegVlrWyDbJCrZ4P18yV/urQUFOyzcLquO/dWPWQ84tUQ5my/w6j
	ZKmOILBNv1mlkAbZaS5SKe9Pk/SXuP0Fqb0Z9zQDRq2W0IzVJ7e3+oH8+Qaxb0EgWg1cua3G+sB
	BTRPJRGCRhxh4Yxzd3KOraD2BhHQGhgdT8Xta/8JCT0WoYky1HCaWm+/JUBeAf6GAax7UYI55E+
	j3P24cq8mjj+me3QbogGSYKVZAeWdUeZOPMYfLG7nEMCfYkRSTA1jM38hgTjL26K5TZIYgV/NKL
	Vhp6h80F3qrIpMEW/UKrNlrRxp7GjHmykDiAHKe7llXygNFchThIYpazWoykyhlHJBoFCky/VXY
	BzK8laRYkrOgQ4RPpZ7gk16myXu82MIkE9PCtUUUFpM599NtBPKR60ferMNjLsbZU=
X-Received: by 2002:a05:6000:41f7:b0:47f:95ce:6f48 with SMTP id ffacd0b85a97d-481455df5afmr6870669f8f.11.1786390809120;
        Mon, 10 Aug 2026 12:40:09 -0700 (PDT)
Received: from antoniarch ([78.213.94.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-480021506cbsm39291689f8f.14.2026.08.10.12.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 12:40:08 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v4 5/9] rtc: abx80x: add irq to struct abx80x_priv
Date: Mon, 10 Aug 2026 21:38:22 +0200
Message-ID: <20260810193826.210683-6-apokusinski01@gmail.com>
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

This way the irq number is not tied to the i2c_client and can be
easily accessed also in the case of ABX81X SPI clocks.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 drivers/rtc/rtc-abx80x.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 485d1ea08030..12a4dbfec639 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -135,6 +135,7 @@ struct abx80x_priv {
 	struct i2c_client *client;
 	struct watchdog_device wdog;
 	struct mutex lock;
+	int irq;
 };
 
 static int abx80x_write_config_key(struct i2c_client *client, u8 key)
@@ -305,11 +306,12 @@ static irqreturn_t abx80x_handle_irq(int irq, void *dev_id)
 static int abx80x_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	struct abx80x_priv *priv = i2c_get_clientdata(client);
 	unsigned char buf[7];
 
 	int irq_mask, err;
 
-	if (client->irq <= 0)
+	if (priv->irq <= 0)
 		return -EINVAL;
 
 	err = i2c_smbus_read_i2c_block_data(client, ABX8XX_REG_ASC,
@@ -341,7 +343,7 @@ static int abx80x_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 	u8 alarm[6];
 	int err;
 
-	if (client->irq <= 0)
+	if (priv->irq <= 0)
 		return -EINVAL;
 
 	alarm[0] = 0x0;
@@ -947,6 +949,7 @@ static int abx80x_probe(struct i2c_client *client)
 
 	priv->rtc->ops = &abx80x_rtc_ops;
 	priv->client = client;
+	priv->irq = client->irq;
 	err = devm_mutex_init(&client->dev, &priv->lock);
 	if (err)
 		return err;
@@ -994,19 +997,19 @@ static int abx80x_probe(struct i2c_client *client)
 		return -EIO;
 	}
 
-	if (client->irq > 0) {
-		dev_info(&client->dev, "IRQ %d supplied\n", client->irq);
-		err = devm_request_threaded_irq(&client->dev, client->irq, NULL,
+	if (priv->irq > 0) {
+		dev_info(&client->dev, "IRQ %d supplied\n", priv->irq);
+		err = devm_request_threaded_irq(&client->dev, priv->irq, NULL,
 						abx80x_handle_irq,
 						IRQF_SHARED | IRQF_ONESHOT,
 						"abx8xx",
 						client);
 		if (err) {
 			dev_err(&client->dev, "unable to request IRQ, alarms disabled\n");
-			client->irq = 0;
+			priv->irq = 0;
 		}
 	}
-	if (client->irq <= 0)
+	if (priv->irq <= 0)
 		clear_bit(RTC_FEATURE_ALARM, priv->rtc->features);
 
 	err = rtc_add_group(priv->rtc, &rtc_calib_attr_group);
-- 
2.55.0

