Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446167;
	b=5q3NXb5npHxOEKmJwiW+mxd5ytwkDLUxcUQzMvhrZ0YhvrjaTAcmLQM4Lhe2h6FBlsOO
	 VNnJX0Da93lX3DrToV7jTLc6tV0M/39dp0QCr2kW3nnlulGxVcTyy/CHDsy10sGadpIex
	 9uTt7pcBwhYlNBWDmuRlHlcj9l8skXvHTmn0VgNNMNGGImali+T3n2SjqbaKBR5TUs7S7
	 75pc7ClU959E4L4vRTnA8NMHnrQAgDt1yhZo8/CntZGzC+jcCt5iFTOPYEvRcYQTqrgX/
	 uldHe/yChXQrfPg4MrFowUj4x//wXNoDwQH3zf0HRX3n7KlCNLtQXzYpI3jh1L0zukQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446167;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JjuBKnBDosONIf5dJCxa5Uu8aJ5mWHCfU8BLSyQF8eQ=;
	b=1U1Vpoz96TZEWjW4K6fxT1E2xvYFpTGQVIhPgSp2jG6T5+lBtfeIx3vnJRN3sy8EfSWD
	 IsgzlWUSwVF+D3DuA8wAoDnzPkjTQ97DdRYAKmjk6se0VaujW5zQ8Bj2WRTXDKIGxc2Ko
	 MC4dW3w53Z/nC+qyQbR26+QQNUb2ztVd3F2EP75mBnxvNX+1jsg4BFVc3TXVAfkOqXlEQ
	 b4NGCb/VCAG6hGatMk1zRxe7D7vZt1j2cFwBMeooRRNtBDFwFtQ3cJX8IRyl/aO+J9ZOe
	 stq2DJUFNSMR5eMK/LvA3yQJHVXCk2acTLThsxTOUvu/+pGN44h4sQI5bX7YCOZzoBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=seAqjJRZ;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF6F606A689
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 15:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BF6F606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=seAqjJRZ
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c50933bdf4bso710842666b.1
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 07:02:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795446166; x=1796050966; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JjuBKnBDosONIf5dJCxa5Uu8aJ5mWHCfU8BLSyQF8eQ=;
        b=seAqjJRZNq3wLY6hn+qGvoYs17635nlmvda0G5cRl0FPPD9JP6td5NVhbcySQJW9SV
         3qO1nxx1BW7ZdNTVKXjZ0XVK98ZH3hHAg6wDXLYVsPSqHSWwRU1MRSxGZNgDaT5adk1K
         fk30tJN7XwrcicD6eCM+eJfkCWLLaPdPQxzU4MPGtecZ7KCd97laW02uAZ/lFLSii4q+
         Hj7HckdCv7sUOhveMW72zb/w5maATHiEDp89gScH3FwAtq7G3f5MkmRj0cFd2v8mEfTW
         7bzi+nBruJjERCKwXOV9KH9l0p46uDdGqtzsDzqOlkxqyQY3HMdQ9zcTIjg68SN2eddz
         FTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446166; x=1796050966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JjuBKnBDosONIf5dJCxa5Uu8aJ5mWHCfU8BLSyQF8eQ=;
        b=EJs3vHH4R4MvHlR9ApZZlKr3oq0acoonaFe5vRfXLGSVe7JsFHRoSw6o7J4KRAXagF
         XO0YR6pHcsum4ijulPjTtS91Q/Wtq7LcYyGPiOp9+UQr+MhyBv6qHohat3ktxODgPYIf
         XcNoLHiefctwRdcsZ1iLQ2terOwx3MZ/ld36LZ0wBudaAhLF5PKqny8G2CTDe9qssjQ1
         APCEJODfIY8Lqtbcb+4+0SghD/qV5ahdyT7jTKHnQxruutjXcQg70gfugi0Abm9KQi+2
         YmkV+F9N7dNYuvP79GkACQBC+Thhtsknp+Fk7nPcMn+MdqPww+JMiK45JoBRS2cZAZBv
         Am7w==
X-Forwarded-Encrypted: i=1; AL+hErHAktQ8K1lqXkVPUBXywMJIeLWWMoK3HlzwEd8t4BnLUKu+LQFI/mn0pkqawK8fI0oMOemynsNxm6wB@vger.kernel.org
X-Gm-Message-State: APuU4Z/5qYI7As7Q2dzuK06o+E5ksWCQqyOQUfWvnr+s676LdoR1Gxx2
	CmiLeO+T/MxVnSN8rHM4tXAseH1JAEq72l2KFJZk/VtOk4d6kfoI8FLI
X-Gm-Gg: AZFdTZetEP1eO9WYnPQPAf/sT98wkW0HAhbcEJVZjFfgDOp9qLS+x1ewTxXkbEIqeMr
	lWE8FWz4aZIfPBYSOpohfg6PPZnQVkQnExlQyy5pzMJxU8dGyu7gtEjGAmF6iHLgSzYC60qcowc
	PxVTYNK+m4JTrAtaZOZGX/OTNU+CKNVpPJdHMCR1L/jzmC1rY29wwwUxRTlbmWvogxzVV29JUTJ
	KP10TXvlrWs7QIl9VFDIqtUT5DNVE7i5QARBjoKtPeeQER4cp1v/0PsQ3Rb1DToLR+VO0lAtONs
	0GCU8wZtLHtyqiRCsxQRIBfbP8oLGuYVySZIlKan4SsYz1ct2R/xhUXQ2zQTkK2qXFlrmlOsLKC
	YLoCiQsphKb6+wGfGX1PWt2Au1Q/yCeWRkHuSRLpzeDNV+wQZNTbej0/lRzaikDbUENciD4nVER
	mD6zlxdp2J3HaQxwgl6B548L0Ra4Vjahv2oAxPI/zi9EX6anEeW2acrsJ/5GQRM5aN0JSw/AW6U
	2kPVASKxgjxpWQfH2Oc/GD0ENYnPfzZ7kZRA829BqV6S6R+3vkfhZGsVYZvOKbuNmlkhhPVXbBW
	tss5nObGJFEXZP9tVyQBNiZ8zeWFkzSLen7pxLSN3gA0jktPDL4QIiuJ/12MF/DqtyhP1zoCnYG
	86PoPV27oRA==
X-Received: by 2002:a17:907:1c8f:b0:c50:9412:93f0 with SMTP id a640c23a62f3a-c51317e3208mr1047945666b.8.1795446165573;
        Mon, 23 Nov 2026 07:02:45 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfe3b0sm418484866b.8.2026.11.23.07.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:02:44 -0800 (PST)
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
Subject: [PATCH v6 2/5] mfd: max8907: Remove platform_data based probing
Date: Mon, 23 Nov 2026 17:02:21 +0200
Message-ID: <20261123150224.199601-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123150224.199601-1-clamor95@gmail.com>
References: <20261123150224.199601-1-clamor95@gmail.com>
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
 drivers/mfd/max8907.c                 | 8 +-------
 drivers/regulator/max8907-regulator.c | 8 +++-----
 include/linux/mfd/max8907.h           | 5 -----
 3 files changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/mfd/max8907.c b/drivers/mfd/max8907.c
index 2f91791410538..a0e0c480ff43e 100644
--- a/drivers/mfd/max8907.c
+++ b/drivers/mfd/max8907.c
@@ -188,13 +188,7 @@ static int max8907_i2c_probe(struct i2c_client *i2c)
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
 
 	max8907 = devm_kzalloc_obj(&i2c->dev, struct max8907);
diff --git a/drivers/regulator/max8907-regulator.c b/drivers/regulator/max8907-regulator.c
index fd227fd136121..84de0c443c945 100644
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

