Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C855C47CC7E
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778676579; cv=none; b=jg19zFJkh3OqkszSom5DCXLacpqrQSn23Gbv/ZqVjsXbt9Ii0qbqL4lICEXt+hpEZ6geVq2Z2yQYTpyP+El+qog4T/F1cHEGKdeSYDmTEkyCvQ8OkMkVRM8gm3Nqnjr9668/7ct/cF/L2gcy3OBXrW/J1i9GZI24Pvmqg2E8vxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778676579; c=relaxed/simple;
	bh=PZMTLxLwbvZOwA8LX8WRjQ2jAtxisx1shd7n6n36z4Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fOdyobVAUYSxqF1ftbXRv+K/et7Xsbwh2Diuz8gHpUXJNVrsgXO8jvTZQVhM7FsCAsYLNY1+HwF1LhVXOybvqAOWukyqNQ0cAtCfqoHqo9DgZQzitnrUXKmgrfZ1IBkEPsBQY9iMWnVaaIHg1sauBXeXIzralX2RECHXN2tzXp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BJVLcoDj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L/SUFubv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BJVLcoDj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L/SUFubv"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DCA2u12965293
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cruwuhjqGa0rMbt22zZ45ZYZ3826Tz+/AC4t/AIJui4=; b=BJVLcoDjbkZ7BvQC
	//hNu/ZkUIPjIMYvWSuK+RMfjekXDozwxoyXJmniYpeCD2fKIQbT7o4FUj3as+Tq
	m9H1ewYxvlGf/k8ZwvJgD1In67oSKj+jw/aoJua7hWVZT+u4EcNyrMPGDDHxZRIk
	HBDkFjzex1whHAcnScdt75+6aoiB6i5MMQ+qYaKLrPC2DERpa7oNbkdXvR9DMsdV
	bk0oWOgcIo+NEFJHgpD7E92tl3u6KRZoQcTGmkY1XtFihbPC1FKA7Fun2O+jQWRB
	XnMhm87QZUWMB9eTra7DiIpQh8FHWDRS5vU5zb24dTyraG9N6pVW+O4TqPbqP2u1
	9MFj2g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma59c32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 12:49:35 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50faf575af4so152569831cf.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 05:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778676574; x=1779281374; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cruwuhjqGa0rMbt22zZ45ZYZ3826Tz+/AC4t/AIJui4=;
        b=L/SUFubv8JQqN9TUy/lPVA9kj7maj6zqjOIfhElCJ7r79pQPOKayNxnZO/Maf5s3eg
         B4FKaeo/GiXlRFR8GCcAeavNuxx7NJHLwqsnqz2zkvmeeld0BEuOAEGS9eoojq13YeiL
         s9wPBUffGHRTACm843l5dKbMBQ0XypUWEW8RX/4ETTInjuA8q2sBwVlMDOMwdSizPZBj
         WTzYCrxiWVH7PkhdpcKNYFT+Uz494e97H5SWQa/Xs9jlZSXe0HfvQR51O+egDk2aiIKI
         IAOCOPmoXjUfXNknKa0A3+Pw64ugBV/zIclN28NzHmK1sbOEIx2FHNkP38pv4i86S5zS
         y8NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778676574; x=1779281374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cruwuhjqGa0rMbt22zZ45ZYZ3826Tz+/AC4t/AIJui4=;
        b=lJcpZoT/TzMJF1uoibC7sqgRfGmXiwXhcm/AGlZ7cwh7yDRQPpwU6YsmWyVFgZEB51
         c40/soYPDQF9u4Ld/RABRT/oAO/MagVXitPO0rgQW2Utmu0F5LOtNwZWfHATGl5IFxpA
         flcWxL5wMTzNNoTxgIWsqraBVZpbhtlTMK5G16U4riwWWHXsgXoEBW84eSuijpRBFYkc
         b/SkLz7pu4olyUIFX8cDObT91Gi1q+AWbw021klDhPyLcgPKPwgsCowFFt6oFpkvehXR
         nSQelJtR55eAOdJMmPHYYrPgV1snhu0Q/6zUFvbGRz9GaxTAh7UY6AIMXxEcumqbZOIV
         WZNw==
X-Forwarded-Encrypted: i=1; AFNElJ8upGfUL/6g5oa1Sr/raUo8q5EVzfUD7PH3m3gk16i76AscTOFQxn9UbgueFYPiSXr1P8iJxtqnjuZM@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1+dmEmEGrM19gSmAIRfh26ieyAbMMXIStwOfKdg26TZBRFgxA
	gvGQMRjSoX+s5SNmV6PAolCE5WCg+jtHJBpzdso1mprAxIitBgRj7YqxXijwsncv8+ps1RRO8ym
	sYSqwvXkhRH33dQz3LcfiEEfpdzWLNxhdyxqeJSjacAJCBjdEQcXEjm6ma/qlGRJp
X-Gm-Gg: Acq92OFtpgGoZJDWJ8yQImQuHb+aiSyGwZy7TUTQdDo1rJ74AhB4bBVmFwxFLheOk26
	OH1nehFkK+F7y5Vw9/4rJJy0s0eQs1uzzSNACTdgJAeckB2X2CZgtAboy+6s7Naq52LQj04Frg1
	laJ5z2eKhKE7yoMTJuOHYrXbb2kk5zFd+rTilVnJYhLAyZ4qVfLZ53HUXllhNvfvtxLqJA+R9/3
	uGf9skkD10eYsgnScKoWaER7Cnjp4wG/xnWN7t+ER92ZFSIMJxWDKsQYEqPJkf45DAKsE42cBQK
	N29qYdQ6lNJ50vy4WVBWjFGlLJCJY2YUXX+E829ped2wHLTHLde8kC7NKVplxVRIMG85c1Q6Kcy
	oRdMlam437+ZFuGGY8fyeFen6G+OJlnE3sJoy1cisVtyqAlas9IdI0n+EVKvHUX5s4WdPdoYYIN
	anTlZdJRUoOhSOEgvVTE38hGE+lJLL+v6WVAU=
X-Received: by 2002:ac8:7d4d:0:b0:50f:c109:b78 with SMTP id d75a77b69052e-5162f6978b0mr41931541cf.60.1778676569180;
        Wed, 13 May 2026 05:49:29 -0700 (PDT)
X-Received: by 2002:ac8:7d4d:0:b0:50f:c109:b78 with SMTP id d75a77b69052e-5162f6978b0mr41927001cf.60.1778676563929;
        Wed, 13 May 2026 05:49:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5f15asm41106841fa.17.2026.05.13.05.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:49:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 13 May 2026 15:45:41 +0300
Subject: [PATCH v2 07/16] media: iris: Add platform flag for instantaneous
 bandwidth voting
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-iris-ar50lt-v2-7-411e5f7bdc4c@oss.qualcomm.com>
References: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
In-Reply-To: <20260513-iris-ar50lt-v2-0-411e5f7bdc4c@oss.qualcomm.com>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqBHNAgfaSs5ARk7leg1w8+Z0GaPXa9OAPL3Hxf
 v01WqAvQBOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagRzQAAKCRCLPIo+Aiko
 1cYZB/9HoHcOSYLAeyPxLkp4spzUEb9wPcH2p9KIVPAfwC93AFLD80RP7QojH74dRDfh++aZjAc
 3ZNa7C0guGXOTA1pE+I9kEp8svz7Z1pmuCygQAT9xikfU3FpsOKi8S80TA3+zUjgkMICr27uBw3
 sJr0YwjaYEo+KSm5fH20NnIzvTVg7y5sH8DZdSdudV1/hnC7zENtWuIxLSpjN+hmyqOltK76WuA
 PEj0/k6PPSTszazBYT51gV3Qobr+a21oL5RyEQ2e7Blx7EKcSfNCoXZJLn5J2GUgs5qyCauEMF0
 SBOXo3sx8/j8giLHGW/qobgPbwTzh4omTZXFWUUPFtPUIW6D
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMiBTYWx0ZWRfX0W/ErDhryKF0
 x8vNH44tkh8AhkAFInWZ2XYZmrbYUxwkaVYIt0IM8d9O9DodJCIjvMbji6k4MHJSuWNWSLbbeDv
 ePkPykrS73k5HcM1G3PTfAkSt2AaOlPXprsZce/1bh5lbhgVONiEJJXpwqmGg74CFaEJvkUHMbp
 q/XeKUo7UBi3FgLXMalsy0E6Sc7QOEom2fJ+MY/f90gLSzkC5YlJlR23xCrA/Js4qBzEOmjLmLh
 Yjo2+vy/X9eCSDLztWezW/ylhXhp9PbhC/NpvWr8uSYQFG1UFR2NOmmSpwrrT9HE2q7AMIK4d5E
 kVvqK3YHmCKPLMJB1kx7EeKUZGR7fX94BtvSVudjEx2K7aSkVqMiiDClXOScTGbiwxkDgbDEqOo
 uU6yuAd5ccW95ti18dY0EG23xqyNkiNL/QD1TVFI0QbCEX0FHZuPrcLHlF751xK5wMkU1vTz4qt
 llgqu/Wzz+BlWNqfsjw==
X-Proofpoint-ORIG-GUID: UO1cYVtJFz6WokcLzCKnCOwXuCbXo4oh
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a04735f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=hZPXDZ8rEFHKWOVG6IQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: UO1cYVtJFz6WokcLzCKnCOwXuCbXo4oh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130132

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

