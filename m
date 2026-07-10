Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C0D319852
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783651211; cv=none; b=WZh7qoH2IIP2IPjgBxZC3tTVLBEMEdgLmxWVbBSC4neEUNS/B0yc1uFIfNvlmLGuUFERAVN4YlidN1PW6vRWzfn8OGmn/uBGwevYkHUMmcYbDoiRN9cElVX+vOxxKGeXs1vGNSvL7cPurj1vostN/jebYNQ3h5hi5tyIstt1VjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783651211; c=relaxed/simple;
	bh=/VrMOAI7RMTSpCjPO+MrxGESmI6mgxV1a4rVfM8UdWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MMrs9UUrc4XjO0OxN29lV2lUicG/UoPpHzJtevRLkTeZcw4dzTee7Wid8ox1AKVZUioL2L9UZ4gK4AlL02/bEBTBDgCMIT8iM7vi+BcQ77f4xTgIldjESgINCZ+BsZgAZp3PBFNc7TVsUJgztjXXr2MNO6UmHpJdI3yhNPa6GPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kj6kZy5F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UMtrYiuC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kj6kZy5F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UMtrYiuC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669JUmKf2557012
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M0XjIK3l1QlrdTu9yiIymA0sMB/2Qxsvll0XOYQf5Pw=; b=Kj6kZy5FuHVLnZ8t
	YufYnucsng3n+1HWl5vfM4wLn9WIVMJE3Vz8C96eULHsKBSio1DIHlM34OmEw8Kv
	gPTnrByXiYXcWRWAyKUsIBhTZxe0UcTlPBwTvSOto6wNQpZdN9PNyiz9zKmwrFTg
	xLLAKpFn5X2e/sJ2zDsFmIk/JDqC9wPz0pMdZVrTxhjDa/U3dag3SyoTSWvGlVgj
	46BYg856Mfi5Y2r40ntyIVa3kOt7MkTmqy2MwK3nG6c6pxfe7ZwG+EC+hkJiJbqC
	t5QMfOlOABuGHCxoEfij5jXY6zh3PF5I0tTXTyKuR2IEqmGk7k0MXyL90c9AblFQ
	wL634g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8h79p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 02:40:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84859a64079so801663b3a.3
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 19:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783651207; x=1784256007; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M0XjIK3l1QlrdTu9yiIymA0sMB/2Qxsvll0XOYQf5Pw=;
        b=UMtrYiuCwSh9nhH669kn7zSwlBnnf7kHUoVIS7iYipSvy0IFNF8CkqaNM7mD53Mrha
         ZTeuHZ9i/9adxN2teLpJ783KP8T/IsYQqqIftOClroDOmTtEGftzRU1kacZYdhy7VC64
         322Jdf/yi5OEq/1C4y53VcJtzQiee0EXmdnFQVzfOv8+jQF7v2SaUvnIVz4f12mXE1J9
         pyL1cBXyoxUn32AoP1Quy1CTMp2kqPpJ0O/AYgm9Bko8CGpZRPLkrlydNi5k7+bFG/JG
         9ymiVB1vPTgD+PW0KpyDBntZjRj1rxkdax2FnjIm8WAyLQA73zUqmNOavu1SkC2ffgeM
         oB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783651207; x=1784256007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M0XjIK3l1QlrdTu9yiIymA0sMB/2Qxsvll0XOYQf5Pw=;
        b=BmwhQjA+48lnWLZi2BhiwqBoTU5OwyrR6If3LaJDrELC0Sby8yawaFAZuIQovqXkhU
         Duvhz/aV+UMAIis/jbbEGGlTcqWWQIrw/1/RCFiBAd5sVjtrvke+8RKn0IWorvJ6ycaT
         KYs+ZsIn5JUKOoM3maFZeOKsxFHl7gnULkZA/3PPnmZd9QJ108i7h9eHwy/9TYbfewNm
         MjGizjN1ckrLJ6xvlcx1Gl+f2NAR/XPFQhf51JrqjFerFLWBzj9G5zc2C84BcL4QUZF4
         qlIKvy+NcF9YmgxUVXr+2BfQAiN2r5rviAkZwbn+7SBfwFrW+RZJZ60I3HB8ccHiKikW
         76uw==
X-Forwarded-Encrypted: i=1; AHgh+RrGxgldyREUIbjtfj8XwZc+qNAIc74Ibwye2fiad7hoWQZicH5L0HY9Pmj/q0NwJfaAgDXW0QlsF66w@vger.kernel.org
X-Gm-Message-State: AOJu0YzU8zISx0sJpaxCnh5Ep6lL5q3h6qKtseTfLsxwQsmIerB31flT
	moJ0KrZm1fGKK+OU05zXSTQF5D/N9tYSjzEWFT9wka2mr4D7DLjjWDrH0BLEf3OSHrJo+Vi1n7B
	pcN/ooAz6rApMwh3qGPF+hh+iLm2tZ0Z4UfWEuEtO8bSA37z254rWzp6DVOIhMezI
X-Gm-Gg: AfdE7ckt+rsOjgX9yh5j7PRfL+L7oqu/PsirbkiyGXiZj48KnRh7yqYE+bUc6SLiF9t
	8T+TRbAIe7s9l57atenj2AnlOjqoXJGv0n1XcbHhcEyTI6Q9e7CeSL4i2wjgI8DM+wPOyRfnQD5
	SA6vbEpp+xvo84qRmnOa3apjpGvAJkAhdQNZNf51r3UyRyMcpq4+ufoYvV3XMat6IsO5eRWLbUo
	0Hm1jiB8VUpvfTsKj+PJH3kBJbtLsxnjw4mfzeBNDZE3auDvJmzBQYnUm3VEvRD6y/O0LBwMYjU
	IeOicSzXU+JlXSW6V3VtwBiynu/mYTBQxYy05WfT2G6UODo6Zsf1UYcPh+EcE8u9TO0lqVCslYd
	fm+tDnvYV3ucErro5a52gwRphUqksem8AOrlfXr1ODdIDWoZbDW38iqmEqh2wiaXzOrnlshqMbQ
	==
X-Received: by 2002:a05:6a00:3e12:b0:848:411f:3969 with SMTP id d2e1a72fcca58-84842ee66f7mr8113031b3a.20.1783651207319;
        Thu, 09 Jul 2026 19:40:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e12:b0:848:411f:3969 with SMTP id d2e1a72fcca58-84842ee66f7mr8113004b3a.20.1783651206712;
        Thu, 09 Jul 2026 19:40:06 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af6df87fsm4517611a12.5.2026.07.09.19.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:40:06 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 10:39:01 +0800
Subject: [PATCH v6 2/5] coresight: tnoc: Bind Aggregator TNOC on the
 platform bus
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-fix-tracenoc-probe-issue-v6-2-41eb36fef8d9@oss.qualcomm.com>
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783651186; l=5005;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=/VrMOAI7RMTSpCjPO+MrxGESmI6mgxV1a4rVfM8UdWg=;
 b=6y3FHfzbxUki4D5drjaSM3YVMMezRawMOVbPyF0uw93CA5mqU+VVMTAN9itU9nQTEeBfM3Ge9
 JbnbH3GHH9QC5rzvF/iwh9LByMKOs5B8Boq5siOOZ85twB8UCsUaqE/
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: en2dVETS1qGLmbw75CYeIalATQXS7jq8
X-Proofpoint-ORIG-GUID: en2dVETS1qGLmbw75CYeIalATQXS7jq8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX5+EHrmt9J6L3
 y4SMNXyDlx5jcz6oKhFLLRP7FxOnZtXox/RGVuaGBEYCdpTjLy/h9D/HMhOZ/m+titq/HRbGQs4
 /kdfBcoUy6R+fDs5Hq11bXKSJ5dkaqE=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a505b88 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=SM-CJC9rQbeaPTssbJMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX/siqunR+tsDi
 U3BrGLb7MA2Wq0qKDUwUdkWOgGqpOmM8mb9pYAAABBUgyKewLeUHCmvBkMTV6TutTVHJxUNQ4rI
 lT0L0W5sW0Y3fGY3MVhyg/bu7RHSRv4di7YwrVrYQlqiXuWYlK9lrajg9RnG1RuY6A6hcFbx0j2
 mRxeL7y9K2CWiAcAvgFx7QQHCmXqnZsQk4OKAkHbyhB8NgoJTnf+4DCcCW2sNJxw2SNNxDO66cV
 ThkiRzi/DN8tCSFA8qMlm8iV4Dusv1dW0lnA5QI6qe8mzM0chyuU9YjKVrLQXlCXwatz+ZVD3yE
 MI9kQi/XC350Lbj5rZNdZr0kYofIUq/TCkzc9rPyzRH7eiit/lWXIdw/IF0GmWYv95iF0FueArv
 jSbaF1/Y05TRJuk51V6uh5/qyW9ZAdmcCtlW58MkWQjjdsRs33EPnPT7ar7QALAeIgrZRkZMcnU
 IoBqgEArWBKyiOYORHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100023

The Aggregator TNOC is bound as an AMBA device through the
"qcom,coresight-tnoc", "arm,primecell" compatible. The AMBA bus reads the
peripheral and component ID registers to identify and probe the device.
Although the Aggregator TNOC exposes the CID registers, the Component ID
value returned by the hardware is 0x00000000 instead of a valid AMBA
Component ID, so the AMBA match fails and the device never comes up.

Bind the Aggregator TNOC on the platform bus instead, where the device is
matched by its compatible string and no component-ID probing is performed.
Add "qcom,coresight-tnoc" to the platform driver's match table, and rename
the platform driver and its callbacks from the "itnoc"-specific names to
generic "tnoc" names, since the driver now serves both the Interconnect
and Aggregator TNOC. Update the platform driver name to "coresight-tnoc"
accordingly.

The ATID-unsupported handling keyed off dev_is_amba(), which disabled ATID
allocation for every platform-bus device. With the Aggregator TNOC now on
the platform bus, that check would wrongly disable its ATID, even though
the Aggregator TNOC owns the ATID that tags the whole aggregation path.
The Interconnect TNOC aggregates trace within its subsystem but carries no
ATID of its own, because the downstream Aggregator TNOC already owns the
ATID for the path. So base the check on the "qcom,coresight-itnoc"
compatible and let every other form allocate a trace ID.

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

