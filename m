Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4751A495021
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 09:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363846; cv=none; b=kkZXd1y0v1cvg3gcjLofhmX0uBazVd9Ki6ukqFbQ3TlaqBsNXT0jXGawsxSc196TL1seh49RnHPr4cjttiig0zoQYgDOjaZRR6YVi6tTZnaCZpm+2DbY9VSMuz0/8Zf9DTvxG/vchAj93vNt24RM8dsJ/v5bnV0rS2z9cmopFns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363846; c=relaxed/simple;
	bh=6hQfTpXcWJCXMi9PLy+5xVUK/Z6Ol/PrhtBHuKTtcKc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=itI8sAAx2I0G6Y1f/oK7GzORTSRZ/724BrRfYMxKYZtq+n+6sY/uz54/NMdMXaXuJUVFkjIHn1svwiTxEQx5wJxikmmfTD6QA5ctd5Ohsy8lJpmg345bzuYOvXvnzfnTfZ2cBZxJR2ywjqmYDwARhSICZJB/mr635s3HarGwPVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hhkB/ECM reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hhkB/ECM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jR6V3298190
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 09:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YS4pH/oE/I5
	Tfkm4NadULCHmtqcTm2/Hf/Nrx/my0a0=; b=hhkB/ECMM36N45R/tmGA29qRd/1
	1iC96QF2tuHR9middIprrREFjhVDK8fzK2a5f4YSbQ1PJZQkobCG73p4W/MN6wEi
	vjh7q7U9kI9OykbgLF45g5WAC93Z5Trt912B2WQkuAkNbik+L7UdTqy+FEgr+tWx
	kAqAO2NBFST9+BIdulRXpuOGmelovBF1WsaLB4NtfLqgTHEX90YdyRAfhaqLjcsS
	Xr+4h+l8CVuUi4gBc8v1cwE8njHbu256FgcG+eip6Pkoahr7zYn2W8O5pV7Q/6kZ
	vdRV+tlIIm5ImJDCna9LTIuBvZr/9f2qb1pwywzsxF96pNyfxRLEnlMNOJg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5hdcrc1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 09:03:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so740574685a.2
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 02:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363783; x=1791968583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YS4pH/oE/I5Tfkm4NadULCHmtqcTm2/Hf/Nrx/my0a0=;
        b=JiRC/A+ZS+gA/S3cqloHayv9J6JDzUltBmKGWCp9PDrzlklIDRG0kLKo6dNbGIPhml
         rN4rxajZy9cyP0IUXod5RPPIsF2sIxEz57MoTap18HWi9qLOVZBM1KbNWveilymNUSHd
         VbqY7YegKQ+o3mNZnNE5LRuc0QYg2G1OUXZJ4qTR50MqEh688TjyGs21GhY5HwXab8EI
         XmdUp2qh1YyRwdjNEVLGJwP9i0w1d5ORTRdj/mHV5h9L5EnCzFj/4U2YugjoCUAaZ1iZ
         YecvyRvZlV6rtCDzcMCkGPvFeeYJSlvScWzd25bP3kTpsAkfQwjcVYDWO0l5t/FS8/9o
         v0dA==
X-Forwarded-Encrypted: i=1; AKwUvBybJ8vjBQFmq7h9fd2caI/boqotfnijWtoJO+PTgsYBMDIbZr3qTczeZ9YoSf1l447lZnsC2opaN+CW@vger.kernel.org
X-Gm-Message-State: AFuF++m4sfepQFmqfUzytQTTNQKw5pYwCsaQLhBU7jDy7qLgTosJl83b
	1g00CDqLkhCGeAvAG718m9BHeYuKm8THdsdlrJegrnFFEDip3N1R2uDU+sG760PaLier1A9ws6h
	QsFAJLl4d1u6fA82QdJDklCUPEas9dgIAm8BWdbnEZPbddGLtz557G89Ql7qk6YEz
X-Gm-Gg: AYBFou1hzJkSVSXG1IEYg3YmhYjJTXZX32iZ+B8/IQDRJO+hvoL30TMLxAm6CV2vzks
	+MT5Wrse9fOXJiHkc1hYAr+vbxcQZlVFf6nVW95ZCnFWa0tFdNiXWoiH/pjXxiJLrRbGGlw61a3
	ZE/T7eOBx4Bf4jTFpCrAn3ExWDA/6mSVcaVg+phkCGCCWGK0Ka+aAUxMBw6J4mpdJX8NQlBMNXY
	VhtPLv0UtfC5nA70+LXkVIAUzcpIuNXR9JhJ17aSkr4JCjVGgCX5Ap35PREslHj46bi2bus69hT
	yDkAEvKz5mB1EwXzBQoAH17H/i1titre5PpaZ1CW2iQOm8ZbuaFOTDi0hvU=
X-Received: by 2002:a05:620a:470b:b0:93b:d7a0:d9dc with SMTP id af79cd13be357-93e9b80174amr315315985a.54.1791363783112;
        Wed, 07 Oct 2026 02:03:03 -0700 (PDT)
X-Received: by 2002:a05:620a:470b:b0:93b:d7a0:d9dc with SMTP id af79cd13be357-93e9b80174amr315310785a.54.1791363782645;
        Wed, 07 Oct 2026 02:03:02 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:03:01 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH RESEND 40/45] media: qcom: camss: sa8775p: add AWB BG parameters
Date: Wed,  7 Oct 2026 12:00:36 +0300
Message-Id: <20261007090041.3732717-41-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YfYe0gIJnpu6QwMIGWshSR2zD_iJwXbE
X-Authority-Analysis: v=2.4 cv=aKFlOr9m c=1 sm=1 tr=0 ts=6ac60ac7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=aZ-3kUUx37z8FZvU82kA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX+WEnKTMjsszN
 a2rudDQ46IgCExUiYoW3GL89usDcizTL2rlDnVQgJJnb8kb+9Ey7UZGVDTJ87wDf+9RB5areuri
 Bqvut9TC2dPPzjAA6sFqBfTJyams1SQ=
X-Proofpoint-ORIG-GUID: YfYe0gIJnpu6QwMIGWshSR2zD_iJwXbE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX/MgcvId3zrvy
 VpPz5C61nZehCjCDEceg9RH8AvkTtyJ6f1cXMIZ+WDEzwXKA0OugJ5X5kLOLJSWPJaS5JH/Eqns
 NktxBpR7wXzHfJvwsRY5Y9/SIl68rjFg3wqeVjhKiSGTxwACjjQQ+9DalE+Fr901pZR+OJfOGzY
 OIGH2pcy0vn844TgPRMbctgH8r3H/pi4X8k1uN+LNYlSUEGLAuiMOKnAdOtnzPzycJ8Si4M7tlZ
 WIYddWA1SszZXozQM6gS4If0iuY9aBw9ddLmTLLqsR5GDUXvkKQZywyNkxs0keiYJx24SKHsAAn
 t3qyLhwY7mLvp3CrIswVyXnDdjtg3M+P5ds/Ju1zC8jM/0yktcnuTv4q1p0rF4friBamsvpgFvw
 MwPu1H8UVVrPvZnOnXnukGuFCG1gT5PZEiEMakxXqKCIr61ORbVk/LOKx9Kb8PtokO8AnFcZP41
 akuigaC4iLh4Jp9+SEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Configure and control the AWB BG statistics block from IFE parameter
buffers. Derive its grid from the active pixel-path size.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-ife-mod-v41x.c      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
index 3c53f585133c..b35a3f375026 100644
--- a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
+++ b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
@@ -678,6 +678,17 @@ static void mod_v41x_params_apply_gamma(void *priv, const union camss_ife_params
 	mod_v41x_glut_apply(ctx, &block->gamma_256, enable);
 }
 
+static void mod_v41x_params_apply_bg_stats(void *priv, const union camss_ife_params_block *block)
+{
+	struct ife_pp_ctx *ctx = priv;
+	bool enable = block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+
+	if (enable)
+		mod_v41x_awb_bg_enable(ctx);
+	else
+		mod_v41x_awb_bg_disable(ctx);
+}
+
 static const struct v4l2_isp_params_block_type_info mod_v41x_params_type_info[] = {
 	[CAMSS_IFE_PARAMS_COLOR_CORRECT] = {
 		.size = sizeof(struct camss_ife_params_color_correct),
@@ -691,6 +702,9 @@ static const struct v4l2_isp_params_block_type_info mod_v41x_params_type_info[]
 	[CAMSS_IFE_PARAMS_WB_GAIN] = {
 		.size = sizeof(struct camss_ife_params_wb_gain),
 	},
+	[CAMSS_IFE_PARAMS_BG_STATS] = {
+		.size = sizeof(struct camss_ife_params_bg_stats),
+	},
 };
 
 static const camss_ife_params_handler_fn mod_v41x_params_handlers[] = {
@@ -698,6 +712,7 @@ static const camss_ife_params_handler_fn mod_v41x_params_handlers[] = {
 	[CAMSS_IFE_PARAMS_LSC] = mod_v41x_params_apply_lsc,
 	[CAMSS_IFE_PARAMS_GAMMA_256] = mod_v41x_params_apply_gamma,
 	[CAMSS_IFE_PARAMS_WB_GAIN] = mod_v41x_params_apply_wb,
+	[CAMSS_IFE_PARAMS_BG_STATS] = mod_v41x_params_apply_bg_stats,
 };
 
 static_assert(ARRAY_SIZE(mod_v41x_params_handlers) ==
-- 
2.34.1

