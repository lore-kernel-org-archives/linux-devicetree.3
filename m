Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FF439023D
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 09:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415392; cv=none; b=nTB9qNbXUiJeyWH3RkYtdOUUQ8I7fQv1C/t05iV3PQPKYm8HiIfvD7NeYnC2NtAtTekX1lk0oywBvw0Uqq5iewiTbMUw4h1Vkj4+8kMPIJR8dV8ctx1x0o+koX+rrdwHkrZT8QnVjYbwPk/ilDWlBSkfrzB04PY15K8S3s/rOhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415392; c=relaxed/simple;
	bh=EN+FdeBGpyAvvN3mrzi/TzCpXDx8W4gkJX8PCHt0KsM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YwOyOGU1B7+s/bHqA0jTfr5P+bn2ivKhKa3Tq/1f4LEb53KN7iiraKWKkCgPUIVNphbIO/Vby1w3dr3XJGPfkkv+HeIXvBG8TTv2se+bRIoZ3ja5mMEfG4Dc07l0bjfIRhSH9xz9+6cAueX6wQDGZQF8RdMWlN0fncXjIhq+Uk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Fv/MpW3S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dSIl4CvV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Fv/MpW3S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dSIl4CvV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6678DnMn3205863
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 09:09:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVzZmvzUW+j5l14x9BgwKtH/lDVSeIvlHRk66AloFqs=; b=Fv/MpW3ShNcWG/oO
	mgrRmyfym790lG3WVAvAeImva8/AZpaseOS9gsFBTHkayHfBzneppUmmmr1ljt4N
	qWxYwsVopA5S6qlIwvV8qlh1Ve1Rm+yaClfdyPsGGv9WXe6c8hwLcnInoRCr2jVK
	CDLjYbxkNNUSKQ3SCMAZsVIEzaXbcrpYBP7cXf8C0h3tG2GLF8NhdElAR89kdT6R
	jXK7Rs98h3baQDvqO0xNPS6WaErks8+kfVp7O2hsKvEkksSVAybBuSwFKP89zCzz
	qNf01t3pFrw1W9sgIx/NWQUPAbTnLXwwpdsiryZrA8/yM6ME60s+bkPAlTuusqfl
	DLOw/g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8fdw3hm0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 09:09:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-845e6a11332so5119275b3a.3
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 02:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783415389; x=1784020189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVzZmvzUW+j5l14x9BgwKtH/lDVSeIvlHRk66AloFqs=;
        b=dSIl4CvVxm/cF/Zsg6S7AT5Ej5a+9Xazmx9RyKfZjmhQrYLTsMvQInpQeWPpArlWrt
         6lriR1Iu6KRERW4a0MGgc7R/KpIyCmU0QKJE30bj6ag7smcQFx9mYRyB5NnEeLsCKkXE
         XiWj/RIYKzdXbOEFkBharHjMcknBettGvtv/Eh4k0CZoMFWUVZZsdZ5WVGVMF15i2kfP
         aP+EZuxaMF4GB8XivoFpGTidC93QgwzoQH836HQ6x6jqff1pofhfX3YzRuXJYUfwf3pk
         GjyO/zMr0RPIeEkAQT+3ddC7GdGm4K9BNoYu3v6PLgAbt3IU9VZKgBjeuaNew2zGDE6i
         /0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783415389; x=1784020189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QVzZmvzUW+j5l14x9BgwKtH/lDVSeIvlHRk66AloFqs=;
        b=oUiCCU8p36GTkX1UAc44R50pVFn/U57I513vuv15iEney6GOoI6vL03PifZCejyBBk
         Glpfsn1n0G7guPw2er+51YcirlCrFQlm09L4MdZDLnQw2cv9tSNYdJkqnB83xi3Qqrge
         2+DtoT4BmXllxMIa2o+moxP8Vc5E2P1Z6TT9+i5Hews86jZizgSOZBCk+H3Rb2BumN5i
         oDOw4Q/EmMbuRAQwZ94wQ4hiD5baRQ232E+dORnY1jBAI2zDUpueAJKk96bqM+h4C/vJ
         u+DfInH7K/P+Q/dSkKv3vrdxDXRmO4d7+Kg/VXRl7zGQDNj8NdXntm6bEqfvRpMUE/46
         kUeQ==
X-Forwarded-Encrypted: i=1; AHgh+RooY64lZG2AM/nvjbNn+SvUSZYWr4d56xJS8J8Z9yuB3SVWBAZb5ju93cdYN1WYRiPaZEeN4BdzX5L9@vger.kernel.org
X-Gm-Message-State: AOJu0YyRax/FSRKxKBLZDrRswyusa3W7Kqn75I3N4saZCquBzCnR7WBY
	tLY6NZuxOmaE5yAALtzYlSI30q4Jdtdgz2xfdQepTXbiYeaczM8dOCLKKKxGe2Y+ihHwepZXj9+
	Llhs07XQU7ufofKuyYdxJCrMUx7BV6fAGEko2wZ9tXRkFV5aGVojQZ2euiwbFM+zy
X-Gm-Gg: AfdE7cn6TdRVoj8bLKUVn7XIGPkovVAzeWct5b1q32heWffOwARcapE8aHu5fP0i2fX
	8YHQMJArEhj1PqrsepfmuMAr1hLy35i+eEJaNfUmiFmMNVmzDcM8EB5wpoTGSiMplCBNhJPExkt
	VeXRZVaIBdcR4nhID6J+Muj/HpG3MTB6M1JZoA3sGD0GpWqNGQjQ3a7pPYCHPacfUutmoTxkLSM
	WG3hOBEZKUjReuzqiNd2mPpyXPL6adjfLY4YMDje1mHmbvDyQAwF4+ohRg5Ci1pQtSFldeNUKSj
	oKCtIDmlvLsA1nbQH/XXoj6SXv9kzCoW8UlpfcR1e4JSRoy7kNuDeJeiSItWWw5cMrIkT2TYwLF
	QPGdtr+sTu+h4N96+9ezFGPzkO+2ZQGMAAp/bBjBTUi+aRmlHZIr6W1WFbvpssRlgkSNGR56cig
	==
X-Received: by 2002:a05:6a00:27ac:b0:847:904c:8452 with SMTP id d2e1a72fcca58-84826cdbb70mr4249806b3a.38.1783415389475;
        Tue, 07 Jul 2026 02:09:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:27ac:b0:847:904c:8452 with SMTP id d2e1a72fcca58-84826cdbb70mr4249763b3a.38.1783415388859;
        Tue, 07 Jul 2026 02:09:48 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b975a0sm5140582b3a.14.2026.07.07.02.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 02:09:48 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 07 Jul 2026 17:08:50 +0800
Subject: [PATCH v5 2/5] coresight: tnoc: Bind Aggregator TNOC on the
 platform bus
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-fix-tracenoc-probe-issue-v5-2-bf733ed9ebd0@oss.qualcomm.com>
References: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
In-Reply-To: <20260707-fix-tracenoc-probe-issue-v5-0-bf733ed9ebd0@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783415365; l=4982;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=EN+FdeBGpyAvvN3mrzi/TzCpXDx8W4gkJX8PCHt0KsM=;
 b=dRccxZSbmUk4pEE5sN+9ZaHTb1sq8axFFGR8dU7llgq6JFKBk/UJJhF0Neya5XB/HgSD6VuOp
 mQYF+9vCnGrDeq/geHhwazBmPeCNJsH8gFsVxuT5XQP3T+v0qDt8vOM
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfX3PMF/39Hfnfc
 svjBOdBcyxtrcEliUACGd/kicw3EXPU1dmwMc5Uoul5uHuiQ+COARSKCF3+IPPf4anxiKUEiyJo
 CRKn4nQWKIYvZJ0dXPisvAuJ92rMX9Y=
X-Proofpoint-ORIG-GUID: dNkon9bNbnDZARBcV9M2CjxRAwP2HTs3
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4cc25e cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=SM-CJC9rQbeaPTssbJMA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDA4OCBTYWx0ZWRfXy0DNGtJMbNUt
 MIcqOkPsf6sbighzGGebSle6JD1Msa/EryEqq2JtziVmvyOciv8wsfmAmKHRnqjfbb5P4iD+HD2
 CrwnUEjHu+gjua0NQAbiq3Z/Knjb4eM+1rRqYmrsjDcC/E8WfIeXte+TDBKcl4UK9/HDyrWtXIy
 ee4X+ZC0tf22Qr08Vtk3BiCwBV3AIAimd2JAq1M+Twg4fPXazKwsj0hBAbV1mJIi3D1oTt/BdTh
 6K6bRxuDsNKbtOr5lFbLYkSpxYYGbA+iOBUErZMpzO2Mzlvv2PJpes+iHtsHhsFdyFkAKhhyxpt
 w5YJrJYCr35IdqaR68iQSx+o+lovbXw9l5EGsdlF/kHaokzNj0i2AZO/OBDVky5VNuXEuMNI3JO
 PoTPnbdA1ZueIuLTmlMCmiB+Kp2Xo1eqsbhcg7L4p8PSS0xlFjL81pXSnyR0O7NwqmMJbDG2Bog
 2dvA+kJSz3fyQlxmrFg==
X-Proofpoint-GUID: dNkon9bNbnDZARBcV9M2CjxRAwP2HTs3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070088

The Aggregator TNOC is bound as an AMBA device through the
"qcom,coresight-tnoc", "arm,primecell" compatible. Binding on the AMBA
bus requires the peripheral to expose valid CoreSight peripheral and
component ID registers, which the AMBA bus reads to match and probe the
device. The Aggregator TNOC does not implement these ID registers, so
AMBA probing fails and the device never comes up.

Bind the Aggregator TNOC on the platform bus instead, where the device
is matched by its compatible string and no peripheral-ID probing is
performed. Add "qcom,coresight-tnoc" to the platform driver's match
table, and rename the platform driver and its callbacks from the
"itnoc"-specific names to generic "tnoc" names, since the driver now
serves both the Interconnect and Aggregator TNOC. Update the platform
driver name to "coresight-tnoc" accordingly.

The ATID-unsupported handling keyed off dev_is_amba(), which disabled
ATID allocation for every platform-bus device. With the Aggregator TNOC
now on the platform bus, that check would wrongly disable its ATID, even
though the Aggregator TNOC owns the ATID that tags the whole aggregation
path. The Interconnect TNOC aggregates trace within its subsystem but
carries no ATID of its own, because the downstream Aggregator TNOC
already owns the ATID for the path. So base the check on the
"qcom,coresight-itnoc" compatible and let every other form allocate a
trace ID.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 37 +++++++++++++++-------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 9e8de4323d28..737cc802aefe 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -130,7 +130,7 @@ static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
 {
 	int atid;
 
-	if (!dev_is_amba(drvdata->dev)) {
+	if (of_device_is_compatible(drvdata->dev->of_node, "qcom,coresight-itnoc")) {
 		drvdata->atid = -EOPNOTSUPP;
 		return 0;
 	}
@@ -278,7 +278,7 @@ static struct amba_driver trace_noc_driver = {
 	.id_table	= trace_noc_ids,
 };
 
-static int itnoc_probe(struct platform_device *pdev)
+static int tnoc_platform_probe(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	int ret;
@@ -295,16 +295,18 @@ static int itnoc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void itnoc_remove(struct platform_device *pdev)
+static void tnoc_platform_remove(struct platform_device *pdev)
 {
 	struct trace_noc_drvdata *drvdata = platform_get_drvdata(pdev);
 
 	coresight_unregister(drvdata->csdev);
 	pm_runtime_disable(&pdev->dev);
+	if (drvdata->atid > 0)
+		coresight_trace_id_put_system_id(drvdata->atid);
 }
 
 #ifdef CONFIG_PM
-static int itnoc_runtime_suspend(struct device *dev)
+static int tnoc_runtime_suspend(struct device *dev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
 
@@ -313,7 +315,7 @@ static int itnoc_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int itnoc_runtime_resume(struct device *dev)
+static int tnoc_runtime_resume(struct device *dev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
 
@@ -321,35 +323,36 @@ static int itnoc_runtime_resume(struct device *dev)
 }
 #endif
 
-static const struct dev_pm_ops itnoc_dev_pm_ops = {
-	SET_RUNTIME_PM_OPS(itnoc_runtime_suspend, itnoc_runtime_resume, NULL)
+static const struct dev_pm_ops tnoc_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(tnoc_runtime_suspend, tnoc_runtime_resume, NULL)
 };
 
-static const struct of_device_id itnoc_of_match[] = {
+static const struct of_device_id tnoc_of_match[] = {
 	{ .compatible = "qcom,coresight-itnoc" },
+	{ .compatible = "qcom,coresight-tnoc" },
 	{}
 };
-MODULE_DEVICE_TABLE(of, itnoc_of_match);
+MODULE_DEVICE_TABLE(of, tnoc_of_match);
 
-static struct platform_driver itnoc_driver = {
-	.probe = itnoc_probe,
-	.remove = itnoc_remove,
+static struct platform_driver tnoc_platform_driver = {
+	.probe = tnoc_platform_probe,
+	.remove = tnoc_platform_remove,
 	.driver = {
-		.name = "coresight-itnoc",
-		.of_match_table = itnoc_of_match,
+		.name = "coresight-tnoc",
+		.of_match_table = tnoc_of_match,
 		.suppress_bind_attrs = true,
-		.pm = &itnoc_dev_pm_ops,
+		.pm = &tnoc_dev_pm_ops,
 	},
 };
 
 static int __init tnoc_init(void)
 {
-	return coresight_init_driver("tnoc", &trace_noc_driver, &itnoc_driver);
+	return coresight_init_driver("tnoc", &trace_noc_driver, &tnoc_platform_driver);
 }
 
 static void __exit tnoc_exit(void)
 {
-	coresight_remove_driver(&trace_noc_driver, &itnoc_driver);
+	coresight_remove_driver(&trace_noc_driver, &tnoc_platform_driver);
 }
 module_init(tnoc_init);
 module_exit(tnoc_exit);

-- 
2.34.1

