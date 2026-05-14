Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B26F3A785A
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 04:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778731558; cv=none; b=brbbyDD3povSeJrXtznJAdoELpO2+JTjWHlCG+dZTD4/eecQIwPrrq5npINYFGKXwE+JKEajzQ2nm6i/w3uOo75e9Hv+MlBRIzgRTjXxflh4RXN8s/F387EV92pPM3RjBDQnjG655E44rmC5MU35LlHmS8Y6xG7wtG4cIutnViU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778731558; c=relaxed/simple;
	bh=ijZovknDajNxIxg3LTmBGvrM7bkdi8po4qJvt9/oouQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SrTTqU0wG6YiP3PqYSh4POnHQj2nxsV4Cdh05o5y6e5v0xiKTbXIQENUy5NnBTFG4RzXjDl2lNsbLvsvDUul0vjV3qDOlRZ6BFOeqaQjLAfYs8HTuD9vM2ZTo/kY5OZwH8TJCTFlNRb7VL/Ri6jpgG0oYMNh1MTFShOjGZktrqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dAp1mbwE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iVfLj5Rd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dAp1mbwE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iVfLj5Rd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E0sldr1620445
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 04:05:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OzTMMQJ8CnCSK3AwZf65cTeHKEgDkdb1Z3INqfD4ySA=; b=dAp1mbwEC3EFPfqr
	eTjQBm7VyktFRR6h06BkmCD86yqDPZwknTdbkeAMueEbrDpUIDaFXetwHZhvttHz
	sTs9aNbT28JKZhh4aiYUG51Ik25ea8E4svCSTF+jd6RW0mQ5UCwjLEEKaECmN467
	FfxEHu9L5yyH1pS1AOzgTaYvWEjWVL3TJ5jpSGJxxVdp/0yBT5HptsPBF28k+Z9z
	CZHZRsypaRqcJ2kFOs5X0cmFkTddR3BX9noyvBNxwh4QzhfjCtD+Y45sSDs4gHEg
	2EVe2Y/7i42anjAPGKM4ZEzqtdOy+8jv8MDmlLKb1jozNULfJvbvG980I8ASz/tS
	F550xg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5492rg9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 04:05:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b9a3c3c4eeso81314765ad.3
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 21:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778731554; x=1779336354; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OzTMMQJ8CnCSK3AwZf65cTeHKEgDkdb1Z3INqfD4ySA=;
        b=iVfLj5RduAhh78X8vyqptxV1KULmMoyvQTJuVfEeM/98LpOKiGzjbBjlyjttCiUq1l
         33Vij90p9hM2xQZqiECvEEqKjmgCPjLAmXmHJ6fna9L/pBkTS4157qSw6YsQVAbJ0/Y+
         AxHm8BSAbuMBA1dV2eZKEWQ+NfpjgHSMe4q1pdMhPzHktA30b8eXPEjzzxiysxx0Qtap
         eYUHmzOLPNaie6XYH4XKplUnkFBCOrnaIvmqlU59R111gkh6nbUn3W2B43ERtNRx0kJ+
         AxKPwrx7+AwGXRJKDNYUZfFMYR9qtaoZTeFEbmSAqIRUK9Ag128KTuzVisuFg38JvJ0h
         t76A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778731554; x=1779336354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OzTMMQJ8CnCSK3AwZf65cTeHKEgDkdb1Z3INqfD4ySA=;
        b=Q4a7LDIuNnyKqZoxCfl28GL/1a+nSSImkB9TbxYeVz5SkK7iUXSbAglGuZrLCSg+zA
         MbI9atrI/7bKJ56rEj5E+D/BxTTTbI3qU254n3uysIy9obJAMXyAipJs0TYK/DWMv636
         0TfTsmCqJJtGij5Z970bwoBY+ho5y1dcHffX+cHdDhLrMv9IUNuLxQ6y66JEqEhSqwI4
         83tWQrsKyNmU0BwKMiNbe+3iYsORydxYllOGn/vAtC/b3zKzTFBX5K8kncynAicKP1Xh
         /4UqDSakvCDk4zd2oXwM6uwn5/grWnCCsr1y5eYb3M0yN/xH/Dujbg0WguAQiGz0ezx7
         rzkA==
X-Forwarded-Encrypted: i=1; AFNElJ8E9dRR6/Lmar5N1+gkOijAj2+UZ7Ke9ewi+41ernOAFSV846kzJmz3QO56wYpm2Haf3qUaQAgOB+ZY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5onBjURKZoAod/vIZolSGwWBRZVD9VbAXoTVwwsa5LkAvQW4T
	3oFYDzrlU+gIq8RcHlt7JyDVMcfGv08LMEE1ycf3OQmU6kVE4XO7O3p5GNRpLSpQw8Bdwx2TG9F
	/oi4E60hmJSEOfaYIYCtMPmxMd/nAzrjugB9IxZXsyOYCDet2k8Pqd9w0eyQPLqTK
X-Gm-Gg: Acq92OF7+oZ+JRBpSi3TRlBGJTAsJ4m7wVgJ8NtihdlxJKjMR2NliwsfC22qdQRYSlh
	InEQDCJrUuoTWreZ3q8e1K9SuEFS+PsBIxenDLpH6iSxDwwC8/7w+8Zk4bx+gdWkrZXSQ+88oQA
	inqmVWgEvE+98zUdzlkxPmSYpLDjyTCODvFq8CujdSVwc0MOhpxhmk2gICcJRMTJLNsdb4uqO3R
	tQ3HsWUumYiOAFjhorkbvmkqhiH8KIsV8fVoOhqFAypQj4WUQypi3qNmLe6L/M2bUwBTtEHPFPx
	F2LcwtkH0Fk8EyInQ2M1TSq6mfaPtqQfTRvqu8IN7iSY4qAOlIhFl5jLOKmJRKMJTatinKtuU1R
	fI7AL7v9nzVtb50M9gO1as0toZwkDLbBPTnIv85gy0RUMMQJ1X/8Jos0JtPz5o9Q02ZThL7mSR1
	UboZNy/3NOrx6qLWkIc5gZbjpXvmgWeKkU7TB5Ia1WD81AgLT83u8PAJtU+CiHhg==
X-Received: by 2002:a17:903:38cf:b0:2b0:6e60:9582 with SMTP id d9443c01a7336-2bd2f70f1b2mr60080515ad.18.1778731553906;
        Wed, 13 May 2026 21:05:53 -0700 (PDT)
X-Received: by 2002:a17:903:38cf:b0:2b0:6e60:9582 with SMTP id d9443c01a7336-2bd2f70f1b2mr60080045ad.18.1778731553200;
        Wed, 13 May 2026 21:05:53 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5cfe8698sm8035145ad.40.2026.05.13.21.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 21:05:52 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 14 May 2026 09:35:36 +0530
Subject: [PATCH 2/3] clk: qcom: ipq5210: Use icc-clk for enabling NoC
 related clocks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-icc-ipq5210-v1-2-b5070dfbe460@oss.qualcomm.com>
References: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
In-Reply-To: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: bRBl4iXJ3ArAB_9OOrU0FQntaVJIKBMG
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a054a22 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=2vMkRBvVivtXAe3DWLoA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: bRBl4iXJ3ArAB_9OOrU0FQntaVJIKBMG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAzNyBTYWx0ZWRfX7DVibvxgDi18
 moRWXOA6YxdQQ5GHtOOYBUFvplKgw3NJIlmDA81iV5vWodUg+ytODtHEyKp0I4s7tQlii24Hxx7
 8/pPwfED2cGPCk8AJRBup9TRRmeyun+AHf9uS9UNSYhrqDhPvr99JGskmee4D/TqCmfdWmX2wXo
 tD6EUl8nzkzyXBudlMX3OBJcRwLka5y1/aJCASvUEehP9HOYEh+2SFbH3+Ms/43gjA3ftbNhdO9
 cp1jfLZRU5AhFBJUCmMc5Pk9EGcrTZ5gf9382CxCa6KKx7XqZ7nItzoHu+oM1ieuRx4Dk3sHl9K
 BXaa6wkGgRT+aZuq/y6Hnz4JudSzwt8PQWDmibN+1E4ARht3SdReXnNhE0NpD0w3vHezxdoIhFz
 glbW2w51wgjPbRXn7tB9zz633enn3885lmTioSXSTs+r0DmVcGvQJwJs9dBdpxsFLp0ziYWUO5A
 Dts5uINJ94QK23xeGYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140037

Use the icc-clk framework to enable few clocks to be able to
create paths and use the peripherals connected on those NoCs.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-ipq5210.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq5210.c b/drivers/clk/qcom/gcc-ipq5210.c
index 3a786a21bdff..1111da24b512 100644
--- a/drivers/clk/qcom/gcc-ipq5210.c
+++ b/drivers/clk/qcom/gcc-ipq5210.c
@@ -4,11 +4,13 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/interconnect-provider.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,ipq5210-gcc.h>
+#include <dt-bindings/interconnect/qcom,ipq5210.h>
 #include <dt-bindings/reset/qcom,ipq5210-gcc.h>
 
 #include "clk-alpha-pll.h"
@@ -2602,6 +2604,16 @@ static const struct qcom_reset_map gcc_ipq5210_resets[] = {
 	[GCC_QDSS_BCR] = { 0x2d000 },
 };
 
+#define IPQ_APPS_ID			5210	/* some unique value */
+
+static const struct qcom_icc_hws_data icc_ipq5210_hws[] = {
+	{ MASTER_CNOC_PCIE0, SLAVE_CNOC_PCIE0, GCC_CNOC_PCIE0_1LANE_S_CLK },
+	{ MASTER_CNOC_PCIE1, SLAVE_CNOC_PCIE1, GCC_CNOC_PCIE1_2LANE_S_CLK },
+	{ MASTER_SNOC_PCIE0, SLAVE_SNOC_PCIE0, GCC_SNOC_PCIE0_AXI_M_CLK },
+	{ MASTER_SNOC_PCIE1, SLAVE_SNOC_PCIE1, GCC_SNOC_PCIE1_AXI_M_CLK },
+	{ MASTER_USB, SLAVE_USB, GCC_CNOC_USB_CLK },
+};
+
 static const struct of_device_id gcc_ipq5210_match_table[] = {
 	{ .compatible = "qcom,ipq5210-gcc" },
 	{ }
@@ -2630,6 +2642,9 @@ static const struct qcom_cc_desc gcc_ipq5210_desc = {
 	.num_resets = ARRAY_SIZE(gcc_ipq5210_resets),
 	.clk_hws = gcc_ipq5210_hws,
 	.num_clk_hws = ARRAY_SIZE(gcc_ipq5210_hws),
+	.icc_hws = icc_ipq5210_hws,
+	.num_icc_hws = ARRAY_SIZE(icc_ipq5210_hws),
+	.icc_first_node_id = IPQ_APPS_ID,
 };
 
 static int gcc_ipq5210_probe(struct platform_device *pdev)
@@ -2642,6 +2657,7 @@ static struct platform_driver gcc_ipq5210_driver = {
 	.driver = {
 		.name   = "qcom,gcc-ipq5210",
 		.of_match_table = gcc_ipq5210_match_table,
+		.sync_state = icc_sync_state,
 	},
 };
 

-- 
2.34.1

