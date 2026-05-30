Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3D23CE092
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780165729; cv=none; b=nnkcGvJuc6Dv1//Ef5vOzvF6rV8fuFR1LLgYUGBhARmGQSyWnY3ofgz8DJqjLgpXJoafI84XeuyD2+B0WrUaUGl6zoB38XJhMF90vRwCsxtG4HT3bK2uy+itqosUE9WDMOxvGObnFqxa63lpaiJJtUGuWCfluwqSyNUAKa7Oe5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780165729; c=relaxed/simple;
	bh=W/YrZ50I3AwtE19t9pzTiT0xdnQWey3D03tHPf2lno4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=so0TY7ltudphlF/TMhQZTdTX/d+/TIkSAQ7M3IjbEpI21QLSzNSLMUGud8zGwjAQjwzAlaUobZLTcQI3BFdI/44fwzwVCBCZHSuRycjOE5yYevUfO5xM4yz8brJPwWQrapFZ2rl7mI+jLWu5N3vv4yWEJSgqS+8uOzIynHEuL9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LCMAEMqD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RIAXzYPj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LCMAEMqD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RIAXzYPj"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UEOuDn1795249
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:28:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XB9Q6X09k8YWO7HfZ3onZiDHCRdqw6sxvgxO5l7nA8k=; b=LCMAEMqDn65Lw2Uu
	5C12nK9JjynGhavVcjoCcDQx8hZzJtKTKsuGr5QBuM8/cqXsMDAcBpi/JGI/WCF4
	zsZNbyn0ByY+6jrvFBz31wKX/DEc37nZ8QUgk5yXU9bX2+lMYVFgzFLzA/zkvlaR
	Cw25uXztEBg7WJ+GbXYZ/HPFhanXEt7NbkdlYL3h7NVOpwj4JgpU/9CTE2AcBk7Z
	9bncQZDcvfxP5kGyhW45H4AV8VJ/+DNQNX3dOV3pnDnxPdt789hH0hCHocyo52Nk
	uXLbWDWOToB6/Vx23aGSF+Tzq8r303VLRndVKJIBrwJETH+0n1uNsq3aAqO4lq+o
	gFUOpQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efpw7hw74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 18:28:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c331eda3so525925ad.2
        for <devicetree@vger.kernel.org>; Sat, 30 May 2026 11:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780165726; x=1780770526; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XB9Q6X09k8YWO7HfZ3onZiDHCRdqw6sxvgxO5l7nA8k=;
        b=RIAXzYPjm5t8X0K4Bhsxb6hwjmZAlAevnYzYItvUktdGVVsIyUFXYn9YHkL+6IyjGb
         kYjTHeFEI7m+BQUagzfPyhxjbvPw7hIq9BD+Q6kM6mHpP0qbvWLugHgCqPA0F4dnSJZz
         oIP7yM/s/6TU+sIR2BX/W7oRL900ooznj+GD+tj4t1+0GXzXMCwCSEeziHfJst2Vf1yG
         qBFU8SyTqJBCw8llYECDfmzIAeoEalEHaDN/G271ylX8cpvDbPGORX6GAfl/elc5gBGB
         1VkexN8f9C2w5VhqjkFepZeXYZFF8f56HfV8foYVmRRnsZ00jhs8dYYis5mOfb14k6RE
         x7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780165726; x=1780770526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XB9Q6X09k8YWO7HfZ3onZiDHCRdqw6sxvgxO5l7nA8k=;
        b=tPbiWRyFaS86QTAnu8Fm9MCjCyoayXykk4A58/0jSmcroFgF2MkAnH/YGgSAIJI/Jx
         DgvDu+NFTaTFlxAx+3ZZKiyzMsZfPuYYT+Lwi8H+UGJ6g8bX7ZjuYIRiu5GpOtlgNOoo
         RCuOt3heRROloFXBaAS6gWe436Oqwq29z4YzKUF0WwRbWQPgsJBeoTK+gYbZWQ3tlO2l
         QoZxJrf5Q/UedJ8bT8wInhN6BJWAD5knFpun2wyp2muLxDSU4Rj/jPApu80aTqGpdPvB
         e2LzcfqwlzIq9KK53vr0T1wkHFDcjMpHqoJiD/ja0GhTget4n/yD4oQ0rvmimOqhSQHC
         NxjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9nu7y0aB8g+DdpuU3BjmbGzScy+O3YaVMuwPF/xLdm4l5qu+FHM1AGKg1tsFc9pV9BXr/OoQTf4Mon@vger.kernel.org
X-Gm-Message-State: AOJu0YyVxyWC16CtL4Z+g+x/CVFRdXfdoodS3ELJr4teTOPREfZm3LH1
	GcdXOUSl1cYy093AztsE4OniOWUrVA1G9HwW0w/DoMnQyaqgxEz4acMMPQZHfKSoySm159CRANm
	wxmeqB9UdXQdOpvv4hcudIdxVVgTxNLCZWreMOTZU9wXtqWOdsF4CTVaaP33L83qXBYwkSfr8
X-Gm-Gg: Acq92OHzUsoALQN13JsyPnJrcN8+O3zroY8E/XplRJhT0KEx5bjutwBy38nCERuzfBn
	8e9G9KUPTn63y9X/zVZaO1vHAfTz8wfgBNR5/o+52DzrybCCeqefl8POd4ZdyG844pYoRX2j19M
	zlxLmkmAWN33vK5wp1w+0T7yfEjtk63/kRONOOqvWzVVLqJnMCwL8wTnUEpwZXYwZ9csIpCx8XM
	d8ElqYYRrpnC4AN5PD0rgwUOx53hU2xcBYzRo+RN/+P7hxxUhIa4+ZyN08R/Lkr5ge754VxiUw3
	gBcrXr4Gw1wqaB7gefaxNMdYZ6hguJ5a1kqg7DCJxWUwSBIi8LqMI+zeklQkvdbflmQBvCA0ryt
	vd0jnYF37dOKGDtdmzlLroC7x0FB6bApKNt25cNqIuz3cpHw9s3H9vG1Mdgs238H2Fw==
X-Received: by 2002:a17:903:46cf:b0:2c0:c625:400d with SMTP id d9443c01a7336-2c0c6254383mr409695ad.37.1780165726244;
        Sat, 30 May 2026 11:28:46 -0700 (PDT)
X-Received: by 2002:a17:903:46cf:b0:2c0:c625:400d with SMTP id d9443c01a7336-2c0c6254383mr409435ad.37.1780165725616;
        Sat, 30 May 2026 11:28:45 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23a27ee3sm56879635ad.36.2026.05.30.11.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 11:28:45 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Sat, 30 May 2026 23:58:24 +0530
Subject: [PATCH v2 2/4] spi: qcom-geni: Use geni_se_resources_init() for
 resource initialization
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260530-enable-spi-on-sa8255p-v2-2-17574601bd63@oss.qualcomm.com>
References: <20260530-enable-spi-on-sa8255p-v2-0-17574601bd63@oss.qualcomm.com>
In-Reply-To: <20260530-enable-spi-on-sa8255p-v2-0-17574601bd63@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780165714; l=2636;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=W/YrZ50I3AwtE19t9pzTiT0xdnQWey3D03tHPf2lno4=;
 b=voDxlLutIN6+40mic0eO9qaR/zPZGz1TZBw7zkWz5anDER4KGLCy5Q4rtAloZPAXl3KnaFiwU
 UAS85ssC7BgCYNdBqAf/7fBTeMRPoqiLnssi30yj3MkJ5ERBSLd4M7r
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: wq82uAZlMp7P86L7R6dZ6Qo4XXsHREv3
X-Proofpoint-ORIG-GUID: wq82uAZlMp7P86L7R6dZ6Qo4XXsHREv3
X-Authority-Analysis: v=2.4 cv=bNIm5v+Z c=1 sm=1 tr=0 ts=6a1b2c5f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=TXo2QnZ9t29hVJcr6pMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE5OSBTYWx0ZWRfX2ZW+UbKt3vWj
 64ZwFyq1n5DyFx4HG0af68YTur9FAGyyRo12UV6HrsVhK7oWgAmjn4IOTIKZMbAh5qmYYrrMtwo
 zitQtK0VA7P69+pB+Un3EbrtmK0G9zFMd7EvI3DXXY/CggmDL0Kchq/kArWzCkoLBmM58f2ykQp
 dynNNDOyO7lHHxuuRZELngx0Zlv4qWx0eu9c4HpcmXS4vpmqscWESnUCHpAiIvboNKgDyNgXWoh
 0WQtAKOvex1QQIiKnz4Fjb6Tqc7du60GHeTjEPPNYt8icpTSCP2NXm2SVhsgIIe3qHqakNGInih
 pJrnWlP6IeH08UMfsDJbjom1cKdcxezmbvkPDGwC3aMSfISD0iepqdFBJpTz8mKYDk6CenXKK2c
 oHPFmApsfSzEEGQZui11CO6oNy1NaGBT2GV1yWRAhSx1KddCF39KIaMjtlmXLX8SUohdOl+yv+5
 63+ZDLIhuA1gJa2za9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_06,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300199

Replace resources initialization such as clocks, ICC path and OPP with the
common geni_se_resources_init() function to avoid code duplication across
all drivers.

The geni_se_resources_init() function handles all these resources
internally, reducing code duplication and ensuring consistent resource
management across GENI SE drivers.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index a04cdc1e5ad4..333216df922e 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -1034,7 +1034,6 @@ static int spi_geni_probe(struct platform_device *pdev)
 	struct spi_controller *spi;
 	struct spi_geni_master *mas;
 	void __iomem *base;
-	struct clk *clk;
 	struct device *dev = &pdev->dev;
 
 	irq = platform_get_irq(pdev, 0);
@@ -1049,10 +1048,6 @@ static int spi_geni_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	clk = devm_clk_get(dev, "se");
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
-
 	if (device_property_read_bool(dev, "spi-slave"))
 		spi = devm_spi_alloc_target(dev, sizeof(*mas));
 	else
@@ -1068,17 +1063,10 @@ static int spi_geni_probe(struct platform_device *pdev)
 	mas->se.dev = dev;
 	mas->se.wrapper = dev_get_drvdata(dev->parent);
 	mas->se.base = base;
-	mas->se.clk = clk;
 
-	ret = devm_pm_opp_set_clkname(&pdev->dev, "se");
+	ret = geni_se_resources_init(&mas->se);
 	if (ret)
 		return ret;
-	/* OPP table is optional */
-	ret = devm_pm_opp_of_add_table(&pdev->dev);
-	if (ret && ret != -ENODEV) {
-		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
-		return ret;
-	}
 
 	spi->bus_num = -1;
 	spi->mode_bits = SPI_CPOL | SPI_CPHA | SPI_LOOP | SPI_CS_HIGH;
@@ -1104,24 +1092,12 @@ static int spi_geni_probe(struct platform_device *pdev)
 	if (spi->target)
 		spi->target_abort = spi_geni_target_abort;
 
-	ret = geni_icc_get(&mas->se, NULL);
-	if (ret)
-		return ret;
-
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 250);
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		return ret;
 
-	/* Set the bus quota to a reasonable value for register access */
-	mas->se.icc_paths[GENI_TO_CORE].avg_bw = Bps_to_icc(CORE_2X_50_MHZ);
-	mas->se.icc_paths[CPU_TO_GENI].avg_bw = GENI_DEFAULT_BW;
-
-	ret = geni_icc_set_bw(&mas->se);
-	if (ret)
-		return ret;
-
 	ret = spi_geni_init(mas);
 	if (ret)
 		return ret;

-- 
2.34.1

