Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20C7972617
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568309; cv=none; b=OG93tpHXR9zJBcpxA31txQV7YSFfMMr/lLUiirP1f0XGqg1Efu1+RnxfaPpW4Pwnfo7uehyMhnp+CFsefvgv2GJ0CYPxESVDus4A6DSlNCWVPoaKtO0hF9v5b3BJAf6uh73b7j5jMhFshOcTWNjoYhzwJ5cTs+v8dQAG/T3r3os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568309; c=relaxed/simple;
	bh=mCQIn5vpu80BJVHa96rLCLr73oxORhR3/iJH4OsVEgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FgZgLwYL8786ZDj5JoFNbo5rafZze60FOmgcYENVYTB8Qaq1UKzs5jUqMs+oMbfb3xAi7zuEH4qlF8htKy0oyylMAUgGPF+Y0vPaGyCNf3fC7BnC5sQMp8YzoAAzX2UY4uuZ/2J6yQaPYH2jtt/gWudnv+vxScCpXcEvOO9uVkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kVVHKKIB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KfbyqMLA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kVVHKKIB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KfbyqMLA"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIxUgP844612
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L9Vw5jDigYiQesIzmMLfKp1iVpSNlFZ/ib37vSw5XRE=; b=kVVHKKIBlqRiqOI6
	RYRM6WOdsRb/1ZKIMm1dV5AvVm+pqXOSQFbvQbzijXLeNDYw23Ce5Z876HJRCZGQ
	19J8c6Ba/A5kwUrL7vE6234Q2rDExxsQbaDgzqnd7SEKIlN4i2mUqA/snG83ZdEx
	bvWNLV3R0ghn24F3O0jYNtvF19notebyDJhrRQk/BGVjsnAtRpm78zXqQvtuABrR
	MjcIMEFLWBtiaUyGrva2/m0pBzUWAE2lvZjL5GmIlCHrIr6Pv6GJt6KkQ0SdGfmA
	pQwE6QrrN1HKBv9bsS/vUxHZeyzRjwGBh7e6z35JR0zjzXyAPqHb9T9E6exiGicf
	5xrdVg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter03mq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:05:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8cecb6dee57so83936406d6.1
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568306; x=1782173106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L9Vw5jDigYiQesIzmMLfKp1iVpSNlFZ/ib37vSw5XRE=;
        b=KfbyqMLA4mBlBWqsJ/z2l7FedVit6ZLQBUrs1YfWkq73zXbA9L7OMPkSUkvFJg70Dz
         yVWzTiGHJzkfyWI8ETylmSxJYVXp98SpgC/FN3QxP7ExpNECLnI//xfFgSjsfNaumab5
         VS7GegkKLnfmoGlp2A85X0cTpCsg78Uc6HmR/ZmKeEc+dlxo7nZDvRXFvwIJ54oA1Pzh
         o3PjO2c8QgAZRFm4h62ZWriceXtmyf/+if9of3bPK3vZXAGlbpNMRlHSmtyzHoimGGD2
         LEcRUore8tSV0O6/6lui94YTDVRP1u3nXwUs6O6uDfqf9nfPgPSkok7g0hhkR8jVIN8S
         7DNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568306; x=1782173106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L9Vw5jDigYiQesIzmMLfKp1iVpSNlFZ/ib37vSw5XRE=;
        b=skAqX+k1/s6HT2CN883AZqbfBqfaW/xduPUODoDhH38zl+xkl1rXIsFWUeEz56X8gJ
         99aubo0PwgPxU6R40gaQDX1n7oZf0BTSgKZqhso8AtNBoozife6jst0CHaQiF6zmooSd
         lXdiYkdI6uFehEjm3Ye7zT0UR9QpEzeVrrbRmDfNonTVGy5oogp1ES2JRGuT19e2Pk7U
         77hF1aM/iCCUzg5A/udAqa/SYhdIEuOPKd0iuEVKDyfZkF6cHhaZ4laceLFVMeBCRbVO
         4wriVNM5jLGejFuQKk5VGTqBMPn1vPQWvxe0R6M/s3p2YNF4V/ZYm0n1vpp565VP1O+M
         R1pQ==
X-Forwarded-Encrypted: i=1; AFNElJ/Tbm68mMD9WsTTWXITWrgTgN6YeN7DZR8hejbXrUqooaqIsksm3/zPlg5K5L5KvbXUEa1V4QmGjbeQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwxWCTOZj9HSzVzioVCsL84AlJkgZKDOdCoKBsKWvAPIM3xlbym
	ccu+TV0LOgfaIgHH8pSmeYDN9GXGrlIUGZSqqfG2UJtQuBeWlz4fjtnmzMSCUm3OIEsCdjHZgUo
	NicEe+xOWyuB0gm8/dWEmIBHqJ9SjQxePEQIUuTAPdEFXlgKyQ2dzctyWbH2Bl6J6
X-Gm-Gg: Acq92OG7kHYT2Iz8mti/PnqPNuPO59kpEqI07XAPgOLU9Ys+TZtwB/EKtEUxj1vWfa4
	cf+NHF5PET7+VRU6E7Q0P1Z7BwQR76slCahEiTfEZoBT1y7u+Sh4bfzltKwgNXPASpuRakagfdP
	ycnjWaUblknnFzUBnBUZzwi67JIZk1pUfCHaQ+mRgdcahT1sXxRcwxnNwOx4M974OUpZrm94IgY
	IsHxnxWLH/K9OPK3InG6ch2hSHVXSwh7mc8DfCgz0lgJerNHKqNiJd221Q/+kJxpqwPlvILwAs1
	GlPTPvPQTJMZnNu3zVqYK/defdQEoLtKibVlBpjknr/GWgZYXGXz/ihqGdHwAjEZBebJfen11l8
	ljEmbkVZFZ/5vTftd7tmoR/EjSJMVGHSXg/O3xm8LNOyrKE5sWWfjajfz3lp+1IgaoMuieUPnPW
	UMT9NTVUpEUfwWIqHcECf5QvMWWvduvJilykM=
X-Received: by 2002:a05:620a:3713:b0:914:bfca:7d12 with SMTP id af79cd13be357-91c2c4d3767mr244246285a.5.1781568306496;
        Mon, 15 Jun 2026 17:05:06 -0700 (PDT)
X-Received: by 2002:a05:620a:3713:b0:914:bfca:7d12 with SMTP id af79cd13be357-91c2c4d3767mr244241185a.5.1781568306028;
        Mon, 15 Jun 2026 17:05:06 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7092sm3015731e87.50.2026.06.15.17.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:05:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 03:04:34 +0300
Subject: [PATCH v5 07/16] media: iris: Add platform flag for instantaneous
 bandwidth voting
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260616-iris-ar50lt-v5-7-583b42770b6a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5396;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=IXfRr4SN9wgRvhhg/OBkArNivfd6O7byWgxU1yn0ucU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqMJMPmA83bxVL6wf8y1MoufXvyjnlRae/r4G2R
 eFpzI3NoY2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCajCTDwAKCRCLPIo+Aiko
 1ZPLB/4iBMSCAfzR3DtxcOgwupMevTdGwco5tBcyuCwNLpwaDxjladnmDoOdPzLlXK5auWCU6M1
 Nw0+NYurohaeytfvLcuDN8Zx0AqYC1gsAEh/ZyD6o+ehLAkkr6kov3Uri+1CbBsLR8V/kx126v/
 pR25PIrt2EmL73evysQLnkBKbD+wCeDnhGIsuVaO2+6DSlj0ap7CNQKEMTPK3ALrZryoWgxEltk
 ndGZteuCpw8fWrWRWyI0DyqvcetPq7rarKuQxy3IFEwGId4KVJrjOKcwLJ8jLdJUU2EmQ8aNJa8
 ip4iL72A0UntcZ9CT46r7emH05MTx6NsP5akSSy/L2Cb6h5a
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: H8KGpys0ySkupNh2hx5maoZ1fTwVsc1V
X-Proofpoint-GUID: H8KGpys0ySkupNh2hx5maoZ1fTwVsc1V
X-Authority-Analysis: v=2.4 cv=UPzt2ify c=1 sm=1 tr=0 ts=6a309333 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=jsq_lj1EPjN6R-bUmboA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX2Rr3yzXNkrgn
 VRVedEc4XD5C3Ekev8QORvXn7PDALVCIFzYO0fAqDA8/wg5v7ZEHKKJiRT8BfPZuG9mJgqwSXq7
 Yi5iMPJxbxNaUz5uA7G8ozVoyL7NuPC1L7Z7IGwVwK5ohUHMrfTfqcDUqgxFg22+ukx8H+1a9Hi
 bp30BfhqEXw4bPpdBcpJVtcE3J76h09AzD3I8eSwrHRGjJb4rNzIzAcij1V3abzea6sc7KpztRC
 qZc63U31xMIVAD97e8Z5T0yhs9xCKQ1PBzBfKYV2XlSJWIpa3lOaf4T0bbrp2xmO82DvkQ7PGiv
 m9O0HecFy4wHPYIFHX6cIfHv5/d07VOASrVcDE9qRND2Ulv8SffsDnrIxs1JxW+gqSRvFed1fnu
 hhe/3hQwKxBmih0771Y16QHRPXJSXASGwNjrBIyVB5M8eiy7ipnRVcIcxMPtgWrncapB3e+HxIO
 gjMJ2RWbGRIsN1bLnhg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1NCBTYWx0ZWRfX6FAYJ2Z99lny
 gTj8IfpCu/mBX2o8/NMTVACVllWNNuE2Grpajd+UfcetQg/nR7rCXCnfzspZKrumAl/YRTaQSzI
 EcKXDEGOHtbnNxBg0nhKzPWY7dT47mI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150254

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
index 6cde94d86408..73bc80a6de50 100644
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

