Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2FBB361641
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 01:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782870871; cv=none; b=JRNKdfY03jAkHuicVP1iL4BezfjIA5U/cvJJAfNZ/TnhaGq/wS9G98mb6mi5NpcolrIEyA3m4vfwpEq2jiTFDSPTszWrNnhBSpC3eNypuqctxkWNKtrBxgg5PfbTTgWUXLJwiZdHqE/ezMXbk9ZOiwDglP1jgElOB1t1kFbdbTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782870871; c=relaxed/simple;
	bh=jPUYlzMEHul9CNoXVAyvw1WxSAWNAF1m3Kd9igZDHK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m/YJM8G1KbOHmuZ5gX5m8QoD6YyCnjmAS2H3Q3ke7PfZDYIWRToqAPrTjpEvVcQpm5mFiISyQLEvJQod91tM6/1RnUFoAKAfTNz4KUBFmqbziiwevHxlz2xGONI269IW9yutO8ZJEuzdoYrwwLMqQaSeReQZwDZE9G/BilnNgiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5EZ128S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TxW0bh9y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5EZ128S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TxW0bh9y"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UNM2gV3413700
	for <devicetree@vger.kernel.org>; Wed, 1 Jul 2026 01:54:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tgOSSppSHeyCQQrXCGuCdT6GPj1V3cln/qe0vnrJEJA=; b=o5EZ128SMcw4GUHj
	lP90HOxkso3lbUvP20Jgu4xk7NpIujDz5aY5xqz9yTM2ESCqg9mIpth9plJqGgkY
	TiC69bkh7zAlQgSmePqJSRT/BMFr0SXlb75hM6T5mAV9UakfBltTw9879Fnl+GuY
	YSDisxHzI3yQ2jGOZSgEvEP38+uAYj731sZuj5Ww3wjq2Ude2H//fbDB5xJR8wdP
	ypCg35Du8LmuIr6H+mu3gXJbV2zhTZScYxEVJDq2NV52P51wCFc+E6BhuiRKu5bp
	3Wn4nVUJe8dmKUMVcG9b6uu0xRHb0OHNQqIxByfSlR34f1oZ98qrEPFdmh33vfP9
	ai70RA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hfya0pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Jul 2026 01:54:28 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c354050c34so1909005ad.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 18:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782870868; x=1783475668; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tgOSSppSHeyCQQrXCGuCdT6GPj1V3cln/qe0vnrJEJA=;
        b=TxW0bh9yjeuiUJsL5ggbFNDeGUUc7wLHa4XIoEkNP9hB7HFU0KWJ3BuATr2ezvYzVJ
         YHVEcd/lM8x0fR6xLHrr1psbeYahz2uF8HzZSfp6wiZ/drodnDfA5A72SFrtu4/zgX3Q
         Kn1/9py0wuRwZOX0VhUVNpGOrL4gOKtluhWT99FRze6V/xmmDlLDOPNeuoptSCfX+nPJ
         HDERRzqWydmW9Z7GeCdfhnmAN705KPoaV/v/lRrLADrUcKAdOROH84JOIoOnWUu6YQor
         61M2t5K5KE4b6D6cGZQNzsl19E3/6kkVwTWX7XbBSHEGVGguGc1tWGWv5vB0nOP3wHKp
         379A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782870868; x=1783475668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tgOSSppSHeyCQQrXCGuCdT6GPj1V3cln/qe0vnrJEJA=;
        b=hmceYZyKpMvxbRzv0W0mlCkatZ2K6rVQriJ4e+UbFZv9Hx6+0K7Pi9UXYjEtXJc8mM
         K0N6uoSCPIrIIeIZtajQw5BHgo30U5u1YnKAeCucAtqRHeJqX4EW4xRIJz46q+AzB7HV
         Xa5ri+/5oek3LvF8NwhiEbIpA8sCMW1VKq35BAhb5isNosYRCwxHTCd7MFjDopYHYLK5
         /k+nGaAVDrrSXWqovw7/B2Pfh5Eu+9O+alCgLDYvzZ6AonQEOwg0zGkZKKeuejAKGbda
         8drzZWHhIjO3MGfmyITFuzGu8hZR8J0595dk/N8EhGCjiJg78xM0wAHJ/EYvePwEyLIF
         X6uw==
X-Forwarded-Encrypted: i=1; AHgh+Rr6uEy0m4F01jdjILrD7pyoKTRsdTet5LfOzZnsIoKkyPKyM5s6cLRWUoAy5qD4Cxls7Vrqw6uSPi1k@vger.kernel.org
X-Gm-Message-State: AOJu0Ywts0iACl08Bpey1XRYOjHxPXH0XgkT+R3Gowtw4FUfn522Ftaf
	ce07J1FyAnzJgfGjFqxmc56Ivdq9/b5iUaqPv657WjbZoKlduEouEFiCNBt30SGqRAGMNoF5C40
	Jr6kOs0zQ1vwkMYGgokyoXqEzOYdqACCTnesDPGoZzOnjPavY+oEV6yob4HHkiALi
X-Gm-Gg: AfdE7cnGv1CK2VWSFxunbqlE+N+lZ88heoBycZrlB23Kq8OsROIgibWOm/fFratNjY5
	j5MMfSCHfNILyGXosFCYbCCxyFhc75NR/928m6LCx+X7+iVSHQh73tUX/Ag2InBLz2O1XVqOZCH
	cLImHKk44ej23X1hUGVkmYUXC78me8AjIQiVkUEvaqA27RsOYwUzb+QBwuTJIvS6xpHbe3lKAf9
	R11/9gYbw48IMRAUxssp8zoQZuv0CcXaIu2gHVr2rU+bRYO8bpEsTMo7DmJzXOh5p0enJk8gGkK
	9xztf6pQ1+8Hqz2N+BENqHWFh9MwCbV9JQJ7Xa+ujXLC2g6UNSaju+l7+jT4Yk18wHJ/aSHXPsv
	MoQR9OqZz5GzdQs3piNlKYDkD2Jv6iGO/VraYUXbTAO0VNFfUBFv34w+2GtTnXpHAPlUONRxvfQ
	==
X-Received: by 2002:a17:902:ce06:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2ca5a552e0bmr24064855ad.13.1782870867681;
        Tue, 30 Jun 2026 18:54:27 -0700 (PDT)
X-Received: by 2002:a17:902:ce06:b0:2c9:a5e9:c26e with SMTP id d9443c01a7336-2ca5a552e0bmr24064595ad.13.1782870867202;
        Tue, 30 Jun 2026 18:54:27 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a7102esm23040315ad.6.2026.06.30.18.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 18:54:26 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 09:53:42 +0800
Subject: [PATCH v4 2/5] coresight: tnoc: add AG tnoc standalone compatible
 to the platform driver
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-fix-tracenoc-probe-issue-v4-2-aefab449a470@oss.qualcomm.com>
References: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
In-Reply-To: <20260701-fix-tracenoc-probe-issue-v4-0-aefab449a470@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782870847; l=4552;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=jPUYlzMEHul9CNoXVAyvw1WxSAWNAF1m3Kd9igZDHK4=;
 b=OEqkorXAE2d8ScPpY78cyBhpnWxbNw8WGkA7mG5v1VHqkug/8+KCAMspKvF+rul3OJeFxzTkX
 kLcJShiMV6iCxwnZGsJjEz9rb7WJd/1fb3OFFV+u87mJbJXNm3N76lr
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=J5OaKgnS c=1 sm=1 tr=0 ts=6a447354 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=H-CQmrK-EWR9bHiRmqcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: zr6rOrwShrOnvEQRl36XfFWju_2E4R8D
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfX9lQAXlrAW2vY
 VNU0Urn4L1+wnVucug0TVYKm86U04OsMrlt2T0ZEP/e4tNHPNWnvT9q9G2BSuTmqJtZJzm4t8EC
 NCRap3KnMWndLo0GoxeYXA/mDsmiI50=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAxOCBTYWx0ZWRfXxzMzWAj0b0QZ
 2zSMe4IlznyDRGNPrZ3ono7cFSgJ1b+10ruS07riMHF8CdS8KgP06aMN23guzOjcP/p0xcxJZsG
 0WXZI1EuMXhxHryAgP+okgydxZNpnAr3pfOrv60E0jG8phJj9L9QinqufxcexwpxMylnGJsydPB
 ra8FqLyz/OMfDCJvMcQ5ka5VUCwu2ZRZKjfXJbyFnC5S24e4R6tsOPAzh53Pv0Wqnhx3yYvygiz
 59Sh94+1TkR/yCWOqHyX+9Pp4FIGcoV16UtS60klDBwmPiSxCNmOJwCEjmdRNuJl/FWMYIKIbIP
 Mbrjx3jUhO6Qylpv+mh7WUSxFu7hyWXn3XEja9zdVP1EQXvTVgm2offgsJDj3ySakSwHbZDYQ2n
 QSSYpFo1pn7qAUjhYpMu2CxEy17M5bgaBMhSBlIZrJwZZgAs6N8L89l8qBQBaoJk5EcWqRduj6T
 kX6Mbstit4nWd6Bi17Q==
X-Proofpoint-GUID: zr6rOrwShrOnvEQRl36XfFWju_2E4R8D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010018

The Aggregator TNOC can be described either as an AMBA device using the
"qcom,coresight-tnoc", "arm,primecell" compatible or as a standalone
platform device using the new "qcom,coresight-agtnoc" compatible. The
latter avoids the AMBA bus and the associated peripheral-ID probing.

Add "qcom,coresight-agtnoc" to the platform driver's match table so the
Aggregator TNOC can probe through the platform driver, and rename the
platform driver and its callbacks from the "itnoc"-specific names to
generic "tnoc" names, since the driver now serves both the Interconnect
and Aggregator TNOC. The platform driver name is updated to
"coresight-tnoc" accordingly.

Restrict the ATID-unsupported handling to the Interconnect TNOC. The
previous check disabled ATID for every non-AMBA device, which would
wrongly cover the standalone Aggregator TNOC. Only "qcom,coresight-itnoc"
lacks aggregation and ATID functionality, so key the check on that
compatible and let every other form allocate a trace ID.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 37 +++++++++++++++-------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 9e8de4323d28..4ccd5f38b92a 100644
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
+	{ .compatible = "qcom,coresight-agtnoc" },
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

