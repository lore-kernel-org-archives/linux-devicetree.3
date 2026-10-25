Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898254;
	b=TjqnjxZOCbmg7rlM8gs50fnjKWUZ7FLG9dUm216qB8IN5rwPupt9TRsWTOg235kDQQLZ
	 R/UjCPODoLbDtyywXneYnQHiKOAOriA5EREsiDPNadRvuOWNDi1joBWuKW7WKBcgL1QVq
	 YzPlV8OnCtqSjrvMrvJOm9wBxN/RaPbpVhOsP5IpO3uVcV7QnkwWS2/inwBvWnBFsGyCs
	 hFMJiMohNj3HswdxgSOQN0nqVuL3L8bzOPNoSDMdIQXmUmr2YMj5BDCJEjM9rhM2D6wrx
	 d3Bg7GW+ET/3Iy7+kGKCldW9a/K0QGxNIrkvddcsABusPQQB3NAkeafSUV3Pvznj3TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898254;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=;
	b=lLRfJS7W374iQFOcdOwgCnh8jQyUaG+QFPiaSU+xD6q+3FxhFvCbMVIxR39Wr3v0Z6fO
	 B6oG0VXqsLXhQ1ujd49I/lkNDdWwZ39UoHdSwnBgY8EWrUpw1Yn440LTO+nYUixyhQT6j
	 07bC/AaBi8tvFcG2LHjrUzP54Fzka9zHEb9Vxave+RQU6WW5Bwxqpqvz+t6TMpd+f7ztI
	 at3I77+9NouMAZakaqbrUCpjAopwhSSovuG96chUpvTgAW/MvrKwLihy/b6PYe6plO0qM
	 gb8s6FfXq6T3j9Z/AfpWh3hfum2sY5ziCY5jJ4WNgQUO9cKR/y9y/fZ/5qEpesPcd5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OZKWQNWT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bz1GBPXI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB48A60A3831
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 03:17:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB48A60A3831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OZKWQNWT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bz1GBPXI
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P16PWf3075584
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 03:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=; b=OZKWQNWT4TkvCQXu
	+v6UTayRUYUaMkXQmkbSbDWqK+TNtKBbvvsftYBZvd/c/CTbbzSxEDxo8ovKVgTw
	GQAUIjbvYpkRUdvhGanyv2HWgZyr/kihXxSzGKbAQEhY0y5k2o7FLs9gB4oEnhJw
	xgDx+Adf6Bzhs8D25EVRZmTlTPETsx0JGBpfEdv6Tf2rKEt/Tdp8a5cD35OyZusm
	hB3PXvaCOYxTGZKhHD1woYoV8NZ527iXj/r2xLFMH3U3ZZCcURSCXPh6W2cKzioY
	5A1Zvnu/dSBMN0HM9+tAtwD+nRTeJ0NpBN/mZMJXSzHQh0MLQ1IMCx5NcjZZlA7a
	1tu0rg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgmruja42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 25 Oct 2026 03:17:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so5507885eec.1
        for <devicetree@vger.kernel.org>; Sat, 24 Oct 2026 20:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898252; x=1793503052; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=;
        b=Bz1GBPXIjmW3XY6ajfoVctbb/tI91wsS/DkzodrC3ab9Il6wO2fQvwtuInPiAK5Ej0
         QI+uUUfe0eGLcDXEISHb4kk3dPoRS6mDMPyEjplXfotYtVWw//vc5/goXZQH7ewPcTLA
         h5wjsD+ohzSr+nFZafsUGTOO4pJ3fSoBwe/uAlyqfbKJ4UU7vFq/HGuwMU6ErBLQFAZ0
         ox51ZNZJ7+XE2lnVt0yCVV/Pt/rJGnUs5EHsSF1ltHjP/iS+P6y1BbzDVeU89jS/pkF9
         XAkbbS3OFXFQJKhM+6JhLJMbLUPCqhIFeXsq8zrUJ4SlWqq5NpniCAfrTsQKgBxg4mzD
         v+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898252; x=1793503052;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=;
        b=vVzK0HBQHya2jZFccH/0AUU0EYlp69SrdANy19pSLXF+SdnYqqaLdIH6AiXMWDm6hU
         4SPzVMMlrvX5kEEFi99z2KtH4Huin+OgKiSFuDluwcSefcSFpbMOQ9S4CGP9LjhnfsNh
         hcOQpGOImrTlJEk7ZaHLkGjna0+cl52FeUsBp55xK1h4nwmk0dOAgwUek71JgvGGz/X2
         CTDEhlSfOwD/5jgLW3Hd50xvch7xBAi2AJFEIqPCWSlDlgnuTVpv4lSRas+coh9jsHuK
         nQQvfL/ftlS344dU5dxeiFgQJAr3RlJsz42XI2TwlW8NixliOdRBP3ng6oPunYw8HJk9
         wnXA==
X-Forwarded-Encrypted: i=1; AKwUvBwI7uYqUlzsnIM2WW17RnjSqfzapn4p7lT6XRdZ3ecXw/82HA21ciNFW+vIU2ewNGE7tdcP3TCULQPC@vger.kernel.org
X-Gm-Message-State: AFq9FYJTqpqJwINTHdvx1tvTOFbl8DVE5iHg42W6rpySJvH1MoTISed9
	oRW/0Dmza9Ievj4uenOQgeQVrWvWd7q+YqhSuSD4fEEjFjxY/a08aQpykb47GnqHCwdDd8T9OdT
	EtRN6/4wnd67ee336BJYma74p2CV2QFnVK0W3Px+rBw6ZbvqW7/6alszifhBfge0Z
X-Gm-Gg: AYBFou2G9RoKHJIb2G6REtqVHVchgCzoAEOAmvPTnK3M6h7twxOu+OTm+98OTH1YeBo
	nIY9/mvOv2ZNyVCkMoB6K4ayQT4Mn9cGuACAQOgii1E/YpWlVso3N7P2asPSnEMi7Rc1DxsGfmg
	VbA16tnDpGi4QU0Zvdq97NRo+PTqYOOKjZANm0+y1CnUkx/MNeGH/iNFooP4pRWetATx9T0bJuy
	IUT6DzMzVqhZEUEcnXd/gjU5LeO78LHx5wyJexDw6atrkFQRuJFzBmPwobkOanXC0cpzwwGtd01
	/jwXZNTlMeO59QPN+QQ3KKtcHI7JEgP6FSfXgIdZuAJaucHl13f4wfQ+LsAi6QLYGwgq14jSAgO
	u0nT8D8eGX0QfA69mdlFmtg5Kj6R2fW4AbCSeBFGaN92KW3yFnzj0xERJ/jXm+hSYhgSXdm6EuG
	chRoFgqKGRYw==
X-Received: by 2002:a05:7300:cf94:b0:35c:99e1:c755 with SMTP id 5a478bee46e88-369e86128c1mr4734814eec.38.1792898251708;
        Sat, 24 Oct 2026 20:17:31 -0700 (PDT)
X-Received: by 2002:a05:7300:cf94:b0:35c:99e1:c755 with SMTP id 5a478bee46e88-369e86128c1mr4734782eec.38.1792898251122;
        Sat, 24 Oct 2026 20:17:31 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:30 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:25 -0700
Subject: [PATCH v22 06/14] media: qcom: camss: Add Kaanapali compatible
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
Message-Id: <20261024-kaanapali-camss-v22-6-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX/VRrtTKfX1QF
 mU8J3XlC/HrbwvSR2L7qvcTpF2x48SS7h+zeIIHRPY9sss15d9cw90Uu6MSAoy4DpdbkLUXhVzP
 G54+1/wUPCfyzxXdMdZ13T/gbQPyandfU0RvLgWPUKHOio3G1AEq2jbQdKtl/bUsYX6QDP18QaB
 4Vus7cPnQy66ZzlCoxkLlOh7NUO4yY3ngfp5Y9dYG1ymuQaotLg4+r1NRIc6uTlxFaOrL1MIXQW
 BqwD5KQkMLA+HyWLmmigaBVxUIxTfA1vmg+UwRsobaCWUw5LUGBXsI41xw168pkZhfqheFRZ+GR
 EuTKU6kY3sFSfEsucxAeYDIN8IuWpOdksPDCp5+xPN6qtchi5uI3pZB8ryMRp2FE54bHQhkIlD2
 9bJ4bjHwejINAEzaNI4yGDa2X7Qr6WI8MwGPvSLeNeI3Jv+898sTB4GaF579foywWLq3Y2Qn73i
 eDmMug9eHOgYKpcM0hA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfX85ONC1hPQJb9
 exSc7+Ba8O9qC+R494cmhoHPnqa0/cCrKv98Oh2ji5AE94R+CaOJVVSmXU6RBXlG2d2DEvsHdfl
 i7z0jToBYaW6F8iDU5qAXdrXhEap7Yw=
X-Proofpoint-ORIG-GUID: TkSZjuxSuuRnB4TvOZgZMae1cPPgKHm-
X-Authority-Analysis: v=2.4 cv=e+aT2qp/ c=1 sm=1 tr=0 ts=6add74cc cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: TkSZjuxSuuRnB4TvOZgZMae1cPPgKHm-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driver
private data. The private data currently includes only basic information.
Later changes will add CSIPHY, TPG, CSID and VFE resources.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index be58a39f4a8b..98ec23c39fda 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -38,6 +38,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	}
+};
+
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -5589,6 +5603,13 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5823,6 +5844,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 431afeb381aa..97fec24e6804 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -96,6 +96,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1

