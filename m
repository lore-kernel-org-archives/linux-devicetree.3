Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E13F4E1C9E
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 20:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789592040; cv=none; b=tLjKVAFYAEp3qr0SN2Mxnp8sJb6Qi6J/jalhc/OYF0jQD+rAhG/7gUiaX1zb1yadi2sTjWxhOfOeFXTJ/oD++qxdEk49Ow4SA/vB46L1nYfXSDjFOj04uJjrRFx8A0CTM8KyiGT4DjlKJqmQTtoXqT98+NzT696LMYVArgLcPJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789592040; c=relaxed/simple;
	bh=+fuIrmtzR6ldoVb6Om5t2rG3lzQj67cX476aa8hApRA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r0gyooAiwPxabtZpNa5zsO4eWyGP1tfUdNYHCSJrjzvHw3JYqW1NmWMv1SCuCtlxeJDHfD8gExdlx1SnKONwC8uX3COq2KKtkqAzJacVYqsJDC+agttKD+0P3BOnZ+RxlsnSbM9lTvUxtna1C4irGi4SkViZrAWkEtsFohlJArg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RRJFK68V; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRJFK68V"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so1215955e9.2
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789592015; x=1790196815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AAunmvXAHLcWGYzBYZe3R5JhEjHYwRPNQssUB8ElOec=;
        b=RRJFK68Vp8klJ2CEhgJrtL07qPCAYF9YreqpUN+pBri0kSI+s5uY1HB9MBSFsUvvMW
         oYjMupJNZnoh+FVCrBnhZw8GRCzxr6Qf94BZ/PF998CHOKPYJOH/D1S16YYfst8S4cl+
         IT72tbW9OwMcZ9Fmy9y/LZGHpOOOm+EP1yhmZgI5haI2Wbqj+SD+fI99i5+r1ZNhrZ5C
         ycAHw4AiSoI6I9Xx4fzQzpaj7yobMrNk2ViUZqN31azBpKYhrYa/JLmZRNoIipvDO3BS
         fo90WN6Jw0yNXb6E8JqxKjdi3wkC6g+9nw/syiOOEv1UsZ31+iIoXq4LLh+5Uc5k79Yk
         9ZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789592015; x=1790196815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AAunmvXAHLcWGYzBYZe3R5JhEjHYwRPNQssUB8ElOec=;
        b=kdQ0aG19PdEmNYNAP2O7LnEjGaYbRg/8Wyjy4NRDX5mzqDFVQZs6dFL0SY7v8MROmo
         RQ4+YpJCy+pLI8h/zXNQSBWntm6Dzpj/EhcxfGEI9aloeOp4Q0SEGw6ozgL6Gxqn4tiN
         n9klvo2/sqB9hT8lIQ8uuN8n74mF4Me5fS8tUph8bsBT3x1SbErnsikdZ7pM9qWc3LQ/
         O9e7xr9CvoX3P8CtWFKaen7yMSx2SHzZLh7d2MFChkZpRR1E6nTUgLQwkNd/tczzvtQN
         WeGIdU6JFbfOL4HraiIjnGy2s2sz48rklzIWn9P6Y+TlVOf0LNuo2fjqPjnDFtJqLZN6
         e9Rg==
X-Forwarded-Encrypted: i=1; AKwUvBx0QovlKnCHj6c9fbx04uKprgoaqgfn+/fnH46o5gtp4PdFf8GliNhbrYuYWuduR1dab2k8RKVakazG@vger.kernel.org
X-Gm-Message-State: AFuF++kHbrQ39Z71GuxQUCbyCKf7EXEplZt4h5GF8+AH04GBap1GT9J/
	6OCZvdhPaECg0K/TZqjTb8iBI21qrSdX/d3U+sDacXei2RQfQ9oMseCc
X-Gm-Gg: AYBFou331RWs9Q2mCVNrFoJTSzAMPhidPd0ijUAzAIOIYG79l3uVgWqfKi3DT2w5jm8
	nK7z56Agn9WMAwa/yJ9DouYr3U1iCHti9sSYsFhvXrqUTATE8yH+9mBvOz6vlzpGaF+SJ1MRj/P
	bFNGttNz1qYlN4Om2lyaa6yEbonMmKvdsyu+hRcnuySo8C8KPrYZ0sWYXC2yBCMzSIi69leDD7+
	tayDwArWVT8KrobuAJx7AXRSbCedKRdPPGyerZDAHnjXpkDRgDQ47k2Y52K8jLQeB0UsV0X9b93
	eYytwcYJG5ay29RIxgLOHf0bGDmP0Rm1FSim2onFxH/UqthgnTkhk9brjL1dbdlx0CrEiGRq8gS
	GywBf4enbkNKq8nlf2oxOcPuaImRYcOuLK7rOw8J0tJF1Mey8niq96h2nicNMibT00PPVGJZqdJ
	if/Gtmqc4houMKz+yoTKbYF4eAbQMDV0GcIVPVrv/lEsor3I9xMweCLOTWaNvG3PID6a6o6Q==
X-Received: by 2002:a05:6000:41cc:b0:487:b4a:3f54 with SMTP id ffacd0b85a97d-4870d16b4fbmr5439006f8f.29.1789592014822;
        Wed, 16 Sep 2026 13:53:34 -0700 (PDT)
Received: from antoniarch ([78.210.41.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7678sm11086166f8f.2.2026.09.16.13.53.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 13:53:34 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v7 5/9] rtc: abx80x: add irq to struct abx80x_priv
Date: Wed, 16 Sep 2026 22:51:34 +0200
Message-ID: <20260916205138.16771-6-apokusinski01@gmail.com>
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

This way the irq number is not tied to the i2c_client and can be
easily accessed also in the case of ABX81X SPI clocks.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 drivers/rtc/rtc-abx80x.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index 2fd0079b7c51..91844c0d9063 100644
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
@@ -343,7 +345,7 @@ static int abx80x_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 	u8 alarm[6];
 	int err;
 
-	if (client->irq <= 0)
+	if (priv->irq <= 0)
 		return -EINVAL;
 
 	alarm[0] = 0x0;
@@ -949,6 +951,7 @@ static int abx80x_probe(struct i2c_client *client)
 
 	priv->rtc->ops = &abx80x_rtc_ops;
 	priv->client = client;
+	priv->irq = client->irq;
 	err = devm_mutex_init(&client->dev, &priv->lock);
 	if (err)
 		return err;
@@ -1000,19 +1003,19 @@ static int abx80x_probe(struct i2c_client *client)
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

