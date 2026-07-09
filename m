Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF6B33F58C
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 13:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783604546; cv=none; b=s8QlGrwZWywJBC6jVwgbQ8o30/eBhHZuWTQeTZ9WMkdX/8dbEIR8F1jSApKP9uJoudLS0uWaiioat8lTc6GYHSSW06XnX2BTA7YvKn+lfe7dbJYKziYFjjJS/bZNeefKxAyFg973E15R0hFaI3+Mpx5IxIGCFV28MnEmw8xnSb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783604546; c=relaxed/simple;
	bh=D12Kqe684KHhLTzzN0zwuJ804Vm06UzaITtnqf7NpI4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dP+9JOA0itPJOH0peE8SIMNFmh9N7ZiwJl3bYFHOCtH/FIytYx8tiEimti1axjd17VM9il0FG/vq7w7w1S1u8DUFftjCgsHXWDsJNkyNFtey1Ih8ZZeZPgMrj+YVcGzsLqpazts+UMeo85+29M/ctSir4/UQfJAub4xXUVJb/Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XD3TomVC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I6fV4KHK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XD3TomVC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I6fV4KHK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669BNNvW1669307
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 13:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uvSmIscE++JIzvsSnLCXt6U0Uap3l+FwlIa5uwxoZRM=; b=XD3TomVCY4hpqMyE
	qNs+GauUf2rXgujQ+SCvLTLxzuqn9CbIO5G3nDcTCQDHlcNe4x8kSepjPpeTeb9E
	vAruQ+V86FlIHGGRcrAApRQBycgdYYwe1xkYOkeRgx7gKS3OJrOz945vzjBoY/Qv
	7MuplV8F8MjdixGDVchKf5Mgc2Byyvm2d3do7oC3j1X8bh8LbUw2Q2Xz9BmG+2A9
	KZkoVlqoe6RqR3Q1mRummsFUbjUUxcnZWb8t/8HrP8ljBn9C7Rmk8LOVs0Z4Ppnd
	Vh3Xbh62n8S+1/YFtF+z5D8a0EwvpdrgukX3WIzo3TFiTpL0LgYHEp8bvcNPCSjq
	xUpy/A==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa418je9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 13:42:24 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9692bdab0c2so1006664241.1
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 06:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783604544; x=1784209344; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvSmIscE++JIzvsSnLCXt6U0Uap3l+FwlIa5uwxoZRM=;
        b=I6fV4KHKw74p4Tp1siXaiUUkEjk5bWUf0dJUmSn/1nUJ0OytJsDGvtsG8a7ly/4Nxm
         rc5JvVWpdxHr0M3QhibyXlPTexzOU8cmemrdcM0ivNhuKsiUDpVPRcN4fUmbdDwixjvW
         wZru0wVYmmBasqPudhvcpvQekOw3E446nQP8VEC43lCXwmiccA/R29zF059OXw/+v2Rg
         98w8hyGDR4bjl45hpC3KvrlpQSp8BNP54eAO5PljcnP3LKk+rY3z/X9J5cdRuL/7dKKD
         QXo1KVebOD1oq7JkllAPcRfEOcltPSqolxeN9kHSnajvZZAHCp+xmthlbe+5I9CZVO1e
         4lGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783604544; x=1784209344;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uvSmIscE++JIzvsSnLCXt6U0Uap3l+FwlIa5uwxoZRM=;
        b=KR0zgXcDLESwg+YcOeROeg3p5Jdc9zU/qmrg/CB4CX0MbNkFyR16wlJHX8ABIiaRPq
         SXeePyZBR+nKCoplFJ3G4D0S5qdvuP9ZPNMREAf0v3/bOnrPaW8T7B/B8Dh8f50zWSV+
         qdzCqnOfvSJevkps/A/1xHEU1sOrt3iJUWGRtpmi9GjobkHgNv7CEgOG3lIJpscT/6He
         2jbgArPtoeYaa6mCemuudXFdx57sz22azr4VBaYqrwHEIMTzJgK6jYGW0fHsExi+zBE6
         KwVecummoIaKaU8ek1muY6F9FTGz+Bi/EMX3MgKINLHCtyD26ixtY7KRrURr9130pez9
         nTDg==
X-Forwarded-Encrypted: i=1; AHgh+RokDprOcHowqGKmmhyozsS+ul6plpUsvZGovr5pnG8wSh45zmAEstkAKbNedou71nqka+5hTLWE+GU+@vger.kernel.org
X-Gm-Message-State: AOJu0YwVVaPUhdhkWukFr+aiQG5BAbhlnNw1ohoJsZyJwmd+4L169mvw
	ZXjFviWd3mGZiNoQnbQpO+XwPfMTa4iObC6ke9wbERA31H1NFgAere/DSLYQVGfnMNa1H0p+BjC
	qOe7LYbKnKuVAjQdyfxSvkiOlgNbHGLF1d/vamQEzUEOd0f2tv70ybvGuxGhwTya7
X-Gm-Gg: AfdE7cnkCPZ6XnUaNu+I4vlzj6H8Gj4ugFRlnh2qSu+sVhpYSJEQzIIEEk8b23MaYr1
	5PDMXoc3tWo95Vt/M6zxUoR6C5SJcSHUW41aS80Im5gKS7sNJZOz8lxQjVX1jlkDKKo2g8TSS18
	qZvyVv+ZxZVPBdr2L2cyAwV9a029Km/4dpOZkmHG6SNUdJFhMQS5vVu8HcptQSUvIeL/90KB8Iv
	ljFaj13K7W1Gfcwq7iBCm6VW0amHDyZqxas56ZRBFYr3s3aa3EaEXikdJcd+iQOSf4s3J4qSgPC
	7h3Xd9e63Zz9D+GK/uI7tZ/sElKJrRKCMbnue6Vm6BTvuv/cSVHfk5u98pdoTIYvTNDj2FxIit5
	PHWPkoGqz8WFb3pdWKk2yu3OGs9vaeoEw440iRsvFC7a7GhM4UhEC0hkl6DUzbIj9EYF7rrB6SX
	ULIwuVSrBhUSkhCBe+D98wl2AO
X-Received: by 2002:a05:6102:8352:10b0:738:8b5c:a41a with SMTP id ada2fe7eead31-744f67bda32mr1449143137.18.1783604543306;
        Thu, 09 Jul 2026 06:42:23 -0700 (PDT)
X-Received: by 2002:a05:6102:8352:10b0:738:8b5c:a41a with SMTP id ada2fe7eead31-744f67bda32mr1449115137.18.1783604542712;
        Thu, 09 Jul 2026 06:42:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849186e1sm3345151fa.9.2026.07.09.06.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 06:42:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 16:42:00 +0300
Subject: [PATCH v7 09/18] media: iris: Add platform flag for instantaneous
 bandwidth voting
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-iris-ar50lt-v7-9-76af9dd4d1f6@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5396;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=D34MZH1YqLFpbixHKqEmKSwRwy+EVhESWZFGb+Rb8ys=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqT6UlHJ4/o9MdMiNYPZ15JRmnPb20zgXw9Mv9/
 /aEdijTeruJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCak+lJQAKCRCLPIo+Aiko
 1ffNCACmx+9x7pWf70ZX/mMUTj6VUukYK8dDb4H7qjVh62PMVfU/WGMm+udYZtcvv0i63RrUVip
 yphd4NtRdytEdCsS1VBNl3Wtb4Yc1/S/yaE4VufWTOz9cSNnWoFDV98KXB9Iay6yoJpyTH3s/0a
 CuaDnEGDE2pqtrX2JVBKJGbmT2HzEi8eWIDFabSTkBKMoCkRK1/LyjQA1362TLtoE+i2wdEFZvw
 UcMF5BfiYFx6/0UIh3rb3AXjC5pfdZL00rr8dLPU0M3R65Ct+mT+Cg3/L7ISoMo3FgKRUkuHsS3
 vjLDldPEPBxD/Yp57DjIu2BLcoWZl/xe/I6HTyjfNnCt3GxQ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=UI3t2ify c=1 sm=1 tr=0 ts=6a4fa540 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=jsq_lj1EPjN6R-bUmboA:9 a=QEXdDO2ut3YA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX6xrjsp9ucmR9
 lKqnU9GBzSBYRNFKQt2dEe7bkGASyyvIb28i+wDvtG4dltaByw/umacwcuTpoXAJZi5BGEsS6hC
 jYxQXkCMWAiq9aMNddUWkwdQKtEaHFL6W3TN5UNZJ2QS3Lef636Ir/N7nx+rpc02BWy3IZxXKyw
 W2aWFadO0hHcN7zKwGaWjVphpVDVmpex6h82UR9RJQv0NooIqrzI5cqiFTtV6bAh4pCHIDM2e2h
 gUyJeje7JwZGF9Bl3acvok13uBMeKoFwSrPV8BmvOr8mjypkt63M2fSNS193PJPeq3O4IcQW2Pd
 X9Xd9Uv0NPQ2mIjgewB5ymT38vabdUUYFg3Ru6hJOmrSrjG8xLwp4E2nemTlUCZnA2MwsFz1TiT
 cbXgBFqW2ZbEcBozPTZQsNU8aqBm0C0hc/KSF/uyQc18vRnMKPJI0y/SY/CfaVIZxfGN0i+0sMA
 l2Syl7TpWAp7EfUSHFA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEzNCBTYWx0ZWRfX8AFyRaadBgv8
 UdGarlLgyeaBAQXZbZhGZtjx+EXvoJo3ffn/GvtumUbZVx3Wzl8GxvOmr5xB5o/SHCIHutdCqPn
 Z6n50E/IIgr32zIPNwBFACcf66Snrcc=
X-Proofpoint-GUID: qtEWH65luSMuyHA-YJyjAB_QXRUnUGCG
X-Proofpoint-ORIG-GUID: qtEWH65luSMuyHA-YJyjAB_QXRUnUGCG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090134

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
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h | 1 +
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c   | 2 ++
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c  | 5 +++++
 drivers/media/platform/qcom/iris/iris_resources.c       | 2 ++
 4 files changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 81fcb2854772..accc1627defd 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -316,6 +316,7 @@ struct iris_platform_data {
 	u32 num_vpp_pipe;
 	bool no_aon;
 	u32 wd_intr_mask;
+	u32 icc_ib_multiplier;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index 940daddbafcf..e194f67a6f48 100644
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
index eeedde8fc9ce..b8099d7ce556 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -116,6 +116,7 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
@@ -146,6 +147,7 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -184,6 +186,7 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -214,6 +217,7 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
 	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -250,6 +254,7 @@ const struct iris_platform_data x1p42100_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 1,
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

