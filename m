Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACE247798C
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 15:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779463116; cv=none; b=mQ11DE5e6cs43WLaUmD1QF7ByEFjes0Dm+Jck8Xzoc1KJUJt11h08mEL5fqb/Cz0xsNVxVmiTrzYnBYdBsuA7zWIPozfrKSWMEoh2KPZ2llXbpJL4lG3CrH7JLKxW/76h+K41c04p/Cb9C31+mJ2fQvhyC0L1x4aQPlgZ7KRF/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779463116; c=relaxed/simple;
	bh=2fruTuJGgso+AVSjN86SFOWYtIxEi2oXmlzdSiu8LiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gBXUkw2HDgt5tqlxCEbsY3xsNO2tbE+GEvPifyftrWvlMX+5gv8b6YHuyhckLtfT2ey+4vBChGhggdUEZ/guvga2zGAa6v9MvUMpaLJeNkXqZqpHtsSlpQ0RGJl+9k2NIc9Tu2CQeSc/qbam9wmKGNgtDXMDaEwihIFzRd4JGr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHvfl8aZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CaqwGPct; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHvfl8aZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CaqwGPct"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M9p1cu312901
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 15:18:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c4wgPZzl341OGf2dUgGOsYttbVFxmjqeXYFCtkA02/8=; b=OHvfl8aZ/nYC9rck
	TE10u0vJ8/UUZ2UcshGddAF4VrHkrG5GkFmAocdo07MBj39ngLWHvAyqD487asLv
	TxrIaHYWlnKL5/u8d9st0o9isslGp7fQbKeGO1HSTTLqFA/OTv6pooxCw7vd7MY5
	CZGt2Rqy4dDGfwG6xh0NZcpNJu6IWoATKjsZP+4IHnbBgaBKflGoMgX5QZdDxW4J
	pJGtwkUv72wpNv/pGAzCptSaWO0BEqRRMYmeoaNeXcKIXNkC5KEwPY9oYOE7blvL
	k424ICQ8jp/v72Ozxrx8V+pi0aJ+74eJQtxjFPH0Hb9mwhwOEpntRz8KHwubst40
	C54eSg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea8834fpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 15:18:26 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8354503d9acso9294466b3a.1
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779463105; x=1780067905; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4wgPZzl341OGf2dUgGOsYttbVFxmjqeXYFCtkA02/8=;
        b=CaqwGPctH/Fxv07tJi5n66aaTEqjlEquS+TLNykWv4TDWc4U7aXIVQ6i+u0nu+9Jjb
         xA+HM8nWL/FxXLfpRrCpDKyy20B+Xxs+UjmUDridMC3Fyjre2QEKvhdiolrhG7BGFZXW
         tno47JlBK9MH75ZAu543hmnXJqQxrIiNmIVKkcVq62Gyx8TUFUdLw0FFvuteDG0vTXxz
         ex+gk2qeTDKcBmOcHDUxW6Bv19yFumDoxS4/kbzdNRhUC3LTI6x01edEv4HWZ7Mwq0Yu
         ds29+u/GZ7Wj+IMnKmUlVWEXsMn9PHZlbNIMoUNNnnAStvuGeM1jxoZcujJ9MkQ8Ll82
         gi8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779463105; x=1780067905;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c4wgPZzl341OGf2dUgGOsYttbVFxmjqeXYFCtkA02/8=;
        b=BRvhdYrJl1gV9Xk0w/9zVOZKnbvG0YPPuC3CYKO5DNfhRQ8cCnKA9bOwp7kommI4BK
         PcMqUhtGJAz70T+xcLBbyIKVqAD2by+anYqt35yanVzoeAWOHzD0qVvT0v8I6RESb01W
         2xx8RHarn9LznZ4jU76yElE6gMHw98K0gKYbc7Ds4ddtfnsJ9s9ukvvlPCOUDJdm5hlJ
         7+oF4xZ06uqY5wv4dayR+L+wwwcEEujACELEImGO1vlP53h2remHCqRYutJx9ZJkLpoq
         wjOFOAY1W1GsYc/U5P40bbJSOUcnGOTl0ilavI/di5mjLqgq2HLwvYi/eggUz88WsZUe
         qvIg==
X-Forwarded-Encrypted: i=1; AFNElJ+4/rtFi0SJUCoFDPDGNv/yOCwv6kZyQJwHXUkYr1Fi8p35JZPTGVnSUQisnI0yKbjNbvcIRrnQUZWK@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl3mriQwvxRWxWzWoJM0fYXOyUP9VvYp77pbcYe5T8ztf+4X82
	CXIVd5qY1ovFqvgd7pdWVB9WpCM4bnRGjGlV337zOYv2LqXdj22vdM0aqjWFL4vH2bt9m3TANEx
	8+hTi9BRyqezaN2OunKGcYz47dcS7Ulpm3NGWx1e0U6whJtR9gJwiRk65SPQPhl1O
X-Gm-Gg: Acq92OH5V8tZ5OkUikmTXjNR0SmWYIKJynaIJVaGhk6p69W1CgoQt9odA1XLn+BJ/3j
	xtc39A+K0ngupuIbii/uhC5WE94kcZ1WqqdqtAAwD8R1vMIGzfr8bw+7twvWE74hIT2+fniWAhs
	jSFqEIRY56fcLC103k3/oHRGoQZfFf9dBerOaXQpYYDrknr88Bw7WbgazixNC2TMr4TyPstTqom
	IPnxmsdiCXKHoSRCk/mDXDzWPkmVrB3x3H1nustOHkUGZhfU+hTwnxwQmoVbdZ00I1jkCUlaBnA
	ISGNlhg0I/mHOQf355+x82rFNXnyTWbygLEppuiy9JweBdHA7jj0J0hyFWTO3KLEXWhFejUFN3Q
	BNvrnrq7QEQVdPokzVeP7Igp6DisCn6wSQECnaL2cEZr0zgFt8LrU
X-Received: by 2002:a05:6a00:181f:b0:82f:aae5:c7a6 with SMTP id d2e1a72fcca58-8415f6613abmr4078487b3a.43.1779463105276;
        Fri, 22 May 2026 08:18:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:181f:b0:82f:aae5:c7a6 with SMTP id d2e1a72fcca58-8415f6613abmr4078454b3a.43.1779463104793;
        Fri, 22 May 2026 08:18:24 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fe97c0sm2083042b3a.53.2026.05.22.08.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 08:18:24 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 22 May 2026 20:46:23 +0530
Subject: [PATCH v4 2/2] cpufreq: qcom: Add cpufreq scaling support for
 Qualcomm Shikra SoC
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-shikra-cpufreq-scaling-v4-2-f042a25896c5@oss.qualcomm.com>
References: <20260522-shikra-cpufreq-scaling-v4-0-f042a25896c5@oss.qualcomm.com>
In-Reply-To: <20260522-shikra-cpufreq-scaling-v4-0-f042a25896c5@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE1MiBTYWx0ZWRfX6VGozFU2oQyP
 Z4uMTdkMxJRg65WFWtechRZV+oNfL1R+5Q24mElH/eXPfNyc9qC/Ke4GDatE/escmDlwzXC4WUj
 ogCDS7BB3q+3W3O99tReOi1kRjmheCKxm0wq3zp9upiSUK7/asemrPUdrKLNQ7uq9FBjJdpREZq
 isr3C6vMYLl1YfS1PsGSuCCvxg3ietVajhHIzYhj8grZzkyn38z9DNxo6l04bKEKdGaJ7H3Si9d
 KjX2XldS3YewRNsTbdZjrojNETucRfkyQ1De8wBMp/lNTWdzdtHbot7ZNlULmyNQqU4gwXgL6Zl
 HbHqcwqplZGwgUzDgDfSOBE25stC0zu8A8655Qx9UrvbZyj584gzk8zG4rAgQdFOlfBUGj0updX
 bjI6XnR2+/sq+Ovz4JShNMCIrrMCxzhnxxoDiErLCqhzagqgDwA3iRJj2OZmqCo2QQhVvfEiiGX
 BpO0143CcjdArhcPkBQ==
X-Proofpoint-GUID: lHRzNC_hIA6mce_p9KN6tJZbN6VVIob7
X-Proofpoint-ORIG-GUID: lHRzNC_hIA6mce_p9KN6tJZbN6VVIob7
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=6a1073c2 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=8xPgF8R1Jm-cxLKBqHoA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220152

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

