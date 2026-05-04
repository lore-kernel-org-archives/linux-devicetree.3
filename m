Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D5103E3DB6
	for <devicetree@vger.kernel.org>; Mon,  4 May 2026 17:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777914451; cv=none; b=sdLrZultc6aJO9cj2+5dKZkypdh0Cd41XaFqSmIwgPlWJPVb1kXJEWuvaJYfEf974EG951Ay0UABPTQNOD7+PlTbn9Qqdon0LULFutkDHCv77ASgojMHodS29/wWsH6aS08PTN/gSSY0zifw4YRtqSuJepj0eF6iRRWSg+H+hj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777914451; c=relaxed/simple;
	bh=9HR3Xd4rmD5sUqSiHMjMhpAeSe2fKm1iaA4AmjsSxAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YBfr//3bnDJKvyjizn/nSwwMHF3pWTKkNfnA8aZoH9xt1bxLJQGvpczQyfWOtXMJ2PZrYk9SS+Eh6NBlJPi/O/p7AVe6Zbqb63LP4HOuUKD9bfQHhuqk3soIzNLk2krIhVvEuWt0tSuJGLCRU7UIoVTUi1TptLesSY2EK3Cdpq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KlqznbCl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWIVWTa3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KlqznbCl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QWIVWTa3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644E2hZh1186849
	for <devicetree@vger.kernel.org>; Mon, 4 May 2026 17:07:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j56RPVoQs/E
	HqShchuuBXHfNfL9pTjlMbfxbxuh9Cys=; b=KlqznbClezUFLMrmZTSB/GRVxtJ
	jAtjeI+kCvUYck/SNsnN1uU7DVV4/cUXHp7UzahF76fm9qV2xZiNHfx16ohdPZHw
	6nwd+8Gfhv9IL45YcSVugbSN8HT5S1MHfvtJXWMH0RxPUqLH7fpA+hCqcxePV06Q
	GaUVntOl8pprWCJVdAs9zPLQmrR3XxrvaE2tnAbQudH5ymWbS6Fj00GjHcNvpXK3
	5jtGcU/3+UCxaohyrI4euAHSFdviwzAMtpd71cjGiawkFymXVOnKTopJRRqt0iPT
	B6gcqsMtCxVK7+OviDggsFkhtNk/ttA1giRNNMidXnqtLFyuS2MG+HZ2MFg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxvvg8q0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 04 May 2026 17:07:29 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-362eaa3aa61so4428290a91.0
        for <devicetree@vger.kernel.org>; Mon, 04 May 2026 10:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777914449; x=1778519249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j56RPVoQs/EHqShchuuBXHfNfL9pTjlMbfxbxuh9Cys=;
        b=QWIVWTa31ODzAHLAlXROjyKR4DhiTNerRpQk2bsH6s0L2SCUiNAAVgwqEdvH4ZFqs5
         uHLwK9rpDE0ajX1eMMusf45WHYz/rwUU4UZ+wPgzAvzEql/cs2OdheZ4WN3qeoe/F7VI
         qDNW5HAWMHmrrPasopG19rEXK1iyHAD4K0eWLRFpdI/7hunJcocBKoEUFyraEtF5MwLC
         S908xNpzTaW97sJ+OWmWQX/IpMA6dQXpsAryyxzovEoFelq1IwDAzhZyJxSQ8NFbQA5W
         TwFAQak9bsDGSni/rA6oIyVpsHHrm3zovX1HzsRHOiFnv9XLCehqr7KPKjt+OTRXNFIT
         pn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777914449; x=1778519249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j56RPVoQs/EHqShchuuBXHfNfL9pTjlMbfxbxuh9Cys=;
        b=KRVce6Ta5LyKJ2krElVQ8rrfQwbSFjIg8sp6cxiYdVP1BFLdSSBMkWpIUfAZba8e+j
         P9c9dxGnvdPN34HksWIiFb9CgmBVLHaK87Y/8o4lET0ZP+QTvok/nda7/S3onaeES5oT
         sv2aiNvFtv6yIVlH7kNnduNa+XF9QETdBtDKFIlq6E2DSi/5SOS8PjLj00z7Wo1FhZC9
         ZOVUpalvnZfUGGkJ0kYsfwPcyjugRshN6icW5p5UlQXaYW3cgM7JasdhWwOVCCsrc9fL
         h8zmvLqucrK0vUZfG5f5Z1Np3p6+bheglklMM0K3T5+JzEGDLSDD2i/+VmhKM9iT54LU
         snAg==
X-Forwarded-Encrypted: i=1; AFNElJ+Hh2QRIoJwKE/CXvMgMftd1i0xUXhg19rDjmE0stooIV6FXKq7vqWfmegLKyKuhOKFut5MZh6IcM6S@vger.kernel.org
X-Gm-Message-State: AOJu0YykgnpT+2xRncmmO8eRetLNZ4qspuTyBStcebh9eBFRKwBoQ7Qz
	gVfWZu97/VY+GW359eCySSWTdGr/hl32gMrX4+rX5CHDzf3OKBllKeANywQVAm2p5bG31qYUMgf
	A799/J7r4np2M0xDVzvz2GnTbVVaBjlb5CzNtWOaXhhachSOFYdgsBOYk87WgAogC
X-Gm-Gg: AeBDievGTese8vg24b7W4e5D2kybSs87Ygk4k6YARE5nDTSGPIASuEURT8yiEhLFtPj
	OsLlfGoHNIdbaZRcnIeXDHgb5UZNT8aGvmiutm3rUSOpieWNNKXTDr7SffA86h5NT0rSTAnhweH
	hydn4R8Ildu+llUvh+nGH9MJ8glWtaagAjrvVnYvJG4PdYhhtI2ZU5VVO1wUaHKldKsZdrNQBAn
	rBOvN1oXfvxn0FWpTCjkh5RPWomuFfYnVMUeSawFt+a9+yj/vQP6jEqBxe9md2zkrj9E+OhDFdu
	iYLYf8EtZ8AA+nYVNJw/ThzNLD39v5+0uIA3eR5BAtW+p/nuwuxl8OBNNh5AHHVu0DVOPU5iN5j
	FiBtN3+hAc52xMzJHpG1VJav1UNJcZFqd6S79jVElo/Q8/86rvdSrVZTs6yV1tyju/YwV+PzC49
	3xqObV5DREWhUK+/jTwF5TUt4pEQ==
X-Received: by 2002:a17:90b:35d1:b0:35e:d012:5a39 with SMTP id 98e67ed59e1d1-3650ce4b8eamr9749049a91.14.1777914448373;
        Mon, 04 May 2026 10:07:28 -0700 (PDT)
X-Received: by 2002:a17:90b:35d1:b0:35e:d012:5a39 with SMTP id 98e67ed59e1d1-3650ce4b8eamr9749013a91.14.1777914447850;
        Mon, 04 May 2026 10:07:27 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36528ad3154sm6256847a91.2.2026.05.04.10.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:07:27 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH v2 3/4] phy: qcom-qusb2: Add support for Shikra
Date: Mon,  4 May 2026 22:36:58 +0530
Message-Id: <20260504170659.282532-4-krishna.kurapati@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
References: <20260504170659.282532-1-krishna.kurapati@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Te4m3d-hAyG8fn8h_Xrt6sKRzhwYnbtn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE1NiBTYWx0ZWRfX3HXnibmrqY6L
 vPPoIHKucanP3MLXSJrrrD6Z9NN45ylIRaPUStToCt2fY4Q5oPX+NfJruir2E/6O7enOvRleoJJ
 z4ETPcIWwxdu68ozmA8yNe6m7gCaFemgXRx5rtY81ApYTX0/6ztD0IAJDTe3u+qt2a90j3WBIFY
 3miYfJTHSnkr+JrkxtF+58GOFYnFpXauYoOUgyJJpnEzd/KijaepVFKPwoVrMebw3O25OR1dJaB
 WTqX+PtJK11LbHm6fRI3lKX5qPlYT/Scqw4FOpXsXvgM3kdjbJqZEjyrd6pxrch9yF0y+z07m5L
 l7+lEHz9Px9ITBtSS0iE0KwhFbQd/p9VvwhRB4ghQ7gI9QkDXeWe5lJuGU6izc8QI0TSZFHRoB5
 0jga2hZqRwPlbTpT/DolLkFDvDNlI01ip/J/5/10RLk6+gdHC7gX2IHPZrqStD5pVszZtw5vC4x
 KdvxM/OYlnTNsMUVwzw==
X-Authority-Analysis: v=2.4 cv=K+AS2SWI c=1 sm=1 tr=0 ts=69f8d251 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Fn7aRh_OGbpVAvsfffcA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Te4m3d-hAyG8fn8h_Xrt6sKRzhwYnbtn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_05,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605040156

Add init sequence and phy configuration for Shikra.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index eb93015be841..ab7437e7b751 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -381,6 +381,19 @@ static const struct qusb2_phy_cfg sdm660_phy_cfg = {
 	.autoresume_en	 = BIT(3),
 };
 
+static const struct qusb2_phy_cfg shikra_phy_cfg = {
+	.tbl            = qcs615_init_tbl,
+	.tbl_num        = ARRAY_SIZE(qcs615_init_tbl),
+	.regs           = ipq6018_regs_layout,
+
+	.has_pll_test	= true,
+	.se_clk_scheme_default = true,
+	.disable_ctrl   = CLAMP_N_EN | FREEZIO_N | POWER_DOWN,
+	.mask_core_ready = PLL_LOCKED,
+	.autoresume_en   = BIT(3),
+	.update_tune1_with_efuse = false,
+};
+
 static const struct qusb2_phy_cfg sm6115_phy_cfg = {
 	.tbl		= sm6115_init_tbl,
 	.tbl_num	= ARRAY_SIZE(sm6115_init_tbl),
@@ -958,6 +971,9 @@ static const struct of_device_id qusb2_phy_of_match_table[] = {
 	}, {
 		.compatible	= "qcom,sdm660-qusb2-phy",
 		.data		= &sdm660_phy_cfg,
+	}, {
+		.compatible	= "qcom,shikra-qusb2-phy",
+		.data		= &shikra_phy_cfg,
 	}, {
 		.compatible	= "qcom,sm4250-qusb2-phy",
 		.data		= &sm6115_phy_cfg,
-- 
2.34.1

