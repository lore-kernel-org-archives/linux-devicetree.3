Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2EC3E869A
	for <devicetree@vger.kernel.org>; Wed,  1 Apr 2026 10:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775039108; cv=none; b=CtVVFbV1yyZSf0gGAgkYmj/OUpNscZpHYWkECAV6p7tzlNwuy5tqgka4jNUP/aKa4lsMnM1rLPacuAKLKyvHIpm1m6Flycq1bKuzD+fRw3/HPZJhKnXea8fSxYFkhMCgz9UdWyyK/nS8lqZ9s1If0Bbbk+cA7erQcKx1BbH7I0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775039108; c=relaxed/simple;
	bh=3E5JRSXQmw0P9c8qjzE7adbTq/jY2GS7bNarfyNVhIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pE7A+ByuAdd0vf0i0cj8rqe88bqaaOReAL3G1R539dw9cikUsJ1vkIAhZBc++/scEhuoof+P6Ycu7R6NY5XJEHmyQjXUMk0sGiDphvtaqELA/6ecrE0movWB06HuJSsGjrqCOjoacd5v+Uivy1d6U67DOFid7J0kqHfbbWd0b+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hClBUgLg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PcEk0Qba; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hClBUgLg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PcEk0Qba"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631A2IV11562707
	for <devicetree@vger.kernel.org>; Wed, 1 Apr 2026 10:25:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qhidriV3hP32GGoYcyHcUN1/C7A1/r4FpZPvF+PAnww=; b=hClBUgLgY4wcw97D
	0G6VLoQzQp98/wqYGlikunGTLPUNAfuEGIAyInWPaDI9T2JRc8lgs0Vd3+VH/NGP
	y59psqVcXlK8vDLHnap+37PcGWN0X1JiiDyxHVWU0zHbK+MH9Kfj93VGOYLvYZTQ
	LAuMDO1SStLzpfJ0zkwTfih3957WzUVzfQwdARvR+A/zdQbASH50WQXEAHjOyft1
	N+35h6009oWH9vAy3iEvTbcg0pMeWDQ9T9FRwUzpN/GKH1A2Tv13D6uZAeHVwZk2
	BntwU4lSXw3Migv4aWYT/BHsFTiHlIXqEHsQbF4wOKYakL+mfOdZ2NX3eVqL342s
	q+UV6g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8va3sbyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 10:25:03 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35842aa350fso19258946a91.0
        for <devicetree@vger.kernel.org>; Wed, 01 Apr 2026 03:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775039103; x=1775643903; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhidriV3hP32GGoYcyHcUN1/C7A1/r4FpZPvF+PAnww=;
        b=PcEk0QbaPQSx/XLhZflYoIbgkvyFLmaQ4qt2z6clF6EAIdtyeHH6TfbgRUcoX5BsYR
         g69AoPKnbpQnsDbRbA0quAZ/Mao9yajHx6FFSvGVCXY4+Xbqt89ZrIHuTQ+W15Vb/WyK
         RM98MqOWcPrqSQZloF7A/JbmVAq88+RdD02lYXS5g9xzhsErxSF/aRXTFLbnlQZ4Cfe5
         6T+lvY5vxkjm93AZv2ODqmAdZTgLGfaTu9q32kTrh29bgjUAnuY3xpxE5aYP5CvGNGYH
         1HMymQfm01t1OM+XmsUA7ROTVEOET7fwcyBANQ2paqFoXeskx/9pXAvSC1aIAvXJGeIY
         lW9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775039103; x=1775643903;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qhidriV3hP32GGoYcyHcUN1/C7A1/r4FpZPvF+PAnww=;
        b=n7wua/0tjFsYZBumxwBfVAEFwZ5oXnMs7AgdaV3hMPUPKmK3dieb3rmvXLiAikPbjw
         PI0Z+F+8FV7kx9dMC21TRyei/1FNs52/E2PlEV7Neb4OIbaRdBrbyDoIsObYvBbGZxud
         ICiMeS/UkommtTFj4nnwyIuexgQjACh6obj70kKqLNQfwvzPZBBOAAiyMBCBewZ3oboN
         4yL9AfQXbdeLaiKTLVHrnkgP+DbY/ZHTx5ncWUlw+36uT2IlEghETjGzW7p2Rh77Q/UH
         azZXir8K0G5Hc+N8hVNNSr4UWPV6Q5nNT0NwOkwIUgnaCq65LrQsWZCVirzB4C+snIf3
         FnOw==
X-Forwarded-Encrypted: i=1; AJvYcCUpz1J8TPPoOuZRjTi91/hMxlewsJbDYasODWQidCPNf/k5a8y6xKcMMyGIXrNggvbuBAVCItf5jlv/@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn5au3osxcSQgbSX40zCCl4xueoyxYQC3Rn3Kw1hbCaIZ48NG7
	iIjMbhii9FgiAcH2ePH61OKsS4tZ5OzCymKgu+I7mD0Vadg160vcI0RcXXyx5qhvcfd155pKiU1
	O86o+SG/xFB+tBvgStuGhp9X07+5d2cwfU0WoRmmyTHt1/pblM96zdySofNSjNkz7
X-Gm-Gg: ATEYQzy5if61S+RDz30BE/s1TWHQc44mInS8dJuQHaf/T3JD0tkQ+TmybAsO62hjR19
	GxwbiAPhsf4G4XNxJIeBuPKjWBihh58NP0Ge74zdnxWRLfryde/eP9NleC1gvliXfiNQCJtEm9+
	QN+GNPsOPG94+HTdNx5JMcqOm1Lf9EeDpexXZKAYXjJOwWq5ovFbY7M1KSNnStCHlEdk7AJc9lc
	BkkR0Zz/agptHPa1sg2M3E1AG/8xVgBZNlDKMypfrBAfmfk+xY6AKzGJ5PMrGp1gFyQ3zWMfAE6
	8Y7UnJhaW30Khl+PE9irB852ni32KSydbBtbLHtE4NjSTJV1EAA0rQh8BvJxBKaFiY/YhjZRQKG
	CmSUEPvhMUORuN5hKM4aPfw5dFRbRP/t0lEN5MOBQD81mVElZzNbiqVzaSaRD2s++PF8RrkPvl7
	z1L+4eNTyF0/omnSe4p4Yf
X-Received: by 2002:a05:6a20:9144:b0:39b:e321:784f with SMTP id adf61e73a8af0-39ef76ae13bmr3332285637.40.1775039102552;
        Wed, 01 Apr 2026 03:25:02 -0700 (PDT)
X-Received: by 2002:a05:6a20:9144:b0:39b:e321:784f with SMTP id adf61e73a8af0-39ef76ae13bmr3332250637.40.1775039102067;
        Wed, 01 Apr 2026 03:25:02 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca843bd8bsm13348329b3a.10.2026.04.01.03.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 03:25:01 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 01 Apr 2026 18:24:40 +0800
Subject: [PATCH v4 3/5] media: iris: Add platform data for X1P42100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260401-enable_iris_on_purwa-v4-3-ca784552a3e9@oss.qualcomm.com>
References: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
In-Reply-To: <20260401-enable_iris_on_purwa-v4-0-ca784552a3e9@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775039081; l=7783;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=3E5JRSXQmw0P9c8qjzE7adbTq/jY2GS7bNarfyNVhIA=;
 b=Ry7rRYlJdB6L9dJwtGkwia5BIdmN0CPeGj2AS6So2peYwEzG32d2E79KEuS3SzUt5pjTSLlhx
 vaCF2kLpNgfDa6E0WNPxpnMpZmwv+OFRxH5MffB0xgX2hack8ptvVBa
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: dnmPaw01tjtg1hMT3ovJbvrAtieKftAH
X-Proofpoint-ORIG-GUID: dnmPaw01tjtg1hMT3ovJbvrAtieKftAH
X-Authority-Analysis: v=2.4 cv=B/C0EetM c=1 sm=1 tr=0 ts=69ccf27f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=jfxm0zpEqxNMAX7I8EwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5NCBTYWx0ZWRfX0lUhrcJLbthd
 13C7XEv0KjFlh61Rm/JpkjsCwt7QrUWWgXjMb1oy9haNeNqM5pDDYaWDYZcc4eOB/gwaf4vI2ie
 ebHcEKbXcM4KaAmKLpa8ZL7EsUIipu/eYbfeSCMr+f5nlnQG8gX+wDHksMwf9Azcs8ZvuwuXS7w
 f3jE8QtslTm/N0ScHePh2R0O24IxkNkArS48lsmIfvkSMHu3zJSE5nvC9AQgX+uF/OE3buvHK4H
 2LCJvvwXGn7NKZDCrenX3zmR5ZAc9XVBi/yaYFBmF5mmsWjC6vpUfh4g/5AnxTVFshwVNJKbsVc
 nT8qNWOf8JAWrWZ0jnr9HeYnKhHRtiQJsIj1TFQzSsjNUCajChgJgxYw0TyM0F6zjysk9M92zJx
 ih8qFSdMpZE72Px+AqYAfHpUmfOHaKEhIbjkmMIKr1z5QJwjHTOJ48XeZu84EUXsIoRp6RmLQMF
 yDgNEIp3uwpbUrAvCdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010094

Introduce platform data for X1P42100, derived from SM8550 but using a
different clock configuration and a dedicated OPP setup.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_gen2.c  | 97 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_x1p42100.h    | 22 +++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
 4 files changed, 124 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 5a489917580eb10022fdcb52f7321a915e8b239d..2e97360ddcd56a4b61fb296782b0c914b6154784 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -47,6 +47,7 @@ extern const struct iris_platform_data sm8250_data;
 extern const struct iris_platform_data sm8550_data;
 extern const struct iris_platform_data sm8650_data;
 extern const struct iris_platform_data sm8750_data;
+extern const struct iris_platform_data x1p42100_data;
 
 enum platform_clk_type {
 	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
index 5da90d47f9c6eab4a7e6b17841fdc0e599397bf7..aac72900c0292040500ec4dcde9bd6e7da225fd4 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
@@ -15,6 +15,7 @@
 #include "iris_platform_qcs8300.h"
 #include "iris_platform_sm8650.h"
 #include "iris_platform_sm8750.h"
+#include "iris_platform_x1p42100.h"
 
 #define VIDEO_ARCH_LX 1
 #define BITRATE_MAX				245000000
@@ -1317,3 +1318,99 @@ const struct iris_platform_data qcs8300_data = {
 	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
 	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
 };
+
+const struct iris_platform_data x1p42100_data = {
+	.get_instance = iris_hfi_gen2_get_instance,
+	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
+	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.vpu_ops = &iris_vpu3_purwa_ops,
+	.set_preset_registers = iris_set_sm8550_preset_registers,
+	.icc_tbl = sm8550_icc_table,
+	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
+	.clk_rst_tbl = sm8550_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
+	.bw_tbl_dec = sm8550_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
+	.pmdomain_tbl = sm8550_pmdomain_table,
+	.pmdomain_tbl_size = ARRAY_SIZE(sm8550_pmdomain_table),
+	.opp_pd_tbl = sm8550_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
+	.clk_tbl = x1p42100_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(x1p42100_clk_table),
+	.opp_clk_tbl = x1p42100_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.fwname = "qcom/vpu/vpu30_p4.mbn",
+	.pas_id = IRIS_PAS_ID,
+	.inst_iris_fmts = platform_fmts_sm8550_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
+	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
+	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
+	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
+	.tz_cp_config_data = tz_cp_config_sm8550,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_sm8550),
+	.core_arch = VIDEO_ARCH_LX,
+	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
+	.ubwc_config = &ubwc_config_sm8550,
+	.num_vpp_pipe = 1,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
+	.dec_input_config_params_default =
+		sm8550_vdec_input_config_params_default,
+	.dec_input_config_params_default_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
+	.dec_input_config_params_hevc =
+		sm8550_vdec_input_config_param_hevc,
+	.dec_input_config_params_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
+	.dec_input_config_params_vp9 =
+		sm8550_vdec_input_config_param_vp9,
+	.dec_input_config_params_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
+	.dec_input_config_params_av1 =
+		sm8550_vdec_input_config_param_av1,
+	.dec_input_config_params_av1_size =
+		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
+	.dec_output_config_params =
+		sm8550_vdec_output_config_params,
+	.dec_output_config_params_size =
+		ARRAY_SIZE(sm8550_vdec_output_config_params),
+
+	.enc_input_config_params =
+		sm8550_venc_input_config_params,
+	.enc_input_config_params_size =
+		ARRAY_SIZE(sm8550_venc_input_config_params),
+	.enc_output_config_params =
+		sm8550_venc_output_config_params,
+	.enc_output_config_params_size =
+		ARRAY_SIZE(sm8550_venc_output_config_params),
+
+	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
+	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
+	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
+	.dec_output_prop_avc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
+	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
+	.dec_output_prop_hevc_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
+	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
+	.dec_output_prop_vp9_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
+	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
+	.dec_output_prop_av1_size =
+		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
+
+	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
+	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
+	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
+	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
+
+	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
+	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
+	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
+	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h b/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h
new file mode 100644
index 0000000000000000000000000000000000000000..d89acfbc1233dad0692f6c13c3fc22b10e5bdd80
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_x1p42100.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __IRIS_PLATFORM_X1P42100_H__
+#define __IRIS_PLATFORM_X1P42100_H__
+
+static const struct platform_clk_data x1p42100_clk_table[] = {
+	{IRIS_AXI_CLK,		"iface"			},
+	{IRIS_CTRL_CLK,		"core"			},
+	{IRIS_HW_CLK,		"vcodec0_core"		},
+	{IRIS_BSE_HW_CLK,	"vcodec0_bse"		},
+};
+
+static const char *const x1p42100_opp_clk_table[] = {
+	"vcodec0_core",
+	"vcodec0_bse",
+	NULL,
+};
+
+#endif
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ddaacda523ecb9990af0dd0640196223fbcc2cab..287f615dfa6479964ed68649f2829b5bbeed6cd6 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -374,6 +374,10 @@ static const struct of_device_id iris_dt_match[] = {
 		.compatible = "qcom,sm8750-iris",
 		.data = &sm8750_data,
 	},
+	{
+		.compatible = "qcom,x1p42100-iris",
+		.data = &x1p42100_data,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, iris_dt_match);

-- 
2.43.0

