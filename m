Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CADA3B14B7
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781773629; cv=none; b=qd8V8V8nU5W7zZdyWHAZM0XMN7o7+7VyUY5M25KjSdgPln/mM7l3RDV5zUwqlOQQBhJhjrOr9Fx1Zek8A7ahFZqN0nM25xL9i7UbHCcReMNoj/s+VfdhzScIaeEhWtHbJP3meWAOq5/x3MnCl4ran78V2HoCf0dFeEVs7JeBi3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781773629; c=relaxed/simple;
	bh=9YWKqHG9h+azs7B5xT1AGSTkv5a4OvLQRAny2OdFtmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KhCpJfVH2O0GTCKap7rXvmWNcvJ7HrBDaKckwN0FmlgQZ5XPPwiUGYcvpvOaGD5LzY83sKAF3U1Mc+EXbo6XvOJuDIm8s8VSPoQL8ZwWkZXL8gIbxcXugcsqgtilXkqf7AFykc+Xezc5S3ex+pF6QkWKdAJhsxcb6DS/c5puUhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ab9ZY0S/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TTPytgBp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ab9ZY0S/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TTPytgBp"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65I8FOeH1177641
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Czs6WvmW4eC+XZ3qTBqPqvwU0TrJ6OjIZ+EZ/8XjiU=; b=Ab9ZY0S/VgFjCrwy
	aWBhllKfjuhMjFY+8zxesXfn5PDrVrNNrjgAsaR9gLudSHLGHB3X4mMR7SRZVV/V
	U9OlqOrfn0mGdnLDPNJBEz4kt2Gdm6k8co8cph0BoRyXnBPUb5RcW21Ri0vPG0El
	Mqhm95WPmppQjR6MfVcfGaO3ICQCd+AMjdQYuc4jhpBpwyh+4rFlYiFJ5scMvUVz
	TBKbDoPaBM+Qgyzuw1/rdVvgHzv5DqtMYf2on+rt7ArEgQZSSSzw0CxCnJmhD4k1
	DhrJ1DDQK96JU4/fP8sAYtogTZ3qvowjf2hSkJpvArHWHRfK3hiRUGE9+QE/ibWf
	Afo8hA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev12kjqwx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 09:07:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c6a2ee8cc9so7091555ad.3
        for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 02:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781773625; x=1782378425; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Czs6WvmW4eC+XZ3qTBqPqvwU0TrJ6OjIZ+EZ/8XjiU=;
        b=TTPytgBp6hnedSG/5nOIg542atSsNLcNZHF11K2fKDQ/iEZ9KppA/z6U8cGairy0Q9
         4Hu1qY6I7g+RzkK433bOT+xM4ue7DJgNiuinjb8LsCHHs2gxH5ybBKaUsKD4h2lraY1i
         gDpUEkvy7KfWJaxCy1ET0FWLOqJP0Bi/7ZEIv7RHf4Chb2T8i29s60Km8ycFOzBVRFyL
         w3dPna6g85/H3IVhO4RzjkVyixyq+ZrDAd89yxAN1Q1hJgwIys6K5AaeYjWfrzAEOIUY
         59LCLt6Q/Ay7d2TEPbl4A4oXYJnFrjP4SGxea844QWLqnzz0JTmAXvI0o//aq3oY4Ju2
         wvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781773625; x=1782378425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Czs6WvmW4eC+XZ3qTBqPqvwU0TrJ6OjIZ+EZ/8XjiU=;
        b=po8lMR9nn67CWCuhIWqXx9BPm4j7r4bJ4qkf+iQuJ+9QU8ws+Xo3Z3vf1v36YnQBIQ
         9rBG7SWkziN4cWcLrPrLysvD50QKYqaa6UrDC6zr2PjV09sHRj6fm+xsqfKNTGOk19wX
         9Sc/QahB9gPqWm/qH7YiLACQGEDDfZRZiNPhoAo5L3vb3ndY8eQ53vf25aO3ZEn8xLt2
         /Zq3ZUKqHnndLwE9/wYhC0so17fbmPQVnfG6Bupkp8gRcyU49vxtADqClKr42dDBX3lv
         0OGi3ba8pInflrVNrjjb/moGLNOPETVoctvI288lu0D9exXd/c5panIVu/DPaU7SF1c/
         7PVA==
X-Forwarded-Encrypted: i=1; AFNElJ+65RYQ2htihx7NYf9n0LDW9EVQLp03II0P1wBvBqrMq9bV6LKkMPKUbSYZLxneFLfJL3Eean1j8xL3@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu6NT1WcoV5Wm00kpU3QFzzSTh8x0LBqZA9LNyJqOsePyAAC1B
	+ZyxA4MVeak9TzHgZKcgbA1yoRnDrHwSpY3LlDXEcWL+Rr8gMYisKOsDJDNJ8M3uFoVIC72C7j6
	Y6ESULBn0vg/p/BaReXQlTqAdRxSbYNGVXy+oADK5LmXfyvwZ2CPa5euXhVtuOpAI
X-Gm-Gg: AfdE7cnfw9JfgfBF7ccV6NYTwq/R1xG0mjHcCF8EkSVkkFMlth/UoVBygYMULyj/cEZ
	BB/WjU52MHfcls+2Hf5/c2TMdlrAfGgDzt+6ueIY+7ABQPjBIQ8CCjhYl1w9ZH/4kdBwSp1N8tT
	hUiKpKLkqkCtGhJxadBztzn55RM0o8ofVlCwXEACprJ9NqgWMZhZ92CiOKON6GA6iJQ+OPVVwVt
	AltAfOoHAt8370Lkp4FJ4vx4zzu/noyI6AP/GwYfNIAyVZOyQoGh4817drHRq+kzeLqp9u2ijvU
	hP4+pv1M5TJ0T6634rhdrFH5HWy4ZkszC9EP304dXQw4/mk/9rxAeMFLDgnO494NwIPcF3c5E08
	KrqNCD9dzyEj2MzQluzTYFrzn5oCr6jdmKhvMQV6vTkP8
X-Received: by 2002:a17:902:e844:b0:2bf:2015:5b94 with SMTP id d9443c01a7336-2c6f340c894mr18082575ad.3.1781773625461;
        Thu, 18 Jun 2026 02:07:05 -0700 (PDT)
X-Received: by 2002:a17:902:e844:b0:2bf:2015:5b94 with SMTP id d9443c01a7336-2c6f340c894mr18081975ad.3.1781773624753;
        Thu, 18 Jun 2026 02:07:04 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c4327ac794sm192112835ad.46.2026.06.18.02.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 02:07:04 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 14:36:40 +0530
Subject: [PATCH v4 2/4] spi: qcom-geni: Use geni_se_resources_init() for
 resource initialization
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-enable-spi-on-sa8255p-v4-2-f5b5067e7e1e@oss.qualcomm.com>
References: <20260618-enable-spi-on-sa8255p-v4-0-f5b5067e7e1e@oss.qualcomm.com>
In-Reply-To: <20260618-enable-spi-on-sa8255p-v4-0-f5b5067e7e1e@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mukesh.savaliya@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
        chandana.chiluveru@oss.qualcomm.com, jyothi.seerapu@oss.qualcomm.com,
        chiluka.harish@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781773609; l=2697;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=9YWKqHG9h+azs7B5xT1AGSTkv5a4OvLQRAny2OdFtmg=;
 b=J4I53N1i41tzyPhhs7ATLMiLulNR4q3N5bXGGJ7vdCNkUxLqQrvApk0P5NSUI0hMVkZBGVQNs
 EeqeBruvSUzCMou64jZwjB1ExfXxtj9Dt5F6GnlliksNvvmFimAiG8/
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDA4MyBTYWx0ZWRfX635ocaGGLjRB
 YnYPvNahrDePnoctVRUVvoMV3qzW1HIcsKKuWxJnIVTUB1rEyB+5q9AyfCxvbZJZM/0ldQltRHj
 115yj7XW+MwjfI7nzENz+9OATIVJbovEcFRydnAVuieUWcheXqcJ9f6UzOLUrpS10o1K/edpmoY
 4H+X85/d+SpuGXCZbAlCF8Gw9athJq5RqIGEN+9s6pUnUtI+KpuN0WI30yvfWyThnQTDBNeGr1q
 7zEz6/HJZ5aDxEUlGJoXuy0X5XKd/yEjiTorhWBr51sXZffK8IoeS0PaA6135tKgNhXL17Jazq6
 5Cr3slhms2jeBn4ji6HyemjPjsJQgr4gn5+pko4hh5Y9Xgz4q7gNDU27v3YYKGGAYmZcYmlwp4v
 U/1Z5G+KlUXrm6NeQZSIwegtum/Si4ujCpOAUphvHEVDAesMpO1VBaFXCxAXXI/Mx56EhTDHZ5B
 kj96KpEsgZma6XE1PAA==
X-Proofpoint-GUID: YhPvzbAC3K7jqN1JFqRUNph7oDiAnKQ4
X-Authority-Analysis: v=2.4 cv=HpVG3UTS c=1 sm=1 tr=0 ts=6a33b53a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=TXo2QnZ9t29hVJcr6pMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: YhPvzbAC3K7jqN1JFqRUNph7oDiAnKQ4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDA4MyBTYWx0ZWRfX0nm+GkRbhORR
 R4elDeVFxmxyy9xKol2++hktwCtb9tnkS8jNQ+5PoIccD3KNG9XxanbQMTsee5teOepEEK5X0l5
 hvS+0pJ4nZM3Rp5sRo7zjOid9E2Ylr4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180083

Replace resources initialization such as clocks, ICC path and OPP with the
common geni_se_resources_init() function to avoid code duplication across
all drivers.

The geni_se_resources_init() function handles all these resources
internally, reducing code duplication and ensuring consistent resource
management across GENI SE drivers.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 26 +-------------------------
 1 file changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index 26e723cfea61..09feb6577efc 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -1045,7 +1045,6 @@ static int spi_geni_probe(struct platform_device *pdev)
 	struct spi_controller *spi;
 	struct spi_geni_master *mas;
 	void __iomem *base;
-	struct clk *clk;
 	struct device *dev = &pdev->dev;
 
 	irq = platform_get_irq(pdev, 0);
@@ -1060,10 +1059,6 @@ static int spi_geni_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-	clk = devm_clk_get(dev, "se");
-	if (IS_ERR(clk))
-		return PTR_ERR(clk);
-
 	if (device_property_read_bool(dev, "spi-slave"))
 		spi = devm_spi_alloc_target(dev, sizeof(*mas));
 	else
@@ -1079,17 +1074,10 @@ static int spi_geni_probe(struct platform_device *pdev)
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
@@ -1115,24 +1103,12 @@ static int spi_geni_probe(struct platform_device *pdev)
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

