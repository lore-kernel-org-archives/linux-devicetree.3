Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810837;
	b=O3dWlPzSNHqO/78wb+VZ+kNQJfbGW55YTICu+1gnMMhy63Bewro8TIPMbgsY4yZ3cC25
	 6/I44RuDK28CstE0Bv+8wL0Q5k/zizKFruSvNa3RzPTDjTf8sI1oy0cMgRpDM7YL7bWk3
	 Y8dPuNEyllTzoK88or/d50Xe+nRogeRrKvdR40OlujAo6vE90Of0SGwUR7NqA0Vobf64I
	 uYGP9Z9+fIF6+MadMi26seBnp8XZEvcNkRQMhYPzvoZwg1SORvrI2yBOjHJtfxIfkfDro
	 VpqRFktzy0aXsdSLmuPX/ark4+i7dhtPKKoF0uPAhAIaWKAeWEQ4dE5JU2rAzENK6vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=Iw/zhL1hpsbYxjNVLjsEh7Qtn2rPLU0cDn1FG/OJ5Sc=;
	b=AalJHl583/xIUAjruwEpIV8SMk5bilwpwPbsgwELiT8Z3APwSID/+7eKdP5dUdBsYktx
	 G6Wp9/M7W1xdy5YoNaHZ8bWY57N6xAgdavPqyYKeeDIIaJ1fFpNntULOh49xdcb+bbzAo
	 szfSkrkOVwfIOMZ6u6DiucZWdxRt0hdgUgcByxHxeofJuKxUl0OVeSrxkC4xhBR7seNH6
	 6eWqwTbd4pPSTYxF4hYnSVbKSihDMZPs6y8dC4t6wddaa6NDHLB/NjKBJL7RzWW3oiAOz
	 9c0Kh06T2tgU9RTwMKiCKVfqFrNMaApTrzsxfBym0X+hwLXqBEC46WLC/gkn18c5sfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ii+JEp8N;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7F56082BDD
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 16:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C7F56082BDD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ii+JEp8N
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b244fb7fffso1297989c88.1
        for <devicetree@vger.kernel.org>; Wed, 04 Nov 2026 08:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810836; x=1794415636; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iw/zhL1hpsbYxjNVLjsEh7Qtn2rPLU0cDn1FG/OJ5Sc=;
        b=Ii+JEp8NcqQOExZCbNy1Q72rEE2d82j/6uqSwHBPOZM5MI/gsmkc8VVqk1azPShaNG
         cuXcwE/gD7VDumYMltfWPvWHst7fCWcVmipbhzGgDXh2GVypSyrp2k4O4b60Q9NV0k4A
         V4nlC/+2OnNcoSoToNxDcBGgJO/yheVFxBcJffRm8mbY+w40ZrnsyPrlRkDIPQbrd8IB
         I1BPtTsMlJ2HCIfeVSTs6wIyZewYdjeB4c6A7RaJesYBkyD4WCMbvuLbnaCBfI6DsK3J
         JnOvcFw6haiXJnCW/3so2voL5cDhoekP/pgDJsqYqnmMcc/aSL8qtr+xd3hq5dPW19uo
         6UWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810836; x=1794415636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iw/zhL1hpsbYxjNVLjsEh7Qtn2rPLU0cDn1FG/OJ5Sc=;
        b=JkP3tTRsoiyXp9QlOfw+7b5ZZt/QGyNlpHAnF3EACy4OYIh80/rO76F7chS9TYnBvR
         +oFBrmGThpj3Cj5Bq3LCg5zibzxEV8MDZG3VkZnkMV3UzZiueeOr1aWyE/4hE1PekXHa
         dQMPzkBI2y4umocTfQOdb7ICvD0SdWWxNOPV4LcEYP1JJGCEf/QPNc7D2gIebBvNsvUY
         Pc9BSeguaPRE2q5CmfYYQX36ZAv4kIvJG3rHVqgL4CkYGKXw+ckmHZmYkP4X+Nl7jGt4
         CL8+rzDKRdYqtRA5Qluijn9CFYteJzgSqEd2ZVzh7h4rzPQ7/fI23o6qAkefEq3UBhw8
         N+BQ==
X-Forwarded-Encrypted: i=1; AKwUvBwC8lVJQxdvAE1ReKMhkXaZjioe10nUptFHFwaTLDITV7MUkGcOhvBfqLxTvdQ9T8NtOv3gMW6SDXoF@vger.kernel.org
X-Gm-Message-State: APuU4Z9qjMTIabx4fS4/Yt3hiyibQ8/yN2qZx812aw+TWJrIoUjZVNnY
	XtbEasimGUkD6Utc94hLjL7oNNXjl9j3KtMedlr6Ew6lPZlGI6Vf+jOJ
X-Gm-Gg: AYBFou28pxWD4yuXQtu5sZnWkuwyNMh39Xzc6QZV03ppaULtXlOUuiIgateu88GWmsZ
	/wXRis/MoTGH9ZOODcn4IkW40eAfEf1aWBYk+SQpz11zsCdtSK9whHM+lJSLlokS1v3p3cWk+Cz
	0fFXB+1sbi6ybq2bzoLMiELwSv/d6yNNGsf1ih9hJVgoz24wNhTq+XWhfVkvK3QHlkEkxd1pCSH
	yt83RoanUnz/VOCDa5YG3iu8v7HWqqJC2J9nrs6CVgOxuE6p0PFkBZu5FKZFdXV0eP+DYKVNCZX
	X8Kv9+VybBjs7DieJsFn+HqcaMoZSv/Om5h3uCOLRwtIwuf4tcZLS1iyy7TAacMhrUox2K/1drD
	QKMJvM8LqL3/hldfY0z5sB5BGUVMl7EvvrgKGMMQ6l8q43i4dtEmJUVLVxkDzohvU490xmQXwfa
	qirWbwY4qk9cHsGh0vUSFEJjSGDdHzwfS8AGwW9bbghlM43Nfs4/KuEJnrstS56MwLcb98vsijy
	8OcxMm5QuOZ1Ppnn7x9uL9QichfdslpxS7kfNdbsjLtPnJHxP/8Kz1l0U2pa5dbcwkOGKmpyiLG
	vM+ZX/KB+7PGXsyXAw7ncfcpnDIoqLtu8rFaZgHQqwAD82RwmXFWA53Pva0POJPz4kFaSFADPEl
	piOU3Vx0=
X-Received: by 2002:a05:7022:3f04:b0:19f:527d:96da with SMTP id a92af1059eb24-1ac5da7b145mr23701286c88.33.1793810835903;
        Wed, 04 Nov 2026 08:47:15 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.207.207])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c57430sm10839666c88.18.2026.11.04.08.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:47:15 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 16:46:35 +0000
Subject: [PATCH v13 3/8] thermal/drivers/qcom/lmh: Switch to match data for
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
Message-Id: <20261104-master-v13-3-355b65c6f764@gmail.com>
References: <20261104-master-v13-0-355b65c6f764@gmail.com>
In-Reply-To: <20261104-master-v13-0-355b65c6f764@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793810796; l=4488;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=VU3SQSKgFReF5BiO2cKpUAobqELNHDdICbyBD7TlHBc=;
 b=zEQCRQG3leyhQotPeA5MCZh/7vfckyMF2IzU+0IxPHpx8ud6vbLpA0+Et2DgDiTWDZbxXhkrL
 j/JgrQU0zoCDYa1IoTh9tAQDpIItm9Dg7NXu4XbjUYF5XSuUW4NhvDj
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

Address this by introducing a SoC descriptor structure (struct qcom_lmh_soc_data)
and an explicit mapping table (struct qcom_lmh_node_map) associated with of_device_id
match data. This encapsulates both the algorithm enable flags and the CPU-to-node
mappings per compatible string.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
---
 drivers/thermal/qcom/lmh.c | 73 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 53 insertions(+), 20 deletions(-)

diff --git a/drivers/thermal/qcom/lmh.c b/drivers/thermal/qcom/lmh.c
index 99396b93e..ef49ed1c6 100644
--- a/drivers/thermal/qcom/lmh.c
+++ b/drivers/thermal/qcom/lmh.c
@@ -94,19 +94,61 @@ static const struct irq_domain_ops lmh_irq_ops = {
 	.xlate = irq_domain_xlate_onecell,
 };
 
+struct qcom_lmh_node_map {
+	int cpu_id;
+	u32 node_id;
+};
+
+struct qcom_lmh_soc_data {
+	uintptr_t flags;
+	const struct qcom_lmh_node_map *map;
+	size_t num_nodes;
+};
+
+static const struct qcom_lmh_node_map sdm845_lmh_map[] = {
+	{ .cpu_id = 0, .node_id = LMH_CLUSTER0_NODE_ID },
+	{ .cpu_id = 4, .node_id = LMH_CLUSTER1_NODE_ID },
+};
+
+static const struct qcom_lmh_soc_data sdm845_lmh_data = {
+	.map = sdm845_lmh_map,
+	.num_nodes = ARRAY_SIZE(sdm845_lmh_map),
+	.flags = LMH_ENABLE_ALGOS,
+};
+
+static const struct qcom_lmh_soc_data sm8150_lmh_data = {
+	.map = sdm845_lmh_map,
+	.num_nodes = ARRAY_SIZE(sdm845_lmh_map),
+};
+
+static const struct of_device_id lmh_table[] = {
+	{ .compatible = "qcom,sc8180x-lmh", .data = &sm8150_lmh_data },
+	{ .compatible = "qcom,sdm845-lmh", .data = &sdm845_lmh_data },
+	{ .compatible = "qcom,sm8150-lmh",  .data = &sm8150_lmh_data },
+	{}
+};
+MODULE_DEVICE_TABLE(of, lmh_table);
+
 static int lmh_probe(struct platform_device *pdev)
 {
+	const struct qcom_lmh_soc_data *soc_data;
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
 	lmh_data = devm_kzalloc(dev, sizeof(*lmh_data), GFP_KERNEL);
 	if (!lmh_data)
 		return -ENOMEM;
@@ -139,24 +181,23 @@ static int lmh_probe(struct platform_device *pdev)
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
@@ -230,14 +271,6 @@ static int lmh_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static const struct of_device_id lmh_table[] = {
-	{ .compatible = "qcom,sc8180x-lmh", },
-	{ .compatible = "qcom,sdm845-lmh", .data = (void *)LMH_ENABLE_ALGOS},
-	{ .compatible = "qcom,sm8150-lmh", },
-	{}
-};
-MODULE_DEVICE_TABLE(of, lmh_table);
-
 static struct platform_driver lmh_driver = {
 	.probe = lmh_probe,
 	.driver = {

-- 
2.43.0

