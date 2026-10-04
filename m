Received: from mail-wr2-f33.google.com (mail-wr2-f33.google.com [74.125.225.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2793CF026
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 16:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791132367; cv=none; b=L0brq8kJmwB0uaaofQPslmHi9EbfUTHzB6b3I2AnoOgyK/YVYBY4wVAdQPFgZXqL292vn09gYKbsIbLYLUAKObuWioNQzqhzE4qvD/+97HDT095+Pfen3mH1jDxFwn3O2QWEReYkr1h7Osa2NBH+SEYrOXwrJsI56MXuzWEOoK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791132367; c=relaxed/simple;
	bh=LUJoAfm8d9DBAnqMkyJ1+9asGnatYQIAciuxSlDdENQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qGEKaxscoPdkgcp6TTl6b0ORuEhTn67yKkOTKqr5uABPgI6YMqLqyIZvH8E5bngbodR8FPhWOb2QHldGmGEsc8+ZvVA7gjpZ05TlrwIqByvCbp/qTHwbRPo42g7PQOchIC5neaL5LP61NWgvvVcw+DnYqjCrmclv3MRWl10dqDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDpKvVTf; arc=none smtp.client-ip=74.125.225.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDpKvVTf"
Received: by mail-wr2-f33.google.com with SMTP id ffacd0b85a97d-48b104f6aa3so476674f8f.0
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 09:46:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791132364; x=1791737164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eBC/FZXgBVy2qPIQx5Do4tZv6p6o386K0itsEb4weH0=;
        b=HDpKvVTfylXk+A1ZKTrXmCchUZnM8elde2BeB/WRLWy8CGYPcVmeTC8a85ZQIoIXBu
         UfKaCaJiLrRD8amqntPODL9L/qx5oaX1b1ztGpwoLPRIQflXG8wZTw9TEKb88huI5kY1
         bthPMkyd/XNM0KanOow41sxZ7xquY/DgVNHcDE56vxzmT1DBnQ+SapE95hfGDPgEG19s
         cdOUXxoYF8YMw228vC6EmtI5eH1sx6n3DyL8ttb5P7mF778URQ9Oom1wKRvdr2VwJu0j
         fHbUOrBwFXca/RNeSkroOJtZ/vfmgIPIAeNldX9SRpvUahPhuifl5HoVSd2S2cUEw6jG
         pQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132364; x=1791737164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eBC/FZXgBVy2qPIQx5Do4tZv6p6o386K0itsEb4weH0=;
        b=teVpbFk/QjmQ6epYctySWDEbu96johJPIsZk4J5V83AwSaF4egY582pJoi/qYn8op/
         0WRNWqPUG1uDm4Gu7LUzKC0Gc1byTSi2qRX11PkDu6GV0K4HkKHewE2L1PfAGHKg6tXr
         +D81wekiVRUJQcVt+E63I/Hvz7BFGuJ3ttoEflJxys9peUt7EBLYu8vf4vyzk6tXUpqu
         TDbkY7s7dfH5VHaAvJMJRh8iI2Olv9K0/6oZ9evBTMFjYl1iAexq3cxpTXkVjf+K9ud1
         y2AqwcD4Zpd9xyYQRNmg9MyvJ0o51ydD1yGxxZ71/LOwTxZWk6CpLTKO527JphDcyoJJ
         XoTA==
X-Forwarded-Encrypted: i=1; AKwUvBxa1IchpGmpIzF1DVQ96Q3BBGEgJEHwjPgwP+Ud7+BIn29t4+5rR6vD9vR0uE2l0fDuwTpNfJxFMuvy@vger.kernel.org
X-Gm-Message-State: AFq9FYIPUJW3hhaWqCNlVQzYEt2O6fQ4HMey6kRLbrq3XvPqJNxq8QkW
	0IpigNi7RzVpd8z5nbnFHdHrsRYC9kDgc4OU+92IHsulhDM60f4CLeVu
X-Gm-Gg: AYBFou0lqfyDs2z7u/jyOoDp9qkUjoi/aTUmeI5zxT6YSCqGxIOqf5aecYt2rsX9LyG
	ZURE7xpxgCjOi3lmKw3Qu72kkxiRsVPMjmDDSsvZUYWuGfs14Luj8yLLfyhm1uEqQ9X7Oi0S6Wd
	fFnPCkDIEDwSEusWt3etE900C0k1xv2BFiLK2jRJ/87Xu9dnSdFbRWRRU8ly3nPsOHD1yFegvVa
	Z+JfBYTiKzq602e9h41QeER/LM9FPFD6obVm/fsEEIK9jzELkX1SQ8O/La9LOwsJTNGA80jBmrW
	rIwiBi90EShfSNzZ2aT4HVTWQwDEJRK9tU7NKZDk8kxc2TfJACj4t4QCjFIS/jEJ0SqJ8yco7ws
	n96bOxSVLubLCzPBMFhvOOg79CynjxLbNysqR7ASYDzbPGi32dXcA7Wt5ppwkje6bMHGV2Ecvxb
	iX+M4RwNElo7aW/HYtsWUR8u4o1GSOxXjv4iQgN8Ybc0bVN4M0UcaHahTaiBuXmimUWe6Jv20PM
	mzZOmjnpiD9zKJZliw=
X-Received: by 2002:a05:6000:18a8:b0:487:57d:18e4 with SMTP id ffacd0b85a97d-48b1276ad48mr14676290f8f.41.1791132364197;
        Sun, 04 Oct 2026 09:46:04 -0700 (PDT)
Received: from xeon ([188.163.112.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380f0613sm21801435f8f.13.2026.10.04.09.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:46:03 -0700 (PDT)
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
Subject: [PATCH v2 2/3] mfd: max8907: Remove platform_data based probing
Date: Sun,  4 Oct 2026 19:45:39 +0300
Message-ID: <20261004164540.198446-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261004164540.198446-1-clamor95@gmail.com>
References: <20261004164540.198446-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no in-tree users of this driver, but it supports devicetree
based probing, which means external dtb files may exist that work with
this.

Remove the unused legacy code and make this a DT-only driver.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/mfd/max8907.c                 | 8 +-------
 drivers/regulator/max8907-regulator.c | 8 +++-----
 include/linux/mfd/max8907.h           | 5 -----
 3 files changed, 4 insertions(+), 17 deletions(-)

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
index e59aa7a3ee546..907ed3fca5e97 100644
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

