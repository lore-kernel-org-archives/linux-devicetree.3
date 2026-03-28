Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6745F33BBD2
	for <devicetree@vger.kernel.org>; Sat, 28 Mar 2026 01:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774662047; cv=none; b=s1sJwkY2BxYN1XtUsNTJkNStk5foqsjkZcLyQvjGu8xVc55IRThXssyNI2OKMe9IbDeHA3f5o00/i7HDK/IenYoH1LoPmjWMm3EsyoF3S2BCd2aNodnf6ccY5Gy0sAWhYUoO2+F2i/92I/M3NXATvptwLqi042EYxl0spJBs+4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774662047; c=relaxed/simple;
	bh=P+sgtflT7HpNTLl3SREork3SLX9AzxBIvEm30I4maL4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KCfAdFghzZwyfyQuxYJKcr6OjqO1XW1+lQlhgdpYH90Gnh1e9uYMgA4pd3WCPJWYLcWqo+hGSSgT/ymrDKZ1R7mcvBQHFvotlgPTddJHIJe5jym65a4bueoSr29cdPN9pMTaezl/UgKpV8ngIjJ1q72Ez+adDkDYMQXqmaAJFcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hfFo7Euy; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hfFo7Euy"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-50b268fba9aso24178321cf.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 18:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774662045; x=1775266845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBBLWCcZ87q82/idzSnceVUwnwhBcq1HPoO/59tEn18=;
        b=hfFo7EuytdGqbNdcKUUaCWOL6owG+TacYy4CGxjTdHxmJxm3UyigIEZeVO7/k/7EgI
         ovJVRrf+GQHDvpTlvcGyHbFWW4OhJGqKSPrEMIewBqZ49nDgkiQuFf/nHc1vQh36ua+I
         LuiBXHUcrQCNgO2oPVBeGJys9j9yPzKje88ZS8VmgWi2QztNppCoizdNtXb1XbCcg9UM
         pKKABGczJsZb4GZarBN76ZxQ/uIkDWok3nRoUTEB6xhekTKz/lKufpuMna0KPiBBkWgm
         Xy1KvNIxRcdyJqtBh3xD/TtSdZk2DxcO8hYsT6Ce0wEJpFaS6rknf6Xs4/zpgb2KslJo
         SnSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774662045; x=1775266845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cBBLWCcZ87q82/idzSnceVUwnwhBcq1HPoO/59tEn18=;
        b=pFbd1d7TqMwVPyUDVO/QAHDBRQvTYR6r9caKD7+mMUfpcw9N5PDFKLvpxK0MOag0b7
         O7jYo2GprqICQ4p12sBFfbuACMe2QoIhs0J0BP8mTHBihMPkMRF2QRDRQpVNgRgmkpwM
         Issd5GiMFRvdk+bAXEMNon5kXu0K8YzmOe/hwrpOCQcporRoMshJFf06lLx0YjufELbO
         1281deMzt+hmAJ1v1Y+VYftDhLy8EEKoZu99zec6nxDOsGra3KH2zEZqxrQ/Bah8gdZW
         /90kOwG2l6YIxcZmvxqxFeerhaoTPmf8ZH8TemKmJu+asMz+ixxs7Cd+EHzZbAbr+UR/
         vbFw==
X-Forwarded-Encrypted: i=1; AJvYcCWAxB3R8eIk3jbH5Qr8Wuw/dwoyfl1MBb4Y7b/dyUUd85XszofI5aCWo3Jj+AK5suTBHJoQ4k5W8RGl@vger.kernel.org
X-Gm-Message-State: AOJu0YwkBTRWQ45MV/BckmOttmsZylGA+Ko35xb4ocnyacM+G7DnOMwK
	ATUjO6KSJfoZZPs7J4AOfFw7Fhrqn/OBvftyxMxiJqag55Idarepor9c
X-Gm-Gg: ATEYQzx5HSeKnGUrlP+uBcHfrjKRrAeeCfndDGLCHHCtCT7qf7Wd9oC/wEZz1qe5frq
	f7i0j1U1J+qqXwpHmVsVd5nw8JRTz14LQ9u07VYVGWCWjy3VuYtIIyMvkeJzCplbn1wJuIy/rNW
	3jXrNrwOM0A1jMAg0LWMdUGVsHKXN7GhqEpiPQsOJj5p1VXqFLy8orXIUfqDf5/zS8HsM7oK68N
	vwuC4efRRMrMmY8iHeyYHDWidS92YpHcl868yarEkvivqHKqqtCI6pwfHHsRA6AodkPR7WohCFF
	2ZNfV1o3BVcuZ9cnCR4in26yj54u1Jztj5rLdAPBi/HvOsr43mdTOi8wYbz9kn9dgIP6F4skhM1
	4Gp9AGzmfQ0lCY01FzU79+ySKz9OhMoiNaJ3kBulx1+bbGrhjLzXBtNxomCDbQE+pIJ+Lt5ZPFr
	D+hOTqUNVVkSHmUBseiAmD30yozg==
X-Received: by 2002:a05:622a:64b:b0:509:61:b22 with SMTP id d75a77b69052e-50ba39c17a1mr66304681cf.57.1774662045438;
        Fri, 27 Mar 2026 18:40:45 -0700 (PDT)
Received: from localhost ([184.144.58.243])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50bb2c67d1fsm8092411cf.1.2026.03.27.18.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 18:40:43 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v4 3/4] thermal/qcom/lmh: support SDM670 and its CPU clusters
Date: Fri, 27 Mar 2026 21:40:40 -0400
Message-ID: <20260328014041.83777-4-mailingradian@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260328014041.83777-1-mailingradian@gmail.com>
References: <20260328014041.83777-1-mailingradian@gmail.com>
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

Currently, this only supports 8 CPUs and tolerates linking to any CPU in
the cluster.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/thermal/qcom/lmh.c | 69 +++++++++++++++++++++++++++++++-------
 1 file changed, 56 insertions(+), 13 deletions(-)

diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
index 3d072b7a4a6d..46c1e301f6c8 100644
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
+	u32 node_ids[8];
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
@@ -144,10 +147,9 @@ static int lmh_probe(struct platform_device *pdev)
 	 * for other platforms, revisit this to check if the <cpu-id, node-id> should be part
 	 * of a dt match table.
 	 */
-	if (cpu_id == 0) {
-		node_id = LMH_CLUSTER0_NODE_ID;
-	} else if (cpu_id == 4) {
-		node_id = LMH_CLUSTER1_NODE_ID;
+	match_data = of_device_get_match_data(dev);
+	if (cpu_id >= 0 && cpu_id < 8) {
+		node_id = match_data->node_ids[cpu_id];
 	} else {
 		dev_err(dev, "Wrong CPU id associated with LMh node\n");
 		return -EINVAL;
@@ -156,9 +158,7 @@ static int lmh_probe(struct platform_device *pdev)
 	if (!qcom_scm_lmh_dcvsh_available())
 		return -EINVAL;
 
-	enable_alg = (uintptr_t)of_device_get_match_data(dev);
-
-	if (enable_alg) {
+	if (match_data->enable_algos) {
 		ret = qcom_scm_lmh_dcvsh(LMH_SUB_FN_CRNT, LMH_ALGO_MODE_ENABLE, 1,
 					 LMH_NODE_DCVS, node_id, 0);
 		if (ret)
@@ -231,10 +231,53 @@ static int lmh_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct lmh_soc_data sdm670_lmh_data = {
+	.enable_algos = true,
+	.node_ids = {
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER1_NODE_ID,
+		LMH_CLUSTER1_NODE_ID,
+	},
+};
+
+static const struct lmh_soc_data sdm845_lmh_data = {
+	.enable_algos = true,
+	.node_ids = {
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER1_NODE_ID,
+		LMH_CLUSTER1_NODE_ID,
+		LMH_CLUSTER1_NODE_ID,
+		LMH_CLUSTER1_NODE_ID,
+	},
+};
+
+static const struct lmh_soc_data sm8150_lmh_data = {
+	.enable_algos = false,
+	.node_ids = {
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER0_NODE_ID,
+		LMH_CLUSTER1_NODE_ID,
+		LMH_CLUSTER1_NODE_ID,
+		LMH_CLUSTER1_NODE_ID,
+		LMH_CLUSTER1_NODE_ID,
+	},
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

