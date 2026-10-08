Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A6F3CE083
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 07:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443682; cv=none; b=FEnRWGUqBDRQLHTGoI/QppA3RpfoL/1RWy7jxGbpolBJcF3PVdWh90TRf0ITH0WOU5B/X1PkaK3tl77UVuDMhHsFpKeWZJKXLAaQmQqfjzJFlTgjxflxwWc5TVpBIeQS7s6lYK0SHKfIEDYreszBRohN9ttFwKjD4OgTCQyGB1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443682; c=relaxed/simple;
	bh=F70tz/v0JBbm10RJQKh3JMQbaDiFcwC8IriM5NQ6opo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JFuWz1oaUjeNzdN6+vFahPlYifWARC759JkDN9W7N484A6FSGwXL6ulEdF6Q8Az8TCKFUh68lDRSXxMgVAkky7npPW08RUU69/blVA9Y3GqIuWDcHQB1sc5JkGdxaKg3Zn928nyX+oJBf+T4lvP1p6YZYYY3CntkCBI7obVAMIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mUMCKkcN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z0TnvXQN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mUMCKkcN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z0TnvXQN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BUIc928483
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 07:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c3gZeVKCPHlwEnEKLOrp/lO8ukYtVa7/GZxiBmiVQ3o=; b=mUMCKkcNXFL7fCeL
	RwhRLPeb8ZWNimL+zM3LrABwgEAip5t7eSL4/VuBrhrLsMs6twzO6Nv0tmT17YCi
	E7ykP19QCPX0G6GdG6ASoX9QdprqYtowU1Cv1MbK46SfqW7lay+/FnrnjhT9XdU8
	LjVqmcNloxOCDBfzPX4Brg9ue2/SkTMBzXwTuYe1OZvJER1dWWOosgOtxRjgeLZQ
	b1d6eCFunq5LuUBEE0olxs5Fsljl03RyMhO6QqebWXSyWUFEIdOvGskHmaofkHMF
	l/AU5RgxPGVAEGeJo0f4oGaqpRutathYdv9dhBn/6JR0Lb8c6ZJfuQiyOEI2Wuve
	LGBxug==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2sn5r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 07:14:40 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34ef5fd7934so13375502eec.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 00:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791443679; x=1792048479; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c3gZeVKCPHlwEnEKLOrp/lO8ukYtVa7/GZxiBmiVQ3o=;
        b=Z0TnvXQNYk/fFXP3+1E9Hjt8Ydb396IpetuOukQ9e3OKxlSgF4/Zu2LMVAKuhfpQKF
         SGHD6F3grsOLhV2y/a7PZ/qQvK3WCYq26FeFj+cg/Tt5E+aTlbkDeSi18EyR5Gg51sEm
         WD3Z3CFn7T12Onq6eFwnHRiSwF6gLMPfgFFnj73gsxEkhBpyex9VB6Efdqwhj4Rp4a7r
         X1NSINBI21WJxqYqts79iDga9Q5+RikKJ1RFKpJE8yZBEEE7Sj5iMK1/gPjunpkPuZRw
         KR8LiQniHTo0uQn6bCGoqz917kgNI9EussAZUzZZAIseb7ALejLh9g+yE/24M7kVP+fR
         LqPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791443679; x=1792048479;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c3gZeVKCPHlwEnEKLOrp/lO8ukYtVa7/GZxiBmiVQ3o=;
        b=JENlyZiURAmnzjQCKaRsecpVNAzQQQWxdcrjpQtFBSJm/oO8Jd7b6PasJn7JiGqSjI
         PkxoIgtN2ST2e7lkLv9IS0vU9wuQtcSvEalzuvOfw68TxV3526LvTx+9MzHUF2inSEjf
         2QVzU7cMQF0m46kV3sOy+KdVBaMhUt/jhzW3JigGOpfiM8e/CqtPy952C48Nrq2V9WT5
         5tVO3WgnBA5Dejv81v3VYe5qTaUuP6eCDjbnj8Huc9aiGrfHiWwKuTBZrYYDHc1gcEHJ
         XRl2/8abCVkTd/mrmqxsFrDw6wNbhw2B1LukiiKibcIHuMyZqi34Gvc1OXvCLE23ueRi
         xGcg==
X-Forwarded-Encrypted: i=1; AKwUvBxasOsNh5+Pc8kmdAIr2Qo0DvBpxZdLYR9mjatqf4v/Q/xWBLriTENz1SzmWJmtucaAqQTfoFxqM5PL@vger.kernel.org
X-Gm-Message-State: AFq9FYJwRwqyXAuBOiqRGD/YGvom4yVToWj5wWWF8iWt2G16QoMbUurO
	mtQMsLB5tCECh9giF57a3q0mm42Wc6tXFEHLBQTokcauHW8StPZEqJGQmVxoS0I0raGqT8BZ766
	vHCEbx1zo8qQjTwdBP1XjvBFnmj05JqxwR71RIlEwiPE0tME47sR4DBb88KGmoMlwyg5junSgCZ
	8=
X-Gm-Gg: AYBFou2C9z+QfuA8hK9JdXqw0/EOghq6S9BvI0BEk/Xea64kk4Bo20pmE5vRE+eC9Re
	shGtwDw3w60B8I0Mc6vVAkFNTXsSB+uHgKOyFEJhL0LHbgNo0aTYZCsyhHs4XEwKe0cTkzkEZkM
	wK60Hn6s6ksC95v6mdUpbE4yWTRIzHheEOvLR4g0iobMzvUq0Y8MQzeKltieZXm2gioZiXJujry
	/FlWniGiuEhueYUSt3+uqoUnwgmnkeDejyjDW921i7AUe27QbfAyMtvMFBsNYGu8x6E3TImjvCY
	JpxwrP0g92TFHBA1p3uasMkgkIWiT6wEmrhdVROK8TnlMosa/k2DcKH3xHaUByqAhY3y8bIV7zK
	rULx5wHzAJqYb/P+uLCvANfdZARkKovmE3i63/mziWLMSN57cAbA/rKlNt2B51N0voyuVcCkF8t
	pyFMprvUlH8w==
X-Received: by 2002:a05:693c:20cc:10b0:351:7444:8bfd with SMTP id 5a478bee46e88-35174448cb7mr2791156eec.39.1791443679334;
        Thu, 08 Oct 2026 00:14:39 -0700 (PDT)
X-Received: by 2002:a05:693c:20cc:10b0:351:7444:8bfd with SMTP id 5a478bee46e88-35174448cb7mr2791111eec.39.1791443678651;
        Thu, 08 Oct 2026 00:14:38 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af155b5sm12251625eec.12.2026.10.08.00.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:14:38 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 00:14:33 -0700
Subject: [PATCH v19 03/12] phy: qcom-mipi-csi2: Add Kaanapali support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-kaanapali-camss-v19-3-b2c583ef50e0@oss.qualcomm.com>
References: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
In-Reply-To: <20261008-kaanapali-camss-v19-0-b2c583ef50e0@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfX0+06OMJ+2TSB
 zL1gCzDov9faTaocKaMGCu+rFJ0ex7Rfx6pG/VArwRFhu1deBY3Xcn0/OdxCimRMAemxcWlCJWB
 1eDegM1TO9bULJw7RnxE2dA9Fs6zhes=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfX5VrQ4xNRufRz
 4mjsH0MYxwVpi6FFjz6jjWUnks7awn3UDbcTg9nrYhfKnpegZP/I571hBK0Pi6WangKU4vcajSw
 fDj9UnT+XqbipFh35Jos8sRr+UahTv9Obel7t1pS+MpIF5kN01Ad7aZCrifNwbrtaTk1o/gROJU
 tLtR6RrtsqSi8FKTI6WADa1/bN0FyW34+9UPgwh9gfAk81Ons7NhQ+a3XOtufBcVk3AaOw6UxVV
 PKIBziZbVMkAtNNU5JthlMjioe1BmmBkOY4JRDAdO8zOGCxwH6JdUYJ1LXO4paVB9Tv4t8sRfUF
 cxllpqKfiifcA063iI94xRny6hsGdpYl7OyBp3eDGIVE2F9SvPhUQpxpnaaD1nyPtnn5uIdx6DJ
 RRQMLtzbY8quJfXdJ1Xxq4hiMjWP/iV2zbB30vQV48HBghvda9kg+qChxb/PKQY9GppVUOw/gFs
 BCf3hRii2d2FwTavU/g==
X-Proofpoint-ORIG-GUID: zka9WpvL73vPZW8C0dMizqB96RI5awQ0
X-Proofpoint-GUID: zka9WpvL73vPZW8C0dMizqB96RI5awQ0
X-Authority-Analysis: v=2.4 cv=CIm/zhrD c=1 sm=1 tr=0 ts=6ac742e0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1e3Zegj4IIqRqDCgfwkA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080028

Add the Kaanapali 3nm configuration for the standalone CSI2 DPHY
driver, including the Kaanapali common status offset and power domain.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 ++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 3 files changed, 18 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 8cd331cfb4b3..658a39463104 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -389,3 +389,19 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 	.genpds = x1e_genpds,
 	.num_genpds = ARRAY_SIZE(x1e_genpds),
 };
+
+const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali = {
+	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
+	.reg_info = {
+		.init_seq = lane_regs_x1e80100,
+		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
+		.common_regs_offset = 0x1000,
+		.common_status_offset = 0x138,
+	},
+	.supply_names = (const char **)x1e_supplies,
+	.num_supplies = ARRAY_SIZE(x1e_supplies),
+	.clk_names = (const char **)x1e_clks,
+	.num_clk = ARRAY_SIZE(x1e_clks),
+	.genpds = x1e_genpds,
+	.num_genpds = ARRAY_SIZE(x1e_genpds),
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index c0a4fa20eaf0..aff9e66f0352 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -444,6 +444,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
+	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, phy_qcom_mipi_csi2_of_match_table);
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index d6366f809e51..2355a1db9b94 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -94,5 +94,6 @@ struct mipi_csi2phy_device {
 };
 
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
+extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali;
 
 #endif /* __PHY_QCOM_MIPI_CSI2_H__ */

-- 
2.34.1

