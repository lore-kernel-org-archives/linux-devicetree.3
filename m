Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980A33264CF
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 08:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781424336; cv=none; b=XDDln0KbQtWB75E/nx6WuOsab9+EqSUhvZWFo6n+K5P7eFnaeidrHho2ITGutGO1CBgJ1tmOx9FLx0M5qlmseMQGQH8lo4xs1+sVZaXMDAgcPgPiK7/hQC0G2z+o3s9BGzs1KxopYi92zo9VVJbT3O0Jq3UKSdDdvNS1znzTgcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781424336; c=relaxed/simple;
	bh=WIsZ63sCQ64dVMlhv7s4p6idYOqkQ1ABcVo8fUUo5wU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q+g3oN5cU8H2eVeJWaip5f7h2XQJY6ziaP26Miqj0qwSBY94GwDDAVV6p1qV/aAB5NDteFDBPA+zQ8B/GTDfIA1p5yfwwhRuxSoKfOD9aCCRoKOZThGNn463K/3+reeFq2yOA+TcWy2h+nFwHO33RNlESwElcKjZ9Pr5UyWw5Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XrNnb0zC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KeZoF8XA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XrNnb0zC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KeZoF8XA"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65E4AtXA626249
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 08:05:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R9Rksv4cSEYx49OcGoEBr2k/skvGa3ntd8d7f4HoDII=; b=XrNnb0zCHed7tqcX
	CQtZFlCgML1e2xclsB4E0y4Bs0Z9DYY6KTRymIXkAYY0nbQMNodPQMjM7k8qbHhT
	l3A9k/Qf5BIT7FupHx1P+TzMTapUlUFPFCMpf9j7cchR4TY4I5kSAB9DoqSiVSVn
	7ibkGF5SAzVJi4Q8VQMrD069Epr7LIv+IDBck2ZCtGdaxoc1N/O/cNu0/eubZ9Rg
	cbFS+4WrDAbdkSkfYYmvC8RhZ0q0eQuderZ36+aPOvRwKAZTaeSxIIIlMFt1F/dL
	tp2JEgwh1axxPWkH0Swpw3P/pbnT4ar0zoAHz0bSPS+7B0N2Lr37FzR0lKHixZ2p
	UgQrrg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery7gu375-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 08:05:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c2d65d9773so22611335ad.0
        for <devicetree@vger.kernel.org>; Sun, 14 Jun 2026 01:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781424332; x=1782029132; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R9Rksv4cSEYx49OcGoEBr2k/skvGa3ntd8d7f4HoDII=;
        b=KeZoF8XA/IL1pd1mrxXeM9Gwj2liCf1ZVZjBkY9jHn2QUeFFsZNc24XlXWgc4Woh1y
         Y27Y5nykP0xE7UQguD154SLt9daqtsR28Mfei+oUYnaUetHB0D+1Lfhlz3U2Bfwgxa2O
         mLTbrqxYV2pMle8WxxBzCOTFce1t4gdEAZLSA8xyQ2MDldq/mCF+tsXt3jKwfev/+btQ
         +ysVUd40weiiFTopc1/02/KVwy4OFlwdxHuTsVBtIyGNfv5fZuuHNQRRV8HKDx1pLmFy
         VgzG1O3VdryE5w6ZTNzObHSm4e1YLyz4Tx5PGWnHOlTmeK5DeW+dkY7i+eYD+dtA2+2T
         iW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781424332; x=1782029132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R9Rksv4cSEYx49OcGoEBr2k/skvGa3ntd8d7f4HoDII=;
        b=sjyLxP2/1JXgMVZNe2MrCyHQS81RoMjGa7zqvX+0IyBE9y1oY9iFCDQsGc12aRKWM3
         7ogHiv58acIqz/Js61zosl5vVhOqzkdibrlCn3U2gcWRrhdbjiLZ5S10dkuy1Wc7x5lJ
         LQHLJzIXKfwndP9wNVUbDa9b2bxnQADBj49CTIAPWPAesBol8oexUA7/jaxoZn4Hugrr
         360ZZbJiO5rosb8CKj7gz3swLa3Q9zYW9fGfi7/Eikc16FuDLuHkdatfatcfpCijTEcd
         lybIybhxxPYwwLflKS+yYQYOzcDAsZiEwVhy62YaI31+5spHNvTYdqBn9K6c1I+eMHGy
         c3Qw==
X-Forwarded-Encrypted: i=1; AFNElJ8gwdwpWvDun/jRHXyTCEAX/RxwlXmzWpisSZkuxP3VAyoQlP82XJ548RGxxTpqitinHBUD/lj6fBSO@vger.kernel.org
X-Gm-Message-State: AOJu0YxuA2EftVWqGH9H+eNNbqxRjEYqU7Ki+K1wZgl/oFlsacz42Ouv
	VmkGoX9uDVJu8ODaMUfP827+m8kLGKgNnZKn3ZQU0gdYFSw/cFmGE5zOCMSMNK6qI9SEbYdKlPN
	he2O9iphmuDmlafTmlRbGLpYWSN5AlTd3J+Cn9fLX44dFKjShwQzqcq1G6dY2tumTSWAEDkzT
X-Gm-Gg: Acq92OH1YIvkJ0E+3uz2atp/63mHlfTl4SQj8stJoLMqbdOR2PncqEGAdvME3nBZuWL
	kiMjP65/JUWOumVAxM5t8R+sf+PkVbZtkJM2vzfRffAnryrid1ktk8kdO5e59MCVWQvJe0o+/Hi
	iFKLbAwXdAlXf29eqtMk85887vGHfOsfReMnOsYvWS6pw4gbfznRgMCZHG5Lu/JuNSJUHtABt0u
	rqMdsnPOn33yaEmHUbM30q/0TRaPCzkmu9YrAWLg0URkt7SajoN0OndXXJcXM11r4BfGd9JWerQ
	o4+r68CaRrNPcihddbdxSnV1r0pAEh18ySwN8LBxtKhu8aKgMoqMlGYsCrneK3jN59bV7cfr2JE
	pA6teo45IZ6oy/uxpuHyo+vsIxijBGz+yXay4v69l
X-Received: by 2002:a17:902:f64e:b0:2bf:2015:5b94 with SMTP id d9443c01a7336-2c4104118damr107951295ad.3.1781424332446;
        Sun, 14 Jun 2026 01:05:32 -0700 (PDT)
X-Received: by 2002:a17:902:f64e:b0:2bf:2015:5b94 with SMTP id d9443c01a7336-2c4104118damr107950975ad.3.1781424331938;
        Sun, 14 Jun 2026 01:05:31 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8ca31sm67309225ad.55.2026.06.14.01.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 01:05:31 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Sun, 14 Jun 2026 13:35:08 +0530
Subject: [PATCH v2 1/4] arm64: dts: qcom: Add header file for ADC5 Gen3
 channel macros
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260614-adc5_gen3_dt-v2-1-32ec576c5865@oss.qualcomm.com>
References: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
In-Reply-To: <20260614-adc5_gen3_dt-v2-0-32ec576c5865@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayyagari Ushasreevalli <aushasre@qti.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781424323; l=4937;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=WIsZ63sCQ64dVMlhv7s4p6idYOqkQ1ABcVo8fUUo5wU=;
 b=5dM7ykcV5A26umbHWnnWpcS+4jfgcX3c+LrbICItVRiSnkUbe2Gx7d30xdTrWZTSAtX5ZS3LH
 IR68NFj2ySADrrPuQBRrMlNnk/YNEqwLjWxhk00O7BMGojRLYcnGoZu
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDA3OSBTYWx0ZWRfXz8h8tywO0SV/
 Hc+6yaELX52oCQR/F+6btPAoVRH2Uhua3HzPKH7tZhGSI2oZwilJlEGMVJfZI478z+ygV+1Jj2E
 bq4S6Mt3HcFmuhfw4ZqHtsAcmRSqfMs=
X-Authority-Analysis: v=2.4 cv=fLYJG5ae c=1 sm=1 tr=0 ts=6a2e60cd cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=uKufQnq3ocnfyFJwv7kA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDA3OSBTYWx0ZWRfX9axhU32AF2jF
 TmfCdTuoxKu//mvi7Sh5vPsAVG2ogF7aKICBL5MrEQQGcwA8KJ1iyQPxPa1Dx2tq6F1LvIZLFBd
 U66pAiTniMSRtacfXn1MIj3TmhOXjDC0n/wyltrsZx6DAchNbyqHxAQxliOst8ytJqAU0UTSQ8f
 fVj2Oa8AgGZBw7ZHdrfCcui+Idis4xczvxAvoIlTx+DhiFK1eKFe6aF/4OnnWB2yaxU6mm5vwPm
 OIi4ff0u1DcI7f1vb9vqNPyA+N26SPi7qWR+8dvpOIFW0eKEfsOE6UWj5FbIus3oqU0clQYCXWh
 m4b4vpT8V1EcUpRrfiO1ANEqTcvlxAqi+Uc5CFF5g6SBzDsGz3/Ul2JzWlYiLlmGxTFhd5fZaAB
 1AOfhWWrdKJnGAS7DuwtxEVbpJlV0NnM+LCeTcSHSnEs+AHRi8biCqnl1enMk+CKTljL2BhRb4R
 ErBctvjLbL5cvawbl3Q==
X-Proofpoint-GUID: p00fYcYsiSUAgBK7HkrV5G_rNm5rwWr-
X-Proofpoint-ORIG-GUID: p00fYcYsiSUAgBK7HkrV5G_rNm5rwWr-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606140079

Add macro definitions for virtual channels (combination of ADC channel
number and PMIC SID number), to be used in devicetree by clients of ADC5
GEN3 device and in the "reg" property of ADC channels.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h | 88 +++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h b/arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h
new file mode 100644
index 000000000000..aa8e54d7e786
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcom-adc5-gen3.h
@@ -0,0 +1,88 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DTS_ARM64_QCOM_ADC5_GEN3_H__
+#define __DTS_ARM64_QCOM_ADC5_GEN3_H__
+
+/* ADC channels for PMIC5 Gen3 */
+
+#define VIRT_CHAN(sid, chan)			((sid) << 8 | (chan))
+
+#define ADC5_GEN3_REF_GND(sid)			VIRT_CHAN(sid, 0x00)
+#define ADC5_GEN3_1P25VREF(sid)			VIRT_CHAN(sid, 0x01)
+#define ADC5_GEN3_VREF_VADC(sid)		VIRT_CHAN(sid, 0x02)
+#define ADC5_GEN3_DIE_TEMP(sid)			VIRT_CHAN(sid, 0x03)
+
+#define ADC5_GEN3_AMUX1_THM(sid)		VIRT_CHAN(sid, 0x04)
+#define ADC5_GEN3_AMUX2_THM(sid)		VIRT_CHAN(sid, 0x05)
+#define ADC5_GEN3_AMUX3_THM(sid)		VIRT_CHAN(sid, 0x06)
+#define ADC5_GEN3_AMUX4_THM(sid)		VIRT_CHAN(sid, 0x07)
+#define ADC5_GEN3_AMUX5_THM(sid)		VIRT_CHAN(sid, 0x08)
+#define ADC5_GEN3_AMUX6_THM(sid)		VIRT_CHAN(sid, 0x09)
+#define ADC5_GEN3_AMUX1_GPIO(sid)		VIRT_CHAN(sid, 0x0a)
+#define ADC5_GEN3_AMUX2_GPIO(sid)		VIRT_CHAN(sid, 0x0b)
+#define ADC5_GEN3_AMUX3_GPIO(sid)		VIRT_CHAN(sid, 0x0c)
+#define ADC5_GEN3_AMUX4_GPIO(sid)		VIRT_CHAN(sid, 0x0d)
+
+#define ADC5_GEN3_CHG_TEMP(sid)			VIRT_CHAN(sid, 0x10)
+#define ADC5_GEN3_USB_SNS_V_16(sid)		VIRT_CHAN(sid, 0x11)
+#define ADC5_GEN3_VIN_DIV16_MUX(sid)		VIRT_CHAN(sid, 0x12)
+#define ADC5_GEN3_VREF_BAT_THERM(sid)		VIRT_CHAN(sid, 0x15)
+#define ADC5_GEN3_IIN_FB(sid)			VIRT_CHAN(sid, 0x17)
+#define ADC5_GEN3_TEMP_ALARM_LITE(sid)		VIRT_CHAN(sid, 0x18)
+#define ADC5_GEN3_IIN_SMB(sid)			VIRT_CHAN(sid, 0x19)
+#define ADC5_GEN3_ICHG_SMB(sid)			VIRT_CHAN(sid, 0x1b)
+#define ADC5_GEN3_ICHG_FB(sid)			VIRT_CHAN(sid, 0xa1)
+
+/* 30k pull-up */
+#define ADC5_GEN3_AMUX1_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x24)
+#define ADC5_GEN3_AMUX2_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x25)
+#define ADC5_GEN3_AMUX3_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x26)
+#define ADC5_GEN3_AMUX4_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x27)
+#define ADC5_GEN3_AMUX5_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x28)
+#define ADC5_GEN3_AMUX6_THM_30K_PU(sid)		VIRT_CHAN(sid, 0x29)
+#define ADC5_GEN3_AMUX1_GPIO_30K_PU(sid)	VIRT_CHAN(sid, 0x2a)
+#define ADC5_GEN3_AMUX2_GPIO_30K_PU(sid)	VIRT_CHAN(sid, 0x2b)
+#define ADC5_GEN3_AMUX3_GPIO_30K_PU(sid)	VIRT_CHAN(sid, 0x2c)
+#define ADC5_GEN3_AMUX4_GPIO_30K_PU(sid)	VIRT_CHAN(sid, 0x2d)
+
+/* 100k pull-up */
+#define ADC5_GEN3_AMUX1_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x44)
+#define ADC5_GEN3_AMUX2_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x45)
+#define ADC5_GEN3_AMUX3_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x46)
+#define ADC5_GEN3_AMUX4_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x47)
+#define ADC5_GEN3_AMUX5_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x48)
+#define ADC5_GEN3_AMUX6_THM_100K_PU(sid)	VIRT_CHAN(sid, 0x49)
+#define ADC5_GEN3_AMUX1_GPIO_100K_PU(sid)	VIRT_CHAN(sid, 0x4a)
+#define ADC5_GEN3_AMUX2_GPIO_100K_PU(sid)	VIRT_CHAN(sid, 0x4b)
+#define ADC5_GEN3_AMUX3_GPIO_100K_PU(sid)	VIRT_CHAN(sid, 0x4c)
+#define ADC5_GEN3_AMUX4_GPIO_100K_PU(sid)	VIRT_CHAN(sid, 0x4d)
+
+/* 400k pull-up */
+#define ADC5_GEN3_AMUX1_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x64)
+#define ADC5_GEN3_AMUX2_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x65)
+#define ADC5_GEN3_AMUX3_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x66)
+#define ADC5_GEN3_AMUX4_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x67)
+#define ADC5_GEN3_AMUX5_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x68)
+#define ADC5_GEN3_AMUX6_THM_400K_PU(sid)	VIRT_CHAN(sid, 0x69)
+#define ADC5_GEN3_AMUX1_GPIO_400K_PU(sid)	VIRT_CHAN(sid, 0x6a)
+#define ADC5_GEN3_AMUX2_GPIO_400K_PU(sid)	VIRT_CHAN(sid, 0x6b)
+#define ADC5_GEN3_AMUX3_GPIO_400K_PU(sid)	VIRT_CHAN(sid, 0x6c)
+#define ADC5_GEN3_AMUX4_GPIO_400K_PU(sid)	VIRT_CHAN(sid, 0x6d)
+
+/* 1/3 Divider */
+#define ADC5_GEN3_AMUX1_GPIO_DIV3(sid)		VIRT_CHAN(sid, 0x8a)
+#define ADC5_GEN3_AMUX2_GPIO_DIV3(sid)		VIRT_CHAN(sid, 0x8b)
+#define ADC5_GEN3_AMUX3_GPIO_DIV3(sid)		VIRT_CHAN(sid, 0x8c)
+#define ADC5_GEN3_AMUX4_GPIO_DIV3(sid)		VIRT_CHAN(sid, 0x8d)
+
+#define ADC5_GEN3_VPH_PWR(sid)			VIRT_CHAN(sid, 0x8e)
+#define ADC5_GEN3_VBAT_SNS_QBG(sid)		VIRT_CHAN(sid, 0x8f)
+
+#define ADC5_GEN3_VBAT_SNS_CHGR(sid)		VIRT_CHAN(sid, 0x94)
+#define ADC5_GEN3_VBAT_2S_MID_QBG(sid)		VIRT_CHAN(sid, 0x96)
+#define ADC5_GEN3_VBAT_2S_MID_CHGR(sid)		VIRT_CHAN(sid, 0x9d)
+
+#endif /* __DTS_ARM64_QCOM_ADC5_GEN3_H__ */

-- 
2.43.0

