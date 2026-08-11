Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FFA476CE8
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 19:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786477348; cv=none; b=qE+ZUsFSd6noO1s7EJFjwUsSQ3qSD68RylE09X6DoVYJHEnRcYZIXw5ilKm700u/vQ5gmdeLzQwkJAvM964PuQHEnp0US9bz1yYXco1sea2oHRgSy2C/yrewIMUa1hsVcA6cteFYGz0jyQN2oHNCihKPESx9pRUcd3mBsUBIEXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786477348; c=relaxed/simple;
	bh=08UtlehfK03KUSQwevWJqiUxLKsv8IURriGU2uZB4o8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GMvVY0SvQJw7QVo1Qeo4N87rZtF8bxF6yN8Nu3dJ6R2wlOMk0MZuEU4ahWqhm9vAEO5/ENmuYHTYT24++DmFPiklUOItuS9U5eDe7Sg6ODtpGfYR+cmQF2gGr61qFnyUGqs4t1VUKW++LwpjpFf3zWHtzONs5xfijf49F9/EjRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2LsqdJm; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2LsqdJm"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so1436355e9.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 12:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786477345; x=1787082145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yFhi9f2vBNbbKbsB00RQsZsEKX9ezsH2FMVXNlaSZW0=;
        b=R2LsqdJm7A3mRbohs2ZL1MNXoUpV0vcbjgt51nhhEl3892NjbwaphqXwa0n5hzbdWF
         FGtgQucuXW/ihEYC68nHGOJdMvlaNdWxdK0D1CMC+NyaD3Jm4ur75egCMjiItH2+oCec
         dq0oim69eIAW4T/1J4kesvCiniLM776jFM8meN/FAgzwrK893nMuJNVIc3GF/VOh6gtl
         i71dc3FbepWl/HwIyD3UOtQxYp8JJvJRItYz2Hdyt5yjntf+o7M6lZwRQumrjG7A05iG
         8Mu1vKxeFd2vJQwJdPmwtOCW2MzO8v64qNjhmQcC6pr2KORTufB3VA92CD9ilq/THRs4
         VR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786477345; x=1787082145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yFhi9f2vBNbbKbsB00RQsZsEKX9ezsH2FMVXNlaSZW0=;
        b=S3Bc4XoF3C4oKUNHNCsr+T15BKL+XdlA6Eay8kdmUyAOMZe8hvjw4KFc92DjKGFmoM
         GSuJ0cyHtvyVVmpVhSY92rGSmBfjuDAnO8wdhyXPDP5cK/ImuFEmQonapaJPPRX7C9rp
         F+GZaYqhwCXuR9hzjSu+SdoNfzPqfCI8RvVary0E+eBIMOzqSvL0TEMFfqH+cxglW5Na
         4o6R8bk+nF92TUPxo43sAeIYLaEVrNtAvo8jtTzGsh0RVCQL5zFS9E21Uagooe++6Wi9
         f0aTA0biaw03vKKWWXVX2RmeC1uumbQdA8jJvy/Cx5Ijqvvth7TJo3Iz/CGFEnNyXVuC
         JDAg==
X-Forwarded-Encrypted: i=1; AHgh+RqHGxxuFd5fwbyb6aAAcF197xOf/SgXRtsSEcssylfddHGpnIzZQdEEYDhxVMreyIZre9rsG5ATjmoY@vger.kernel.org
X-Gm-Message-State: AOJu0YwkeAHKcwmYvhkbt8p4X+nezwsiUqIM8W6B63u7oasUwTlVaj+u
	QBsTfKmNNKSpK66z7jZgDaTgCWt74D1nnH3hQiC7R5ckTubjQGqwoNG+
X-Gm-Gg: AR+sD12hylD+yBXUMsqnDQOs2rHr98ZEWKN5DgYWmReFtssQ3ymZz9CP43n4oif3mPw
	8LDKG3j1SQA/j1Gt9OXniPnMrMiAuWHTHfVpUZnkYWhN6IVtyy6oAZOXGWJg89Zp6BEZDwG89gy
	mbbuAdvg4FB4A7Nfa4Bzm1mJ2SKdQPiUcLuIP+EFMA5BaE22Unz0VB4xptjINF3WcHSW/a1c79Q
	PWe35lU8Sem4y8Yiw4X0oXnOCOJ/MGGTE7owBxO7SW5BitXfxX/fF77gBhkulOazQB4vY5Z4rKZ
	A68t/U4LxlNgv1fj/ks56CpYD/gxY9egZonfazpuz6r/x9UoKCRRK8zRkUxbD9dboMBZw9dcs9w
	YxcFO9WID3Vnxi6UXhiIyY59CpYF0BgqMwioj3Vt0Gbg+HCHBGtHQVSoBmbqDb25IMNrZHwTRKA
	B3iWrK8DiDjtObWc3DFbQH7130jeLxUFUdxWb0OyxD9f5UGg/VxZH2ggHHaW31evYG
X-Received: by 2002:a05:600c:45d5:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-49978441d3dmr86339245e9.7.1786477344536;
        Tue, 11 Aug 2026 12:42:24 -0700 (PDT)
Received: from antoniarch ([78.213.143.159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997b22784fsm2606535e9.2.2026.08.11.12.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 12:42:24 -0700 (PDT)
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Antoni Pokusinski <apokusinski01@gmail.com>
Subject: [PATCH v5 5/9] rtc: abx80x: add irq to struct abx80x_priv
Date: Tue, 11 Aug 2026 21:40:30 +0200
Message-ID: <20260811194034.28937-6-apokusinski01@gmail.com>
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

