Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB704BD786
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 11:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978389; cv=none; b=NDTsu3WX5rQNpg8l2vBKcBhBLcqNHgcltiS/XKD40xw1QCcy2IHDZL03icPTyKpK1ymdVdu42sxZmC0Ftk9qWtlo3bMnIlQbV5hloDGaMGFiHZyzLuNH8UJ+pK6rOLNbzc9zAMkn8iXNkbKRDc7rS2J4Te0X+pX8Cb4hiixgqos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978389; c=relaxed/simple;
	bh=3pLGQfsx8ENltiicZlGQiUWAczEW5WkJbfaBol4boF0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t9udZGSNYfP5GFqNa2T0oUdEN+hokcP5oPa+iYeCG8096DuhESxPDqcAUPvbCo1h3KgRbfCBUor1wuyiIPOxj72moPBD1NHmt16yP7drI4qH6SCxft60hKglFPysQavwyGMxic2RHq8g2/0TZtjivqPPaFvFG9yJS7gtLSr3JZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i0J9/33k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fg1BM0QT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i0J9/33k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fg1BM0QT"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E7TJBY2874211
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 11:46:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M1RDyMw+wrGI5I+yueiU/NXwSTwBJYIf8HmETx2iPgE=; b=i0J9/33kfKkiBORG
	4K3En/wTBiY+BwVbZyzrHdevbQEjh2gFT4tSiOdLvanDmyppW9FiBMK8Nr4WUDPz
	+TMEgwPEiojWYfm39mzDE4W+ZsUA97VIBtOwceDMccZEc1H+NHcL/bFMc1gMDui1
	KIeyBKTdVBN9vhaTWs+hj/kDSUVR3MB5P/mbQcdW6bmZ89Hh8Fa/Leiy3BdFZ8UC
	EGap8bT9W+bocJ5jv9fyN9uv8FyiJQd7OnaNpWAvBE5XKrlhQRHqT/q3ZXb0TucO
	XrxdxzhdvZr/n2LVtdDhxwot+/Gifiq8rxxaCbE27KmoGRjk/vNtVRQn1T3v5Z25
	ojKyIw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9yphjbtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 11:46:26 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac6795617aso295889a91.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 04:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791978386; x=1792583186; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M1RDyMw+wrGI5I+yueiU/NXwSTwBJYIf8HmETx2iPgE=;
        b=Fg1BM0QTZmMXTNewaO6681MtSIRTmwLDu8gdRBz438zGCs2Egb8pcJR/wViatjnnkc
         sUmcayi2CrGiK/Dm/CNeHirXj5Lx3URv9Qzx2AVLAp0LfRCCSKb+13LhmEblbIdveBrX
         nMTVyoYieXBZF74lQqZq8IXuaO1+iePtY41yxq0Z54zS/NjSpszdq6eza87LeYqBEbXy
         AC7bSg4vmppMoDGwGAJgd0GYH/PLqE0hDXq/bzQ7Z6kNKhHWoBSG+p3uMEpnUDpUfjCR
         UeneqzwF0e3v936j1OF6p79A7H0acYvaBiXJ+tY11QYkO2BOxyFQcMIOB+3UYSlqxfGL
         uYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791978386; x=1792583186;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M1RDyMw+wrGI5I+yueiU/NXwSTwBJYIf8HmETx2iPgE=;
        b=cHc1jsf4Hjm1gmF2aNxbmQiiHFoDY17XqagfyKHR5dl58R7CFaDl8gi4+ZEMg3jS2U
         edv6CBwvkNPBiXecrS3q8Rm5TRpPf4skJ7Fi5Fsw0OHzf+3H1hr1bC0lw+xuQb1+aGSB
         rYePWduuC0Pavv7hJ8goq8/WxD8jIanNmq37YiDhcTygZrNqPPrjkM0VCzEXeq+5OldL
         i8hPcVhQGimWhFQM9n9Xq75DIF5UwWDpujlGK50ZVk2QvKhQvrfLJTnH+7xELWXdG3Yx
         4xbpwXuLVRGrnuurthEfDjbXuJMR4QFuouZRpKnUcQ9jskXjg+Yl5iKgLYAwCii/U/Xt
         UUHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLl/zF+MYwVm+hgde0h78mf81geKweNeu5w7b6rnXDrtBjK7AsG5+b/NwXLQMJ85B5PxR6EcGjkIH9@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6abup1TBWme2mx1LaxRwjkhLfNPB+5CnxsNXGeqFQ52EGDrng
	T8gtBZ4h1WHAShBEV2vhwy5W1Efwswf00da/pWLnPMWZp0tes1iyQ3Snxkcvwsh+GFrUYDrQ54y
	jqe2FbE9SYx3o1f+1usgN5NOUBIU2tDa57oJeoUrKPRh09QFBbZ728tHHqBAbiuS3
X-Gm-Gg: AYBFou0WSQAtuNypJAkFcVBiNXdB64m7P0mRN9UF8cC0DKSfMoSjhiUmGBqNFLZJS9f
	R8wysyiAtl+kItaLA3K1NoW2odf2ycn9xJxHSTRzn8onGAYBrVLlzuo5HbQNdfDbM/GDRf7V6WI
	wzhJuHTO7J8ybsz4na9TUTgRRByX8nB8H2H1RLHU8dEscPySJ9OD9TS9+9uv8jg5aPsy/BzuZsz
	+ZDPrSnb5stCcFRZVzLVYpuB/+t4Ugh9Q5uq6C4+sw27vmAeIBy4iC7j6OKmz+dDZgEGCRXiMTv
	+GNfOBO/UeRXQs5zvRVQZdnIa92HnSlbelUwXMQDO1MGu+z+U4Ju2AUsE5sWK6ciLO81WVGCw1N
	gYlO/N9QDesG+vL37J8AEqeEWY1IbkKnDey50
X-Received: by 2002:a17:90b:390a:b0:3aa:548f:eb79 with SMTP id 98e67ed59e1d1-3ab3a74731emr14723915a91.21.1791978385549;
        Wed, 14 Oct 2026 04:46:25 -0700 (PDT)
X-Received: by 2002:a17:90b:390a:b0:3aa:548f:eb79 with SMTP id 98e67ed59e1d1-3ab3a74731emr14723890a91.21.1791978385036;
        Wed, 14 Oct 2026 04:46:25 -0700 (PDT)
Received: from hu-apateriy-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac6009d94esm4219151a91.8.2026.10.14.04.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:46:24 -0700 (PDT)
From: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 17:16:10 +0530
Subject: [PATCH v2 2/2] remoteproc: qcom_q6v5_pas: Add remoteproc support
 for SOCCP on Nord
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-soccp_driver_dtbinding-v2-2-09d9c1378e9e@oss.qualcomm.com>
References: <20261014-soccp_driver_dtbinding-v2-0-09d9c1378e9e@oss.qualcomm.com>
In-Reply-To: <20261014-soccp_driver_dtbinding-v2-0-09d9c1378e9e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com,
        Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-GUID: BGKb7nAlG6nSqlTurYkIlZStODjFa_nb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0NiBTYWx0ZWRfX2wzCoDMXJC5I
 BBBB6ouJ2o9Ft05iDwc91URbhAQdLiS2GWLtqog/M1LT3EOl/wMfrumUIsCtvZlrOTpNEx3KRM2
 sw0JPsBTPN7W8jWQoW4YnnoH/DcB3B0=
X-Proofpoint-ORIG-GUID: BGKb7nAlG6nSqlTurYkIlZStODjFa_nb
X-Authority-Analysis: v=2.4 cv=Uv72pOwB c=1 sm=1 tr=0 ts=6acf6b92 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=mFOwqZS4PhHwTGmbvEUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0NiBTYWx0ZWRfXwR/VjbSEyR9H
 N74QMQmLsVIXogjx9w3bE+M4Egpq3WkwPPaHrmqfW4qB/G8XCi2+kvOEgPa1V+Tx7ClmUSP7QUi
 VAOaWpd4xrPHsz87bN24KgWdpM+G0Yk69JGeWybvOKl6x6zMaoboYVwtVlWYriXHWOnk0roi0OV
 TOozDw+xrh70wPFwdezTWliBdXCWj4Dn5xO3/Iu0833HSqXNFvTZ7gktqzYeQ4OFjO+f1CLwJfP
 sShqhv9Rs/gur1TBb8DCw9jMQS9ZSGXDVsCVgMbv6+SaWF+xnQQTM8FnIDVv1q3t1wnOXsr6LjL
 vK6BU3u+vOM6YkUvz1NzyLQXHnNGRgp/uAZAj2wS0lUAVFqnUve67ndtdWY+4SUWL+CLf3xe0bt
 tw0Orh7LqFxh9m2yRyB+7mvhKUQH1THHkocNuHCHf4OSav3YTA1KckalT6jqUknn5iRTL5OCZvi
 r97pA9zzGCl09aUz58w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140046

The SoC Control Processor (SoCCP) is a dedicated control processor
that handles hardware fencing for display and other use cases on
Nord based devices. For Nord, SoCCP firmware ships without a
separate SoCCP devicetree image. Therefore, it takes a single
firmware-name and memory-region.
Add support for SoCCP PAS loader on Nord platform.

Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index a005546c265d..6fa958044218 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1545,6 +1545,20 @@ static const struct qcom_pas_data nord_cdsp3_resource = {
 	.smem_host_id = 197,
 };
 
+static const struct qcom_pas_data nord_soccp_resource = {
+	.crash_reason_smem = 656,
+	.firmware_name = "soccp.mbn",
+	.pas_id = 51,
+	.proxy_pd_names = (char*[]){
+		"cx",
+		"mx",
+		NULL
+	},
+	.ssr_name = "soccp",
+	.sysmon_name = "soccp",
+	.auto_boot = true,
+};
+
 static const struct qcom_pas_data sm8450_mpss_resource = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
@@ -1844,6 +1858,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,nord-cdsp1-pas", .data = &nord_cdsp1_resource },
 	{ .compatible = "qcom,nord-cdsp2-pas", .data = &nord_cdsp2_resource },
 	{ .compatible = "qcom,nord-cdsp3-pas", .data = &nord_cdsp3_resource },
+	{ .compatible = "qcom,nord-soccp-pas", .data = &nord_soccp_resource },
 	{ .compatible = "qcom,qcs404-adsp-pas", .data = &adsp_resource_init },
 	{ .compatible = "qcom,qcs404-cdsp-pas", .data = &cdsp_resource_init },
 	{ .compatible = "qcom,qcs404-wcss-pas", .data = &wcss_resource_init },

-- 
2.43.0

