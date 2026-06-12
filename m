Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2613A3E97
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781256365; cv=none; b=KPcnPk+rM47Mf7+0PzJdVhoXFwLLlBwu8soqwSbobHZgIsOpQFgUIvaZNwvFm1lp2s4vpuPjCiK5hBHi7maMF3vfhbePZsb38a1ofwhAheSFJmWLr/woSZvqidbu/WbtozoL+hXHTynrc54DW+ixGnQH64wt8oSs7GOz82XR+Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781256365; c=relaxed/simple;
	bh=xNsqm+B3LOE10tLNQts5eunxNV5RsjVx0kaWEOCN+lE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jA+ulVqiyO1eMoJUi9flVDvOgtwnIWINF9SfKdDvPCIJw5PliJ46JBEQTEQ3FZbqRYJQlJ5C9KzlF3xtILSw3ytSzvJWqLv5u9fAIGdjDI+eNT+K+XxRRAg6npkxf2ol3JMD4hiSkuWnTHEQYUdTWVF6nw2+8Y1NCPGShWqB+EI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lUUqjXkw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hKZEjSBw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lUUqjXkw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hKZEjSBw"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65C39Ngh2475823
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:26:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L9Ew5+SW+kC22+WMmYtdad6wVyhCdPtwJDrWQBFGf2w=; b=lUUqjXkwQsvvukaF
	plRq6OE5C7UNH3QrMFAOxxVJcK/Ty/0R4tKEWduwxn6ksGUKqvp570UfMhiwiMF+
	IXDJ/sqZYHOwcdio+TVb1e6gpAHG2fTgm1/DwNo3P3/G8V2D3/MedAVdUq2xpZtR
	lIuxSZETv9lXSImVrkMzstmlFobLWxFG9ocaMI6rowHu0sWlHETH7xqoEfBXUscf
	UbsTdQAtHNudNvpaCv2Vdomv9p/UAV9vG4lRoNraqBgQ3tlXzIrnaoi1iPHwTdJJ
	D4mqR0PnOvoAPfizgxm5HrYsz1NT4/3tWVca2m11HY+wq+9uSpHXQNTgL1AjjirM
	wGw/qQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2r5tcgx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 09:26:00 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6c67361f5easo1888391137.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 02:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781256360; x=1781861160; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L9Ew5+SW+kC22+WMmYtdad6wVyhCdPtwJDrWQBFGf2w=;
        b=hKZEjSBwM6h1ryKs8S1D1Pnrk2zBQdgtXpmK6KxEwc7f5dO47sHrmbT0B1ivzcENZC
         ICoONjoLvrCpwmrQwQZ3acCV3TFZVoY83wffbhzx+QGnW7+x+2MftbHMZnis7Ntk52uc
         6OadZ9DxcdLzqHSXYrrcoJpFqHnm9vtmbH6h1YqFobdJO1VoGrM2RCv/2nFlDip8GLbG
         e4hUuDOHtLCz5tKsQ2BhfvQ+xQkjUES4AKEcKrtl5ajep70ddLz/yaUx0NYpIV4XuXJ/
         NhV4L60BJpI7QHqPJcd0+clxARYJaebIkRumtuK6yD4qDH0sZEcSMiCDRWEhzuEGQmWe
         2UGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781256360; x=1781861160;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L9Ew5+SW+kC22+WMmYtdad6wVyhCdPtwJDrWQBFGf2w=;
        b=D2vyNKZ9G59Lup5ZtBhqSI0hGETsxP3xT2DSVN5CQ1+yDJ2ybJHb1hzhcWCpQ1TiCk
         bkmH0qAAjigH2fWB/1pSbsRwmhHe48JTZZfZzrkZyToLhoHChWZppJyJ7F3MIwr96he6
         HVkz/1DV9TwT7wgP/xhHFPA4hmgM/E+OnFYX9OTZCbwPI8HpvyWzX3cIa4vxq0CUOc5/
         iGcfnMgDZTA64e5Y5OHD0VJUk+5Wn9pUGghn+iBGTgc5PG78W5BV3a0PENA/WDGyiqdi
         L1+hLqDDGMPzwG1ktzIL8xHuU9YDgyYpApuhkC0SxU3EwMYA6juPksdz9MHQPk2cmeSk
         u7iA==
X-Forwarded-Encrypted: i=1; AFNElJ+ntOUxB4RDFT9CeWurfqxH3LhV3qM7IvCctI00ZPaw+2cMbq59O575uafxB9JgzYwlZtbsAQeEDoV6@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0qYW/i3Legqbu8/ZQnWtWP55+Z0jgtl94oVLGr1V9I69iR0SW
	ssfqWoCM1j3eezvF4f12zcJ2u7/qzKRS6Dwj4M27Zr1WoddWmE0pZu78GeB0hhYQsq5fIvpY8H+
	VPlOgPU1AlLaJvkxoP7jNRkn+0kA6fgLX0KsdgjulCpju0WASFZcyuXbYNhdJ0y6EiG0JoO+F
X-Gm-Gg: Acq92OHgjvYb0RTTBTMwwwFHCl6zaNCqgBtioPOIkh/ElfwmvUccMK5XYy2R+iL1ZQO
	UQlETDj2NDekXn7k/1ZlZrry7gl1TqNfQ+n9InvBBs5ioh8eiPQcC+hRcxs6Bq8abecPNKn96DX
	7aWccyhzSGJeBJ2C18TMQcadgtc4cDWyx7sRhHNlFiBLA45a/qLzEErOsgAT7c+oVAeW2PKkiBw
	c6SUHwKuUuQmZhWuy+GkR6Xx9w++g9UPvG6jlFj/0RUg4wIymGuENeG8QNNSAFuV6Zbo/OeSi82
	axMrHcpnbD7t72upWDpIsSzBugrNHkxNkOUyC+VRF5XV5s/2slmj4GIHICRKx8+1RcNZ0Xi17Yo
	hU0mS1BjNRLMxqpipb1Qq6sxaht4+IT1s5xS3hPmSd7SJpfLc5ILhc4Qs0xm8sU9DO9P7gV2k07
	D1Pw9nwrGPm8BQH3+2kbIw76VzMzhAWw6Z7K0=
X-Received: by 2002:a05:6102:61ca:20b0:6cb:b3db:c31c with SMTP id ada2fe7eead31-71e61ef611fmr671916137.0.1781256359616;
        Fri, 12 Jun 2026 02:25:59 -0700 (PDT)
X-Received: by 2002:a05:6102:61ca:20b0:6cb:b3db:c31c with SMTP id ada2fe7eead31-71e61ef611fmr671913137.0.1781256359166;
        Fri, 12 Jun 2026 02:25:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39929f190ddsm4560191fa.19.2026.06.12.02.25.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 02:25:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 12 Jun 2026 12:25:39 +0300
Subject: [PATCH v4 07/16] media: iris: Add platform flag for instantaneous
 bandwidth voting
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-iris-ar50lt-v4-7-0abfb74d5b3c@oss.qualcomm.com>
References: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
In-Reply-To: <20260612-iris-ar50lt-v4-0-0abfb74d5b3c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4991;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=RnwWFAaJcZbGFM4BPtgb/HiyJNOnSGTgdllJ6NoVDw0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqK9CQnqHoBieSia91XFs5XPA/VfkeCtH7g+3B5
 wUSJpPKYtKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaivQkAAKCRCLPIo+Aiko
 1St4CACEU1jg9eaZaKESXwgnhYwNZvjNIOSi+O1BL4emf9VdQ4dFvv0JS7KXW21XyNidiI2e+Nk
 VNWjNWVzbCKNKe1XwzI0kB5LZ05eBbrMfOQJ+cKyIxpHqp6uUhLtmwX8MMYdP5NuKdiB5UHpyph
 6Ru2asYwv67IjAbkjap+q06Cq6vfCzapKH3r/Yf79WKlZ/8uRgJRsVkulWdHCxJrPnXsTlrZ1ej
 nioAXXqeMASTNOWAae9cbZzemmdbBDlJOoxk/VRxwTnFJPePE29/BuiI7PRDRs0gbzpIBiWFnxX
 ig0e8B6M7bHrA+5virOIXEzJDZV5Hu6sWsWDKxhIMPKKK87l
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: LgBY01wZ5vHXIGccFf-86X0EiVLy6qF3
X-Proofpoint-GUID: LgBY01wZ5vHXIGccFf-86X0EiVLy6qF3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX68nPbpVEp+nR
 ROd0pMA9xQTd5PIINYTBXCTpc71BML2mUOP9MczOu1U0IGdXt6r/Hy4k7A5rM2xYbKO9ui0kEkC
 B7TbeqdwvxssESs/+2BRD3cnP/kkZvw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEyMDA4NCBTYWx0ZWRfX+BYDIpihP3lP
 QpwTRjHu6cSJ2Yk/yB88P7EKqAGYKkYBvT64CCRJLZK+7kkLGeKFY9OZi0+YOLLJDWFcHLeodjX
 mrdrB8fmPRSS6sYdrLlDsnsPSSCas6kenCWJt9979SQJAPSa3V4zUEEXU6bDqgAtSPi0CWlc1dB
 o0r8fDrWiT3/cvvv/yx3qNhWZrVRYHxCgQEVHdu+NBBmdLKznZ3YQsgGKUAwfIDdnq7C4Zzk+fd
 6fClcEWJh+42pqiIN8gXS4vFf9MwXYddg+G1VV+9t0ZxMBtaqVyy7mE1Dg5fAECCJyxSSPxFCem
 qupb1wdac9A53YVaMMWWKtotTLjF2/eEJAb11xWnJCnF27yx9lJa4JanVP5o0zi+eBmxV57GSyx
 onxwaaeyAT1R3lIczMfYG9X6N9yKbL5htktDpq+j+TbriQCJcXf1eK8YqFw3aUjOGt7KYR78ypw
 2p334aMjEuKDdPgKnvw==
X-Authority-Analysis: v=2.4 cv=M6p97Sws c=1 sm=1 tr=0 ts=6a2bd0a8 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=hZPXDZ8rEFHKWOVG6IQA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-12_01,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606120084

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
index 261db38a013b..64cf182d67cc 100644
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

