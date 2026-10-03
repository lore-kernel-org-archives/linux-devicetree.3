Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B510A376A09
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 09:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018157; cv=none; b=Y7xX/Oa/WJmKmKoVBulyFUujIZepbrXpaslOFdGM4Kle9FUMc8QlKiz++Aw5f1JFZY0ial7iiABAEvUH8BsZCrkdRaZh1dP7c6bKTiiTwRsbWkD0y6pr369czTiExuV3oBNGCJpgRtx3V1LlmRbtos2D0PGJib9dkKp1D7d50Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018157; c=relaxed/simple;
	bh=NORLgpnQkBmH9YIsIxH+loCGmEq+ih/mS1MHTJtXE2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uCQOeTVGxo2vnCset8H0qa25h2BBHRccUfClSfAxi0uJ3/vZuqH7hHT/tsBbc3tIWXo0YIYr9DujXRzyCqDQCBIIuLqsnna/gVS1nWLNKZ3IgGTBUvbgU71U39CkSxUdE6+WvXnEeeLweA8pZz3V48WOwvqoJy5DI3P9ZP6FtOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q5v453Tf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O+q/4k4Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q5v453Tf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O+q/4k4Q"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6933QJie3382869
	for <devicetree@vger.kernel.org>; Sat, 3 Oct 2026 09:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=; b=Q5v453TfNXUD4ACi
	zk0jxYD3aXdA/HOCdsE7bWH417RQuCRjM0JN8+xmmnRCgdGbkFdQBhfYsOhlUH/D
	40w4azfsDgR9VKy2wwodlPS/y/0Kmph4IBvRCtsnCkY4FdGOeJFYbm7r+9cBT3YL
	Lycop4U2NHnW+fKpSM0ZuPNvPdH9sFaFJaMskdPnDnGRErSwCaRpejYu+27b5nho
	tioJu974j1uK4MzhW4bTA2ickdGmmJtrB8YmSY4E+3F2nvgKx31K6iUKuY5ae3RQ
	OGiUs0P9unFSbFK7lBq92kR4F4IYz4y31yqgnCe3Pk5rMKv/rcnMzCDpaN+Iu9AH
	K5mkhA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssu8guy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 09:02:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3425098ae4bso125138eec.0
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 02:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791018152; x=1791622952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=;
        b=O+q/4k4QVQG7Or/l/V+IC0ochgEJiAXSUBpQ0m7xkQ+1C09dpMMty7UL629u7oWVzr
         /3xeJfRnwNERGGKeK+bz2o92sDJzSJ/c0rAU7DfYF348Hshp/8yZZ4h7fFJLi7/5xsaA
         Pu7ChYnHKQqquqLo8DItcYRPt1HEs5wkeve7kv5Jkw354oXO2lu65XA/Gzgpc9J33Bn7
         5xsjHmSJvh/ruRL9IUVOpCVK7u5AMh7GcUqbpTQoFquu7VKt54SjPyk9GUYRVoZP/gO+
         nv6YvbiS84xBATY3k4fZJQeLafXusmOHPWYjtxGaHbPoOFpXnVK3nXcqS96MeWFsJRpE
         my/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018152; x=1791622952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=;
        b=o8gvwrjsKDcct/OGuQ5neBomhRNqQIrpZhJkC5CTv529mpp81hDs96Ez7j1LZ7fpNU
         KObKc7GYeAb92uXWos9dS/fAS7stn2CfCkN47Bcr6DDGmH2QL08X43hKgZv/Cyci7/mz
         lY6W7toGOIHpzyb5xzsyZ6s0Gbmgk/mxIrjaEmXcSLdVPschJ1zwATyzryHkig4Cuvd9
         ya7ZKUATmnNt1D5wTFrg4q5+wt+JV/RaQysoiYdE7w6KtOzKRYwrwnOdpL0mN1V9RgAt
         nx0Qui4aNRVYfi6hYM/Swxc/JsOjcspCGFXBeQtNi0YoquOhnhfaCwAWctfkfsd19CZC
         shpA==
X-Forwarded-Encrypted: i=1; AKwUvBwhB8r43Tjk3Vutx5CtyvAdY7J4Vh4K3UTwrVI4AOHACsuUEMmDtt2cti0uYrahvIZKkaHFQlxI+pLm@vger.kernel.org
X-Gm-Message-State: AFuF++m+uvK+74gbmDPRvqn75bAyQnFVl1sUFGJQV72uuAwSfftgI8jY
	cEQ1P1KrxH7wfeLbgoogln1WxixtZQKYITsYw8HnR5m1Y/I4WxBS7YfUS+03TUR8fzYyqZcN2SA
	k8YvFie65MJZfZpKBH5/X6/BHfK3Yhqj2IM/8ZMVGEXwLtaAMAeWupI8mLF9BI9bk
X-Gm-Gg: AYBFou2ScleKXP8n3wOTBPaRKSAA/yqXB1X77fQhNno3kuT8SmuEckd7an432TzgY8W
	fV1/tGNqut0TEMTd5eC5T9pROYbDPoTEB02aoZ0IAynBKk/I/jmtDh2CLAegT3gplGbwrGebT7T
	BGwEiCz7iEeVS9Fm8WxnyHFgSDOtCjQX79esNPIpLaq28/1eN2/0FwW/WxS03azabtyQfbG0Iey
	Ccnu1aoNNNdEh6H5JF3AYU9hzhH56UOCp9plLo1YXMQ5xQdbu9QptIJEEx5JdI6CZOKVVmSq+aM
	nrzRGQtxuFBMDtcuTL/XZPLPqxDQrPr+GeYfkE5op60CrpzvQ+bfC3MbL8xfoYfbF7SXKisyE5x
	DawBcTbylE+AyT++ln8dvywuBxrnK49EBTSK+qinI3ZdhVCvM9Ge0/BuRMZDTXzjM4rnaF+zQtM
	AcSZyFPmgv4A==
X-Received: by 2002:a05:701b:451c:10b0:151:ed93:e273 with SMTP id a92af1059eb24-151ed93e5bdmr1698414c88.19.1791018151987;
        Sat, 03 Oct 2026 02:02:31 -0700 (PDT)
X-Received: by 2002:a05:701b:451c:10b0:151:ed93:e273 with SMTP id a92af1059eb24-151ed93e5bdmr1698384c88.19.1791018151403;
        Sat, 03 Oct 2026 02:02:31 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f9f2afsm29278695eec.18.2026.10.03.02.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:02:31 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 02:02:14 -0700
Subject: [PATCH v18 03/11] media: qcom: camss: Add Kaanapali compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-kaanapali-camss-v18-3-87ba4ebe0db1@oss.qualcomm.com>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
In-Reply-To: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX05ry9btymQoS
 ElDnhtWG+W4gT8HtWXFxJ/zNC2NGX9P98ZTJMaXKeiMbq4Ia0YshKLTwp8U+GI/zaAWfP+dD+0b
 Q41fzMJMvBVkG70bWFHMFS1KkhQEUKQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX+6vXIpKtQPRT
 boWTIsiBVX2MBNZLEDl930USoYMa4Jkoh8YeZ2ZDWwPS9cGa52lrTQwdzRj8xeFIAzi1w8iSJJC
 rN6y6tmctgHn6/8pYnMdp01Il3SohkSbGOZr1jb/Q0rSSxPFktt/XCFBaSsh0A5ABYioQDrU/Vq
 flTjG7Rp6u/QiOKjP2lIhqsruiT+rNJsaq5RtmmGcXFye+XZ6zLge68k5o+mQ/wuvQUFC/LPPj7
 HndpelAyvgSY11zOyUk/9/wiVZ4PM6gLnI9yBBqbDO+gkVnADY4d9YSwXfpBv2s8Au9uxIcL8hS
 TSDWEyffPLqTklx2zvSeKCF6yc0ldvZqLhEhCzE6qoT6pumL4hQczFaXmKvlKhVjHIccQR/IBv8
 /2P5OeEyYhiO6tHgStEzZw5lWTVvznvadmspzHpFA5gX0POHvhvmB8oNLTb8ADOuBf8LEKC4bN6
 gABxqOioeCbSCz2X9sA==
X-Proofpoint-GUID: IHDuG02vybAyMyPscc1kkVv7OD_dxlBZ
X-Proofpoint-ORIG-GUID: IHDuG02vybAyMyPscc1kkVv7OD_dxlBZ
X-Authority-Analysis: v=2.4 cv=FryQbGrq c=1 sm=1 tr=0 ts=6ac0c4a9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030035

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
index c54185c93a8a..fca3de214a92 100644
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
@@ -5576,6 +5590,13 @@ static void camss_remove(struct platform_device *pdev)
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
@@ -5810,6 +5831,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7dc2fd9f03e0..0551211f7948 100644
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

