Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D751389DFF
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778753401; cv=none; b=JmHh+42e5xHX3jcKD525ZmRQnIjAtf7ttFtXijx2Bxr3pwcseeJ8ZUGW65jdbf7N6HzJkWKtvDySqjcz3RX1M9xg7bhPb/YwQZy8ThmRrfAkxLQ4siy7jGBIG/kdkv/YR3tNQ9RBoDNRxlEZ4kXfD/scABj0EwKjlE5CSwH3Pbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778753401; c=relaxed/simple;
	bh=Lo3+EqRmidcRv20rL12nzMZqvqEoAWfi9u1LSMD1tcg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nULwayVBboyWPRmWgmGETnqzoLv0VBY9QZH+8cJWCsB9llFLnhh19EILlNXpfhZEM0h3rMmC0IAuK+c2i2Zd1AE6wYBtKG9RMV1vjxg+gh8zOBEYzgGOgIPX97FyvyqIe9j81XGlfpzfz1PI2HUoWCR4PV6PZPJAad4lM/jMdgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mCmMlk4O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NX5oEPJg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mCmMlk4O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NX5oEPJg"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9klfW638791
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GX29oi6WWeJJBl5pgdWXHMArI5N5aynqx/FYbRtltxQ=; b=mCmMlk4O2qB3tWah
	T6cebLdZ2Lzg7Zmf+XGsUNGTxhMoRxl/JHiyd+CzmMTmRy+oEB4CmCKVKg4Vuj9f
	Oj77jFQt8teYBZbMhargBJJlJ2qM4oiQd1RjzDhzR3SLdJwTJjTXL9zv7pxzkchI
	iBCF3vYFoIEiKhAzARhyjU5IxgPS7eakEM0TlOIX31m5YsYF8gbOlL8zI9oDb3rq
	R+nM69lGTJb5pK/W9uPE1wGurmxUi9f0ebm/KNda2geQWaggTOT9T+WQraPbywfb
	RcAsSHUtepnL29YHWT88Vv85ajWeQmA3XBgKBKDa1OyukdubhZMmFsurg+90y4J/
	njOtSA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjkdgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 10:09:59 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-366122e01fcso8886577a91.2
        for <devicetree@vger.kernel.org>; Thu, 14 May 2026 03:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778753398; x=1779358198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GX29oi6WWeJJBl5pgdWXHMArI5N5aynqx/FYbRtltxQ=;
        b=NX5oEPJgas6Su4b+AFa8H9RVBzdIA/VqcYaXwaatZ0MC8s2qdzgww8D8ovDwrG2TjY
         velSfREBzxN5phXSy13zL2R8a4KHXxC99ngEepQKW35X2nUF+6tIE1hwbTMc0QGBUEeA
         kyYZmCwBpDhxOngFSXvIEz29/C6ZqoD+Kc6m8zhnpPjou8sIS9rAStxyaByY0sPACwws
         CyI1c2VYU3Ne310l9ErqaKj1eGvP0KObYal9uVNRAHJnIqQHcdlGI0nKZY4/HSHz4a7M
         FS7bkNc1L6aKvQ+1BDhX+kSuweyTFKdy6O6uWIj455dCUZZp5dhFKG9TS9P9nMTO8q9i
         ALhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778753398; x=1779358198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GX29oi6WWeJJBl5pgdWXHMArI5N5aynqx/FYbRtltxQ=;
        b=OANnirHtQ4gvYnlNrnZQV1LLJqpm4+o68jigUURZ6bmmngbikBedqFSGEIHj1cYIuk
         eUPddpRV9NlV9GY6DB+h5C0fn3ivsZm7sAxkOKnRlIzploF8drHu2jp+sCRyoO0BR2rG
         +a1VB2Do9OKOWiYQ3ay8gotCxqdplvGpbZFitFalbKyT/3oaBgQmVO7TQnboaZLxKwMp
         lbZn9fRErzEM4RWoTzcQp52yziMTRueCFVMp3YOFa5ZiwDDpU+S/t1iCPaXAnvSrAuYI
         QvF04nIPcCyQXXKL+fHn3T/f/aBhBnlUMnRUiSdH5pYCC70rDqr4k3mKadJ6hvl1E3nh
         lfJA==
X-Forwarded-Encrypted: i=1; AFNElJ8fXhurQHIIWSZyE+pMqbaPkqS/dZmpP/7Z8Kg5TFDHiqhO4t7dFYKBp+xvYYc4dwF/Pl8Mth2gFzj2@vger.kernel.org
X-Gm-Message-State: AOJu0YwNEbyHKvll7bwlmV/0C3Ico69cEK8YEGv6oKr/lfo9vBM77pSe
	Un6Cz3mTD0qI9Gaw7Z42RUDgx/SkBLEJQpB/nNI4lWNKHsXT2cVUHJaXutO/LFs5zwjr6EN3eUK
	RN0DjNVXvZfQoh2jMNBais6IC1v+xoJlPboWg/otMUN+jo8IG3TaUvJVuoye/HRLi
X-Gm-Gg: Acq92OHpnP/tazu6YQ1eBpbk/hT9KfVmxRSvqODZan3Zle//2h05n3hhcoJIYHI7Eec
	iDVeVKsfgyLEuyXh74tpGgMSqDr1ygfpjkR5x2q7R1Xh4L1Ob9eB3mtg12IYzRsn7GqQbqXC00L
	102ORJHBjw/ilzgNVmzK80O6g2LuueAfG9SXj9Ur6Ch/f654Gq75/By1M3I7T/iDFHAf4rnDpa4
	rpL9KIwKsiw1Mf3CYxFaSe1Wb441g+gOgn869u6ZqI6zkzONfgW658UUIr6OSlHNPJdOUVWl75e
	SMiySJFoi4fy20OqLTMmC7Sg1pPQfTiJFGBvay8EuIz8NUUs9otQLvr7A7dzybezwcs85WmuRRB
	RkPqYylH9rAPR3zOpWWYHTIVN0t8QtEM1au+41Wln4E3i1Gyb2n9Tu3iR42te1oT7OIDOVSpXF0
	tW53701OjauQZ3JxB5SigU6hvXq6DyYuw=
X-Received: by 2002:a05:6a20:3d90:b0:35d:5d40:6d79 with SMTP id adf61e73a8af0-3af8077bc22mr7964289637.12.1778753397866;
        Thu, 14 May 2026 03:09:57 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d90:b0:35d:5d40:6d79 with SMTP id adf61e73a8af0-3af8077bc22mr7964241637.12.1778753397239;
        Thu, 14 May 2026 03:09:57 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82bb07b007sm1966450a12.11.2026.05.14.03.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:09:56 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 14 May 2026 18:09:35 +0800
Subject: [PATCH v7 3/5] media: iris: Add platform data for X1P42100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-enable_iris_on_purwa-v7-3-47aa5b026f1a@oss.qualcomm.com>
References: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
In-Reply-To: <20260514-enable_iris_on_purwa-v7-0-47aa5b026f1a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778753378; l=5454;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=Lo3+EqRmidcRv20rL12nzMZqvqEoAWfi9u1LSMD1tcg=;
 b=807NVkxkEvWjZtg8qvyuMDn7zJmOdRVBPq3S+kLZf3OMLYBdvj/phK1buLECp23cuWiCHQ1zl
 eqfTruVVBdcBVwEeELiTZ5cN9wO/3jbL3DXBECVzoO4xv4ec6fP96v6
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: aho1WLzoA9fX6MT_jaJcPshNurdiX0_7
X-Proofpoint-ORIG-GUID: aho1WLzoA9fX6MT_jaJcPshNurdiX0_7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwMCBTYWx0ZWRfXyIjYjiCjBA6S
 SDJvAoipBccRcxF+6giY7pmJQFI3UQ4DsaRfXmFJcbLYietD14CQU1c1L8pKLRTBENwoKhUk7Gj
 mkCr+uzf0YwOQzP3rTo2HapeHLqugUsgKYylmjIbMA91x+NY0/+mg60baJsPZwIFd0Ln1iKvnH0
 ODk/Qyp9n9Fx2SSEVNLCDLEA4XXM3RoSWfuJeAdEV1hH5Of2ag2mori6yEhAET2r9pdKR4H/MGi
 j9a9lVEkuvFXdVtNV28EeF/4g4GlxaUaYx+MGxzi9Utv5uzMm2I0EErapxm/oB5nh4VHZwdN4Eh
 9BeXwfJLMyYUu6HEF9c6kUseL8qanecbHz2XgAseOL7W2+JNMY4Eacy/aDtZPB6kDOGcFR40jOP
 w/OMMtcKeXYmajg6tI0vbuGPfAoPse2QsfB5LhNSAa01bs5EfIPmbjNuo9FusaNrDOoNikp7CtZ
 eJirRqYn28/xNxfhIaA==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a059f77 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7846H_0ANTkhO8RSUocA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140100

Introduce platform data for X1P42100, derived from SM8550 but using a
different clock configuration and a dedicated OPP setup.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 42 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_x1p42100.h    | 22 ++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 +++
 4 files changed, 69 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 6a108173be3548af9868697c2557e353136d147d..8d42d60dfc4710875f9dfacfc44216535d0a00aa 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -49,6 +49,7 @@ extern const struct iris_platform_data sm8250_data;
 extern const struct iris_platform_data sm8550_data;
 extern const struct iris_platform_data sm8650_data;
 extern const struct iris_platform_data sm8750_data;
+extern const struct iris_platform_data x1p42100_data;
 
 enum platform_clk_type {
 	IRIS_AXI_CLK, /* AXI0 in case of platforms with multiple AXI clocks */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index c249ff8275414a355339ec8edb6856f292b5cff2..541ddc40e3aeef349f1ae68e216d398b3b4fba78 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -16,6 +16,7 @@
 #include "iris_platform_sm8550.h"
 #include "iris_platform_sm8650.h"
 #include "iris_platform_sm8750.h"
+#include "iris_platform_x1p42100.h"
 
 static const struct iris_firmware_desc iris_vpu30_p4_s6_gen2_desc = {
 	.firmware_data = &iris_hfi_gen2_data,
@@ -29,6 +30,12 @@ static const struct iris_firmware_desc iris_vpu30_p4_gen2_desc = {
 	.fwname = "qcom/vpu/vpu30_p4.mbn",
 };
 
+static const struct iris_firmware_desc iris_vpu30_p1_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.fwname = "qcom/vpu/vpu30_p1_s7.mbn",
+};
+
 static const struct iris_firmware_desc iris_vpu33_p4_gen2_desc = {
 	.firmware_data = &iris_hfi_gen2_data,
 	.get_vpu_buffer_size = iris_vpu33_buf_size,
@@ -217,3 +224,38 @@ const struct iris_platform_data sm8750_data = {
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
 };
+
+/*
+ * Shares most of SM8550 data except:
+ * - clk_tbl and opp_clk_tbl for x1p42100
+ * - different firmware
+ * - different num_vpp_pipe
+ */
+const struct iris_platform_data x1p42100_data = {
+	.firmware_desc = &iris_vpu30_p1_gen2_desc,
+	.vpu_ops = &iris_vpu3_ops,
+	.icc_tbl = iris_icc_info_vpu3x,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
+	.clk_rst_tbl = sm8550_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(sm8550_clk_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
+	.pmdomain_tbl = iris_pmdomain_table_vpu3x,
+	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu3x),
+	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
+	.clk_tbl = x1p42100_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(x1p42100_clk_table),
+	.opp_clk_tbl = x1p42100_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.inst_iris_fmts = iris_fmts_vpu3x_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.tz_cp_config_data = tz_cp_config_vpu3,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
+	.num_vpp_pipe = 1,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
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
index d36f0c0e785b7de0e3527e0a824942db0fb79133..9f8113ec7a508a5a26cf275408165d34684d3e0b 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -385,6 +385,10 @@ static const struct of_device_id iris_dt_match[] = {
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

