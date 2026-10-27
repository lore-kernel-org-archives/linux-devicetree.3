Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101613;
	b=Dq7GR9oryJ+lwVt6fZaVAec1Tz6WAZsqeXTbUE8JhgBTLvMyxzhBWSU0A8L2Rrd6hGMH
	 9VUOfgM7ayfs+uRg5uVkdOTOghxWuWOCYtcF0DO3yriyEB9VsFf07tW0y44VXWzdoSysC
	 z5Wh5vygLyRNuKyhBGvbhT1rUOBvsrBnl5qTOx/u1brBg3BkqZ6VkKo1a097mOMiKY3bB
	 wxcHzeJdj7uh3WULClFn8B8sINmeSd/bA8YvBtH6VrzaQ3DnHvHIFY9J+sSI/0y1QI1po
	 7l/i0UU9bszt/J9tqp7zyQRC1qZlQIYSekg00Ph85SiyyzYe5h5PHncz85XWnDSGWGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QE9XGJJc4fSv5NK0pBPw7TKpZvBBJTMfX0/e+Q+5Ads=;
	b=pCb8/NkjRwMx+iMW/1VfMWTFlnjn6QL3yvBeIc5hNkF0Vx9Kj+40f69GELd2ZCMWh3Ds
	 I0Lx+7XJzqk8C5pbjJgouMYBZyPOVX7zVqi5OETZ9iWXb++tFF9Kaoi3DKEIvTZH8jMxY
	 hScqTzxS0k0ANRJvPjIztlZPyI8LQbk6ezF4wxbOUZLkCbng1WszU5rxdD0kF/DvZLR+P
	 cQ00njr/IjdiiNP1Hbd3xZ8dXMfeejJ2sV95oaUPIPPcA56HOq7otrXAK3CyMEBKsSprE
	 AunjI8wDrmY0ngCdxcRwYCVzbqIDoL8L7Gq3QO2vCeLvg7yVzzNTLsGi6qvVXHgoYLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=agMhBugX;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3371B606A85F
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 11:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3371B606A85F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=agMhBugX
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c423b145922so541391466b.3
        for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793101612; x=1793706412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QE9XGJJc4fSv5NK0pBPw7TKpZvBBJTMfX0/e+Q+5Ads=;
        b=agMhBugXTZjxORet4N8CFbEGevudEKwglwoZ4lkgMoBV4ANsa7nwOoZUzvYmO8MkUJ
         F0sAC5O+IwxizVriKQgj4uHtkxTe/1kpEuk/XMP9edpAbRDijvKA7oj32LLlNFFGJuqi
         MWO5w7W6lTi37fw/D4uSVxecfZ8N0SkaARNFw6w3fWaYM7fz8iHtv7v6Wbi9rFZ6EBtF
         v4dmux9Vxo9FPjdml8oL1W5zkyzXpzpfrwIw+uHdIwDN0WWoh2MHYUDMVKqC3/w5Yfq3
         l/RYSJlMVL92Us8EUl4EpbJ/s7BVtH72NPYEk8AC1UjCIcuMVd8t6dpNaLhcMZJB/7BW
         SjcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101612; x=1793706412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QE9XGJJc4fSv5NK0pBPw7TKpZvBBJTMfX0/e+Q+5Ads=;
        b=D8OvPbJJ1Pops5ULWS9Si1cCJ4vzJ7Dg31wQvVUBrSutpxaksXgBY254ElSXmsUPcZ
         kYVzCG3h5pMemWmgvrzJ4D2HYF8VTrmLMjfAoTIIc49FA4+JfTWXLCu2ScUwg+uV1Xbi
         EiomE8fQ9cy6JKCEFMih8gp827G7HC6hqSY0cYcqFvETXesBuzlkYIfzBtDB8GlL0N2z
         Ki/JWN33yeXIiEzPM9aEXt4ywp3mxp+fwVhjIgoTCchxnj+d+/fsqS1ZZLSTHUAW3cJ0
         9ZYNAGLk6xaHABcNxslJP6J7ABdRjQvMxHa2uG5MyMNQLRXHbmKlk12EF2jkHD3vXFm7
         nufw==
X-Forwarded-Encrypted: i=1; AKwUvBxp54g8J0cbe8P0xKaAJ5YKojqnn6L+wkmLVUwRB1R4B8JfrZL++jpeTqrzpJd4uUhhpIXJ6yEptSs0@vger.kernel.org
X-Gm-Message-State: AFq9FYLEjMNx4Y9awjcJ4Mhf33RVQvO1zuJyVFLWgJOSmotHGZMhYZhm
	nBvUliAoN1BQeCoGswkY6AWdy4Ff3Q5LhZkCpbW2lqsK5u1IGU2SWMqT
X-Gm-Gg: AYBFou1IbMXTjnHUfGxIViNE6owS08WEZnE5bTJxdy8MiUYEFk9Hwt8NJzxqBJBq3Ce
	GA9PxwCWOdimuk0i/GosuP0+2IDZFQY0mQwRtjz+FuQ81ymLuAZuazX66LFrvt4Lf/aqK4SXiCm
	8IHyP5nN/mLkXeNaW2LUriUUibKtRdUBphGmCYS6ZSrTUrtClRS3LKgKIY2t3JmBTNJFfJVoLCM
	aalvH6m1Bz9Y+DuM6OXMhwgzXZqdjf1eTLqiJWYRQAy7Algki+xxg4DuvaF8/ZhySP1QLz1hL/6
	kY/sKJbd8KWqtebdpCiHjIHKc1K0DdJR8FDlynanJ0bfbCagJLbgDeBImgyo4DDU08inuvhlr3Z
	yCl6KVvahqyZRe0v5RK5fvUmRMPbz7szirHTOB1XffoKMDk5r6++6G9evKpNTfPZRcQpCgHGZCS
	rFtBL5Y9AOsPXhvgenM8OdYNkmpq6d5q3IXGBuUsVbZXRNDy28r+paOu2/i6ckF6icJmZpH3J/p
	TZMXxnYedGX9e7gqrTkEj2cIlhpcNAlrv3uuDalIauV1gm1z0cErc/R+RQAJTC6ydflXMr/yDeU
	Ii9e04sNs8d98L57W84Yig==
X-Received: by 2002:a17:907:d64a:b0:c2e:4b90:3c55 with SMTP id a640c23a62f3a-c46bdaa5e52mr1109139466b.5.1793101611523;
        Tue, 27 Oct 2026 04:46:51 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd529b3csm430692866b.37.2026.10.27.04.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:46:50 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev
Subject: [PATCH v4 2/4] mfd: max8907: Remove platform_data based probing
Date: Tue, 27 Oct 2026 13:46:32 +0200
Message-ID: <20261027114634.79706-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261027114634.79706-1-clamor95@gmail.com>
References: <20261027114634.79706-1-clamor95@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no in-tree users of this driver, but it supports devicetree
based probing, which means external dtb files may exist that work with
this.

Remove the unused legacy code and make this a DT-only driver.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c                 |  8 +-------
 drivers/regulator/max8907-regulator.c | 11 +++++------
 include/linux/mfd/max8907.h           |  5 -----
 3 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 7bac1d6517717..363ac80c0593b 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -184,13 +184,7 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
 {
 	struct max8907 *max8907;
 	int ret;
-	struct max8907_platform_data *pdata = dev_get_platdata(&i2c->dev);
-	bool pm_off = false;
-
-	if (pdata)
-		pm_off = pdata->pm_off;
-	else if (i2c->dev.of_node)
-		pm_off = of_property_read_bool(i2c->dev.of_node,
+	bool pm_off = of_property_read_bool(i2c->dev.of_node,
 					"maxim,system-power-controller");
 
 	max8907 = devm_kzalloc(&i2c->dev, sizeof(struct max8907), GFP_KERNEL);
diff --git a/drivers/regulator/max8907-regulator.c b/drivers/regulator/max8907-regulator.c
index e59aa7a3ee546..521825c0adc07 100644
--- a/drivers/regulator/max8907-regulator.c
+++ b/drivers/regulator/max8907-regulator.c
@@ -274,7 +274,6 @@ static inline struct device_node *match_of_node(int index)
 static int max8907_regulator_probe(struct platform_device *pdev)
 {
 	struct max8907 *max8907 = dev_get_drvdata(pdev->dev.parent);
-	struct max8907_platform_data *pdata = dev_get_platdata(max8907->dev);
 	int ret;
 	struct max8907_regulator *pmic;
 	unsigned int val;
@@ -312,10 +311,9 @@ static int max8907_regulator_probe(struct platform_device *pdev)
 		struct regulator_dev *rdev;
 
 		config.dev = pdev->dev.parent;
-		if (pdata)
-			idata = pdata->init_data[i];
-		else
-			idata = match_init_data(i);
+
+		idata = match_init_data(i);
+
 		config.init_data = idata;
 		config.driver_data = pmic;
 		config.regmap = max8907->regmap_gen;
@@ -331,7 +329,8 @@ static int max8907_regulator_probe(struct platform_device *pdev)
 		case MAX8907_BBAT:
 		case MAX8907_SDBY:
 		case MAX8907_VRTC:
-			idata->supply_regulator = mbatt_rail_name;
+			if (idata)
+				idata->supply_regulator = mbatt_rail_name;
 			break;
 		}
 
diff --git a/include/linux/mfd/max8907.h b/include/linux/mfd/max8907.h
index 4be3c2370e2a4..e222250f0cc1e 100644
--- a/include/linux/mfd/max8907.h
+++ b/include/linux/mfd/max8907.h
@@ -227,11 +227,6 @@ enum {
 	MAX8907_IRQ_RTC_ALARM0,
 };
 
-struct max8907_platform_data {
-	struct regulator_init_data *init_data[MAX8907_NUM_REGULATORS];
-	bool pm_off;
-};
-
 struct regmap_irq_chips_data;
 
 struct max8907 {
-- 
2.53.0

