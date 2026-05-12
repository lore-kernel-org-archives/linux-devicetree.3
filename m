Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F2B2C3768
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 03:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778557082; cv=none; b=qvjuiyZxxJXQj9i5boA7oxe2Vb6rKk9906IkvVvB2W1iFR+neVG2PYuCevtzcrUqI2p10sW+FpmcA5Q5ZKGVbuNmhjpt9Ct3aZvGg8Pc/Wnuvx5hXWMQ4Lf0SvZMtloXM6utLcNq865iZIlJIIsLrsCSfRJoJTI3n5Luy2Ha9GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778557082; c=relaxed/simple;
	bh=k+d951Qvi+Dcbct+bPdWAZBcVUO5zA4xMaJyBHeyrMU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lX2qxTmCcDUsUzdvcahwbdcunObSy4TrHlVVqEXdlyrnhCGh/pYFT8xWHlGDhzxGdmE2sz393iIEL2eP1XOrdq5JoUo11zyozV93bfv/Q/AUcmeZHt9mj63X5usI99ISaVUIgsiI0YdGsyZwUlTW/iThtYts4UN792uXMGDbz1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UcILo+2j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RmvlkuAk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UcILo+2j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RmvlkuAk"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64BK6awH2518217
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 03:37:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=f6Lh5X695h3
	Y6NxGVDMp4XhoibCMZmokmWWM3MAxEng=; b=UcILo+2jc+3KmjBTxKd068qfIbH
	KBGjSXiKo3UPXDkBewH0e0Wza+R8yO2WSUvcijjciKy+UhG/MJtwPPnJJtuWyoPz
	f9SLDKJ1ZiiUfBkMyNumsdjTuTfGSc6ltVeUXO+3/xEGfnQK3outRRMKQjww6Jw4
	Rljl24l+5Wx+Ol5LjjY5wr30saI6pXCHeR2Y0e6ZtOATd9M6HyOqjvYsU0BtcQyt
	+TY8x6lzOP38ZMNJrOlTgOzpYNAjADTpPlMkJ0WjzZcqTHp9EJ7zQC1d9RzQ29jU
	yOaxyio7+inqqEpc0kquLJFuW2AgOK2j8UmOuzGtA17ds5x/VJai3j7WLbw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv1h9m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 03:37:58 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c16233ee11so6780666eec.1
        for <devicetree@vger.kernel.org>; Mon, 11 May 2026 20:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778557077; x=1779161877; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6Lh5X695h3Y6NxGVDMp4XhoibCMZmokmWWM3MAxEng=;
        b=RmvlkuAkmlyH1r5XIzf/OapV3JDFOk03GKwkzzzTvG4y5HOLIusVrMwPjS4GNszX90
         NTSK5NB87sTt7/T38XNcdwavghRuEgXwH8AybT2/e/Z/xyPMz9cSKwNWOJnxfDTbZDK8
         4Bic12bSaxxwBnNSv9tFLx21jHzgcCig1t23p0SRIuM1iRa3LlYOAZSNsWbQoxo7lZpO
         i02hz8ijaasxSuJZkG/TzmBOD5VGOLdW2ayhxy9XkAgXUcLwRl5syuUHxha6O/8PAtGM
         NWTLeJ39/WK4Hnw1Rp7DF0GV9Mj4w1cQQ6u1IWRX4VJ+lMihsJGkveTHiUeD8ujvH3nP
         E6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778557077; x=1779161877;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f6Lh5X695h3Y6NxGVDMp4XhoibCMZmokmWWM3MAxEng=;
        b=r2dsYpc5VyBq3DvkaihTicmmHfdfLheoA60SI59Jebm5RxPdljdP0NGjo86VH2pCfy
         2sRfRLxV5sq/vBB1s/uW4pKJHuDE5XT/QwkqU9R711T0u0s9AOIIQcL1+CuTd1znweB4
         +CJVGPHzF5x3f8z+wssq+rvraWVGT7RqwbVLqWoXGNNitQff0sBhwyWzXd3cLhFy8mTs
         6hD4C0gXcmnkuYJv/sMs0H+J1h7Wki6o7UXzFPk7r7O7XyX+GEJQWRoN6zkscWODFn1k
         a8KAY9RUE4EEwmxWJtBcVQfSdmUdrBET6GHbGQFjvCLJKsdcZOmjWZAI7kMrRHM7jbwR
         O1fg==
X-Forwarded-Encrypted: i=1; AFNElJ+39Ly5fOjx686Zchv0BbVtx1nclL8WfljdzABdsDg0/eWns54lP9DsQ9jGlByievIajDkq67uuPDon@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvipsgw9FEzpMNA/x/UfUFGmMZIwBC3ACgA1s+48l4AX1VfgBB
	w4HFcoyyQ2AbmJ3nv/xmsuGTY7kMzTCrKPUh2zi4IUyO6oDZJkO8wkgOSv5Mpw1JlsgvV3rfzd8
	I3/BXsK+PDwOiwBvA6xVPzzAVtveSQPwggumRrrXNX++dYym/hgY93QAkYdIKKm1E
X-Gm-Gg: Acq92OHHQvdGqSdk0nIFxn4a55c8TpBvXhyWMEmqGcNlscKQL1gadE46IN4ToJgs37q
	L3eJsqjYEVMRIHkm1OT7d0okSRXmFVwEvFhNiJqM12diVRZHnhZkB0I8rRlgzJe22sA2HoROEg7
	fNAzDZ7B37RZUJk4XPwpb3LjuWvyBeW+aiVOQFTWSZ8CTG+ml8iNf3RQhie3dLoJ2hiwELb1lKs
	JvHySPAuhiIuOVdwzaTviQ2D4jvsSOA9QJ+yCrhy9M+dkWeGh/n7mfHrBYMddMpSQU2GW9GdfPV
	KXX1/1KHLgp9bEJx7Ju98q2GN3UcRqxjS1KSSuyK2pLK8flXjyOZMCH/h1UtPb8krmKlu+AvtZw
	yXH/YwnGoiWHYZuZ1cQSIcsxhaenHBRSY+eJsv5P1WkRD70tH2QsxncZTZTAQMJvjkYZUyMyBI2
	nVprVz
X-Received: by 2002:a05:7301:6589:b0:2ea:edc0:4fbe with SMTP id 5a478bee46e88-2fb4bff7bdfmr5950469eec.14.1778557077399;
        Mon, 11 May 2026 20:37:57 -0700 (PDT)
X-Received: by 2002:a05:7301:6589:b0:2ea:edc0:4fbe with SMTP id 5a478bee46e88-2fb4bff7bdfmr5950442eec.14.1778557076836;
        Mon, 11 May 2026 20:37:56 -0700 (PDT)
Received: from u20-san1p10573.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f8859eb4b7sm16730109eec.2.2026.05.11.20.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 20:37:56 -0700 (PDT)
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Subject: [PATCH v2 2/3] soc: qcom: ice: Enable PM runtime for ICE driver
Date: Mon, 11 May 2026 20:37:49 -0700
Message-Id: <20260512033750.3393050-3-linlin.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com>
References: <20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jehsxqUc8nfXmfQIDZqQxdsYAZ3aJ4dO
X-Proofpoint-ORIG-GUID: jehsxqUc8nfXmfQIDZqQxdsYAZ3aJ4dO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDAzMCBTYWx0ZWRfX6f6S1xPk+Dje
 qh7ozTm+30HkfMgmg0MQfSFmUjqHIk1qYKqR4Ws90TmzcnHa6O//1E83yCcRXyULM+1GqkfFlxI
 VSmyd651PT6+Vjrz8eR8461R5MuvJCtgBAHZStrbaRI59DqdSlaVxh+jDRbVORMnLyH8aEzsIDp
 BE6cLihr1oORhB+A8U2KH44ty+RlMU+q88/Xaz6ArAHR4RD8uXH1rcWzxMcKX5zCgX0FiGkoUpq
 lo99LNZn25Vs3HXCKgZe8f7/KVLO5iQVN6orbeWwL45JqUDkn7wd6KLNJYpl+A6Plm09FIYK892
 RBZUnJqnCHXQEN94EdLchA6Fu2kV6Yp2dwv1L55k2JWd6rH1g60BgK8RGsEHse/5N70Z+nMp+Yb
 +VeyeETrEsEKCqEqq+H8mFiK1zGADMD3cyjTDfpmNl5x7KsvE8xy6KGmHV089+r/HG9O07lFkPJ
 6jIbjxekbZuaH5VGHpg==
X-Authority-Analysis: v=2.4 cv=c6ebhx9l c=1 sm=1 tr=0 ts=6a02a096 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=7JBRkwD79zxFga_vYKgA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120030

The QCOM ICE driver manages the ICE core clock through direct calls to
clk_prepare_enable() and clk_disable_unprepare(), which limits integration
with platforms that rely on firmware-managed resources or platform-specific
power management mechanisms.

Replace direct clock management with runtime PM support by moving clock
enable and disable into runtime PM callbacks. Use
pm_runtime_resume_and_get() and pm_runtime_put_sync() in qcom_ice_resume()
and qcom_ice_suspend() to drive power state transitions, and enable runtime
PM in qcom_ice_probe().

Reviewed-by: Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Reviewed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
---
 drivers/soc/qcom/ice.c | 58 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 53 insertions(+), 5 deletions(-)

diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index b203bc685cad..6f9d679b530c 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 
 #include <linux/firmware/qcom/qcom_scm.h>
 
@@ -310,8 +311,8 @@ int qcom_ice_resume(struct qcom_ice *ice)
 	struct device *dev = ice->dev;
 	int err;
 
-	err = clk_prepare_enable(ice->core_clk);
-	if (err) {
+	err = pm_runtime_resume_and_get(dev);
+	if (err < 0) {
 		dev_err(dev, "failed to enable core clock (%d)\n",
 			err);
 		return err;
@@ -323,7 +324,7 @@ EXPORT_SYMBOL_GPL(qcom_ice_resume);
 
 int qcom_ice_suspend(struct qcom_ice *ice)
 {
-	clk_disable_unprepare(ice->core_clk);
+	pm_runtime_put_sync(ice->dev);
 	ice->hwkm_init_complete = false;
 
 	return 0;
@@ -716,24 +717,69 @@ EXPORT_SYMBOL_GPL(devm_of_qcom_ice_get);
 
 static int qcom_ice_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct qcom_ice *engine;
 	void __iomem *base;
+	int ret;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base)) {
-		dev_warn(&pdev->dev, "ICE registers not found\n");
+		dev_warn(dev, "ICE registers not found\n");
 		return PTR_ERR(base);
 	}
 
-	engine = qcom_ice_create(&pdev->dev, base);
+	engine = qcom_ice_create(dev, base);
 	if (IS_ERR(engine))
 		return PTR_ERR(engine);
 
 	platform_set_drvdata(pdev, engine);
 
+	ret = devm_pm_runtime_enable(dev);
+	if (ret) {
+		dev_warn(dev, "Enable runtime PM failed, ret: %d\n", ret);
+		return ret;
+	}
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		dev_warn(dev, "Runtime PM fails to resume, ret: %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 }
 
+static void qcom_ice_remove(struct platform_device *pdev)
+{
+	pm_runtime_put_sync(&pdev->dev);
+}
+
+static int ice_runtime_resume(struct device *dev)
+{
+	struct qcom_ice *ice = dev_get_drvdata(dev);
+	int err = 0;
+
+	err = clk_prepare_enable(ice->core_clk);
+	if (err) {
+		dev_err(dev, "failed to enable core clock (%d)\n",
+			err);
+	}
+
+	return err;
+}
+
+static int ice_runtime_suspend(struct device *dev)
+{
+	struct qcom_ice *ice = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(ice->core_clk);
+	return 0;
+}
+
+static const struct dev_pm_ops ice_pm_ops = {
+	SET_RUNTIME_PM_OPS(ice_runtime_suspend, ice_runtime_resume, NULL)
+};
+
 static const struct of_device_id qcom_ice_of_match_table[] = {
 	{ .compatible = "qcom,inline-crypto-engine" },
 	{ },
@@ -742,8 +788,10 @@ MODULE_DEVICE_TABLE(of, qcom_ice_of_match_table);
 
 static struct platform_driver qcom_ice_driver = {
 	.probe	= qcom_ice_probe,
+	.remove = qcom_ice_remove,
 	.driver = {
 		.name = "qcom-ice",
+		.pm = &ice_pm_ops,
 		.of_match_table = qcom_ice_of_match_table,
 	},
 };
-- 
2.34.1

