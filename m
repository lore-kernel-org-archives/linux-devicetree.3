Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A75A34E741
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 16:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776702615; cv=none; b=Cehnqwf42TkQ8L9HTDPNq6nLpsaqlDtdQrsBwvYp/63eDCx8Y5qj9qTqSOwWyYGw73rVeJMxzfU2LUO3i/mlXu9IpbGH/X/Ci2mW3S54Q8mJxFS+wYgdnu3Py01dg/aac3pf0NS4hgIWSa6Gwe+L/AmOYAwlUKd9V50inEhQMFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776702615; c=relaxed/simple;
	bh=f2wjz92I0Sbbb8BOJs0/4SrTPSaL+5OM0B7Xf9WaqAk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jkwfvEGkf+N5euADtJGfZNNYyZDU04Q4IDI6/xjK6Z0PMErZ1C6soi+TdwD4l+QFsqZPgva+5UFkYxgVrTza9ziXjGFwU3AsCAZFL2tyNsdmykByIyuSY0ouK+H0sQPE9ztKLOBeNALsJIb13I+nuNTMHu24YiMyHWSODAqKTz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aPTf7d43; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fPWQYd5f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aPTf7d43";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fPWQYd5f"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63KBFbQZ1598277
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 16:30:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cj8JODyzns33JEy+VFqUGn3ybiwxgn9uIU1bz6Z3n60=; b=aPTf7d43qKmhp/eA
	QVlEYDTJQT/NxbPAVY2GbsqT0wWlNAy0dMA8JrytxlTdS/k+F+Tvzkl+8TisXaVp
	4YgOfsBl+Cbl3hIkAaWRLdThjuHl9rrDTCn8umJd17oieoWQVM6Glybsg+pqhjku
	xymy/CjJnmqM94Lddb7VojyVz/ggujNSWzYL6AxDI+3wduDD9GvWiYYUSqwH2HdE
	KUHuS8vfSpKIjgx85dnQE2gGq6EX5J/xKfcCiHeCXExuyMyeQS8sNpM7pKHOa7K0
	vNZuBgqjg/G0cO2Bj18SDIBpl3zmBj78eE16rU+nVS7tHqoEoJ9o8CNaKdKh2Udc
	XlvWgw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dnfgnjbmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 16:30:13 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c798ace3e03so517244a12.0
        for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 09:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776702613; x=1777307413; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cj8JODyzns33JEy+VFqUGn3ybiwxgn9uIU1bz6Z3n60=;
        b=fPWQYd5fwmtWPpixsvHLxf/EVPZQq7QPTBpQtS/pQ9U7G3iLg0+511jpss7NapXhNZ
         ZlmOtKbZnfY6ZF5y8Q4t08hs7jWmQCNbuJkDKG2bMz1gcz50sh4OU054s+busox6Zl/4
         wp3EAFRBGNGi7VnnHYGeo2K7Otj9awx965H5Byz0q9AXuPJ/ekDoc0ij6YXzfvKGEsr1
         zRx13eN0ZiaKXIjt0ZEcebehl5b8C3mJZdTgAYV78pvPfNqo/+onenI/F8CDITSBkY2a
         2TewS0a0x+WfV1/4QSUUSSVi+fTLWMKCmufLomMwkGZlNa4mycNF/ZFWEVZtZsG3jECA
         Ag3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776702613; x=1777307413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cj8JODyzns33JEy+VFqUGn3ybiwxgn9uIU1bz6Z3n60=;
        b=L+pN5W8TX/7DzULSbzcrYajt35xliL74ah4fBiX9QbO4nKjYOFSwP3Q+UMMubpSaQq
         p5w+o2Q78sj6k7zasnBvEQSCyUUuOPtJ870IQ73R38Nrb4TSpziQmXg1diVG98pyLFpc
         aG9UfqLKSw45Oi4ZPbyTWpFCZMEekWHmS90HfOAwBq/69KHqMChIHh8dXh8/eZnFgofc
         BK2hI0lVHKmOW5OIe5mzhz1S4YU0Ln/+KmeDWL69x6DF/gUgWWj2x38rIu6YatqNrm7F
         X52KKVsQbX4ORkjivsP9Rvhl1VmnQupgI+UnFAmkwV/45tPapWdCbIiRAbSv/HaIDa1E
         l3pA==
X-Forwarded-Encrypted: i=1; AFNElJ91ozx710olDJqYssSDsvcJXk4SkygH7XKAIgtkGk7sbIszQESQDpwg+A7nPSduq5i8pu21eoLlcAcE@vger.kernel.org
X-Gm-Message-State: AOJu0YygTTFJRjU7u+Z0pqsPidwS0V8/sf8rRxcmtNfwH+s9suWAeVhN
	dQzDpFsHewf61pgv9U1pktFZxEbf9juZ5nk6n40luOZsWd7fnhyYefIPRTTwFKzl5VfAezAYrZ9
	j40OKYfJxsUOfT1YbTy7H0aPzKC04MjzP6c8zSv+s4TqcQ62kyii+AnxcSleBjoxI
X-Gm-Gg: AeBDievwhGmFUVSd0S0i8rRy9um12GV6rojw/4bfz6T9Z+Q6XHpwMCqQXkpNRSA9OWz
	/3JE4gzugVcXv+ot2s8pZkKr52GKoP0xVBp7ZUxJ+/GFANaQyOPpDT/nKDzyfgxx+PqeRqxgvCQ
	BQ0ybbnDRzLu5yyKLCMwiCHImYQhNW2Qi/N+vHcXA6w9sY8XnKgaA1Fe1cfGdAOEWhULWN5VApC
	uZov7iZ14F1jaCGYHOZ1NKkKJGPzVF0KMmbZyd7id+u8adq9LedtFCFs3mcLpgwM3Jj0+s/MrJD
	mHmcZ8P92jnqKj/KhHbloOmOk1vrfxkkY6c2DppXdyaRi1fHTRcz8VfChihXC8DDbUVbqoOP2jR
	gYlzpsjqLf75/4OsQPak1sUSSdLwpnCmW1ASxOfKJZUCFETJTCzLpRvQ/hBYSMZU=
X-Received: by 2002:a05:6a00:3498:b0:820:2f9b:fe31 with SMTP id d2e1a72fcca58-82f8c8bede5mr12500270b3a.30.1776702612277;
        Mon, 20 Apr 2026 09:30:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:3498:b0:820:2f9b:fe31 with SMTP id d2e1a72fcca58-82f8c8bede5mr12500211b3a.30.1776702611609;
        Mon, 20 Apr 2026 09:30:11 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec05391sm11666469b3a.56.2026.04.20.09.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:30:11 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 21:58:58 +0530
Subject: [PATCH 05/13] clk: qcom: common: Add helpers to control clocks
 using CRM
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260420-cesta-sm870-dispcc-v1-5-eb27d845df9c@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
In-Reply-To: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: HuonMHlPFeT54X4ATkKUJaArCcYBHaCR
X-Proofpoint-GUID: HuonMHlPFeT54X4ATkKUJaArCcYBHaCR
X-Authority-Analysis: v=2.4 cv=TK11jVla c=1 sm=1 tr=0 ts=69e65495 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=rqiFlLygBDmmhMIpyI8A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDE1OSBTYWx0ZWRfX0Xc0MqwDLWsY
 x68NxkHCT+7vn7/WZHVUuINikoMAuyhQjnhtUrXU9mK5lDIXKFKzjc1BSDv9VZGdJ9yrDcI62vo
 AQO3zu4KHp4q1bXemCvyeGyh6mNJNDZ7g6n6/fmJkT8QgRWFPQ5HGmWliR/OE4/+szD0RNOBVyh
 ozMLcLoC/8sWMcP/2tJyvg4xt1Gp15WSYeCqnHyVZHMAG5myJEhXt6DHY6Y25epLg/iS38OHg/I
 dcbGAGanp9j4E+K2jpXaCWHTGJyX+LP1ur7peIt7Wt9vAsy8ptpUgqIMMdcvNp4WvQYxWf2tZKp
 bdYpFuuUDJrp2hEsQr+KqCDvbRx+2LoRfbag6XtkDHGIL3HUWVadPV0HijP/w+rZte05twIBBgo
 uVw4GqeVWvTMXnnWGOGpbFoPKklh83ROvRFCj3wu1G4LGBSw1iR8P72/x/LpSBdyShyRf1lAamS
 pUEfUILheU0vD2yfC0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-20_03,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604200159

CESTA Resource Manager (CRM) scales clock frequencies based on
performance operating levels. Introduce qcom_find_crm_freq_index()
to convert a requested clock rate into a CRM LUT performance level.

Additionally, add clk_crm and qcom_clk_crm_soc_data structures, which
capture the CRM-specific clock configuration for a clock controller
(register layout, LUT information, CRM device etc). This info is used
to read frequency lookup tables provided by CRM and for sending votes
through CRM to scale the clock frequencies.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/common.c | 39 +++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/common.h | 38 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 76 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index eec369d2173b5ce24bc1ca860d2ac1bbdce04524..968e19997daf5eebec65315974cd0c41e08e55ec 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
  * Copyright (c) 2013-2014, The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/export.h>
@@ -80,6 +81,44 @@ const struct freq_tbl *qcom_find_freq_floor(const struct freq_tbl *f,
 }
 EXPORT_SYMBOL_GPL(qcom_find_freq_floor);
 
+/**
+ * qcom_find_crm_freq_index - Map a clock rate to a CRM LUT performance level
+ * @f: pointer to the frequency table
+ * @rate: requested clock rate in Hz
+ *
+ * Convert a requested clock rate into a CRM LUT performance level index.
+ * CRM treats performance level 0 as CLK_OFF, so valid performance levels
+ * start from 1.
+ *
+ * Return: a non-negative performance level index on success, or -EINVAL
+ * if @f is NULL or the frequency table is empty.
+ */
+
+int qcom_find_crm_freq_index(const struct freq_tbl *f, unsigned long rate)
+{
+	int index;
+
+	if (!f || !f->freq)
+		return -EINVAL;
+
+	/* Return 0 for CRM to disable the clocks */
+	if (!rate)
+		return 0;
+
+	/*
+	 * Calculate the perf level for supported frequencies starting
+	 * from 1, since PERF_OL 0 is treated as CLK_OFF by CRM.
+	 */
+	for (index = 1; f->freq; f++, index++) {
+		if (rate <= f->freq)
+			return index;
+	}
+
+	/* Default to highest corner */
+	return index - 1;
+}
+EXPORT_SYMBOL_GPL(qcom_find_crm_freq_index);
+
 int qcom_find_src_index(struct clk_hw *hw, const struct parent_map *map, u8 src)
 {
 	int i, num_parents = clk_hw_get_num_parents(hw);
diff --git a/drivers/clk/qcom/common.h b/drivers/clk/qcom/common.h
index 6f2406f8839e8f432ef34ce32c930cf045f6ae7a..9987cec84324a258f3405c7b9093237f52a41b45 100644
--- a/drivers/clk/qcom/common.h
+++ b/drivers/clk/qcom/common.h
@@ -1,5 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-/* Copyright (c) 2014, The Linux Foundation. All rights reserved. */
+/*
+ * Copyright (c) 2014, The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
 
 #ifndef __QCOM_CLK_COMMON_H__
 #define __QCOM_CLK_COMMON_H__
@@ -62,6 +65,39 @@ struct parent_map {
 	u8 cfg;
 };
 
+/**
+ * struct qcom_clk_crm_soc_data - CRM clock register layout for a clock controller
+ *
+ * @reg_cfg_rcgr_lut_base: Base register address for CFG_RCGR LUT values
+ * @reg_l_val_lut_base: Base register address for PLL L and ALPHA LUT values
+ * @vcd_offset: Offset between consecutive VCD blocks
+ * @lut_level_offset: Offset between consecutive LUT levels within a VCD
+ */
+struct qcom_clk_crm_soc_data {
+	u32 reg_cfg_rcgr_lut_base;
+	u32 reg_l_val_lut_base;
+	u32 vcd_offset;
+	u32 lut_level_offset;
+};
+
+/**
+ * struct clk_crm - Clock CRM used to communicate with CRM
+ *
+ * @crm_dev: Pointer to CRM device structure used to communicate with CESTA
+ * @regmap_crmc: regmap for the crmc instance to read frequency look up tables
+ * @regs: CRMC (CRM clock) base register addresses and offsets
+ * @max_perf_ol: Maximum number of performance operating levels supported
+ * @client_idx: SW Client Index
+ */
+struct clk_crm {
+	struct device *crm_dev;
+	struct regmap *regmap_crmc;
+	struct qcom_clk_crm_soc_data regs;
+	u8 max_perf_ol;
+	u8 client_idx;
+};
+
+extern int qcom_find_crm_freq_index(const struct freq_tbl *f, unsigned long rate);
 extern const struct freq_tbl *qcom_find_freq(const struct freq_tbl *f,
 					     unsigned long rate);
 extern const struct freq_tbl *qcom_find_freq_floor(const struct freq_tbl *f,

-- 
2.34.1

