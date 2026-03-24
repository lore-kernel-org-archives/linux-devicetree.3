Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 344073ED107
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 11:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774352313; cv=none; b=SgfhQ/zIzD5RHN9cEPpoHJW6d3jL2osSDOpjSkLAcA3pgOHYq9mn9L+XG5SHxjY5YJjaXVvTxqAQ4IQKiCs4D3gNoTNwRK8/ruGZrQazqV6NCV2bTG5rXCpMZcC6Fx40Wo5knI+3Z7xX2XTSc3dUoUBBX8Q1kzx3fi+Ku1hUQfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774352313; c=relaxed/simple;
	bh=1uAjKjH8Mriiu2XHqXVfsDGlgQSHnV96d3u/aQzpXDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fsrpp5w1kOq976SJc0b4TcZ6n1wm5+XMC3wXV2rwa+8R8shkHJsVayKagp+KlkAHzA5ka/aLU17H35MMsdEohSm58fbMAQ8ohr9ZXAdcUBRt5990RIxOm6cO5gmzECN0RSu9mlsKO1NYedqpASXx/pjEdvvCfEoKtQScWq2whxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=LoxWdPsh; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="LoxWdPsh"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-48704db565eso29809235e9.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 04:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1774352310; x=1774957110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=veDJydETiE9Gv6g2pRG32dl9Jb7Mpm7Du1gG7k28aTM=;
        b=LoxWdPsh6BjiTuvi12E25hu0JCTEt6cVS7lNv90ueKFeHmMYU2kjIowpu953fNiu8x
         ZhKDF9xDPBWxUSZopo1AB0hjHIoliPxHbjaUHq0rVPc9kZoL34CNfptTRvJzgRbw5o2A
         vZo/Bxc+ozxUMm4Ry+60CNxi8pLqiPJ+5EVJafB8SIZQyuZoht8MUu5/I+EpNj9YEJt0
         DsArQsjWNuQfgsA3FFmqwxfj1TenwEUexmgH+FKLkShE4ReUj+CrPGvSqtUdOFz3+YWa
         ovK0IBBGnD7ytEPLMy0qntNUYyifkX6qWo6QeNqcyeE/8zKT0w+olBVZEP8NC9i2ERNm
         Oi6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774352310; x=1774957110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=veDJydETiE9Gv6g2pRG32dl9Jb7Mpm7Du1gG7k28aTM=;
        b=bcwzL7a5D+8yA0ifK/UU4YF4CyWfCqTC2WWtmoh/oIUvv5Gjepu/BL00RH2tGBXAam
         HqKmqZShLruoLE91gaaiK3RfYRw7FytGwJdcryOu2eRuxNSyzPvpIdGXCGOZpQ412HQe
         GDMcf4PSjEVjpw8n33Jwwax78rrrgxDuFUaAJNCkwJNzFw5/PyasDGxPL43IubzahUxv
         oAfllfWYWrbEwkf8f0/um1NP0CAHVPC63oAYp5eYXyPTza0By8b+LI0Kl5u1hkgXYI9C
         AzV4oyOAoyT425MWlKHzZwIuNwS6buZhOsVvBH2zECTmjtCb9F7zfj1tShCO9nf0Cc5K
         jZjg==
X-Gm-Message-State: AOJu0YzR7bot/MvXgI4M0uV8XkfFTdHlPSHQaNRWNA91tKClIGl5xHg8
	DhP6/a4B4zEM2ULm8TBT1+b412ZQexm4F7E0VbPS+aqSD2+uEX8JT9WtapeaE6p88SU=
X-Gm-Gg: ATEYQzyu+1jsYcg61hA8ApBjLPCg+U3HA7pFO/gE282vpzjFCuiJyderLeERNcGGbKW
	xOoS/F+GZKfbaVPwCTOJKVmof7iLjQ6xWZp2zZyP5tqlogI9BNW9u/3T4Ib+wA+D1xQ3+MWNPMp
	/T6lNZwD2OMKSy2JvH7YKWxWphEJH1CtFFMUeJd0CDby0XsSiX7wLg0ujqMBO9eqeLlO6LCJ6xB
	KAmjM7i2v6/+CRq3nIGhV7yLUxLWl2Sfwttm9S/Pj7BzXg+UukyfantYW4mPnGVmxw0lp7eftnk
	gFZywJ4iTb8obCsCMt/oKgGRObUGW5nRsCnFTaJN1Bha1W+9diF+56+b8MR22/jVhLnQ51vK8u0
	CDs1bW0TIOcyaZWdAxq609PzJRldiO3nFVxJYd6Y1iVDoz0VtkWuX2CNwdAxqTyJZ2q8kvmxftn
	2x99oO20jpRuhXJV84m4Zj9YCiq5pnBoFG3gjFnAKW4jR8zDzNPkDWG+VQpZnW72zIbbp3/9/ru
	aiNVg==
X-Received: by 2002:a05:600c:8b31:b0:485:40a4:364 with SMTP id 5b1f17b1804b1-486fee1af50mr221443735e9.26.1774352310539;
        Tue, 24 Mar 2026 04:38:30 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-86-98-192-109.alshamil.net.ae. [86.98.192.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f6c0fa6sm20846715e9.1.2026.03.24.04.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 04:38:30 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 24 Mar 2026 15:38:08 +0400
Subject: [PATCH v5 03/11] regulator: bq257xx: Drop the regulator_dev from
 the driver data
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-bq25792-v5-3-0a2eb58cf11d@flipper.net>
References: <20260324-bq25792-v5-0-0a2eb58cf11d@flipper.net>
In-Reply-To: <20260324-bq25792-v5-0-0a2eb58cf11d@flipper.net>
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
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWQeKl8bE7h14Z3g1uhf17mkmTYxbLs9Rzhw84QMT22+Z
 qmVvM1pHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oaGOsY4RAxenAEz152cM/11dK333mmwI/bU2OpH7ESNv/vu7gTKVv6uvCOq2dCYe/szIMOXO089
 NQqcPyvffbd6ao9s1N3jKR7M+ScXOIGnfxo5PDAA=
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

