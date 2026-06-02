Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2691630C368
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 00:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780360356; cv=none; b=qvZVlgr4Kt5CcxC8FVNbsIw/K5CUIP25vRjCKZiUBomOpqGiq68Ycuy1YmpjOvgi2Xdn+gZmy3Vna+7AjXq6hdKuQjyA0BtKMn4o/DFzQK/UxQ9DnycVdY/1sejqMrpDHA8bXQzgUfJZKLDTCfeuzdMXcKweQ8xAapmvMjoXFDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780360356; c=relaxed/simple;
	bh=WMJmbvG3UPc1IPdNbAwP4ZE5xHmhpJuEECJsEbdDars=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=stCxNqzLgcbdNOqZvcuEC5SPcnirzMY+OKkb1NsuDeDgTpaoSPA3F9s+VliNgHOe9i5wticJmV7OCA8P0745vvIGwuTf1yfyOph6fTEb246S5awK//1bnyjXoRb4j28UbFlsQmRVxeMiFZ9cHYXt/Ii3Y7Mq8zz5SfmqZT4looY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jd3o1ZXo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YUuazW6J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jd3o1ZXo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YUuazW6J"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6520JtJD1258666
	for <devicetree@vger.kernel.org>; Tue, 2 Jun 2026 00:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xMgkxod0RTJbF2zXR11uV9q7aNgYn1Lh3BSSkMCGu64=; b=jd3o1ZXo761n2Iq5
	zpNKe2A/CYBTKN5QABvTzv5RYPyX3MbeGTavWLW6Edzy+wN3aRrqdzLcDuVC4YY/
	w/51kWr2i9cx1Z0liPyqHA+zg8bol2f0A9K5g+Hl5DzaFIZyvSwO3Tb+qOeA87aP
	t09Ss4gB5mXN1xsqy33DCgJry2T5gR3uOLk8pS//MvmFD0OBCA18zM7IRY47XZ3A
	42RjoGuElOyoMJ9dTfZpkBiUZaq0j53I+z5ZHR9NrCvfXoFep1IMJi3ipPRxgxjS
	/wGwVP6jxfz0ssG2ZifeH+Ba1RxjWu9U81AlMsAk+nQi8EzP8b/7MTNO5RxgTIOj
	vYmqXA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6ssupmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 02 Jun 2026 00:32:29 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-305fe3b697cso1585420eec.1
        for <devicetree@vger.kernel.org>; Mon, 01 Jun 2026 17:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780360349; x=1780965149; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xMgkxod0RTJbF2zXR11uV9q7aNgYn1Lh3BSSkMCGu64=;
        b=YUuazW6JbNXvS5YfezKA1q/TWyO1tcVTfLpaZ/lNFbaSZYtHVkUVJJ47LjUtZb7n3r
         zKlFW00VkEG2ME9lo4kIBsXPUSPXOA9g6p4wHsjO+hMk9ZTVD3NjLXxuaUnMGRGLpW8S
         3QCVVZTCKqWNgjnHE6goT5hkc+AUduGNQe2O0k46ak95fdC+nr8kmBHHlpAk24XC3yL/
         nRm3J42gBMqZqZl3bl7/aNYkOYrGxUrLHAhCvzNcoXGMKsGNkxiS6e+geuTDl1d/x7ve
         uG8j+r+vwJVfYeOQCtuuJhsBnBkU+EFZmrFzRske3hzDVxn24qFgavzaasSLFwdqiWVA
         735g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780360349; x=1780965149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xMgkxod0RTJbF2zXR11uV9q7aNgYn1Lh3BSSkMCGu64=;
        b=A/3+0IAVJQ+rsBR+TpwmSzWjly8tYbTri/7KugER8rMb/3N+qDtw83gRgNxggPHC7D
         dPXriWWVS2abJUSXFvSB9WLDIr1F/H4VweDBk74J7Gr2QMdulkCTIeSV5grpS5FQPIlc
         lCAK+5izM8Yuf/O368Z0axlSRlNf4aDyzfq+inR/m1tHmXO3JVM5UTRMpASIdiPJFOJo
         AYU3Mwv6bXyhN64QgipNy2ZvbL3E3EXLvwzzHu9y87YrHAmoSXMG6vlau1yiMyIFCph8
         ajLl9a5YIklshFFl2ljQ4ast6GGlMnTqEa+YvlQdg4a1yvZeNWwn2rhT78kc2RPkclsK
         4oXQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ux5Sq3V+hRg+zGijQk/RRPUMo4ZxpzZvjBUfKA6Iy+DQmf+rIBSk6DNUX4fxUvDv5msYXWt585bEJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxlWuJQJDMeXdtJPvrAYqlAHrMvW6cuO5fzU1NgIu0OeNw6gzsA
	7U/yGvkntz2dH4FYF2otnUbYaJUuqxaerttxkwxa/iXITIbIE6IGtdf4UILsuCLdKDPKq94KW7i
	GErG8X6jicNfL2y9DW2ath0zoHHqeTS+kbjswQoTvomNPzzWaWD+4tXXG6iMT8YWJ
X-Gm-Gg: Acq92OHKBaySsD9Y2FpbvzFpMGyEEq/KzmHSrQq86RUcdrfyruX6z4Bhj9T9ty9x8OR
	VnNrjhVgOw8DWTuyhANWB0iJIeueJBh5AaLnOgrspnINK029XTpevonSFkSvM5aJQxH0GmybqLF
	tU4X9KWPRk5vlHX7af2YykvpGt9lKqbzMuSzFpiovSVXfHjuYV/bgSVWABZSD9UIbmgoRa6+fox
	kN02ydovO+N9/qXUfngIoOlGhUNdJ2yUdEUGUBnahE1wQ9aEbk8gWMo3JXCZbBgVRqAWbJW7vo4
	xOunflJpVsKO5cP8Yk87jbN5eIz3oidhVFjSL4uXDkQFZ1ujrMzTQe28eX8hCokCN5mK8HLLisc
	PMM3SW9KdrMMrKD7+zS8fQZv+SzezGsqmRM/SHyBk0NhUibxVOgF4WPYdEuVFB4KS1uernSUWcM
	HI7AhbDs/w+wg=
X-Received: by 2002:a05:7300:e683:b0:304:de26:3cb6 with SMTP id 5a478bee46e88-304fa61b98cmr5773434eec.23.1780360349186;
        Mon, 01 Jun 2026 17:32:29 -0700 (PDT)
X-Received: by 2002:a05:7300:e683:b0:304:de26:3cb6 with SMTP id 5a478bee46e88-304fa61b98cmr5773416eec.23.1780360348513;
        Mon, 01 Jun 2026 17:32:28 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed563d09sm10070412eec.15.2026.06.01.17.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 17:32:28 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 17:32:22 -0700
Subject: [PATCH v5 3/5] media: qcom: camss: csiphy: Add support for v2.3.0
 two-phase CSIPHY
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-add-support-for-camss-on-sm8750-v5-3-dac36a190de8@oss.qualcomm.com>
References: <20260601-add-support-for-camss-on-sm8750-v5-0-dac36a190de8@oss.qualcomm.com>
In-Reply-To: <20260601-add-support-for-camss-on-sm8750-v5-0-dac36a190de8@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: l4NHBoqjdOIym0A22wjNyp1hFBvv_q4W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDAwMyBTYWx0ZWRfX3n6uo+hsWRQj
 R1KOXTAsHTGSWNLyLMvEyPiKCb6G3sz94MlLk8ClGCthkc1SJj49jPC20a6445MUFjdq2tExhJK
 MsPThqMBXYYDCR6OHDIFLQbImOcMIEjybNrNwJpsQbnoEDeSL4/bKc8r6h85PqjaUhe21O908J0
 9lQMGqY+uCQVqW9t9L70mh9PftufcllEKJLayx4saPNmBzfuemsn4V1IAlkCKRzjfddweOjv6/b
 ovU+aRqStaS44iQ/6MKzW18qHsR53qPhPnQhUOtNTTHr8FZolFEXFQiXDRm2cSNKNBI4xHSuUk9
 pnC0Y9tkAJvJhoLJN/LH+Vfh6pcgzCwQaAo7mLUgKnOIyNNgL8M8d8e9/06ccmw2tg1Iup42e9h
 E4kwICQCmsaumHY5OtFfFLTjaXcU3HiiCI3gIHHaimD6SjTUV8TjCPZPow7SMzdZyBBVXHae0XC
 E/nHzmf0Yh0s9pxs/FA==
X-Authority-Analysis: v=2.4 cv=O5wJeh9W c=1 sm=1 tr=0 ts=6a1e249d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UiSUrLz6K6kVaq6zp58A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: l4NHBoqjdOIym0A22wjNyp1hFBvv_q4W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020003

Add more detailed resource information for CSIPHY devices in the camss
driver along with the support for v2.3.0 in the 2 phase CSIPHY driver
that is responsible for the PHY lane register configuration, module
reset and interrupt handling.

Additionally, generalize the struct name for the lane configuration that
had been added for Kaanapali and use it for SM8750 as well as they share
the settings.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |   5 +-
 drivers/media/platform/qcom/camss/camss.c          | 125 +++++++++++++++++++++
 2 files changed, 129 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index a219fbf0ce3d..bb0290a4bb2d 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -804,7 +804,7 @@ csiphy_lane_regs lane_regs_sm8650[] = {
 	{0x0c10, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
-/* 3nm 2PH v 2.4.0 2p5Gbps 4 lane DPHY mode */
+/* 3nm 2PH v 2.3.0/2.4.0 2p5Gbps 4 lane DPHY mode */
 static const struct
 csiphy_lane_regs lane_regs_2_4_0[] = {
 	/* LN 0 */
@@ -1256,6 +1256,7 @@ static bool csiphy_is_gen2(u32 version)
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8650:
+	case CAMSS_8750:
 	case CAMSS_8775P:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
@@ -1377,7 +1378,9 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_regs = &lane_regs_sa8775p[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
 		break;
+	case CAMSS_8750:
 	case CAMSS_KAANAPALI:
+		/* CSPHY v2.4.0 is backward compatible with v2.3.0 settings */
 		regs->lane_regs = &lane_regs_2_4_0[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_2_4_0);
 		regs->offset = 0x1000;
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 834f6c1a2519..d68d5debe6d6 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4533,6 +4533,129 @@ static const struct resources_icc icc_res_sa8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources csiphy_res_8750[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy0-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy0-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy0", "csiphy0_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy1-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy1-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy1", "csiphy1_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.id = 1,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy2-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy2-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy2", "csiphy2_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.id = 2,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY3 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy3-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy3-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy3", "csiphy3_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy3" },
+		.interrupt = { "csiphy3" },
+		.csiphy = {
+			.id = 3,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY4 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy4-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy4-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy4", "csiphy4_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy4" },
+		.interrupt = { "csiphy4" },
+		.csiphy = {
+			.id = 4,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY5 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy5-0p9", .init_load_uA = 148000 },
+			{ .supply = "vdd-csiphy5-1p2", .init_load_uA = 14660 }
+		},
+		.clock = { "csiphy5", "csiphy5_timer",
+			   "cpas_ahb", "cpas_fast_ahb" },
+		.clock_rate = { { 400000000, 480000000 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "csiphy5" },
+		.interrupt = { "csiphy5" },
+		.csiphy = {
+			.id = 5,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+};
+
 static const struct resources_icc icc_res_sm8750[] = {
 	{
 		.name = "ahb",
@@ -6099,7 +6222,9 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources sm8750_resources = {
 	.version = CAMSS_8750,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_8750,
 	.icc_res = icc_res_sm8750,
+	.csiphy_num = ARRAY_SIZE(csiphy_res_8750),
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
 };
 

-- 
2.34.1

