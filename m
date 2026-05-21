Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EA33B1022
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 14:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372394; cv=none; b=dxpONI4M6fJbYncvGxOUD41lhHFYGc9SAtmHHqywJ+9iRsjzcJrY0/PAgexTuDXuSXdBqCOKTrSGcdA/8PgnmvTgrJ9nrj1M0HQh1Dlc2kW0GBHtljsLn685uiVLaVSdc9+PvNlfdn+Vo/J+5fvKQF00TC70/8jiHBFjFzKizxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372394; c=relaxed/simple;
	bh=2fruTuJGgso+AVSjN86SFOWYtIxEi2oXmlzdSiu8LiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fsGYoY8nuFpUuP4Og/VrAtlvF5nblEnPLY7q99RMbp7zsIbH0uk/zggrVd1HJ4s0r0DMe2TeUhFk002KTfZ+9jclVDdGktoUcZVw1C4i3BGV9fl5LCdq66EhpdwHNpOuXXvRgZ/rMn8qeCDyO8L7vRYYycNbJcC46xJX6UGm2p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DZb3c1U4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XDQ08mDe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DZb3c1U4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XDQ08mDe"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99n3j3009474
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 14:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c4wgPZzl341OGf2dUgGOsYttbVFxmjqeXYFCtkA02/8=; b=DZb3c1U4hANrkUez
	MWm5LxJ7zfcX6bniI46n54ufgbPmzvvoR52OhokQlOP1Qkq2MIcvAg/j4b3itzPS
	d7YoJmcMb/RvrRwDWtAmIcrOCRiNB/ehC/1zaHlXQa0tA0498pLdSr/jOhpiLzWo
	+sz9PLV9/43EZ0TUq1csNxUlbhcPdOSbK2ejTnDyTOq+2Fh6KnqHjiA/SjQ7H/mb
	6nCu1bhl+S+RVkw1fFGJhqbPYgtGmdyUrYcH1ycoh1GgaQUkx1HyLOh/3atyDztN
	bMtkzAbvEfGVqWs7AYpbSsfFtbRZpvS8Eau2IfPSmsxN+zoszwbz4RxfKepZGhlD
	CeGkxg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9sr32ja6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 14:06:32 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7bd5c9e2e4aso63521697b3.2
        for <devicetree@vger.kernel.org>; Thu, 21 May 2026 07:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779372392; x=1779977192; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4wgPZzl341OGf2dUgGOsYttbVFxmjqeXYFCtkA02/8=;
        b=XDQ08mDesHFURKb/KLTJw9D0fsLKcheWKC5NCgUzswOJX7PB7offQsmhUDWF2hOdkg
         zZoLHifLXPCUJaNDuzCn94Mqjw4FOmovzBxcnwe0iIn2zMDthNK33sRi/EjPdyDyGinT
         NsFuXuTZYN+RcExp89J5TQz3pQWEX09q4a1ZlKmRX3udispAV+Uguo7qaPmZU7duunAL
         yhOuqGrSfWWycdIwTspCAKtKoll7S5sLkGYJoekkY+CvwINq67KYzxMszE6dS3nUgd2k
         mxRRKT0u6hhWEhzpeh7OP6kXp/LmXeBccD8hKgW+JigNhYCATqve+37lHn9zuh0bfeqt
         vMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779372392; x=1779977192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c4wgPZzl341OGf2dUgGOsYttbVFxmjqeXYFCtkA02/8=;
        b=fCT68VPWL29HgE0KtvsoEqNyE6TtYIlh0ux1g279GHCNXKnjGNITkI6WEyeXdldhPl
         NJrnbJZVo8I39I3A0wEWxRLiz3wG3eWLlWn/6tHiWY9XJsplm9PRYEOKlsWFYXMDMznh
         8xZTos8iioFr+wo84AFz2cCTazf8smIp8osiPWMk74pJisoaVvcDCjroe47dk/DJnZ2t
         RwAj8KDYF//A/dSKj+KcUw92eC7mYYkGyT+eAjX5kEOsKDBHSIlPts8ofi5M4EKqY8+K
         Frr+tpnMkFoUH688owGzgn1mZBORMyua+tZ+2Q8GSMm36VtyMSWUytpiqxhvq2dpDtn/
         aiGg==
X-Forwarded-Encrypted: i=1; AFNElJ/xNopRPudcjY4JK3PJG++c2nzsB42DonI2ihSzKDMMqg5f0z3Qz4/aVWtrb/2UnF/Yi4poR+361Vzy@vger.kernel.org
X-Gm-Message-State: AOJu0YzCzD2xG5gqm6x70Ordph01zosTT++izhfSWTPTZbEXQQfD8XhJ
	ZePqsLbctdPkUsqtbRkzsfWRPFwiTkZnQxaDjeYmj4H9hjJ3LvB0KWVnDQ8RAAFhqpdvnSYfN8M
	bhuZh1nqZ8ZhauWdkDZVcLpPnGFO8cqWbm7zd+XgRs6zWFkdMyuzfP9uZ0rZUOWTh
X-Gm-Gg: Acq92OFho8lj0OxOCwQGQlCnNANjuY6wHrC17PlWtMJA+eg0u0v85Bw+MHaff/MCPaa
	RwqODBdKikW0X4g8ozLS8ZgZL2Rl31mkIlahjI3o9j/5SZ8cqmD6FT6aFK3Te5j/kH7SRnA0oPb
	NEmn2GFn3lYX8AF7DCE1ShbvOCQCfAPF2Zs59St8p/9Tp+i0WMi71f474tlGCshHpRC5inpfe5D
	J4elzWO9GIJyVtdYjq68wumFUp57P0fQg+2bkSqZ5O+4FZI3OxmXQFuRDA83cjq0PRXCamEKlIP
	6AmVswrwqr2vpqWucC4lxdeLUmmTAz5Hs5+IQRG3Pe5i7ISSnZlGgwOQrYvOmzMW8kFtgoXrMUL
	zaObot9yFiFbwQVFA9GKFztUiQfeRIazQJ+17Zj/wxELeEi93/0Ge
X-Received: by 2002:a05:690c:6213:b0:7cf:d9bc:808b with SMTP id 00721157ae682-7d20c940a74mr29415867b3.23.1779372391666;
        Thu, 21 May 2026 07:06:31 -0700 (PDT)
X-Received: by 2002:a05:690c:6213:b0:7cf:d9bc:808b with SMTP id 00721157ae682-7d20c940a74mr29415057b3.23.1779372391070;
        Thu, 21 May 2026 07:06:31 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d2cab7a5f9sm2920677b3.39.2026.05.21.07.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:06:30 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 21 May 2026 19:36:05 +0530
Subject: [PATCH v3 2/2] cpufreq: qcom: Add cpufreq scaling support for
 Qualcomm Shikra SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-shikra-cpufreq-scaling-v3-2-883c13d1e514@oss.qualcomm.com>
References: <20260521-shikra-cpufreq-scaling-v3-0-883c13d1e514@oss.qualcomm.com>
In-Reply-To: <20260521-shikra-cpufreq-scaling-v3-0-883c13d1e514@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: X8xu9Z1XcT1sqvOGVG6yRrbeh6mNntBg
X-Proofpoint-ORIG-GUID: X8xu9Z1XcT1sqvOGVG6yRrbeh6mNntBg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDE0MiBTYWx0ZWRfX3FuOLFUlKHOi
 spVYd/1wqZ7eA3Bp/C+9h/q4bhq3HF9OcJJ7QPfcHOqyQ2nyxEYqAq/qz9xktbfLveaCL9Be2O2
 ObEgn/6RWJkHQbA9gHYE6oKG7+6W65+DrS2JBOGQPnBMabC0WxgUJRHCuajLwjjBQyHTj0Q7PGQ
 xVP/+8oj3FNRyDrR+y+QqEarVIU+Ip3IxWilMVQg3NWqtVl6yks29fufYi+2lQpQLn7LoQmAyZC
 JoqZyYCHJ76eewwJkrD+Fw36w7jBruac1L2ujp7dTCtBBdwSWxPa8+Tmy9k4cRTg79EKafnW/FK
 LA2qoYzf7HCkLmoGxneuQ3cJvfSjgxkWOFZ/en8o67R3E50TiqUgvfCLxL8Usp27+X2LK5grKnE
 bJ2noSo03QXrmfdk3gLtn426KYNgMc4cF1Hs11QFhuKtA+0FmOmd1Y5BmxU2EtSwAIPikCMRYsB
 X0NV6DqYQEeDGI24DjA==
X-Authority-Analysis: v=2.4 cv=L+YtheT8 c=1 sm=1 tr=0 ts=6a0f1168 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=8xPgF8R1Jm-cxLKBqHoA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210142

From: Taniya Das <taniya.das@oss.qualcomm.com>

The Qualcomm Shikra cpufreq hardware is functionally identical to EPSS,
but supports only up to 12 frequency lookup table (LUT) entries. When all
12 entries are populated, the existing repetitive LUT entry check may read
beyond valid entries and expose incorrect frequencies. Hence, introduce
shikra_epss_soc_data that reuses EPSS configuration with appropriate LUT
entries limit.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/cpufreq/qcom-cpufreq-hw.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/cpufreq/qcom-cpufreq-hw.c b/drivers/cpufreq/qcom-cpufreq-hw.c
index ea9a20d27b8fdceb9341ee53e5fa27b7a6d92483..3d5a865fb8a35e112cb4d040fb519e2c122a91dc 100644
--- a/drivers/cpufreq/qcom-cpufreq-hw.c
+++ b/drivers/cpufreq/qcom-cpufreq-hw.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/bitfield.h>
@@ -40,6 +41,7 @@ struct qcom_cpufreq_soc_data {
 	u32 reg_intr_clr;
 	u32 reg_current_vote;
 	u32 reg_perf_state;
+	u32 lut_max_entries;
 	u8 lut_row_size;
 };
 
@@ -156,7 +158,7 @@ static unsigned int qcom_cpufreq_get_freq(struct cpufreq_policy *policy)
 	soc_data = qcom_cpufreq.soc_data;
 
 	index = readl_relaxed(data->base + soc_data->reg_perf_state);
-	index = min(index, LUT_MAX_ENTRIES - 1);
+	index = min(index, soc_data->lut_max_entries - 1);
 
 	return policy->freq_table[index].frequency;
 }
@@ -211,7 +213,7 @@ static int qcom_cpufreq_hw_read_lut(struct device *cpu_dev,
 	struct qcom_cpufreq_data *drv_data = policy->driver_data;
 	const struct qcom_cpufreq_soc_data *soc_data = qcom_cpufreq.soc_data;
 
-	table = kzalloc_objs(*table, LUT_MAX_ENTRIES + 1);
+	table = kzalloc_objs(*table, soc_data->lut_max_entries + 1);
 	if (!table)
 		return -ENOMEM;
 
@@ -236,7 +238,7 @@ static int qcom_cpufreq_hw_read_lut(struct device *cpu_dev,
 		icc_scaling_enabled = false;
 	}
 
-	for (i = 0; i < LUT_MAX_ENTRIES; i++) {
+	for (i = 0; i < soc_data->lut_max_entries; i++) {
 		data = readl_relaxed(drv_data->base + soc_data->reg_freq_lut +
 				      i * soc_data->lut_row_size);
 		src = FIELD_GET(LUT_SRC, data);
@@ -405,6 +407,7 @@ static const struct qcom_cpufreq_soc_data qcom_soc_data = {
 	.reg_current_vote = 0x704,
 	.reg_perf_state = 0x920,
 	.lut_row_size = 32,
+	.lut_max_entries = LUT_MAX_ENTRIES,
 };
 
 static const struct qcom_cpufreq_soc_data epss_soc_data = {
@@ -416,11 +419,25 @@ static const struct qcom_cpufreq_soc_data epss_soc_data = {
 	.reg_intr_clr = 0x308,
 	.reg_perf_state = 0x320,
 	.lut_row_size = 4,
+	.lut_max_entries = LUT_MAX_ENTRIES,
+};
+
+static const struct qcom_cpufreq_soc_data shikra_epss_soc_data = {
+	.reg_enable = 0x0,
+	.reg_domain_state = 0x20,
+	.reg_dcvs_ctrl = 0xb0,
+	.reg_freq_lut = 0x100,
+	.reg_volt_lut = 0x200,
+	.reg_intr_clr = 0x308,
+	.reg_perf_state = 0x320,
+	.lut_row_size = 4,
+	.lut_max_entries = 12,
 };
 
 static const struct of_device_id qcom_cpufreq_hw_match[] = {
 	{ .compatible = "qcom,cpufreq-hw", .data = &qcom_soc_data },
 	{ .compatible = "qcom,cpufreq-epss", .data = &epss_soc_data },
+	{ .compatible = "qcom,shikra-epss", .data = &shikra_epss_soc_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_cpufreq_hw_match);

-- 
2.34.1

