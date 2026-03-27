Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BF63A7845
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 20:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774642808; cv=none; b=mXoLeDy1EiHnGMzWlNKHKN4om8mFcH+EheTDOsy5mINFaKmN18XbPENCwitVFAq+XqXWYEkDupPvwicx1b2e85DMUSFbJDOXkvHMsz0KwMqBlMlwDKb8hqWizEud69dwmhWhau001oTKO/IfY2zmjPNpy5F2+X/7ggMSrWtXqi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774642808; c=relaxed/simple;
	bh=Sjkopt6DE1KjMmnlYS+KL4p1o+7A4uaEPfALTWUuNnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q35L9oPwuRJuruHOofqDcAKBcVG9ZfBRTOid2QxtmghMXo+2QfIw5B05RJhSinl7BHDrcvFoBdrqUrOSOpHXwdyRP7ayXt0NC3MCwVz9mvHnqigyZ+K2+O47F+0OoMx4sAB5kFbmmbw6sQbAzJuq8GXdWGyksv6XQuNK1b4hKTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hRYHpQTf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J78XIAkN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hRYHpQTf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J78XIAkN"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2a6t3659008
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 20:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QKlKMp4CxZTt/vapbQeq8RXp1kuuPuBSN620uIJs00I=; b=hRYHpQTfWGrmGu78
	3adgtOhIoL4Y9p8AHbSdejsVY2I8sGbMBZCh1i3mutLQKlA69Xpby/Mer+bM8+fw
	kq50jFphA7Oi4CDV61b1bfnrT0Z3CJ3J7YZpaUqBqA5My9WuCK0bCF0uSLVfUpkj
	N2JQ8+ly68OUNJXEYZvaaWxhLkErG99Jhb9ORLvJ7VppH2K6vurDFQZnMaIbX7sv
	ebenrYdsF16AG4wzPziI4j5tF6OQVfso6omQHfCzvkxXSMCuKUan8ymLM09ugDNF
	9INkHbnkIYbL++XXsLM91t+mYDEw1wBd7tVXa7N7CG+6SJXxB4RHWb+HkmUhk4Y1
	veVGnw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5mn12ued-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 20:20:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89c4b118740so82868946d6.3
        for <devicetree@vger.kernel.org>; Fri, 27 Mar 2026 13:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774642805; x=1775247605; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QKlKMp4CxZTt/vapbQeq8RXp1kuuPuBSN620uIJs00I=;
        b=J78XIAkNHUkXFNz7ddW767vAsewgc3Q1/Mjn52U1GgRyQXJc7+oKubFXrq/BVPdwLi
         /Qx/6YdG579SQZlYIuF//gHEvRcH3KXiJv6+m0E/W8PgRpysk0R5iKpuBoYKOcvgzFOi
         /mfD2FIDzQe45YtDuA0+rgH+sPK+DLalrjBV45gTPW5ou/aRoabzCEBfXcljfCy7wEO7
         DVwGTI7kjUFGvwyF5bhlowAKVyOcTgIusjSyRq+TneazAOF3OOjZSinef1pYadwhDREu
         EaeEObvogqmtZca7EuR9SF3Ks4MPFnik+hzrIi1njbWx/0NhegHzu1ZT0vS2DkkT8EGb
         cOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774642805; x=1775247605;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QKlKMp4CxZTt/vapbQeq8RXp1kuuPuBSN620uIJs00I=;
        b=km7RZiCNf/O6gq0OAVz/CLf1RKQtIEgMAM/Zp5XTW+mqi5Yhhv/wOt+M4HnU54psnt
         Hpu0DFkZog0LtFcM/cD482GfpQcnHDv/s06sFOHRMqxBNSSAueA0SJKDzFskwk2gK50t
         kvESTFYuGbBiH7VgRitysaOvBGezRG5DeWBRGK/uzR9kPwenbGaWT4Wsu1XkgAf/5aaT
         s1PGRYFSPxe9Y0UVkmOCnZvRaAxMQGJlxQkGs9Jhl+Lmf0vHcuRoXm2JaZDcjyEnhDiP
         NFeDPfqXoOrk8ya5Vg2SJrTn1qV8OBHDAzZtKC+qaGbXV17ciT8mm3cyr6TAXcx/XgSC
         F+Lw==
X-Forwarded-Encrypted: i=1; AJvYcCWs9G/Rmo2byudgJD1mJY/3zlxjNhymDD38ndk0d8BUUjIfCiTaTBpVku0NkH71v3G7awgIWsBzXXXN@vger.kernel.org
X-Gm-Message-State: AOJu0YziOB9Dtcx5y4hTcsSAERBLDTE2Pt1KzMUAz4ypKirLa79H8MQv
	W5/pTN4bvrPzCCfhb1yxVVII/CEthsWwzzZ7jQNOATtTgmwdFbxt+4eSAfEclAQMGyTL1JuD/pX
	AQ4DrfMLxburBOwUIVZZuSxwYR+Gl9WZCp2u9Ri0rHbg2jlM+IY4OmkNMK4AC6zr6
X-Gm-Gg: ATEYQzwL4CIYsJvRO+LGZiuTYzvb/G33Y22CodkSnxB9vDN7ug7GJDhj3VpiExswmRo
	YIpUaOMf04n8pmC3tXMy4NYFR+6fB3KU6HXw9M6C/Z1u3jMd/7LlFS8wQ6qsZkEKLAzuZ1esZFt
	4AE7UjpMpFQOFpzjQSqjCsPlZGmNRYQpATf441wzRIDGS8TBiX7tHEeyxHuxkSFG0t8BbyRl0al
	ISjifIhmZRGUjKzhdWpeyoi2I/dde2Mllx2S7e+DHXwr5aRVf3ANl9GzFURJGR+/PLqapmkPHlq
	jY42IxWegk6UJAv3n/Fm0NVHq7NFKCv0dxUrMrIILS/k6iHpAUZkxHaUS+bMRHZpx5khVrHH79y
	pSB5Ll/RnuG0fftX9Hp81wDLeJp2BRkDbuVCMwMb64ucHB2/gyU6KS2bekpamo2kXt1PQAuK6gC
	5KgDwZudYHM3NrnWJWE1FmcRbEAIMTZwefPfM=
X-Received: by 2002:ac8:5848:0:b0:50b:41b7:d6c2 with SMTP id d75a77b69052e-50ba39353a2mr51090341cf.47.1774642805304;
        Fri, 27 Mar 2026 13:20:05 -0700 (PDT)
X-Received: by 2002:ac8:5848:0:b0:50b:41b7:d6c2 with SMTP id d75a77b69052e-50ba39353a2mr51089891cf.47.1774642804764;
        Fri, 27 Mar 2026 13:20:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838931acsm506581fa.19.2026.03.27.13.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 13:20:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 22:19:56 +0200
Subject: [PATCH v5 4/4] media: qcom: venus: flip the venus/iris switch
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-venus-iris-flip-switch-v5-4-2f4b6c636927@oss.qualcomm.com>
References: <20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com>
In-Reply-To: <20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5432;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Sjkopt6DE1KjMmnlYS+KL4p1o+7A4uaEPfALTWUuNnQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpxuZr5r6OVOXEdzWas4EPQjAiJUEbw3UkgCdwv
 DATYz18u6qJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacbmawAKCRCLPIo+Aiko
 1aIHB/0drkiE8COAyTwG3I6NtvLdH+wqx3VfHE525Wjy5OIjUKAZue4VLoohz4BpWNv9nEXuLW2
 mFNJQY/yKcJLvosOAAeugg0FyV5PZLxnFSAsivsgISS0+pO0w34ga/8PHZsFHv8RIm3ekO70nda
 y0VI+i23F46mD7qrYlet/PxsEd1sEcXNSvBx8FAxGcx536iAq+htojrmIHeCElT3gt530j1dXUp
 um9+5CATUhwKCQRmkYcf9PxO1K2eBfOsesEFaKi1XcWxUZ3/2OtLssi9kINQKofgaW9uksMml4t
 mPuxykXCqeOeXMTXwGGG8A4RnAkHjzEIJOOVrZkRQzvmB9Ua
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDE0MSBTYWx0ZWRfX7pv3ufEz5DRU
 QbPv6uitOpUW6dQSam8oB7wNCpzSCcpW+wEQQb1vS3EQ5kxDs/KBpJPJkbCIEvXJYHSHYjfSWO8
 s9vf4HoYj/FTMbpJrTGimFcru1XiRjTR7o3mdz6czjgYPCcK/TLRV1PVtxpSdVbr7+U9pUNY/zm
 tbaSTfDI3oLOKyWnYqV+p8lM7oxovcHj9LxBl1fZt5Ahycej7dCDSd7JMdrDENl3+444fxISrD8
 5js/AIJ9uUf8hvnBok01xSbWA6ZHIS0g32kd3rKsMAC3OuSLfgaBWFheRlqRv/Ob5hDXuVepgmN
 7XWQBfunQKvDFMFp7OuzzcsNNGLACi9eNTT6C4JrG3+c49sG2SDEL2ZJeiT/pRcJUhg9EWg/0uy
 tyjgs+nf80AdCs1tTfXHFqA0bZv3VYowN+Q9PtUDq1PSI5BrgmmHHdxLGFagJlLLij4ZOfnbvAZ
 uOOHu/ldvZ1unBqgO1A==
X-Authority-Analysis: v=2.4 cv=CcwFJbrl c=1 sm=1 tr=0 ts=69c6e676 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=PTCOktDilvW4XOe9n6IA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: BL-UUV2L0qmb7_EDrN-PSES76F0nxEs0
X-Proofpoint-GUID: BL-UUV2L0qmb7_EDrN-PSES76F0nxEs0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270141

With the Iris and Venus driver having more or less feature parity for
"HFI 6xx" platforms and with Iris gaining support for SC7280, flip the
switch. Use Iris by default for SM8250 and SC7280, the platforms which
are supported by both drivers, and use Venus only if Iris is not
compiled at all. Use IS_ENABLED to strip out the code and data
structures which are used by the disabled platforms.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile     |  5 +----
 drivers/media/platform/qcom/iris/iris_probe.c |  2 --
 drivers/media/platform/qcom/venus/core.c      |  6 ++++++
 drivers/media/platform/qcom/venus/core.h      | 11 +++++++++++
 4 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 2abbd3aeb4af..2fde45f81727 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -10,6 +10,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_hfi_gen2_packet.o \
              iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
+             iris_platform_gen1.o \
              iris_platform_gen2.o \
              iris_power.o \
              iris_probe.o \
@@ -26,8 +27,4 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu_buffer.o \
              iris_vpu_common.o \
 
-ifeq ($(CONFIG_VIDEO_QCOM_VENUS),)
-qcom-iris-objs += iris_platform_gen1.o
-endif
-
 obj-$(CONFIG_VIDEO_QCOM_IRIS) += qcom-iris.o
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index ddaacda523ec..7b612ad37e4f 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -352,7 +352,6 @@ static const struct of_device_id iris_dt_match[] = {
 		.compatible = "qcom,qcs8300-iris",
 		.data = &qcs8300_data,
 	},
-#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_VENUS))
 	{
 		.compatible = "qcom,sc7280-venus",
 		.data = &sc7280_data,
@@ -361,7 +360,6 @@ static const struct of_device_id iris_dt_match[] = {
 		.compatible = "qcom,sm8250-venus",
 		.data = &sm8250_data,
 	},
-#endif
 	{
 		.compatible = "qcom,sm8550-iris",
 		.data = &sm8550_data,
diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 7e639760c41d..45ce57406a4e 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -949,6 +949,7 @@ static const struct venus_resources sc7180_res = {
 	.enc_nodename = "video-encoder",
 };
 
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 static const struct freq_tbl sm8250_freq_table[] = {
 	{ 0, 444000000 },
 	{ 0, 366000000 },
@@ -1069,6 +1070,7 @@ static const struct venus_resources sc7280_res = {
 	.dec_nodename = "video-decoder",
 	.enc_nodename = "video-encoder",
 };
+#endif
 
 static const struct bw_tbl qcm2290_bw_table_dec[] = {
 	{ 352800, 597000, 0, 746000, 0 }, /* 1080p@30 + 720p@30 */
@@ -1125,11 +1127,15 @@ static const struct of_device_id venus_dt_match[] = {
 	{ .compatible = "qcom,msm8998-venus", .data = &msm8998_res, },
 	{ .compatible = "qcom,qcm2290-venus", .data = &qcm2290_res, },
 	{ .compatible = "qcom,sc7180-venus", .data = &sc7180_res, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,sc7280-venus", .data = &sc7280_res, },
+#endif
 	{ .compatible = "qcom,sdm660-venus", .data = &sdm660_res, },
 	{ .compatible = "qcom,sdm845-venus", .data = &sdm845_res, },
 	{ .compatible = "qcom,sdm845-venus-v2", .data = &sdm845_res_v2, },
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	{ .compatible = "qcom,sm8250-venus", .data = &sm8250_res, },
+#endif
 	{ }
 };
 MODULE_DEVICE_TABLE(of, venus_dt_match);
diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 7506f5d0f609..c7acacaa53b8 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -54,8 +54,10 @@ enum vpu_version {
 	VPU_VERSION_AR50,
 	VPU_VERSION_AR50_LITE,
 	VPU_VERSION_IRIS1,
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 	VPU_VERSION_IRIS2,
 	VPU_VERSION_IRIS2_1,
+#endif
 };
 
 struct firmware_version {
@@ -525,13 +527,22 @@ struct venus_inst {
 #define IS_V1(core)	((core)->res->hfi_version == HFI_VERSION_1XX)
 #define IS_V3(core)	((core)->res->hfi_version == HFI_VERSION_3XX)
 #define IS_V4(core)	((core)->res->hfi_version == HFI_VERSION_4XX)
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 #define IS_V6(core)	((core)->res->hfi_version == HFI_VERSION_6XX)
+#else
+#define IS_V6(core)	(0)
+#endif
 
 #define IS_AR50(core)		((core)->res->vpu_version == VPU_VERSION_AR50)
 #define IS_AR50_LITE(core)	((core)->res->vpu_version == VPU_VERSION_AR50_LITE)
 #define IS_IRIS1(core)		((core)->res->vpu_version == VPU_VERSION_IRIS1)
+#if (!IS_ENABLED(CONFIG_VIDEO_QCOM_IRIS))
 #define IS_IRIS2(core)		((core)->res->vpu_version == VPU_VERSION_IRIS2)
 #define IS_IRIS2_1(core)	((core)->res->vpu_version == VPU_VERSION_IRIS2_1)
+#else
+#define IS_IRIS2(core)		(0)
+#define IS_IRIS2_1(core)	(0)
+#endif
 
 static inline bool is_lite(struct venus_core *core)
 {

-- 
2.47.3

