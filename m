Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF9D480320
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778845709; cv=none; b=SWsoBQOi78DXBFqEjyZvQRFPHEKS2DJNftPoPDuYUfeWCkOaC22FEHDnhEY22TuVqLT+eYGeW7Xm3kaMTmfMcQD/0oKmwkd5UITAIm6eqCtM9BgaZn8I3a2jLgY1xvkwfDPaXIzbT5wdAVTbangcafBlPMPo89dLEajQ7Nw8rCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778845709; c=relaxed/simple;
	bh=PZMTLxLwbvZOwA8LX8WRjQ2jAtxisx1shd7n6n36z4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kx1Xo4ZUnzk56/3MPQFaHndW6TSR5WWVENGQAoFgeggIpazUd56an+Fk07S69zAz+YvYaEhoeCcuw72tjL5/GBBeM/66BZACtbwIshk0jBzMMmmUo7B0hfCNwHsfD6yY5ZEvi0Fr6WZmMF++USwoG30J6c1fOP2rmzXNfDD5Ins=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G4jVhYSf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PNinHipR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G4jVhYSf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PNinHipR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB63mn3513635
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cruwuhjqGa0rMbt22zZ45ZYZ3826Tz+/AC4t/AIJui4=; b=G4jVhYSfQ84ZVdW2
	tx/VeMsX6Ad/DFD+4cCp4rwjNY2QbotmXxorBSrjJ7FB/KjmPBwUYfCdxla1bpYZ
	VqlhHZosF478JDOQV3hlLS91fjl+I1zxFc4aiiFkpQY2S6lmcEzCtEO4K6G4rLC2
	E0W/YCo/SOhcxKOhtKyUBFt3P5DrS+wU+lT52o5ReH3a4LieHPmuiaExSqqY75br
	tHh52PSVX2pkoHbOF0rJbVoYqZPzZmCf++drg0XKANUmLVgoKyYE2jCMezsIDITs
	heJmaROE7nQVMWUj0Rpk1uv8GHUpuzgDbeYH59+KpCTvCtRANk5JXUwo7EBz/E92
	D2BX1g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1vb3ph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:48:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50fb3c7b989so138456131cf.0
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778845701; x=1779450501; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cruwuhjqGa0rMbt22zZ45ZYZ3826Tz+/AC4t/AIJui4=;
        b=PNinHipRpYOYUT1actZl2axOxu79d9+41JLqetriOYGHLQO2znaOwxWmD1Qua0m7dJ
         5g1Oa6xGhOsjehK9boO03bZavFI4pRHm75aG6LAvmHtzhy0h47FTNsoPoOKV9leGNtdz
         lveu61f6anx04kx6xPmAtpQK9FfgTRnrNFrcgWi9LsM1PxOIEXXr0IRr8ecChvJvKGbV
         Af10Nw+gtW/LW1ayVtc2SNu1Jgs3CZXJ8Tu033a3zlxiOP2EtoRMA81YKDk2QwjqWbFw
         BWdxrHwNGpB1hgRvA9bbVVuYi77iP5hHgxkJsqWMcyiAW3l0GA02p+oGvVZZoNnEb38z
         CB+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778845701; x=1779450501;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cruwuhjqGa0rMbt22zZ45ZYZ3826Tz+/AC4t/AIJui4=;
        b=E/iGx6xVU19FuTFMPM9Oirdx69c6jK007Ica38V2hY+MXyDY571/TyDNWkeypKd7Ey
         iijbuachj7fo1Bj1SzcayC0EE8lyZvvQHpS6lVieI2T0FwBJ03NDi5OBhY1iVDC8lu10
         RAK8Jk31p8RLLCZO1z+dJn9b89BpUutWiT9OvDNxXUsyjfXNiZ+CwOpSIG2vO2J4DdUU
         tkHtPjIbRnXLnF6AWUTyHSBDHBmpaEMjBND+azlL7oB9bKDlCLXrSsDLfqd3w8/FN2oN
         0uPzKGe4kMG9Jz4R5iw5biGpWGYpkGWOv3VLdUV4kkCqfMKnPvtLCWEe6KkeYNI4/ftT
         NRbg==
X-Forwarded-Encrypted: i=1; AFNElJ807NE3L5rwoA6ht1/4Za2uLjaO7r0mNRev1HecKoSQiucUEC6yIvDfWZZ9QH+HHEX84NdPq4cFn1Re@vger.kernel.org
X-Gm-Message-State: AOJu0YzDj+4b3LavEnl5swIf9bL1wLBnSxnHEi/Jf9TwGi+Geto7OaM8
	UKhwe+OR5BREmstaK1hb741vHKn3/c5Sndpj1NxZ1DyubUvIwHfJzWjmlyq4wLbzB2tegxNqMZb
	W5RECuuONUHc/hYYvgYuSRjn8MDcUV7O9MLjDRhQbHKQma23zzoHkKQyU6zbkWO45
X-Gm-Gg: Acq92OHnndV3yG+aJC8GyxHcolAxM3T8/iu75r3LbqDYOn/SsI0s3uvbABQxP94wSo1
	TnrJYV1WYYQaN0+Al9FvXbi5ypXG+EGmFGfdr5SR2Ae4HJRJ1L6GtYEnk6D4Jb4s+2kWgKVdDE5
	RM/K3DXl5GQr60X2wbi1lGLU/FGQguWCK8J7BV74eyqslMh08Cu1W9G8kMYrI3DJnpkFRU1xPw8
	Q2DZ3VJImUdvcqZzViGKRl0S3BDMo8uinDTz3y+WtDyir+qz7NGTVqwmD0PwNZRTX1IQw9LJ1nw
	2OkXtz3WkuJfRJuBuR2jysaEcci6EiMXij7YTEGn/ZK63szHOe7GvJcczI7eu7sjQpXQ59WgG+i
	KMzYcrSixdRf/MsDU5f+v5g5ZmuMHBdrTt1jCEIeRaqHVZC8mei/lkFwH9T6194zutGPmvInUln
	Xhy1M0grEFR5o8twBAi7U6ae0eOfCkhbm1qxI=
X-Received: by 2002:a05:622a:1b05:b0:50e:42ec:ca7f with SMTP id d75a77b69052e-5165a03f084mr50859761cf.18.1778845701522;
        Fri, 15 May 2026 04:48:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1b05:b0:50e:42ec:ca7f with SMTP id d75a77b69052e-5165a03f084mr50859291cf.18.1778845701067;
        Fri, 15 May 2026 04:48:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f11a682sm1265079e87.31.2026.05.15.04.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:48:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:48:06 +0300
Subject: [PATCH v3 07/16] media: iris: Add platform flag for instantaneous
 bandwidth voting
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-iris-ar50lt-v3-7-df3846e74347@oss.qualcomm.com>
References: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
In-Reply-To: <20260515-iris-ar50lt-v3-0-df3846e74347@oss.qualcomm.com>
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
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4991;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=2AZDVaVeHjBN9ieMkt6OZ54VG8WgR2+oqvqtNSNqUsY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBwf1F9avgrZWq+v0I1pdodAUt/N3MADwO/BeF
 YPULYqOuAeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagcH9QAKCRCLPIo+Aiko
 1RavB/kBUB7psisjYBhnxLnD65L34JyEGjWu0//xRyJf6bEggrC5MYMJyqMMS5SD88Eh2lqB90R
 0vmtqmO+8nRwjTRwkR9InqVGyT3eFDNbbakJhttOL1+3NH2CICvrWLR33qvmXRRgq5q/bvCLZrF
 PlH845qsyQsn7vhyCH3WBKX0UKmXzbJEn+drUbaus1AylXbIQ81Bemuw1t9ID4bFGYLBP1QhXMs
 jWgiIVkea93/CTSHlih/9qn407lADicGzS6rP7ZCFsgJeQLWd2lvDka9dUlpaykzuL64oBghucz
 QRIuea9bzmEmzk2xgFyLyIJ9ERuBMhTuXWe/kN+8NQ+SfeF4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExOSBTYWx0ZWRfX8s7853WRG3F0
 W3LT8bNFxIR/2PjxRQIUCjP20+LDHC6foyDV31i8PwtQ4HVkXEeB/9oeElh0RjQrRxxesCrlEA/
 qWSt8Ee0dgKpMUHBDdI3zO9mchEm0hDOw/YZ7ljid18B5KzYr/ENTBkNmVJ/aONLg1GEKv0NcKR
 N0Api55abx+rx9zH5frJfS8HRmy+HC86GU9dzKi+IbDdNahAte8K9DhssdVbz3akkn6VTYsn/b8
 4GzPooUi9n3DfQlMxLbo3VdoiGWKMFAZ467ucewbCjsmYGJBx5UuLhRXO6WIoPBD3+a53RXOkwM
 iv17wX+5qxEIeB9HESG+YbImb4p/lt9hLT8JsRyB6N7jU2RMK7ay1N+rVguVYPmrA9W9UcaLdhZ
 xNMyiWuD7pQjD2gUDm48wkdeA9edlPF0iaDzddNzdjQqtkHfX3bS2Dg+AySj1+KYpMDpWXDZ5Yk
 CRzxNgzE1GZJ5BMWjZA==
X-Proofpoint-GUID: SBmU1kR4hV0OqcJZn60WZyqv4DHzs5c2
X-Proofpoint-ORIG-GUID: SBmU1kR4hV0OqcJZn60WZyqv4DHzs5c2
X-Authority-Analysis: v=2.4 cv=BvqtB4X5 c=1 sm=1 tr=0 ts=6a070806 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=hZPXDZ8rEFHKWOVG6IQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150119

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

AR50LT require explicit instantaneous bandwidth (IB) voting in addition
to average bandwidth (AB) when configuring interconnect QoS. This
requirement is due to QSB (Qualcomm System Bus) 128b to
QNS ( Qualcomm Network Switch) 256b conversion at video noc in AR50LT
which is not needed for other IRIS cores.

In preparation of adding support for AR50LT core, introduce
platform-configurable IB multiplier and enable IB voting for all SoCs.
Existing platforms default to IB == AB, while AR50LT requires 2x peak
bandwidth.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 +
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c   | 2 ++
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c  | 4 ++++
 drivers/media/platform/qcom/iris/iris_resources.c       | 2 ++
 4 files changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 51d8faf6fd1a..e1dc226066c1 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -284,6 +284,7 @@ struct iris_platform_data {
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 wd_intr_mask;
+	u32 icc_ib_multiplier;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index eeef453c583f..e2fddc29abc7 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -97,6 +97,7 @@ const struct iris_platform_data sc7280_data = {
 	.num_vpp_pipe = 1,
 	.no_aon = true,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
@@ -128,6 +129,7 @@ const struct iris_platform_data sm8250_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 5fbaff5c01ca..8c1c8b19fa99 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -109,6 +109,7 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
@@ -139,6 +140,7 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -177,6 +179,7 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -207,6 +210,7 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..caeaf199cef7 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -18,6 +18,7 @@
 
 int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
 {
+	u32 icc_ib_multiplier = core->iris_platform_data->icc_ib_multiplier;
 	unsigned long bw_kbps = 0, bw_prev = 0;
 	const struct icc_info *icc_tbl;
 	int ret = 0, i;
@@ -36,6 +37,7 @@ int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw)
 				return ret;
 
 			core->icc_tbl[i].avg_bw = bw_kbps;
+			core->icc_tbl[i].peak_bw = bw_kbps * icc_ib_multiplier;
 
 			core->power.icc_bw = bw_kbps;
 			break;

-- 
2.47.3

