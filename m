Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792513848;
	b=mMtozz6Qnw0E0lMW1okc6Z7UC7yB7KgEja6HhNnQp77cOfn8kk9QmaCbFnZD03mnr58J
	 LzTdgUVzY1BeleJT6F61NhOQqU3XrvRj5wVMynTtKtSd6m3vPXojAmI+WL4WNNX9Y2s1u
	 pFC5DjDD8HInmcYFogHBxQNryBfolDWYJ0G8UZ7v669ZatHc1fACwjn6KYaxZqGDSVxRo
	 IS0+aVtw3LYfuKo4R3GBhKZO6zdgmmPDVuH7IPIVPzMnBzCLSMIFfRfKC/Hgog791OIya
	 MnxuJP3Yo/Ri9Y300hfgQP1kk8d8yvLGUdQzgiXfKfYVrWDISBeJNcWkp6sAyfjW9Ow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513848;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XA0IAiPsmsCfgrqSEgkMXcasY5uxsfrk4i3u8mvlO20=;
	b=WYqD4rJDOgjn+4DgSC0pMzJQWan6rvXfnq1/KGSQb8Pz6ZJaE7E/k3XF8g75obzuxsK1
	 abJVh0mSSrbmR7BylLVMeFsReysdSj1Py7cT94faYPMYQcVxE5/rp1/FBOc6lH61RITGN
	 I7AXGnW3burCspxxwbkVY7RZqb8kYwE+W1FpFN01RcNM8oHUhWkPeaU+ekBtFaW1L8l92
	 jaYBurd7DqMaBPinw25wFwtNwiyVKjMzJvm2N9rmJApmMgyNZOGFF4HSyOt9N8eA+TMaO
	 OZoF7n0kmZd6us4XE1uGVe9DRiw+9IP2HNOAWMh2rOllgbsPswDGd2o2CPnv19j3oyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fM3fSPH2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OSAWB4+G;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48280606A33C
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 16:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48280606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fM3fSPH2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OSAWB4+G
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDAGE71209863
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 16:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XA0IAiPsmsCfgrqSEgkMXcasY5uxsfrk4i3u8mvlO20=; b=fM3fSPH2d00hRahJ
	Yb54MpFTMI+t3Fq3EpjEGxJp/GbFtTHIqV4a5V9fjVVwgIVFulrz9UK6LGOh2r5A
	B1tEncSv1orJNWdWwsfKqD3aGo8+0gxbG10CFFYeJ5C/sOLKHv1ve2jDqaQ4mENB
	mGo+ouJqTHm/hDnpsA7Bn8dg2uN6toYxlXqGZ8JjChTJ27Kb3d+eTiHUkeqtYBn7
	LOwcYoxKc+LPkJ/RA3slM2RuVDolHeiuuyWX26og9yVfuSWk/UKB2iypodJoiV9r
	IA03mVPPJ2w0OOrfQCUuKWQzXVHYGhH3HiD1sa38GstFof0ABRTolcG1SLFCLhCs
	vCXudg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pbdjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 16:30:47 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1663fb7e005so3796735c88.0
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 09:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792513847; x=1793118647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XA0IAiPsmsCfgrqSEgkMXcasY5uxsfrk4i3u8mvlO20=;
        b=OSAWB4+G+fYpJaFX6wnGwVpaiFiX7O03kPHJ85V1jrPSMhigZeMn9iOEdLzKKitJtT
         DFKBNEpdNAaErIjPYQPMeWAzhYx2afa03AAGnk8ICpqyece+rPpa50oGs+bfL8feR2OL
         8eZAtQwZJiQEE6KiSTKvc6j3GfZZZV1IFEdl8GUPYdQJaYsyG1au4GYeFvVzydYEuQvl
         7GozZEt9h/foPeAlFNWQoH2duZJDIWI6xloN3fV2Gqfvp5PmdYNHCozhtGo66YsYizS2
         ZOV1MbQy919mPyZP+7DaXDAqYAYEOepz3laX/YLcRgkQZPwxU8fqsgGWQI7D9bePFq5N
         jD9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792513847; x=1793118647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XA0IAiPsmsCfgrqSEgkMXcasY5uxsfrk4i3u8mvlO20=;
        b=nlbknpOE4d1x5KX9uFHY7araw5ueLVYSHqThfrOe3Bncw+DrSnQTFAANfQW89neyt+
         yDV2EeqwFHkQgdhDg+T6KQpBeBVotOPktOgzXuEp6Rohpc+g0lPUPWPykHROlTM6CSRQ
         xNWUNElNlyYKBfSDXA6nRwVyoJQepJw2jWrz51u/EZ+YXKwy6vas7gP6MqSa4Iy+qmgW
         o1C17/eVLiSlQCCvEgBAfetKY0qq2B+QWqeSJtwWXwATyj2XxoNVRVRFq0opglNfqEWh
         OMjsCUw9jnO/swre1+MeTC5LcAKsBw/eYeKOTlXJ/8vmG4blRhAsEMbmdST5zsNWUsdl
         UTCA==
X-Forwarded-Encrypted: i=1; AKwUvBwFC68gd0BpK2DFET5GFQQL1Y4OhBshIosshkIrfyWWh5L4iNH916p2Qdk64inqkTkPnP93KjlQ7Sr0@vger.kernel.org
X-Gm-Message-State: AFq9FYLmCKN6PZd/a+m27u1+B7BFwZDhpt3uvceo7XU08qjN7LE3qr2w
	55wfvDCNiKZ/Bak+mgqEptZYvxbuwuGrEQHhf+S5ZIvbbtxl33OqIFoGqRqUWvdLzaIbpdXEo3E
	9IuteieXvxx10rInX4JpKkfcbSs/Cdg7n2l+FcolC5nx1dMl+dkQ9jCQSac4WS375
X-Gm-Gg: AYBFou041scxQFDCLSYKe1W3Uz4Nya4l5Y6na5bXzKPjS7lhwoJ1xmFz9nJyS2tRBCV
	SizICBrIzFJwiciE7HoCFQSan1V0JZHTOfkYB8+xRP2pIl3dfT09bazysX9NG6B6EG+PN1FVISd
	gAJpeIqb1MsbAY6Sa+JCkmdfmOvwG77pX4f4DFUlX/VHqvde0YOi2EpVA2UKNLBozlgeXswcwvZ
	MnbGFrCVUfFzjK1NyFuZ6QCCk7Gx5RMP9ph3W8Cr2fupnsD1O/jRr5haMvOAPT6uir4gSXjoNG0
	xup6288QCZ3/qCEzNhrWkHZA7ZMmDjq49yXmzdI6KU0MMlQF+zttZmgmNebxdiwj7lqeGMMNpx/
	wr62O6V3is62S2sP0Ey9fSGq21l/y8rBgGu25wd8RMzk4tbHOO/lBgTSnaw28ns56RU98oIrIfo
	bs3k+A9a27gFrZVpnbiaHyLmMf0eaaF1Q5r9Y=
X-Received: by 2002:a05:7022:b054:10b0:190:596:4071 with SMTP id a92af1059eb24-190059640ecmr251657c88.11.1792513846416;
        Tue, 20 Oct 2026 09:30:46 -0700 (PDT)
X-Received: by 2002:a05:7022:b054:10b0:190:596:4071 with SMTP id a92af1059eb24-190059640ecmr251602c88.11.1792513845675;
        Tue, 20 Oct 2026 09:30:45 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b37ce3fsm33473794c88.14.2026.10.20.09.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:30:45 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 22:00:27 +0530
Subject: [PATCH v2 2/2] soc: qcom: llcc: Add LLCC configuration for IPQ9650
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
Message-Id: <20261020-ipq9650_llcc-v2-2-e4c492acc8b2@oss.qualcomm.com>
References: <20261020-ipq9650_llcc-v2-0-e4c492acc8b2@oss.qualcomm.com>
In-Reply-To: <20261020-ipq9650_llcc-v2-0-e4c492acc8b2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: 5EK7D-Xgw8ieTpUvwqh2l71fL7vNpz1x
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad79737 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=g86QhdraO39nIfxGWTwA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA2NSBTYWx0ZWRfX9ZFOdIepQVjv
 0dNRNXoK6uz805afdbsX3teiZRVP0P/kWIV2yfxceJbvYA+jDkeK1PlnRahF1jOmMhrIAfU7zB3
 UsRwh+W/QtHgSZRqqs7Cmos8euAaclMpOYQuxpKyGJ0m/Ui49VGRavDZy1lRKFDpQi77e7+u3PV
 tGviXysU5LssP8nELhp5yEB0tRRCs3P7EMra9cdmPvmCRXV6pRptEEy1kgNoJsUUEQXz1hDFTs6
 13JsfhqUp74CSwJvrG6Ne4KAsFYO5EMzUoLAvB/HJUyj8avHwl5b5tL0Vu25+rhl2Lri+TjAeSY
 Y/vDvaVpCWh0B3sK/TmH5pVtL8nTWX7xlnpCJPhjkjocW86aQsnlJXqJ24KXgRxvYCgAeVJIGRT
 T0gJ8a0V24oVr4oAbs4ES3slpZvEQnuAVFb5TUmOYmNpX+/2ROECfThnsLqNlCXbRr9EigjUyqY
 jfNSlXZwRCCISGbzcnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA2NSBTYWx0ZWRfX+X7jg7SZdC2U
 d1xRrAbpER0BNISLWALI3w6bKd84vySEI9TMDfxLZ5hbMzCNtThM8nsArP7KZNKW4V5J2xb3AoK
 Vc8YEZc++X9ybE9z/Sn68jlRFzWnKCA=
X-Proofpoint-ORIG-GUID: 5EK7D-Xgw8ieTpUvwqh2l71fL7vNpz1x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200065

Add the system cache table and configuration for IPQ9650. The LLCC
hardware version in IPQ9650 is v7.1, but similar to IPQ5424, there is
no broadcast region since there is only one LLCC instance.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/soc/qcom/llcc-qcom.c       | 76 ++++++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/llcc-qcom.h |  1 +
 2 files changed, 77 insertions(+)

diff --git a/drivers/soc/qcom/llcc-qcom.c b/drivers/soc/qcom/llcc-qcom.c
index d7a42a8040a1..37154db362f4 100644
--- a/drivers/soc/qcom/llcc-qcom.c
+++ b/drivers/soc/qcom/llcc-qcom.c
@@ -696,6 +696,66 @@ static const struct llcc_slice_config ipq5424_data[] =  {
 	},
 };
 
+static const struct llcc_slice_config ipq9650_data[] = {
+	{
+		.usecase_id = LLCC_PPE_RXFILL,
+		.slice_id = 1,
+		.max_cap = 128,
+		.priority = 1,
+		.bonus_ways = 0x007f,
+		.retain_on_pc = true,
+		.activate_on_init = true,
+		.write_scid_cacheable_en = true,
+		.stale_en = true,
+		.stale_cap_en = true,
+		.alloc_oneway_en = true,
+		.ovcap_en = true,
+		.ovcap_prio = true,
+		.vict_prio = true,
+	},
+	{
+		.usecase_id = LLCC_CPUSS,
+		.slice_id = 2,
+		.max_cap = 384,
+		.priority = 3,
+		.fixed_size = true,
+		.bonus_ways = 0x007f,
+		.retain_on_pc = true,
+		.activate_on_init = true,
+		.write_scid_cacheable_en = true,
+		.stale_en = true,
+		.stale_cap_en = true,
+	},
+	{
+		.usecase_id = LLCC_PPE_RXDESC,
+		.slice_id = 5,
+		.max_cap = 192,
+		.priority = 3,
+		.bonus_ways = 0x0380,
+		.retain_on_pc = true,
+		.activate_on_init = true,
+		.write_scid_cacheable_en = true,
+		.stale_en = true,
+		.stale_cap_en = true,
+		.alloc_oneway_en = true,
+		.ovcap_en = true,
+		.ovcap_prio = true,
+		.vict_prio = true,
+	},
+	{
+		.usecase_id = LLCC_WLAN_2G,
+		.slice_id = 8,
+		.max_cap = 384,
+		.priority = 3,
+		.bonus_ways = 0xfc00,
+		.retain_on_pc = true,
+		.activate_on_init = true,
+		.write_scid_cacheable_en = true,
+		.stale_en = true,
+		.stale_cap_en = true,
+	},
+};
+
 static const struct llcc_slice_config kaanapali_data[] = {
 	{
 		.usecase_id = LLCC_CPUSS,
@@ -4673,6 +4733,16 @@ static const struct qcom_llcc_config ipq5424_cfg[] = {
 	},
 };
 
+static const struct qcom_llcc_config ipq9650_cfg[] = {
+	{
+		.sct_data       = ipq9650_data,
+		.size           = ARRAY_SIZE(ipq9650_data),
+		.reg_offset	= llcc_v6_reg_offset,
+		.edac_reg_offset = &llcc_v6_edac_reg_offset,
+		.no_broadcast_register = true,
+	},
+};
+
 static const struct qcom_llcc_config sa8775p_cfg[] = {
 	{
 		.sct_data	= sa8775p_data,
@@ -4909,6 +4979,11 @@ static const struct qcom_sct_config ipq5424_cfgs = {
 	.num_config	= ARRAY_SIZE(ipq5424_cfg),
 };
 
+static const struct qcom_sct_config ipq9650_cfgs = {
+	.llcc_config	= ipq9650_cfg,
+	.num_config	= ARRAY_SIZE(ipq9650_cfg),
+};
+
 static const struct qcom_sct_config sa8775p_cfgs = {
 	.llcc_config	= sa8775p_cfg,
 	.num_config	= ARRAY_SIZE(sa8775p_cfg),
@@ -5830,6 +5905,7 @@ static const struct of_device_id qcom_llcc_of_match[] = {
 	{ .compatible = "qcom,glymur-llcc", .data = &glymur_cfgs },
 	{ .compatible = "qcom,hawi-llcc", .data = &hawi_sct_cfgs },
 	{ .compatible = "qcom,ipq5424-llcc", .data = &ipq5424_cfgs},
+	{ .compatible = "qcom,ipq9650-llcc", .data = &ipq9650_cfgs},
 	{ .compatible = "qcom,kaanapali-llcc", .data = &kaanapali_cfgs},
 	{ .compatible = "qcom,nord-llcc", .data = &nord_cfgs},
 	{ .compatible = "qcom,qcs615-llcc", .data = &qcs615_cfgs},
diff --git a/include/linux/soc/qcom/llcc-qcom.h b/include/linux/soc/qcom/llcc-qcom.h
index 713cb0221b14..b0ce1a7d5d8d 100644
--- a/include/linux/soc/qcom/llcc-qcom.h
+++ b/include/linux/soc/qcom/llcc-qcom.h
@@ -92,6 +92,7 @@
 #define LLCC_PPE_RXFILL		 102
 #define LLCC_WLAN_5G		 103
 #define LLCC_WLAN_6G		 104
+#define LLCC_WLAN_2G		 105
 
 /**
  * struct llcc_slice_desc - Cache slice descriptor

-- 
2.34.1

