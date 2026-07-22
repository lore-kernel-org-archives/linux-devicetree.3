Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39F640BCC1
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 20:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784750451; cv=none; b=S0LUgagbsJxjArQGbD4VWbvVcQKqixE2vCd/yYP83dGqjWMMFPwQNseQF/s8tyO0XpBavQ7RHUQd0R7aipO9vUO4upRTwBU9mD12c7ZDn9jXqlZtTPGW+/pAhzqHLxtU1NtMFRXlCrhNCtzx4jr4Hwl307aGHc+xCDQ7MyIGWBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784750451; c=relaxed/simple;
	bh=a6MSQ5/1V1Noi2+Y+M5xBqdyzbDQ2THeDRyVpcTFi4s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HyfcsCX46ZbUAfVaiS06JwzTTvYPTsf3hiRsDIL0gcvIU7+a7KJCmrAPFrh4C8+kFcFM+xnzL3OpUUqs5zo1eMZRryCNUSJJ5epFUlOBHBkiANj5ACUq1rTv+cEJA/CnsyVkYbiMShzftGKbgLxChKQ/AygE5KD/ueJj/U6fMPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zpsf5c1j; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zpsf5c1j"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47f6609c657so2311445f8f.2
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 13:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784750445; x=1785355245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L906OadpequPwZFjgy6o+rd2z2eN1Obz6YAK2vIYQy4=;
        b=Zpsf5c1jm0jH9v6RvUWYJxkEnJvDKnjz0W9cikc434yx+WTWfnCDCvbucrD3YG6mz/
         rX2CFw9BMfcfMtD9f81ngAyuXzIq9W0Q1acdesUSfEevQNIbOLnlVjaNoTkdzzDNSXrl
         GNaafRHl8p4g/FaSqPvYuHKvzA6bw3V4EsiU46miGEypCiud+7KIiKlIdI+ks8+Qc3kN
         w/euHARH6jIZPZ0iFGjC9moje4rpA2+dEqSJ5//mETKCjR4mFcZlonoaARqB4rF8EeiG
         jGvKDpq2NpUaaY6jwjDMnePBjeAp7GC+v2szExBxwHvHKDm91Io94vO3uwZPC52L1g9r
         tBxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784750445; x=1785355245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L906OadpequPwZFjgy6o+rd2z2eN1Obz6YAK2vIYQy4=;
        b=jn3LPTNhpP2mLloCm21zDD/9ryHNgSt+Z3fZMqk6H/ZnDSI3WJISUChIHpZzPjwrQt
         d7QzMPLJ1utShwCUleF3EqiZEx1I7mQt0wSX/yVm1shrmgLL11+Fa6kWweBWJCaP1DK8
         tuTbgr6Wz84sRwncRTBxwJxYVLH4saDjZbM0LVyQA1axaypcAzK04JK55JYcOP44h67Z
         OMw+qX6xr+YQhS+K/acd6IE246gbbvhqrj0dWCQooaHJ1aHHXERxZsUz8rXm0AvxF2vz
         7tAO6MIsfSZS3I7Z413WYBWce+oy6RGEgj+DtAPGgbVmj2rTlOztQmKT/yDZCu6mfUl2
         KiRg==
X-Forwarded-Encrypted: i=1; AHgh+RpfpejnIBvIt6VCjetaNtOWqAaalxzqlwf8s4LKaT2ZcuMYoAerje2JalE8Q6cPWrwqQo2JgGrIA6iB@vger.kernel.org
X-Gm-Message-State: AOJu0YzMK0e6tAz1gXlvY0D6Rjinpmu5tTwTdcH9hDwyf8/FkZsLvClK
	75ENoNYblXx29H/NZwYWdh6Or0gJ+unkFHVHWkyZUGKC/2kJJMMTD73w
X-Gm-Gg: AR+sD13DCvq+dwiNyAVm01eBrwXhcND2MH5eRfaTb63mydPAOXqFXlVtEYSnjPtV9MT
	lUmRhutsmpuvh/9ieQ+PKlqvmA5u4pRLoBYMCmQDK/icujfu6+wmKpwQpfUXMFPONHZ3UDg6Tdx
	Z350kcpZhbsBYUUcMIp3PB0m6U81Q2UcledsbdYTWQgclEUfi7k9mkoAYLxrxzdlO+akiEUt27J
	wYG5wUZN/gIiWNLjLtzD0Cpb5IdjVLng03ZQfviF6N9dt0R/osyO0Ibrf0eazUurN7BQin6bloA
	5UuJ07SockYAwMeedkg/e5fg+Zf2ve3SkDwC/OpIDLID5a7ef9cV1h+KcknO95Y46u/cUgwml8f
	DDrkYPXf5DnCsxq/3mJWPeMcVXeewKfEzloq24n3Z6OGgIn/RquUVbRzLP8iTzQvM0WZGWQ37Yj
	IH7jK0uA==
X-Received: by 2002:a05:6000:2387:b0:47f:7050:5026 with SMTP id ffacd0b85a97d-47f8dca1ff6mr280247f8f.38.1784750445247;
        Wed, 22 Jul 2026 13:00:45 -0700 (PDT)
Received: from antoniarch ([78.210.252.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c52fa9sm9532851f8f.20.2026.07.22.13.00.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 13:00:44 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH 2/6] rtc: abx80x: add irq to struct abx80x_priv
Date: Wed, 22 Jul 2026 21:58:10 +0200
Message-ID: <20260722195814.298552-3-apokusinski01@gmail.com>
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

This way the irq number is not tied to the i2c_client and can be
easily accessed also in the case of ABX81X SPI clocks.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 drivers/rtc/rtc-abx80x.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 5486d9d0b1e5..9b0e1d48d9ba 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -127,6 +127,7 @@ struct abx80x_priv {
 	struct rtc_device *rtc;
 	struct i2c_client *client;
 	struct watchdog_device wdog;
+	int irq;
 };
 
 static int abx80x_write_config_key(struct i2c_client *client, u8 key)
@@ -285,11 +286,12 @@ static irqreturn_t abx80x_handle_irq(int irq, void *dev_id)
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
@@ -317,10 +319,11 @@ static int abx80x_read_alarm(struct device *dev, struct rtc_wkalrm *t)
 static int abx80x_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 {
 	struct i2c_client *client = to_i2c_client(dev);
+	struct abx80x_priv *priv = i2c_get_clientdata(client);
 	u8 alarm[6];
 	int err;
 
-	if (client->irq <= 0)
+	if (priv->irq <= 0)
 		return -EINVAL;
 
 	alarm[0] = 0x0;
@@ -908,6 +911,7 @@ static int abx80x_probe(struct i2c_client *client)
 
 	priv->rtc->ops = &abx80x_rtc_ops;
 	priv->client = client;
+	priv->irq = client->irq;
 
 	i2c_set_clientdata(client, priv);
 
@@ -921,19 +925,19 @@ static int abx80x_probe(struct i2c_client *client)
 	if (err)
 		return err;
 
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

