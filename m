Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE6041C30B
	for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 15:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774971838; cv=none; b=Y5FhV9C51nStvrvdClhwVMgIP0dWnxa+1vAFSeYqRAS7iqAnkDWeQQ6wA8slrzT/Qv2+rpCFpnJUT8hGNwB1jkfRjIkoZWgBfi/C+rkQZjGC4BPq0hh4Pq36eKfgR9I9/mKGaaii1zbH0392GFxz4UzUKIxoPV6C5GeWoR1FpjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774971838; c=relaxed/simple;
	bh=1uAjKjH8Mriiu2XHqXVfsDGlgQSHnV96d3u/aQzpXDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cx3fCjc/+bQHs29FSkj6tawCCBeCkR+03TIMcx8AUXYn6b2Um6wivZ9vOiNP8ThNSK4aZywGgHewSS6fAU66HVvIK8FzV8jUkt/V2O4489lWzhxRevytQEFxqLV522sC0PYbds8X+lE/7JvRAa2e43AAUXKm+f97/zMa9Hf0RHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=qnHcMgHH; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="qnHcMgHH"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso52729785e9.1
        for <devicetree@vger.kernel.org>; Tue, 31 Mar 2026 08:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1774971835; x=1775576635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=veDJydETiE9Gv6g2pRG32dl9Jb7Mpm7Du1gG7k28aTM=;
        b=qnHcMgHHjfDccj+1QAnj/lAlt5BiyHG5F+cD1TDTpQsrXKAaEnovoEcV6gqEYk7PgJ
         0ASc2pmisv+yYDLf+8YHpl18UwnFwF9PImEVYpehNlQ8nyO3zicrVh6J4KCMzJVQCTnK
         K5y6CePvSNkMlxeIEA7FQ1zrTEJ2/J7sLydwgqzpQ3JQLg90FjZ5FmqiKRdgtA11zi4Q
         YNisKgXa6NmRwVlBjuNeI/1wGeOFe4so1PzRsr/cXIT3+CPcB7GnOGXyKH5GpQOm6mpN
         77ziPdcrCpHk51E9onAZ40r+AQ9zA2WD+an2LS4qGBNfAdIj/DEZUUYdsoSQQY7XaTEu
         fagQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971835; x=1775576635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=veDJydETiE9Gv6g2pRG32dl9Jb7Mpm7Du1gG7k28aTM=;
        b=QWDvs8+Ch3mEY+b9lTqYauWB+QhYe/NIB4PkSTSMaZiHVWtw84bsoNJZL2kyTbhm2B
         olPB83XO1G04MtEsrcjvnnBQ7D4kBexhUeefz3eIMbTc+HwVhAZ6xOKdjiTVTaOuj4k9
         YxVk1TYuESNRjwiU30UTNFiGMOvLxxoXtckVXjar4MisnfaJlUupwblAgCzyynCbbKsL
         cmeCdlHFXcheyulK6hzhKb7H2aYA7lr1QlgCAdNW3xZhwGLFFNPdgce3KD17sj8kD3aZ
         kJufLsDnWDC4ocameXNLQSE/8ydlyNhtZ0OLBYkJlCE9n6nB3Vb68m/r4LNjAES/7kXl
         37TQ==
X-Gm-Message-State: AOJu0Yx0AMj8xgZ0cUEHrH5UPYPeeEDGC32u3eZi1Cl15tqUhohucenE
	nGiWqANXgdmVUpogAe0+CePdZa/eZf6+GatfKvIbaJnHFzo2FiKI/2aB41iUv/GwMkM=
X-Gm-Gg: ATEYQzx6DiF45dcfG20R5wD7g6p6ugvBykwUnpsYHso6/TyQ/ziE4Hg3e3Sw11fvQze
	gd4bZrm/3WW6E4JCHo47hgWyC2iB/2C5a1/T+asrKOmXIclJdZSzatoGmi7yYJOI/yVRJOHQcUj
	LnyY1X68IcQ1hnsXVZmudISowxu+Ifd9IXnbQDVOV9W0qktSl77MfAICqQX1u+s+yQxDAMCLjpx
	xTSfvhYmpULpV+6m1BKUvkyXlQ7S7CgJUye/2QFOUvAykG3/UpSa7ysEptDRmSIf6unYody3+dd
	6bGj7NcUAEQf/z+OwV6RtkgPCzMj2y1Pe5hrqHMGa6x3erR2Y7c86Pc7opgZNpjqjcO6ZrtnKTZ
	mU2AUfDtI9prvwBqpT9MSQz8XFzBlTqXcFmLpBISF+tiHpmJmor3RlKfZ7E8o+RRl7fcfF5XE0M
	lO5hxArmqQfh2UJdoMiKTahVAuUi6OlXm8bojtrzBKQfYfcgROLXe3D3k6C1do+8FnS1FD6wkMH
	IiM8Q==
X-Received: by 2002:a05:600c:34c3:b0:485:3f65:94a1 with SMTP id 5b1f17b1804b1-48727eda72fmr294205335e9.18.1774971834917;
        Tue, 31 Mar 2026 08:43:54 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887c8852a5sm48412605e9.9.2026.03.31.08.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 08:43:54 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 31 Mar 2026 19:43:40 +0400
Subject: [PATCH v6 03/11] regulator: bq257xx: Drop the regulator_dev from
 the driver data
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-bq25792-v6-3-0278fba33eb9@flipper.net>
References: <20260331-bq25792-v6-0-0278fba33eb9@flipper.net>
In-Reply-To: <20260331-bq25792-v6-0-0278fba33eb9@flipper.net>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-pm@vger.kernel.org, Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1643; i=alchark@flipper.net;
 h=from:subject:message-id; bh=1uAjKjH8Mriiu2XHqXVfsDGlgQSHnV96d3u/aQzpXDo=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWSefr1+IrODV/rWs6zSx7Zo/dp8bsLnoqtLqkWFTzZ+8
 3vzu2jrro6JLAxiXAyWYoosc78tsZ1qxDdrl4fHV5g5rEwgQ6RFGhiAgIWBLzcxr9RIx0jPVNtQ
 z9BQx1jHiIGLUwCmuvIwI0PDvuoJQvujb3zOX+L27M5U4R+cMmHircIPVnktdp63aa03I8Oas90
 M8g/Ldtlq2emtYHFSXj2T7+iCqYGmy89r//CoKWcBAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

The field was not used anywhere in the driver, so just drop it. This helps
further slim down the platform data structure.

Acked-by: Mark Brown <broonie@kernel.org>
Tested-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 drivers/regulator/bq257xx-regulator.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/bq257xx-regulator.c b/drivers/regulator/bq257xx-regulator.c
index 812938e565e3..674dae6109e9 100644
--- a/drivers/regulator/bq257xx-regulator.c
+++ b/drivers/regulator/bq257xx-regulator.c
@@ -15,7 +15,6 @@
 #include <linux/regulator/of_regulator.h>
 
 struct bq257xx_reg_data {
-	struct regulator_dev *bq257xx_reg;
 	struct gpio_desc *otg_en_gpio;
 	struct regulator_desc desc;
 };
@@ -139,6 +138,7 @@ static int bq257xx_regulator_probe(struct platform_device *pdev)
 	struct bq257xx_reg_data *pdata;
 	struct device_node *np = dev->of_node;
 	struct regulator_config cfg = {};
+	struct regulator_dev *rdev;
 
 	pdev->dev.of_node = pdev->dev.parent->of_node;
 	pdev->dev.of_node_reused = true;
@@ -159,9 +159,9 @@ static int bq257xx_regulator_probe(struct platform_device *pdev)
 	if (!cfg.regmap)
 		return -ENODEV;
 
-	pdata->bq257xx_reg = devm_regulator_register(dev, &pdata->desc, &cfg);
-	if (IS_ERR(pdata->bq257xx_reg)) {
-		return dev_err_probe(&pdev->dev, PTR_ERR(pdata->bq257xx_reg),
+	rdev = devm_regulator_register(dev, &pdata->desc, &cfg);
+	if (IS_ERR(rdev)) {
+		return dev_err_probe(&pdev->dev, PTR_ERR(rdev),
 				     "error registering bq257xx regulator");
 	}
 

-- 
2.52.0

