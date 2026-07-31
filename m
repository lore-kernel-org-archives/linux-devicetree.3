Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EA147D448
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 18:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785523812; cv=none; b=Xgj5+aRbJGcDCbI84zHfoc0wMKVXwxVz+SDVhBNRnNmX0pMq6Mjl1dsDXS2M+FnbQp7ua1tzV/TL/PqBkFir4DwUVXKmlHcqvFcWoXUPr4dSKJFwMsOK83CipuVVXWuU7vwUqyciv46J/YuQkwlsvrdNg+lGhAEg/91BJLr/R04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785523812; c=relaxed/simple;
	bh=8Fp1cIgdmX68QdFeBMdb2nap5ZPDtbuhyKtuCyvwSGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P9bJ9ItKJeMOuR+lA2/vNvMMEZy3jHwGF4CCI89TK4iHT5vddeGLTlK5X6hB5J+pF+/BrVTAJlyfB6cr+jTFvC7EKymFy/3MUZ1WKp6gNZmbFkb/a46vSdVOBIySvMOpg03qKdZpKrpSPWDuWYr4k311j2Hd453kuJgU5FaiRtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ovVT9+/d; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ovVT9+/d"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47de008b020so970331f8f.1
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785523810; x=1786128610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kqCqqXB73tbV7DKWXe+e3HNB8ml/FvB4UJsSADni1XE=;
        b=ovVT9+/dSbRExsh/rDc3IxJAh6H4jL1vh+5M9DUlMEK5buO9u2sprvhrgI5+/8YYR0
         WhDlq0dalcVkbgQ8mP9Lr3iAm9pjWic/AMNf7QGqcifi9dsE6z1LCva3ecL3H3PBbn6y
         4jkwScmW5P7qzuFM7x4Qlb3CX+1D3KKtYzqvwt34xgqwBr8O3TGlaOUfRAHXcN3GfupY
         6DNFdnMKzgJVZ1DG0fKbih/5UnvDFj3W7YAC8z5a666vaw5bLhz3EPYCd9RLhl4r9n5j
         T/IWp9FMH4YKTqNJOTIdB+zICkgD8dmNLy0jPFSWgc3TupGN3WQodOUI/8dhq0aS7smg
         q/zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785523810; x=1786128610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kqCqqXB73tbV7DKWXe+e3HNB8ml/FvB4UJsSADni1XE=;
        b=myESVhUKY7jSyoBGzrYGhwWRJXiDzxjihDKrvH6fmwwghQEOJfJxf2+TsiqRkTi0AQ
         D/JGomKbnKX5x26pshkcpgCKoV0JIv9DvJkIJamv692punNRbGAbzoTZb7Zn/uUGubiv
         SieS8TDDgUpsYXYHLtcAH79+wp5s2GdB0PbXuczLMfDKsIb4y4YyGQZpqt/WC66s05nk
         OVbaquYfoyHxFduntNi2Nvgb4hdWiT7BiJ0OyX3ICMbME4LG2fwM9bfXVG8RbPOzqKht
         Q+N2t4ZA34tfFAy0slknjPhiz44ZZ7U0hoxVSGkUPzOf0ZfRjLkEzHfnqGvIEuuvnbcR
         A18A==
X-Forwarded-Encrypted: i=1; AHgh+Rq9Re58MHi/NR85FZXmc3oLBuMTmxVVWeo/C3xbjj210wvLYq0k/wm/TKmMAr1wkLzpRa9H0XAqDCMN@vger.kernel.org
X-Gm-Message-State: AOJu0YwhulvNkxjA+QTxMRyqJl21y+uDcwpEkQyUMbFBgWz5SfAGF3tR
	jdkOgWawXZ6IB+HtB/+qQtdB67wECDur9kpCCCpkpwFjc89KWTwQLir7
X-Gm-Gg: AR+sD12b6xFEZP1N+XsPSIPqUwmZ8/Yj1Ngj0cMNaBnidjEa/3pcMiugVTDFNAojKnm
	vQz3jIIvu213lvxdmQlZnRbKXg0094dcHO8KQn3BzNgjUDd1unZ1I6yM4galfFsqgncWNXfRhWn
	ZS6AFNDfYbEVkr2dlag5BVLZ/NgN2RzuQlO+LP0OfUQYjyEXz5dH88Wv8x4CzKKbXuNJQdkbsMZ
	PCvqBssZkxostto/nRUP4qYHwtm6rnkBPs0HcW6AAGzcXW4niRUM0l20lJVHY/0yCL+HJSDKC9W
	MN4bxCHaXbL6bChr61FtChibtYf3SMPMpcXInm6oxLxq9vj5xSROK9orLzZBUaMA11PhYaMt1FA
	YRujK4nPmHHO2a79kL3rtQMwY/68QuQ8BFxoEk1u7z++0NggREAd4bCYajaTX7PsVpk7q1a6ern
	L5Nwqh1NZXWkWAzN6Xqhw6BY1Z/kMsYmp/K31fyBfT5kesRSzu4PloycZV2dIm847Y
X-Received: by 2002:a05:6000:2489:b0:47f:537b:d5d0 with SMTP id ffacd0b85a97d-47fd72a8070mr1564677f8f.28.1785523809624;
        Fri, 31 Jul 2026 11:50:09 -0700 (PDT)
Received: from antoniarch ([78.211.133.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd42d91b3sm8741488f8f.14.2026.07.31.11.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:50:09 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v3 4/8] rtc: abx80x: add irq to struct abx80x_priv
Date: Fri, 31 Jul 2026 20:48:27 +0200
Message-ID: <20260731184831.44037-5-apokusinski01@gmail.com>
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

This way the irq number is not tied to the i2c_client and can be
easily accessed also in the case of ABX81X SPI clocks.

Signed-off-by: Antoni Pokusinski <apokusinski01@gmail.com>
---
 drivers/rtc/rtc-abx80x.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-abx80x.c b/drivers/rtc/rtc-abx80x.c
index b84fce0ef294..4ac3ace687a1 100644
--- a/drivers/rtc/rtc-abx80x.c
+++ b/drivers/rtc/rtc-abx80x.c
@@ -129,6 +129,7 @@ struct abx80x_priv {
 	struct i2c_client *client;
 	struct watchdog_device wdog;
 	struct mutex lock;
+	int irq;
 };
 
 static int abx80x_write_config_key(struct i2c_client *client, u8 key)
@@ -299,11 +300,12 @@ static irqreturn_t abx80x_handle_irq(int irq, void *dev_id)
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
@@ -335,7 +337,7 @@ static int abx80x_set_alarm(struct device *dev, struct rtc_wkalrm *t)
 	u8 alarm[6];
 	int err;
 
-	if (client->irq <= 0)
+	if (priv->irq <= 0)
 		return -EINVAL;
 
 	alarm[0] = 0x0;
@@ -941,6 +943,7 @@ static int abx80x_probe(struct i2c_client *client)
 
 	priv->rtc->ops = &abx80x_rtc_ops;
 	priv->client = client;
+	priv->irq = client->irq;
 	err = devm_mutex_init(&client->dev, &priv->lock);
 	if (err)
 		return err;
@@ -957,19 +960,19 @@ static int abx80x_probe(struct i2c_client *client)
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

