Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA283D34AC
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 07:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791443689; cv=none; b=n3q0ZcLbbuxB/p5uiLehJTHw+J3GHt/dqoYJeBU1CtdufJkiBSBnpy1YVa88r895NYBAjX/ypCSdTB9C5HM5bdRjhks6ugIm6Ee+y31zNkJ2aVeJNmjZvzngtpUka2tfjaMPbZt0KT3EME5bHowfhISyqZ+RcyL27XrQSyzwMao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791443689; c=relaxed/simple;
	bh=NORLgpnQkBmH9YIsIxH+loCGmEq+ih/mS1MHTJtXE2U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UlEMQfZ4DCy+ij1LHu/aXltC/nwskoCUBMlcP8KbDjG2q7ZXaOMX8zfrlC0AHvhlP1OveGGtshT3Sfay17AQVzeHgtbKVbtR5S52NbZjhhO4Ya/hNOF9ndNYLIsXnDskUeWkQJVwFaa4wAdDZkpSp8cfhRTEFU8MMG/Am3AyUUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bq+mKVIZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EF9l55f4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bq+mKVIZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EF9l55f4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BXPR1157823
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 07:14:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=; b=Bq+mKVIZwpFHuCnT
	+aBkQ/R8PNFJUaPx4NolHICK7EMNc0FrDQ56yUQydSDyibu5ELTt78d5/jCMJuHO
	H8fyVIVZhkIpTwOXfPH+YuvjlDdfel9ckob9NLmrqjCZkP/nVn7o3uTOE7C0AXzi
	Re92LD1KDmi19Wo9ao4JPrxR+a3PrYwJAEABWik5+dglpyaq56MZ3FOW43x8nuMY
	MyajmYTSwAR66j+2LZ/+FCIBpE/2/2K5cEBpIjAlnwM2zqHsO2z4IgP7SANaEgbE
	a6yOxWy9Itm2JccFOUhGuQDQCEFB8+3OwvjmAx6wh/PvfjmLsTZYQ0oGfrcH4k1C
	wOzqPg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe51nb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 07:14:42 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34d62bb27a1so20848622eec.0
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 00:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791443681; x=1792048481; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=;
        b=EF9l55f4Qp5S6gBAIIvRvgFGRkEAWh8uY2GudE4SCE8OA9g+zGERXUwlSvbq4YcgVn
         NfFeEI3SjDJ/f6M06awEZ5MhWKznQv2zGH+YR+EtN6bDC+cCBuDymCB5Nh/nJuCBVVkh
         TEX5/mSMK4F7kR3vaJr2Eybl2y8ybqfvtV+eIzL65UM1Vwro+qB0+vBo40nz3xOYElAM
         kw2xKRtEXK/xEyGvXwbjku+rFiD52Q2o+z7LP6KIs43Y87MHKgaCttaYLWHUtuMStW1d
         TjIGU+HcEl9BeYD5+TyyZMywHs1CPYo8ZKmH9C67i5xJKTvnxTZVv4QItmLCJKeerPV0
         YqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791443681; x=1792048481;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXUsa80x/1w7XU09zAB/IA5nFL6Qb4lFQWBwrWEvNZo=;
        b=WEzH+ko8Ixekth9/2noYH8JhTE8AOrww/g2ZoVllZiW7bhYvFiO71foFmni49nkiIN
         Qvf1JXiK/5jTU++5CIX5dPzl2mRaYFJTWURkwzC3V3Kc2l4VaZdZqdvzUk//ZhYwQJma
         QljgrRRi9IRNUEmfeLpZ2fc+vD0ogfXm7avvZTtgWQqZ03Vn1kbgDtxz80dHYuNacNz2
         0XrSPbY0ObiFBBzdpSC3Yyq/MFb0ruAH8ROpk6+TXkfO6uOzbjWI0KdkAhdXn8H1tUaP
         R8dGf5GDeZA/bY6WQqd71MWLWOcFMt+/xNxteyW2ErijBwzW9s23NizLSTQJq7uFUqcs
         YGJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwy4Qpu5D86FNJNGPcGgZuDTMjl7EF/jkrlfZ6dd9+/F8hdGYhgoZnG9j0sJ4zcDAdcwA/1h/85ETNd@vger.kernel.org
X-Gm-Message-State: AFuF++mv7+TOew+9jY9P6/Ztf6aHWGjqRE9mdOHx/dbvl+5TQRTtclHR
	yDNitdt1UM8UOq4fd163+dHaXBBIoG4P5HzYJsaVokW0wMRlr7XuVg2qec6EINZYSvsZOEpUBcI
	f6kFgEy08Cc4MJtI6vZsYgm3EI4lPhfy+7tZbc02JyPXSQ/mfxBcxwvo6SO0OVyQMvbBWTSxnXG
	U=
X-Gm-Gg: AYBFou0cF8H79njBIDn80EqeHyzPnuhXp7o+CK1otfAXqDYGKh8V15VduaYHO361tYQ
	b0D5ywRqMlkfrK+UX5bfZvvEcTVBYpF/lOq/b9770hc9mjSXzJk3OEYE3PhC5PTVhHOIXEphhY2
	ytMiAPe8M4T8AwgiBvxLIuSquf22G4fPMzQE5ux2p1jijDala+DM1f1WIW7/qREiYU34e4nuOAS
	xkgzTZk3xcckbG3rhPO7JI2gelZbvqXd/v95P/rc/xq36lz8EDW5kzeYhMgJkppvnpniVXGjjcY
	2dIUUi0WOc0Xqz6Zcf82MXmwpPfSY+Weg6KGfGYKXgIXcC+AJpmag7vodOliqy9B3S5A9hKBQdS
	RY9u9/usdiUh9nPyfsGu8d4Ys4uONaPIKOLmH0k3zCkLa7DQhJgR7RXMWv/fNNF93/YJ2KIKjU7
	nrUJ1lxgB2zA==
X-Received: by 2002:a05:7301:7d16:b0:352:4f11:8118 with SMTP id 5a478bee46e88-3524f118159mr275077eec.40.1791443681300;
        Thu, 08 Oct 2026 00:14:41 -0700 (PDT)
X-Received: by 2002:a05:7301:7d16:b0:352:4f11:8118 with SMTP id 5a478bee46e88-3524f118159mr275030eec.40.1791443680585;
        Thu, 08 Oct 2026 00:14:40 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3515af155b5sm12251625eec.12.2026.10.08.00.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:14:40 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 00:14:35 -0700
Subject: [PATCH v19 05/12] media: qcom: camss: Add Kaanapali compatible
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-kaanapali-camss-v19-5-b2c583ef50e0@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: frllh8B1sKA6z6Z5CWtthI6Gk0HgYjow
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac742e2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfXwmwmtS5g9aT4
 9YrryEvwA8wUa+r70BzgXX2HlrLky7K/WBPg5QUT1XhGDgvlQ839QrFXPqVXAfGBOYptIzJ/p8Z
 p4Ht1X4mx7a/B+kTS48MqyMFS8Nrvwg=
X-Proofpoint-GUID: frllh8B1sKA6z6Z5CWtthI6Gk0HgYjow
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyOCBTYWx0ZWRfX+puT028SKvF7
 fx84z1dTBhBnLRwkCM5sPOK7mrHpMQxODWkeV+Eu0cTDyzbqVmXsHOvuVaom28EbslqmaxmY28n
 JDCkVJfP7LDttVcpTTJFZMTr8Ymz1K9/eKZt9+gTRdVmsjiJokt+CPnPrWu9AEYTlyJ6qCy8YDp
 30TmiVxh/naYmmTDlEpOywlvIKS0tOMq+17uqlzFb9Mt7fP+klNE7HbfxYfBm9Pi7LUJjOEQVEp
 n3afaSppwu6O8qhq9hok4HCQxxokjmmAVWwqIrWLlKw28Cyu9dae4keB2sBI745m5k1B7UNf1Z1
 iC9PR85bqgKcCPuGbpKBEhSrBYbK1JkbHJ6nS/bNpRN1/Vuut791DkugHupaTeJipbWzG24jVcA
 DiFAKgFh7eQ0VBPOCBpIQehCC74zvC76Jzlhly3Ms+7aQv6QgMFimDyfKWXDCp3L67dZ1Luxx6g
 dRQ6ULzfM64HwrvK9zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080028

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

