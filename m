Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715FC38B15A
	for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 16:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774889522; cv=none; b=B3TIxNQLJz5Ninis0zWcojWacsvPxQThDdegyBvuH8BYnwXfl1t+Pr8xfjb4NztuP8Vp/WzUqeP+M3C2xLju2rXhlpiZoGIUnb1LYVo78zijb/9+tlzXsptlsw09hkbgN0gnrQ1lLm1N+6lmoWXNbaXTOoeTbRW4lhtaO33iCls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774889522; c=relaxed/simple;
	bh=XwLSuwNXEZjBIW+yA2bhoMct5gmlj+ljgCDuHwRDYZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KlIPWPH87WQlCnud4V6uHYZ2hTw+l+1zGQdfPqoX3t4tquBOp4vbiATnur9NHyVCuFDr5Cm6HlaZa0UcKGtnIwuIdYNjNIWrXWrENbAO+1ZRMW6vr+aOReXy3Vij9RaDcUSV1IAjLrThwykTUXV+Fx+EM5L8pO8g08jPHtG9m0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qDqBlWKf; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qDqBlWKf"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-89cda8de641so53282746d6.0
        for <devicetree@vger.kernel.org>; Mon, 30 Mar 2026 09:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774889519; x=1775494319; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBXeNBZyHgjVgtu2Bum5En+w/w6aOZhbfuK0R+dyuuw=;
        b=qDqBlWKf15CKHkzTbFujokeZJ5L1gMg6+gajC0BOWsbLNrMyDudxfhWF5kiAOqI4Br
         I45YlpTG7GlbEaTgcuaUgQGC95gcZusftN3vfaSyP/ZVDhaujMzv/m5MjXIqMY3b+Uh+
         3nkjvU3A9BnpHKWIxHsceXaw2wwJleuZpQJjgNIOMkNwGi+URnpCGfck506GRzr8U3eC
         e7AHisgAa23jxWrTNPR60qmXSYjM9OUQlK3YHHX6LKWLvLpZkINsZKaN0pUoycVCiyZu
         8wrNS/JXTBRIbYgeYpoSeUSYlao+93HsPaUPzA5m1C1MJCrJmRGZsxxP7dPzeqJU7/gE
         dfTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774889519; x=1775494319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jBXeNBZyHgjVgtu2Bum5En+w/w6aOZhbfuK0R+dyuuw=;
        b=Dj3ZdPKEEvzoIsM/V4OIRkBmx5LoS/QrxloSduSb6zlK6z2CyZdemKMx1qa73hpkOU
         ksGsIGwdVQZSk1XOmDfEfSfseB7RlXOXP+fAY63n2uNdg/8ZGU2qXbMy6eDFprj3joXn
         Fs815gTq9Y5ipSLZ66PNb1xHmMR7TpEYJELB9qtRF6lXe/X390uQuJgdyZkMoRjJK461
         RkZpHTNgLk4YwjrTg4Jo81Qcprhl/AbMJZJ6nQUBwVnGeirNF4v5TpKXWrppxRvpaSnV
         Un6IqE6xeStVNiRsB1nHqSdt91ZQG3rlJwfTWZ8QJYwjGiOOEnwunPP4bVolWNkhNxCE
         s3qg==
X-Forwarded-Encrypted: i=1; AJvYcCV4l59OhlAmSoGul2KZHMKSDonLfrHkGLO4ZbND3NKKGwmsPdyZbieQnRo0LyzMeD357mvOlTZqPcEg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz48ugEp2ON7TOMQWcVtg/MVRSh8/A/KH2KgUSBwpgWhUmr9/PL
	ERmbVAtdZzNl1SL8wbF08ogh46cOO0V8cB0HXu1C7yOqh89990mR0pE0
X-Gm-Gg: ATEYQzwicVNTz4Le0ixE3qzRTij8ThP3SHSW49+u2z1K/YHTpucVd0qjyNMe6XwyrYK
	lYAtdbZzjaq6Tp8Woy+2YLhEDmvbjc479Taw9EQz159AwVfD0rsLej3+oXraGPD51WxU0gtFsy1
	A4+n/+gdVSRcLcrxXmR1aE8lE+Viu6NIXI0v8OIiFVlprkOrQ3T4hxzah1AyqZO2Hgk4KE4ysrU
	F51AvnknVYNlBsPKdl3ciZfGw4Uosx1JOToo9TEHJiGbfaq2KQwgRGKUaBEpDICOIVc1bu5jeX8
	CD5nUVBBuPUpqJzjt7cXqElnBoAiI5BlRoze6oHWeAbbi+PwHo8jwWH4ztsGGhYCxwCXfl2iOW1
	orCofoAobZZcElKeYIMCTH03dOWzMUDFkTulD/1nFvB2bViz5FLRsq3SEj04qbkjFjpJwdBejf9
	4Kl3hZqmrnILVgszFsKZUuUtw=
X-Received: by 2002:a05:6214:1d07:b0:89c:8681:36fa with SMTP id 6a1803df08f44-89ce8dc159bmr212374466d6.32.1774889519213;
        Mon, 30 Mar 2026 09:51:59 -0700 (PDT)
Received: from localhost ([199.7.157.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecb5cb530sm71400926d6.7.2026.03.30.09.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 09:51:58 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v5 1/2] thermal/qcom/lmh: support SDM670 and its CPU clusters
Date: Mon, 30 Mar 2026 12:52:36 -0400
Message-ID: <20260330165237.101045-2-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330165237.101045-1-mailingradian@gmail.com>
References: <20260330165237.101045-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LMh driver was made for Qualcomm SoCs with clusters of 4 CPUs, but
some SoCs divide the CPUs into different sizes of clusters. In SDM670,
the first 6 CPUs are in the little cluster and the next 2 are in the big
cluster. Define the clusters in the match data and define the different
cluster configuration for SDM670.

Currently, this tolerates linking to any CPU in a given cluster.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/thermal/qcom/lmh.c | 54 ++++++++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
index 3d072b7a4a6d..81ab2f0be9c8 100644
--- a/drivers/thermal/qcom/lmh.c
+++ b/drivers/thermal/qcom/lmh.c
@@ -30,14 +30,17 @@
 
 #define LMH_REG_DCVS_INTR_CLR		0x8
 
-#define LMH_ENABLE_ALGOS		1
-
 struct lmh_hw_data {
 	void __iomem *base;
 	struct irq_domain *domain;
 	int irq;
 };
 
+struct lmh_soc_data {
+	bool enable_algos;
+	unsigned int clus1_start_idx;
+};
+
 static irqreturn_t lmh_handle_irq(int hw_irq, void *data)
 {
 	struct lmh_hw_data *lmh_data = data;
@@ -100,8 +103,8 @@ static int lmh_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	struct device_node *cpu_node;
 	struct lmh_hw_data *lmh_data;
+	const struct lmh_soc_data *match_data;
 	int temp_low, temp_high, temp_arm, cpu_id, ret;
-	unsigned int enable_alg;
 	u32 node_id;
 
 	if (!qcom_scm_is_available())
@@ -121,6 +124,11 @@ static int lmh_probe(struct platform_device *pdev)
 	cpu_id = of_cpu_node_to_id(cpu_node);
 	of_node_put(cpu_node);
 
+	if (cpu_id < 0) {
+		dev_err(dev, "Wrong CPU id associated with LMh node\n");
+		return -EINVAL;
+	}
+
 	ret = of_property_read_u32(np, "qcom,lmh-temp-high-millicelsius", &temp_high);
 	if (ret) {
 		dev_err(dev, "missing qcom,lmh-temp-high-millicelsius property\n");
@@ -139,26 +147,16 @@ static int lmh_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/*
-	 * Only sdm845 has lmh hardware currently enabled from hlos. If this is needed
-	 * for other platforms, revisit this to check if the <cpu-id, node-id> should be part
-	 * of a dt match table.
-	 */
-	if (cpu_id == 0) {
+	match_data = of_device_get_match_data(dev);
+	if (cpu_id < match_data->clus1_start_idx)
 		node_id = LMH_CLUSTER0_NODE_ID;
-	} else if (cpu_id == 4) {
+	else
 		node_id = LMH_CLUSTER1_NODE_ID;
-	} else {
-		dev_err(dev, "Wrong CPU id associated with LMh node\n");
-		return -EINVAL;
-	}
 
 	if (!qcom_scm_lmh_dcvsh_available())
 		return -EINVAL;
 
-	enable_alg = (uintptr_t)of_device_get_match_data(dev);
-
-	if (enable_alg) {
+	if (match_data->enable_algos) {
 		ret = qcom_scm_lmh_dcvsh(LMH_SUB_FN_CRNT, LMH_ALGO_MODE_ENABLE, 1,
 					 LMH_NODE_DCVS, node_id, 0);
 		if (ret)
@@ -231,10 +229,26 @@ static int lmh_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct lmh_soc_data sdm670_lmh_data = {
+	.enable_algos = true,
+	.clus1_start_idx = 6,
+};
+
+static const struct lmh_soc_data sdm845_lmh_data = {
+	.enable_algos = true,
+	.clus1_start_idx = 4,
+};
+
+static const struct lmh_soc_data sm8150_lmh_data = {
+	.enable_algos = false,
+	.clus1_start_idx = 4,
+};
+
 static const struct of_device_id lmh_table[] = {
-	{ .compatible = "qcom,sc8180x-lmh", },
-	{ .compatible = "qcom,sdm845-lmh", .data = (void *)LMH_ENABLE_ALGOS},
-	{ .compatible = "qcom,sm8150-lmh", },
+	{ .compatible = "qcom,sc8180x-lmh", .data = &sm8150_lmh_data },
+	{ .compatible = "qcom,sdm670-lmh", .data = &sdm670_lmh_data },
+	{ .compatible = "qcom,sdm845-lmh", .data = &sdm845_lmh_data },
+	{ .compatible = "qcom,sm8150-lmh", .data = &sm8150_lmh_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, lmh_table);
-- 
2.53.0

