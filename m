Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795669132;
	b=1osXch3kVgJWM4GNxp40sgQYExAS9l0mSoL/+sapl6EfSDb1u55OXcXwwgw9faRb8m1s
	 DIPmVFYdXBrH6mYzVA0QuEyspUoCFzVA5HwePIr+2MbwTwF29T4JCpPqZx38CUKlwInwz
	 lWtV+m9qh7fxEYcwBf5EeMcrOkPECxkiGFGoen98QzJwHBzXYODwQh98zOprq9gCHjZ2E
	 nmiJptVHQOJZmT0Im7yBNp/bF5BQ1++LFRtNQTX6eQ7Sn8ZABpgvhNDacg7IgnpdTmDNI
	 dbIvTvKs/Y7qryTUeyYtStmXcnrXhQKRjXy5iBdVUO25avafvg06ytHDLaiX7uGUiQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795669132;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=+MWBTNYSRWjg4nAw8/hdhIdqDgN2Nzlt5vynJ2DjOQQ=;
	b=j3kXOUMYP8Tup5TJ21vGhCJc5f5ejI9fU7tFxvC+PTqrZ+sOzXlNEuwQZciNrBwbBjYi
	 Bf5aNErUL6A2e/J6qfkhIUQxT1sw2o+aGbkZpiW3kgbmEvVAoFkoz57PDY17el8t0f+Cn
	 XcHrNkIhN20vZHxeEoUaSnFo2Gix+jkhZRT3wOOgXw5+GcaD9YOWYJ47SRPg37JY1Mm7V
	 rh9L+g8Acj+ADGDrEx4f9DZEt/ndGl76am/UfUG3C79ew0kmySxpTs4R8B3Va/m7E43OC
	 tHUWcx2FSpIltmpukqhJMiBZ1skiO+n16NtuE+w/u+9K2anxgLkbYWYOD92YzLWJP5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RLFgUwIl;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC33B606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 04:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC33B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RLFgUwIl
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-38190551625so12942197eec.1
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 20:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795669131; x=1796273931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+MWBTNYSRWjg4nAw8/hdhIdqDgN2Nzlt5vynJ2DjOQQ=;
        b=RLFgUwIlz0g0MjaqUyAsLzSqvkJ1xLt6pNRY4OtdtTDSlvM9yWhwOMqlv82swf/spR
         cpN8y0G74ukIXQVmdxMFTvwiAVDQpXEb4h0UvDTgh24cJTLOD7b2+v/rs/d7CXIycJLD
         6/Msy39eq6ajkqsqV38tDFS8MpwW+dQxPz1xrQ8Dc8ur4k7630y1efc5HB0HdHJ7OxZo
         g/ivpWJyMYJJJJ1i+qOAkTDlHlCdrB7MClyIVaIO7z5NLZl8Eu6yrksd3gzIVVAwSJpm
         CfXShRM450RzeD/OuhH+/53DkoIF9c4PQI68XlBu+thZ9SMj1Z0ZZoe83miPr9iKsH76
         CfWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795669131; x=1796273931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+MWBTNYSRWjg4nAw8/hdhIdqDgN2Nzlt5vynJ2DjOQQ=;
        b=lkI7p5YfYsLMU33IALdZE40ApW+9Iury8OaoKysOyKAuYRGj290lV1jxNVLPmh6h+R
         vmsNKPKtB9EDDQ/DCwtrQJHDqNc+oBuobG+Ef1SBWImODok9Zv5ORHGO2x1tkwqXITNW
         d8AqzuGNWJjGm6zjke6DgqDeHDtxJ9GXSq1Sdd/U4gutXqepKPgIWa9Qe+BzVHNgjwMQ
         wJ5ayBWgVdl0ZHtnwfYJFmPan56OqqonXawu/T19nlfZPqm5uwfoDuMo60NZNJ8V64Nb
         eZRtMjPrs9iyzddEnR8UZEDXwYjy2GMS7uL5oks4MN+No7M+3QyzMH1LkwOPFMYcULlv
         Jj2A==
X-Forwarded-Encrypted: i=1; AL+hErFzD7wM5qjJIelKedDqm784lD71cp0XOI1RwUV1ZECo6Sz3tiLraF14KknAZGiqHinbmw6Hcmou4H+8@vger.kernel.org
X-Gm-Message-State: APuU4Z8Lexi5xKYzvAibpm7sUaK5uHNVh4h6IbkBIj3lsHV6gKOPAp/P
	dlTxpUrxZv3ZRVN1enD4fDqAPHscpkjD/a6gn1jhqZvTI9wMlOobgIP5
X-Gm-Gg: AZFdTZcVSTNBb7QiYWB9uBr0PZG0EORkvN74idvT4mXTcuiSVuFEL+LAq8GEUrd8KnK
	cEvadmmKDVQx7tNUrm6+Rqai782laYqJSdV0lQbWg5hYp7bcGjHmReomzIutLRCtuAAP0C/TyU6
	cJ7NqCs30FRUJhqDPiLrlgbSg6syf9BgkEkB8S5OYuJZ5EM48WSBkiv42JdsyJ06NfZXS+vmxuH
	/VREqvSJFwh0DbmP+uaOt0GgS8UYcy2Q0UY4oM8vWbf05GBoBAhUTnVUeeP1tz1PV5ib84JIB0u
	UudTF5rUCoSKViXVizwKgTy+afH74VTsre3pwFLydrDDyIwBkVO2Y3rjomiQ5S+2T/WX4iydY4C
	tOv/2z4u/ghfTULRnkJN9fZy8RweC3ayPQ+aha3rYQzmpbSlRlT6/oHTaLaEciwako3c5fgILjD
	sPtvCb7FPxVIyDgPtUk0O5EpkY5+0/uE6fZYwdY8sJV93Znizeh8KeKvnPh4CYF8+9cvFC5VVGy
	oKFrzVrNB1beaTHjjvst3xnMPPs3Ciqzc2ZSlwr1KPifj1Ut0zGeMkk6XXURpD3Bm+y9Rj1/pTZ
	2sZ6Q+JuZI7Tb59qgf8F4jcl2X/yIyMXGVLw/VyMmgkhFIiJCDPgdy4JDK0R30jNiQQWG6clxd9
	AZfbCqvM=
X-Received: by 2002:a05:7300:601e:b0:386:1e2e:ce0a with SMTP id 5a478bee46e88-3861e2ed1bcmr19606973eec.27.1795669130976;
        Wed, 25 Nov 2026 20:58:50 -0800 (PST)
Received: from Sobhana.localdomain ([152.59.222.211])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm54800362eec.7.2026.11.25.20.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 20:58:50 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Thu, 26 Nov 2026 04:58:08 +0000
Subject: [PATCH RESEND v15 3/8] thermal/qcom/lmh: Switch to match data for
 SoC CPU-to-node mappings
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-sm7250-v15-3-492014ec0a52@gmail.com>
References: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
In-Reply-To: <20261126-sm7250-v15-0-492014ec0a52@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Robert Marko <robimarko@gmail.com>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795669088; l=4181;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=4OXsCzvDxUDZzUq7vC0F7ppwML+xpv9VHox1Zc+zKA4=;
 b=iheqhOtdpQh/0n3iRRubDWuH146ojwlMj03gsY5OjYOhXTj1+XoFKhFe+wELpJighk7dT3Yao
 Hv0TPWTNrXDDS0mPVo8AdoPKojWBGrDV40/iwV7M6wZYIT5nTOAQJTP
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

lmh_probe() hardcodes the mapping of logical CPU IDs to LMh
hardware cluster node IDs: CPU 0 maps to LMH_CLUSTER0_NODE_ID, and CPU 4
maps to LMH_CLUSTER1_NODE_ID.

This assumption only holds true for 4+4 big.LITTLE architectures like
SDM845 and SM8150. On platforms with asymmetric cluster layouts, such as
the 6+2 topology on SM7250 where the big cluster starts at logical CPU 6,
lmh_probe() fails with -EINVAL. Consequently, the second LMh node does
not register its interrupt domain, which in turn causes dependent drivers
like qcom-cpufreq-hw to fail or indefinitely defer probing via fw_devlink.

Address this by introducing a SoC descriptor structure (struct lmh_soc_data)
and an explicit mapping table (struct lmh_node_map) associated with of_device_id
match data. This encapsulates both the algorithm enable flags and the CPU-to-node
mappings per compatible string.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 drivers/thermal/qcom/lmh.c | 63 +++++++++++++++++++++++++++++++++++-----------
 1 file changed, 48 insertions(+), 15 deletions(-)

diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
index 6bfe25021..de3fe64c3 100644
--- a/drivers/thermal/qcom/lmh.c
+++ b/drivers/thermal/qcom/lmh.c
@@ -94,19 +94,53 @@ static const struct irq_domain_ops lmh_irq_ops = {
 	.xlate = irq_domain_xlate_onecell,
 };
 
+struct lmh_soc_map {
+	int cpu_id;
+	u32 node_id;
+};
+
+struct lmh_soc_data {
+	unsigned int flags;
+	const struct lmh_soc_map *map;
+	size_t num_nodes;
+};
+
+static const struct lmh_soc_map sdm845_map[] = {
+	{ .cpu_id = 0, .node_id = LMH_CLUSTER0_NODE_ID },
+	{ .cpu_id = 4, .node_id = LMH_CLUSTER1_NODE_ID },
+};
+
+static const struct lmh_soc_data sdm845_data = {
+	.map = sdm845_map,
+	.num_nodes = ARRAY_SIZE(sdm845_map),
+	.flags = LMH_ENABLE_ALGOS,
+};
+
+static const struct lmh_soc_data sm8150_data = {
+	.map = sdm845_map,
+	.num_nodes = ARRAY_SIZE(sdm845_map),
+};
+
 static int lmh_probe(struct platform_device *pdev)
 {
+	const struct lmh_soc_data *soc_data;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct device_node *cpu_node;
 	struct lmh_hw_data *lmh_data;
 	int temp_low, temp_high, temp_arm, cpu_id, ret;
 	unsigned int enable_alg;
+	bool found = false;
 	u32 node_id;
+	int i;
 
 	if (!qcom_scm_is_available())
 		return -EPROBE_DEFER;
 
+	soc_data = of_device_get_match_data(dev);
+	if (!soc_data)
+		return -EINVAL;
+
 	lmh_data = devm_kzalloc_obj(dev, *lmh_data);
 	if (!lmh_data)
 		return -ENOMEM;
@@ -139,24 +173,23 @@ static int lmh_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	/*
-	 * Only sdm845 has lmh hardware currently enabled from hlos. If this is needed
-	 * for other platforms, revisit this to check if the <cpu-id, node-id> should be part
-	 * of a dt match table.
-	 */
-	if (cpu_id == 0) {
-		node_id = LMH_CLUSTER0_NODE_ID;
-	} else if (cpu_id == 4) {
-		node_id = LMH_CLUSTER1_NODE_ID;
-	} else {
-		dev_err(dev, "Wrong CPU id associated with LMh node\n");
+	for (i = 0; i < soc_data->num_nodes; i++) {
+		if (cpu_id == soc_data->map[i].cpu_id) {
+			node_id = soc_data->map[i].node_id;
+			found = true;
+			break;
+		}
+	}
+
+	if (!found) {
+		dev_err(dev, "Wrong CPU id %d associated with LMh node\n", cpu_id);
 		return -EINVAL;
 	}
 
 	if (!qcom_scm_lmh_dcvsh_available())
 		return -EINVAL;
 
-	enable_alg = (uintptr_t)of_device_get_match_data(dev);
+	enable_alg = soc_data->flags;
 
 	if (enable_alg) {
 		ret = qcom_scm_lmh_dcvsh(LMH_SUB_FN_CRNT, LMH_ALGO_MODE_ENABLE, 1,
@@ -231,9 +264,9 @@ static int lmh_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id lmh_table[] = {
-	{ .compatible = "qcom,sc8180x-lmh", },
-	{ .compatible = "qcom,sdm845-lmh", .data = (void *)LMH_ENABLE_ALGOS},
-	{ .compatible = "qcom,sm8150-lmh", },
+	{ .compatible = "qcom,sc8180x-lmh", .data = &sm8150_data },
+	{ .compatible = "qcom,sdm845-lmh", .data = &sdm845_data },
+	{ .compatible = "qcom,sm8150-lmh", .data = &sm8150_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, lmh_table);

-- 
2.43.0

