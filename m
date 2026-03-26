Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC91364EAA
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 08:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774512679; cv=none; b=q2OZlw3PHHBTYgaBrvfEdzgi3I3e8Q0iTI2kMwTicppVp8q5KvoWLInBssj35siEuPK1+F8w5FGuAMRrlGau0+94TfHT22YJudotpyNOLaMdNRjH3zA9hndwx03X4t6uCFvf7VeTJL5aH9iPIcHLTlGjwjHKDhKqU+U517wjUT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774512679; c=relaxed/simple;
	bh=WVD+oQYU4DDjFVTcmhlg4TA6UdE36jaEIjF1vHU+HN8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Da2eJds878t6QRHNKSR+fr0GI+yw4uUIeOlWabnQ/fbQkDqTFWMAf82a5t3UBrHvJ/7xpTeva0b0GZ6MWbdSDBlbd4g29XsxFBnnE86kjbZrxml+OlsaQbof/AIdpmcZB6oN6dOJwh2MUq4uZuBnA5BGAvG2EnftVhyDlc4jL1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kKBP9zZV; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kKBP9zZV"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35c06831dd3so703147a91.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 01:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774512677; x=1775117477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CC10WFWDdAyN+TFjNPYY2y7LqaKz7gtKkshZ6FuGwXQ=;
        b=kKBP9zZVmWQRQnekQhtilcASqz1VnyBnkhl1pze2bWbG3LPGTurbXoG3/hV+ud6qYD
         gIMensIMDP6u+N8YqLdkgxmGJD7dCixfANwlWV8BOL/ww0+6i7akQU13G72Peyt0T3FB
         LPfSMGP1CjCfvaAvOpHreRp8RYkMcwkSPILKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774512677; x=1775117477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CC10WFWDdAyN+TFjNPYY2y7LqaKz7gtKkshZ6FuGwXQ=;
        b=BaJzaKMv6zlhzSJFDBfvosMYqoR9HYFfqxqI2x9wy3mgHRJX4eemIfyre/RU1cd9UI
         TtvQ1IIU5jX76wAqSRLe44TpzQANkrLGr64YBhv0LjYiLb5Cg/E+QMQ36ndPgzwkHbuP
         q9ciIv0aZ5tB4j89Ax19DSq/fOHp1XFn10mcL2ROcFf17ZwdSXAdvompZtESuIN6wUyu
         65f+/al05cga5+9+rPAFD//ACc82AAPAA6Nhpgz0RkcPRWKCzQQHePcBicZl8FaY+oPa
         tLjnzFWq/7YPQGMaPsZZqfrxO1rRJYLl62pHMLVNEeKUoH4LUlZveR/B86r/wnniAjtJ
         q3uA==
X-Forwarded-Encrypted: i=1; AJvYcCVHNhQLr17pbzVvfLx+DnvF9jLL32Cdy9GVkrQ4ALSne3wMwd1T7BF9R976DsBxPExesmcy5MaZdLPg@vger.kernel.org
X-Gm-Message-State: AOJu0YzhGTHTwNAu664LaaFTEfwevHDcMvqe+QvuT7JncyaEGE2XGTtR
	nbVhzhQoShrLhCgY8bG6xsVw/sYCLn3dTWdbfsbHEjiwDtj+gqzgI5M1wM65PfEQow==
X-Gm-Gg: ATEYQzzwzelRiwwTlahk0tR85bclQvqRxW749Vv4pxehaI3hLYu2bhG+hNwEchi2O6D
	8L9E/FAkl8dfiQIUhI4wE0kxlMYpVcRrYCZsVYV5c9tRIygNEIsraxEWpIYWr6N4CRHZzdV7R7l
	TcJ8HW506fy9qFHlKRVFxFt5Tu1sues3xFGb7Z+GCBjbh2ua45tepVK1WH2dqn2jP3HiaBdkAFo
	kNk+Dx5iGnRI7wntGKzqT6O4St7T8mxQ6NmLXJJLlawse1AxvHRrp5izzoRDKjBEgJjnYrZXnAE
	QeeQy3+GzBYKO67QhfDRJjZf/yGEaSa5JrARS5NCcE/Rk0NIvv9FTkmFmGmE7wNbdfeF3tCFD7q
	ZKBoLbk2T8fEP48Jjz+y7f3eHQQBEcAnE1NfP0rop0YUWq/8fPXSUEM/whYYoUp+7BSC1MzevpW
	NtFQYGDoAa1vjkakYPmJ5/FSATcLMGvLBg5Amj5shZY5Xr6b3YnDkv9oOBHPcWPXiM8vCFwmTLP
	P9phteN
X-Received: by 2002:a17:90b:2645:b0:359:ff8a:ee44 with SMTP id 98e67ed59e1d1-35c0dc8ee2bmr6266111a91.2.1774512677238;
        Thu, 26 Mar 2026 01:11:17 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22d09573sm823452a91.16.2026.03.26.01.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 01:11:16 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] regulator: mt6315: Add regulator supplies
Date: Thu, 26 Mar 2026 16:10:49 +0800
Message-ID: <20260326081050.1115201-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
In-Reply-To: <20260326081050.1115201-1-wenst@chromium.org>
References: <20260326081050.1115201-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MT6315 family of PMICs has 4 buck regulators. Each regulator has a
separate supply.

Add these supplies to the driver.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/regulator/mt6315-regulator.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/regulator/mt6315-regulator.c b/drivers/regulator/mt6315-regulator.c
index d3f93aae0fc5..231e64fb0596 100644
--- a/drivers/regulator/mt6315-regulator.c
+++ b/drivers/regulator/mt6315-regulator.c
@@ -31,10 +31,11 @@ struct mt6315_chip {
 	struct regmap *regmap;
 };
 
-#define MT_BUCK(_name, _bid, _vsel)				\
+#define MT_BUCK(_name, _bid, _supply, _vsel)			\
 [_bid] = {							\
 	.desc = {						\
 		.name = _name,					\
+		.supply_name = _supply,				\
 		.of_match = of_match_ptr(_name),		\
 		.regulators_node = "regulators",		\
 		.ops = &mt6315_volt_range_ops,			\
@@ -190,10 +191,10 @@ static const struct regulator_ops mt6315_volt_range_ops = {
 };
 
 static const struct mt6315_regulator_info mt6315_regulators[MT6315_VBUCK_MAX] = {
-	MT_BUCK("vbuck1", MT6315_VBUCK1, MT6315_BUCK_TOP_ELR0),
-	MT_BUCK("vbuck2", MT6315_VBUCK2, MT6315_BUCK_TOP_ELR2),
-	MT_BUCK("vbuck3", MT6315_VBUCK3, MT6315_BUCK_TOP_ELR4),
-	MT_BUCK("vbuck4", MT6315_VBUCK4, MT6315_BUCK_TOP_ELR6),
+	MT_BUCK("vbuck1", MT6315_VBUCK1, "pvdd1", MT6315_BUCK_TOP_ELR0),
+	MT_BUCK("vbuck2", MT6315_VBUCK2, "pvdd2", MT6315_BUCK_TOP_ELR2),
+	MT_BUCK("vbuck3", MT6315_VBUCK3, "pvdd3", MT6315_BUCK_TOP_ELR4),
+	MT_BUCK("vbuck4", MT6315_VBUCK4, "pvdd4", MT6315_BUCK_TOP_ELR6),
 };
 
 static const struct regmap_config mt6315_regmap_config = {
-- 
2.53.0.1018.g2bb0e51243-goog

