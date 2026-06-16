Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AB578F2B
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568305; cv=none; b=O5KlisdXnOx6e2/iehE5RpashmNrbQaQIA0pMzap6EDoFT502wP2zWawbL01PtJW4zWZntVErdHclJhl63G6zYosZalI80M9N3oSUA4vQWhIZ8LE4BZfxcnUC4Y9MeR/4x62xsYp9oUMG8F7/udrkbi3G11PupLQGVY3vy197DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568305; c=relaxed/simple;
	bh=+Z5rBkgfi7IwcRuoWGZOUS606iHRju+ESdKBNL5RkTY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jPxoESjwofwMQi3+vzP7ZH54s3Q1Kc4pVv9uyq916WJEumfggjbTRi9foTbNwbIqYLnKbH/BFvZ4phBjISo06jwWmoW+dY59yLgVNvu6uggE+bRuH36R4ngFbLZYCL9NZFvAMwVkWox705AvgwAMFhISC/7Ye06597Bo5T9cGR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PvbfC8V4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YWEYHvuR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PvbfC8V4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YWEYHvuR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIxE5X884118
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:05:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7dNNWLjoL73Wgtu4gxCh26z70OXEkNFEiHQmOGKik4I=; b=PvbfC8V41HYOmj2b
	8dzeZmvMSxLgBHpkLIhKUwh8ud/KHQ5rPIVZAdSJpIjpBc6GTHJI+UTsM0V2b6gP
	uwd2wN3S7UnkUa8zETGE902okz0xeeUB6weSDKt7tb8CenMCDx/OGsttGKesMbSl
	HzgHV66g2f2I1jb9AQc+GpYbhTfWYeWjdCBjxJlSK8aPdPInVGDf9WVjfMRkMErz
	X3t4n+PfDNJWemdJoKADR9+m1U+PopSKX3EHPr2pCXe/i4R9Q6rvbFsyqToEWCxF
	EXYX78Bzc9K7ns2ufVw9t3psl/Zn9NkMH00b1BzghHo65EfD+2Wefx6S4iwnuz7Z
	KF8oyA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etfa73m41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:05:02 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-915ba226a9bso984770885a.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568301; x=1782173101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dNNWLjoL73Wgtu4gxCh26z70OXEkNFEiHQmOGKik4I=;
        b=YWEYHvuR1JAZjTKLS8+ZF4UOFPklejf85m9ZYmH2yENT/RSmu33ysxaCE/vBSyGQcW
         cC4EqLA+re/sO1QroRtGZxMjhHqaDScAgol5ZH+JjkvJGnxNDdKmh7duM6VTzDm6oHad
         PH7tSDN5bHufIvx3tqrLfsBOGoy5dQYZnQzpEcGsYmEyMqFwJeJC6pkNL9MCxmNcuK38
         pHR9UsoFOZwQZM/vidUfRHUJKHiwWXY2y1NJXrz1Wr+IIiit6C1dBeYfVTnpmxt+E3g1
         2opgmr5pdJ5xLs8ReGp0a1hvJeW4TSqHBlFzavCZOrKmYMceSCW8bCNcy4D74XIAgik0
         /OdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568301; x=1782173101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7dNNWLjoL73Wgtu4gxCh26z70OXEkNFEiHQmOGKik4I=;
        b=SCqmKZyp62IH6kINk3ixCjgW46Y2n1z/vTgO3uxWkaSSE1WFDWXn8Rf1k5K/kSgAnz
         BEOIlWdc2PuJEVxNidKunLoVPj2lu7GmHL/IiH5aTMjnJ5JpcC6KCGAJ1vQBWiJm/SN+
         yhvd8XsqJHI/GN8XLk5SPFI5JdTG6e+0ua8+nG+jfAKjJtq40AVVgx+MygEHiapapFpM
         WKmI+aYUmBgw2D8ZwI/9O3Qv/woWFSQwZUNovuhpQyjZBy4WIB6ub+eW+3HfoO5JHXeM
         MR6dl+YSJ5m5Kt7KC1BJVVOA3kWlu3v1rUjhx4D6FerzdETUCMSFb+j8X+8escm6VzT5
         QGmQ==
X-Forwarded-Encrypted: i=1; AFNElJ/tgYC9sw8cxWva3yEF/roylClsEappGCvDejJpMdoTqHbFaduP5HPWx7x7J2EKBVAeSFoKMDsZjaqw@vger.kernel.org
X-Gm-Message-State: AOJu0Yzvu+mDMLsww0wM8Rwjvx0XeyqiIzzdUv7cZVDds7iveiUDHYET
	V2iZ5Pxfr54MTt8LLtL9zlCcI25vuKVgRQYfOLO/KOlk2EMp2H6zRjmBh1b/1FkyKU168z0DiNO
	jIkGFSE+XpKyju8xPbBKor55RlQ2eLqnfSQTw1Gi0YKS88h+Ln+Cwutfko7nr/Jtd
X-Gm-Gg: Acq92OF4BVw34MMyHt7Nluv+vriFdmNwrLSvYNz5O3XK9ZK7GdHxaFoVGd66Q+qPKH8
	LRo6TpIkfxSVL0OYU/a3j3P7MmFrhoMOjP1OhFZXRgrlFG4s8JEmhIWMdvS2TVLD94VPpquFwTg
	dLkHs28iLKjDXcT6F+39L+ZyehdekKJwb2jyDB2ae2sjnOTrVkBoTroINAWRSdbC3AGHUVpzVRT
	z4LWrypdDH6YDmZJMYPNbPOEnvXqEvcwEb/zyTPdpBLfEH7BrdZVUFHwvVJcWyZ8aE3tC5dn+2Y
	fSesECG8elMzz4qPk2BppEI1fxGaIMv0KlFbmRM7l8moiAfdzxbzSGhR99Xc3cNHwHBehsW7DAt
	bMwGqcasf+A1xGWnOgBfoNbXvcek6+a7K2fWRWah5R9/TrnfglMH/PKghbis/U/AEgQmknS5TW6
	ke7WBA5tNuHMM7PkOsPg/hyA+Aj5AgKLeNw9E=
X-Received: by 2002:a05:620a:2984:b0:915:8055:3f91 with SMTP id af79cd13be357-917f1f4bd4dmr1972933685a.43.1781568301536;
        Mon, 15 Jun 2026 17:05:01 -0700 (PDT)
X-Received: by 2002:a05:620a:2984:b0:915:8055:3f91 with SMTP id af79cd13be357-917f1f4bd4dmr1972927385a.43.1781568300966;
        Mon, 15 Jun 2026 17:05:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm3015731e87.50.2026.06.15.17.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:04:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:04:33 +0300
Subject: [PATCH v5 06/16] media: iris: Add platform data field for watchdog
 interrupt mask
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-iris-ar50lt-v5-6-583b42770b6a@oss.qualcomm.com>
References: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
In-Reply-To: <20260616-iris-ar50lt-v5-0-583b42770b6a@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6946;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=AJFs3OudyuZVurF6CXPv4L/hKHLI2q1ug8aHEJrRBk4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqMJMOtFFKn3Gk8q3r1GPmozoFOIWr7mSKtbmNS
 Jlxjkpt71CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCajCTDgAKCRCLPIo+Aiko
 1RMYB/4ifAOK6LvptRsRn0YV0KuNuvYytHJ/Oq3Jh2aBS/RVs2Cb0DWqnmnWytzvYTakL7UvICQ
 a69ho8YoudM0PI6X2muzHU9J1Gq9L+3J5QVXNbZ4BoUbJ3Y47h459v81um5MDQB6H+6o6jw7Zw9
 v08a1h/GFzmxOPkGg0sHXCh+RJ6yRFuDdSIm8LY9n/hZXX23C02nAKMZ3bM1l75g/2SLqLMN9G1
 yqnU5h3SpwR05XpGHgQqxavFiS/ZVJerf9Tm55DznaQgj4Ey/Q2fZNshMWzZiTsPYqw/FjMhzXj
 aF3C8equN+008+VD3b0IJ+TyP14w1IPLCHx6ZvrGJyyNyr2h
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: y_DRpZGoGzvlwOPS9rtnr21DIOCbxi98
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX84kcUqzQ1Vu2
 BsKgs7+gaFj2xeUKBddFtcfdxMfz6cGF/AryXZqBgE10iogEj9P6GDVCwuZtwJej3relGjxd7pF
 MGrH/7uM0k1bg/RK1MC3CWmSUEk5/vE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX9q3Ovr1asOV4
 ZODgGnPso75TsjcrcyqvpJP1gRxMzRKoN+NMR3uWNLlCvCZ+d8fe4DbGAPtCYD0IYm8+jlgp9R+
 LqYGiibX2HrdqTBhcZCax5JFVnfAfyK1FV45F9x7cqYCA2dugxt+4gHCwUUA0EpRzYdZPKM0ZNb
 +8qoBEK20nNjo8AAo+s3SW3EQlWDYbRWyL8wGk/lFwM240u+o4B2Uw1ICaQA7hnCLxgVIEosvLW
 MwN+RKMu/j0VqZ5T3+PWpyoErlPTEbFa2WsgWs+WwO+WFCJEyxm+d3410WQ/ZpQRCwo1qnfq8Zt
 EzBsiqwlgfnEuxPbz4GK/VI3oXK+cCQE7pRisvEZMvS9gdEwrYwUFhqcKFceubDkAosVamb0X7Y
 A63VouGlKy21eOe0N4mo9++JFKSVXnFnoR/1SGlW7Lk5E/raXeuVSGcr5B9A4anlL0zd+X7W+tc
 XmW3lOeMfJfx+swjImg==
X-Proofpoint-GUID: y_DRpZGoGzvlwOPS9rtnr21DIOCbxi98
X-Authority-Analysis: v=2.4 cv=AN2yTM5Z c=1 sm=1 tr=0 ts=6a30932e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=6vpm4igQ2ooD_hm6sYAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150254

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

For AR50LT core, the value of WRAPPER_INTR_STATUS_A2HWD_BMASK differs
from the currently supported VPUs. In preparation for adding AR50LT
support in subsequent patches, introduce a platform data field,
wd_intr_mask, to capture the watchdog interrupt bitmask per platform.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h      | 1 +
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c        | 4 ++++
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c       | 7 +++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c           | 8 +++++---
 drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 -
 5 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 55a4fa356985..81fcb2854772 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -315,6 +315,7 @@ struct iris_platform_data {
 	u32 tz_cp_config_data_size;
 	u32 num_vpp_pipe;
 	bool no_aon;
+	u32 wd_intr_mask;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 961dce2e6aa9..eeef453c583f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -16,6 +16,8 @@
 #include "iris_platform_sc7280.h"
 #include "iris_platform_sm8250.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
 	.firmware_data = &iris_hfi_gen1_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -94,6 +96,7 @@ const struct iris_platform_data sc7280_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 1,
 	.no_aon = true,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
@@ -124,6 +127,7 @@ const struct iris_platform_data sm8250_data = {
 	.tz_cp_config_data = tz_cp_config_vpu2,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 74626b35d9cb..6cde94d86408 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -18,6 +18,8 @@
 #include "iris_platform_sm8750.h"
 #include "iris_platform_x1p42100.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 static const struct iris_firmware_desc iris_vpu30_p4_s6_gen2_desc = {
 	.firmware_data = &iris_hfi_gen2_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -113,6 +115,7 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
@@ -142,6 +145,7 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -179,6 +183,7 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -208,6 +213,7 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -243,6 +249,7 @@ const struct iris_platform_data x1p42100_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 1,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 375bcd923476..41498f94480e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -109,11 +109,11 @@ void iris_vpu_raise_interrupt(struct iris_core *core)
 
 void iris_vpu_clear_interrupt(struct iris_core *core)
 {
+	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
 	u32 intr_status, mask;
 
 	intr_status = readl(core->reg_base + WRAPPER_INTR_STATUS);
-	mask = (WRAPPER_INTR_STATUS_A2H_BMSK |
-		WRAPPER_INTR_STATUS_A2HWD_BMSK |
+	mask = (WRAPPER_INTR_STATUS_A2H_BMSK | wd_intr_mask |
 		CTRL_INIT_IDLE_MSG_BMSK);
 
 	if (intr_status & mask)
@@ -124,7 +124,9 @@ void iris_vpu_clear_interrupt(struct iris_core *core)
 
 int iris_vpu_watchdog(struct iris_core *core, u32 intr_status)
 {
-	if (intr_status & WRAPPER_INTR_STATUS_A2HWD_BMSK) {
+	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
+
+	if (intr_status & wd_intr_mask) {
 		dev_err(core->dev, "received watchdog interrupt\n");
 		return -ETIME;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index 72168b9ffa73..4fffa094c52f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -41,7 +41,6 @@
 #define MSK_CORE_POWER_ON			BIT(1)
 
 #define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
-#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
 #define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
 
 #define WRAPPER_INTR_MASK			(WRAPPER_BASE_OFFS + 0x10)

-- 
2.47.3

