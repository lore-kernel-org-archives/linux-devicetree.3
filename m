Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884084;
	b=EpkNbp7U9DSLz73C/MibZUZ+Af7Sru9njaq261q1WITfHtJQEAh32fJiyicwYiyFIait
	 7ohB30aUk4/lTIrh6r9TNa7SwrlOPVZOdONw0PLgvjTqFDqyq9FYRdWSjBsimy/h/8QHc
	 R4MYioPHDOV16E2L6AWW7UR30aw9LMlQACoyfDfDjXiBdeYs1fLpIT2XCM21sWPgzTKdR
	 buCoWQQJwWRPkoqqRCy2o1neG4OeZRETpAUDkxufQn/NInKrU4vLwukuOtn4LWB9fJ8cF
	 FrC+tL2BDAv8ReEnzYfwTvU68W2IO0h99GhwCD3Y0vvmjHt9nFqxabUpkvLdpfJxN2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884084;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z3ofBAtKu3hVvJMLOepdv8CXahZMhxFhCPrruLLycU8=;
	b=oL0qhq8kHMBZp9xXXc7Jwe2QtubkwrIZ1YQ5HjUKUC5B4xd+S6JCahf+9396jr8OwKFq
	 zUDE8WHdVmo+usY8s+A748rgjRMxHbEsPv0NBllPlMVvSN6l/sXJcSqZgwzUBRjNskmoA
	 MBOArOGliXMyhzNCdeV2vrEe1zCNQRetXT7OYmcilFDcq16NsnGAq6rErFCOCa54zZHOG
	 Z5dxIfDMtpL5Ild1o0rYgXu87YuN5pA04nM68rRoXqxMUVn8sQ1UGTROvANBIbO4+3kc1
	 qdJVqunMP+GE0aWIOQ5eXZu2X/8Spp8I+1Ztcsf0nJlOA8wzurB5DW6ADcPx8V62QDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bR9heqWY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TVgX76kr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B94606D82E
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 13:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4B94606D82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bR9heqWY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TVgX76kr
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tbpA1028243
	for <devicetree@vger.kernel.org>; Thu, 5 Nov 2026 13:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z3ofBAtKu3hVvJMLOepdv8CXahZMhxFhCPrruLLycU8=; b=bR9heqWY3paYZzeA
	TJyB2WKjdBJeSq2TXWUZSfXGXZhnV2Tvu/ayfmh9qE1SeGhyYDST6WRUVbwa1iBj
	rH1SrZoX2/pzNBbhaVza+Sk+QpsdxgCCDnhNMuxZdUpBrmloK7Uh984WtB8bpLvj
	Il0wbe5K+7jYZ0sHNP52oXR21iAcLWcVmY1fPoxfOLFU5V7a5HLwsti4FxZGWPbb
	DDdcywRusiTSWJ2wg/9AfsSFQj+rJn33atAOhpSWFhJ97x+J+zSW09CL75hl50cZ
	O4qSnsqD82PCv0mJKhJcHkLf3SOCOtAElfnbqS8k8u4pL8UA4QIrPqIt8HTOx4/x
	1rVGQw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrkaq9wr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 13:08:00 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b30392e019so20988167b3.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 05:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793884080; x=1794488880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z3ofBAtKu3hVvJMLOepdv8CXahZMhxFhCPrruLLycU8=;
        b=TVgX76krpIqoOQyqxBlpJVn1R0OiSmquAZ4hEJF3s4eyuBFcEOW3oV0fdxZe778hly
         JRwnyNlnfLVPgjB08n41d3ikvkpkV/hvxV+G9x72RRJX0mOQw//gT4R3VFaLXw3vkyiB
         s15xpLOtgVSWvoZNcHLEWAnwNKrPSd8P4tdqgCHoHTZaQTnlVP14lpMmN9n2iAP/4QBB
         BEIqcfczh3/8hGoC5EeIp8dhKl6HhRDQGfMaALsrUmZSJhVBpdswGfefrFzJ3Y8cbO1T
         obu+EyP8oqZr1z0ZodsDvx7dBqFstWsYJLgkDhL6iPa8CcLV8qab8xSB4A4CshyuQdmA
         Przw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884080; x=1794488880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z3ofBAtKu3hVvJMLOepdv8CXahZMhxFhCPrruLLycU8=;
        b=rXqQl7dQ1Qd5flwepRsI/Pi4Mw/lDyexDwQSCbq6Mzj9V4yoiMMg4cAcLXFUO7/I/G
         Q0fCXXUQ9juGqCoCDgu4C8WhhJcEJ8EIZ5IP6nFVOcws0TLBYWn3HdMd5PpsbkGgRw/m
         sG8NvySYVhRiDo/1olGThTA2o6GVz0YCL7gvuJOu3aeSaH7wK8oTKQUWiPd+yaQUCDp9
         veFDPD5KpNeU78AipD1u+9e5Amq0fS/Z+ZfdZWZ44YWkLkBTKhLIGoRRs5df6EuyKVhJ
         f4e512oSohm5Ps6T+xb5x9Zh9nrUEciEksWQfYhoDwua4NGPOc0WGnmHI9LE2sUPlVrI
         fJZg==
X-Forwarded-Encrypted: i=1; AKwUvBxZySVSF/J5dcDJMsy/jEvHU/cCsu8+excbm2g9avfM+5AqTSoSAHwHFXMjpATlr6OfDGekpy9fth6h@vger.kernel.org
X-Gm-Message-State: APuU4Z/gJTTM0nug5xmxN7XwNaE6/1LTF5xYdqOAsjWrINp5Laa9pgzI
	KpECvUI39TKXh40E1qJxGVDeLnAbPY5Yz1qR8lYvzbKQ00tVRGVW5SZbxGgq9j/BkL9dPr5t4Ev
	LEf/5DwoYkkkDhJxA0xWWs7/UjSTNsqmx3j6WZ7xnK6MvF9oZ9vKUP83vu5HJU0L/
X-Gm-Gg: AYBFou1G9EYvxtXOlYXPFkeKIsgbdvk5b9TGlwjs6K29uL+rLdLsh4lWFDF9qQcPTgq
	SrpUa+t4i6jR5NpgVRrsryBHwMhZuyIOHT6Sq6qeY5/asxScjV4V1KlOleVIVrfP5HTAWl/eNRG
	n/b3FjsSovDz1Nnxz+UpBw0Kiwh7sbN2E6bOUeIcZmsSUfIUCTJ5UN89v0Q3VK3e4pEArsaUOUQ
	5ZK9ZsqDFe452BZddlCjjJtOL0IXqmduEa5k/WnFLgzvCxXHbacqY6y4TZgfFreVvu61w8kaQfE
	j6MYMRMgfukhxj8cNx3VDW2CrbMseghE33bWudSLlNP/kpTf8dD8QQZcUAxWIUO3yol9G6FG/nr
	8bBpmMCTMJCX8xijToIpW3CrT+ABq3Pfo+M3Gk0/fp/VfnfWEMym12YXtlN0MccpMbGzg4t+Jct
	TlFD11BPgR6lC2YlYZ
X-Received: by 2002:a05:690c:c6cc:10b0:873:5bb2:6c06 with SMTP id 00721157ae682-8b2b676095dmr99205617b3.48.1793884079270;
        Thu, 05 Nov 2026 05:07:59 -0800 (PST)
X-Received: by 2002:a05:690c:c6cc:10b0:873:5bb2:6c06 with SMTP id 00721157ae682-8b2b676095dmr99205407b3.48.1793884078463;
        Thu, 05 Nov 2026 05:07:58 -0800 (PST)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b309bb4406sm38915937b3.40.2026.11.05.05.07.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:07:58 -0800 (PST)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 05:07:13 -0800
Subject: [PATCH 2/5] clk: qcom: Add NSS clock controller driver for IPQ5210
 SoC
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-qcom_ipq5210_nsscc-v1-2-d4fcb5c32b51@oss.qualcomm.com>
References: <20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com>
In-Reply-To: <20261105-qcom_ipq5210_nsscc-v1-0-d4fcb5c32b51@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, netdev@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793884066; l=67202;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=b6ZDE6t13rSvkvneIlzR8uKsti2wqq62Qr/wruRcTho=;
 b=vjG4jvUkv2aAgaTYK/KvzI/7qtfCyr2cvRDMmIPjFY0Z19acQOvvMV6v+7CWCGWhhfj8nm2ez
 BfLcaG61vifBgKQOx26BbbCsEeyJyBP9otZISxJlMI8YPIX9wPWSJAt
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-GUID: WvPzvpUNjUU-8GNhQUgrOIEdujAD3BNk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX1mAD/ogQRRaW
 ZlRZNO1IL5TQfloijGIdS/k06EfJ5FgQ/sGXgsbSioqtm5zHUyHGKmK5zdQS0qu5XGvVTX5YEtp
 FeTGJKbqs8Lbjy/9q4LFIYcrpzoFzpU=
X-Proofpoint-ORIG-GUID: WvPzvpUNjUU-8GNhQUgrOIEdujAD3BNk
X-Authority-Analysis: v=2.4 cv=OZoNnRTY c=1 sm=1 tr=0 ts=6aec7fb0 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=9NNFwX1Lmsrkzrh2ROEA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX62aPw5HMoniC
 xjmapET1ZlhJDWbmv1D7tgv5p5Y1XiDpxJUqhJB44gByAnnB+kVvDE+uc2PsBQ+8QtLUCvswwaf
 mAVGv2G2domeW9T1ATp8aCEF5K2e+EUZVnr7McQRLTYkpQ0Q+DNMfWCJzN28KDBtLhAFYW/9caB
 Jq6zmgQLe3vIZGNf+IDdjH0m4wWP0pSg+y0OqMTY3uP9y3H/P0WBIGbfL42sp0eu5Cin7zHO1Mx
 oS2apge/UlGWP2DdIHW9HgTpXVTHzGyDMc12uP+e+lHi1gV8k8ig+w7AQJdwjMnRotJIvP39/EQ
 zNfODf1yRzFSMQFSQV/nQoOGNwI7f0WJz8Q+MnrB9mdgTfZjL7mIXYOjcVBE05djyVGKc7f/Jg0
 n2M79y8VswQ2vuzVB22rVatEzbumZaI8DxVDk/MjMNERoCLoh8VsMT/PF8ZmsJlufPEwwWEJcrt
 rcclojgP8mexudbLE9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050052

The NSS (Network SubSystem) clock controller provides the clocks and resets
to the networking blocks such as PPE (Packet Process Engine), UNIPHY (PCS)
and the integrated Ethernet PHY on IPQ5210 devices.

The icc-clk framework is used to enable NoC related clocks to create paths
so that the networking blocks such as PPE can connect to these NoCs.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig         |   12 +
 drivers/clk/qcom/Makefile        |    1 +
 drivers/clk/qcom/nsscc-ipq5210.c | 2203 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 2216 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 27d0ab24d50a..73382081c310 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -715,6 +715,18 @@ config IPQ_GCC_9650
 	  i2c, USB, SD/eMMC, etc. Select this for the root clock
 	  of ipq9650.
 
+config IPQ_NSSCC_5210
+	tristate "IPQ5210 NSS Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	depends on IPQ_GCC_5210
+	default m if ARCH_QCOM
+	help
+	  Support for NSS clock controller on ipq5210 devices.
+	  NSSCC receives the clock sources from GCC and CMN PLL.
+	  It in turn supplies the clocks and resets to the networking hardware.
+	  Say Y or M if you want to enable networking function on the
+	  IPQ5210 devices.
+
 config IPQ_NSSCC_5424
 	tristate "IPQ5424 NSS Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index 6affb5073f26..2b65ed4c35d6 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -79,6 +79,7 @@ obj-$(CONFIG_IPQ_GCC_806X) += gcc-ipq806x.o
 obj-$(CONFIG_IPQ_GCC_8074) += gcc-ipq8074.o
 obj-$(CONFIG_IPQ_GCC_9574) += gcc-ipq9574.o
 obj-$(CONFIG_IPQ_GCC_9650) += gcc-ipq9650.o
+obj-$(CONFIG_IPQ_NSSCC_5210) += nsscc-ipq5210.o
 obj-$(CONFIG_IPQ_NSSCC_5424) += nsscc-ipq5424.o
 obj-$(CONFIG_IPQ_NSSCC_9574)	+= nsscc-ipq9574.o
 obj-$(CONFIG_IPQ_LCC_806X) += lcc-ipq806x.o
diff --git a/drivers/clk/qcom/nsscc-ipq5210.c b/drivers/clk/qcom/nsscc-ipq5210.c
new file mode 100644
index 000000000000..ca749e0af323
--- /dev/null
+++ b/drivers/clk/qcom/nsscc-ipq5210.c
@@ -0,0 +1,2203 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/interconnect-provider.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,ipq5210-nsscc.h>
+#include <dt-bindings/interconnect/qcom,ipq5210.h>
+#include <dt-bindings/reset/qcom,ipq5210-nsscc.h>
+
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "reset.h"
+
+/* Need to match the order of clocks in DT binding */
+enum {
+	DT_XO,
+	DT_CMN_PLL_NSS_CLK_375M,
+	DT_CMN_PLL_NSS_CLK_429M,
+	DT_GCC_GPLL0,
+	DT_UNIPHY0_NSS_RX_CLK,
+	DT_UNIPHY0_NSS_TX_CLK,
+	DT_UNIPHY1_NSS_RX_CLK,
+	DT_UNIPHY1_NSS_TX_CLK,
+	DT_UNIPHY2_NSS_RX_CLK,
+	DT_UNIPHY2_NSS_TX_CLK,
+	DT_GCC_NSSCC_CLK,
+	DT_EPHY_RX_CLK,
+	DT_EPHY_TX_CLK,
+};
+
+enum {
+	P_XO,
+	P_CMN_PLL_NSS_CLK_375M,
+	P_CMN_PLL_NSS_CLK_429M,
+	P_GCC_GPLL0,
+	P_UNIPHY0_NSS_RX_CLK,
+	P_UNIPHY0_NSS_TX_CLK,
+	P_UNIPHY1_NSS_RX_CLK,
+	P_UNIPHY1_NSS_TX_CLK,
+	P_UNIPHY2_NSS_RX_CLK,
+	P_UNIPHY2_NSS_TX_CLK,
+	P_EPHY_RX_CLK,
+	P_EPHY_TX_CLK,
+};
+
+static const struct parent_map nss_cc_parent_map_ppe_cfg[] = {
+	{ P_XO, 0 },
+	{ P_GCC_GPLL0, 2 },
+};
+
+static const struct parent_map nss_cc_parent_map_ppe[] = {
+	{ P_XO, 0 },
+	{ P_CMN_PLL_NSS_CLK_429M, 6 },
+};
+
+static const struct clk_parent_data nss_cc_ppe_parent_data_ppe_cfg[] = {
+	{ .index = DT_XO },
+	{ .index = DT_GCC_GPLL0 },
+};
+
+static const struct clk_parent_data nss_cc_ppe_parent_data_ppe[] = {
+	{ .index = DT_XO },
+	{ .index = DT_CMN_PLL_NSS_CLK_429M },
+};
+
+static const struct clk_parent_data nss_cc_ppe_parent_data_eip[] = {
+	{ .index = DT_XO },
+	{ .index = DT_CMN_PLL_NSS_CLK_375M },
+};
+
+static const struct parent_map nss_cc_parent_map_port1_3_rx[] = {
+	{ P_XO, 0 },
+	{ P_UNIPHY0_NSS_RX_CLK, 3 },
+};
+
+static const struct parent_map nss_cc_parent_map_port1_3_tx[] = {
+	{ P_XO, 0 },
+	{ P_UNIPHY0_NSS_TX_CLK, 4 },
+};
+
+static const struct parent_map nss_cc_parent_map_port4_rx[] = {
+	{ P_XO, 0 },
+	{ P_EPHY_RX_CLK, 1 },
+	{ P_UNIPHY0_NSS_RX_CLK, 3 },
+};
+
+static const struct parent_map nss_cc_parent_map_port4_tx[] = {
+	{ P_XO, 0 },
+	{ P_UNIPHY0_NSS_TX_CLK, 4 },
+	{ P_EPHY_TX_CLK, 5 },
+};
+
+static const struct clk_parent_data gcc_xo_ephy_uniphy0_rx[] = {
+	{ .index = DT_XO },
+	{ .index = DT_EPHY_RX_CLK },
+	{ .index = DT_UNIPHY0_NSS_RX_CLK },
+};
+
+static const struct clk_parent_data gcc_xo_ephy_uniphy0_tx[] = {
+	{ .index = DT_XO },
+	{ .index = DT_UNIPHY0_NSS_TX_CLK },
+	{ .index = DT_EPHY_TX_CLK },
+};
+
+static const struct clk_parent_data gcc_xo_uniphy0_gcc_rx[] = {
+	{ .index = DT_XO },
+	{ .index = DT_UNIPHY0_NSS_RX_CLK },
+};
+
+static const struct clk_parent_data gcc_xo_uniphy0_gcc_tx[] = {
+	{ .index = DT_XO },
+	{ .index = DT_UNIPHY0_NSS_TX_CLK },
+};
+
+static const struct parent_map nss_cc_parent_map_port5_rx[] = {
+	{ P_XO, 0 },
+	{ P_EPHY_RX_CLK, 1 },
+	{ P_UNIPHY1_NSS_RX_CLK, 3 },
+};
+
+static const struct parent_map nss_cc_parent_map_port5_tx[] = {
+	{ P_XO, 0 },
+	{ P_UNIPHY1_NSS_TX_CLK, 4 },
+	{ P_EPHY_TX_CLK, 5 },
+};
+
+static const struct clk_parent_data gcc_xo_ephy_uniphy1_rx[] = {
+	{ .index = DT_XO },
+	{ .index = DT_EPHY_RX_CLK },
+	{ .index = DT_UNIPHY1_NSS_RX_CLK },
+};
+
+static const struct clk_parent_data gcc_xo_ephy_uniphy1_tx[] = {
+	{ .index = DT_XO },
+	{ .index = DT_UNIPHY1_NSS_TX_CLK },
+	{ .index = DT_EPHY_TX_CLK },
+};
+
+static const struct parent_map nss_cc_parent_map_port6_rx[] = {
+	{ P_XO, 0 },
+	{ P_UNIPHY2_NSS_RX_CLK, 3 },
+};
+
+static const struct parent_map nss_cc_parent_map_port6_tx[] = {
+	{ P_XO, 0 },
+	{ P_UNIPHY2_NSS_TX_CLK, 4 },
+};
+
+static const struct clk_parent_data gcc_xo_uniphy2_rx[] = {
+	{ .index = DT_XO },
+	{ .index = DT_UNIPHY2_NSS_RX_CLK },
+};
+
+static const struct clk_parent_data gcc_xo_uniphy2_tx[] = {
+	{ .index = DT_XO },
+	{ .index = DT_UNIPHY2_NSS_TX_CLK },
+};
+
+static const struct freq_tbl ftbl_nss_cc_ppe_clk_src[] = {
+	F(24000000, P_XO, 1, 0, 0),
+	F(429000000, P_CMN_PLL_NSS_CLK_429M, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_cc_ppe_clk_src = {
+	.cmd_rcgr = 0x3ec,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_ppe,
+	.freq_tbl = ftbl_nss_cc_ppe_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_ppe_clk_src",
+		.parent_data = nss_cc_ppe_parent_data_ppe,
+		.num_parents = ARRAY_SIZE(nss_cc_ppe_parent_data_ppe),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+/*
+ * The XGMAC PTP reference clock rate needs to be configurable, so the
+ * PTP reference dividers use the writable divider ops.
+ */
+static struct clk_regmap_div nss_cc_xgmac0_ptp_ref_div_clk_src = {
+	.reg = 0x3f4,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_xgmac0_ptp_ref_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_ppe_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_xgmac1_ptp_ref_div_clk_src = {
+	.reg = 0x3f8,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_xgmac1_ptp_ref_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_ppe_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_xgmac2_ptp_ref_div_clk_src = {
+	.reg = 0x3fc,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_xgmac2_ptp_ref_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_ppe_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_branch nss_cc_ppe_switch_ipe_clk = {
+	.halt_reg = 0x424,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x424,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_ppe_switch_ipe_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ppe_switch_btq_clk = {
+	.halt_reg = 0x42c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x42c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_ppe_switch_btq_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ppe_switch_clk = {
+	.halt_reg = 0x434,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x434,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_ppe_switch_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ppe_switch_cfg_clk = {
+	.halt_reg = 0x43c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x43c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_ppe_switch_cfg_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ppe_edma_clk = {
+	.halt_reg = 0x440,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x440,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_ppe_edma_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ppe_edma_cfg_clk = {
+	.halt_reg = 0x448,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x448,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_ppe_edma_cfg_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port1_mac_clk = {
+	.halt_reg = 0x44c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x44c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port1_mac_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port2_mac_clk = {
+	.halt_reg = 0x454,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x454,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port2_mac_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port3_mac_clk = {
+	.halt_reg = 0x45c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x45c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port3_mac_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port4_mac_clk = {
+	.halt_reg = 0x464,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x464,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port4_mac_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port5_mac_clk = {
+	.halt_reg = 0x46c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x46c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port5_mac_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port6_mac_clk = {
+	.halt_reg = 0x474,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x474,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port6_mac_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_pon_clk = {
+	.halt_reg = 0x47c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x47c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_pon_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_xgmac0_ptp_ref_clk = {
+	.halt_reg = 0x488,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x488,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_xgmac0_ptp_ref_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_xgmac0_ptp_ref_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_xgmac1_ptp_ref_clk = {
+	.halt_reg = 0x48c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x48c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_xgmac1_ptp_ref_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_xgmac1_ptp_ref_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_xgmac2_ptp_ref_clk = {
+	.halt_reg = 0x490,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x490,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_xgmac2_ptp_ref_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_xgmac2_ptp_ref_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_nssnoc_ppe_clk = {
+	.halt_reg = 0x4a4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_nssnoc_ppe_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_nssnoc_ppe_cfg_clk = {
+	.halt_reg = 0x4a8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x4a8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_nssnoc_ppe_cfg_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ppe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static const struct freq_conf ftbl_nss_cc_port1_rx_clk_src_25[] = {
+	C(P_UNIPHY0_NSS_RX_CLK, 12.5, 0, 0),
+	C(P_UNIPHY0_NSS_RX_CLK, 5, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port1_rx_clk_src_125[] = {
+	C(P_UNIPHY0_NSS_RX_CLK, 2.5, 0, 0),
+	C(P_UNIPHY0_NSS_RX_CLK, 1, 0, 0),
+};
+
+static const struct freq_multi_tbl ftbl_nss_cc_port1_3_rx_clk_src[] = {
+	FMS(24000000, P_XO, 1, 0, 0),
+	FM(25000000, ftbl_nss_cc_port1_rx_clk_src_25),
+	FM(125000000, ftbl_nss_cc_port1_rx_clk_src_125),
+	FMS(156250000, P_UNIPHY0_NSS_RX_CLK, 2, 0, 0),
+	FMS(312500000, P_UNIPHY0_NSS_RX_CLK, 1, 0, 0),
+	FMS(378788000, P_UNIPHY0_NSS_RX_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_cc_port1_rx_clk_src = {
+	.cmd_rcgr = 0x4b4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_port1_3_rx,
+	.freq_multi_tbl = ftbl_nss_cc_port1_3_rx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_port1_rx_clk_src",
+		.parent_data = gcc_xo_uniphy0_gcc_rx,
+		.num_parents = ARRAY_SIZE(gcc_xo_uniphy0_gcc_rx),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port1_rx_div_clk_src = {
+	.reg = 0x4bc,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port1_rx_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port1_rx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static const struct freq_conf ftbl_nss_cc_port1_tx_clk_src_25[] = {
+	C(P_UNIPHY0_NSS_TX_CLK, 12.5, 0, 0),
+	C(P_UNIPHY0_NSS_TX_CLK, 5, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port1_tx_clk_src_125[] = {
+	C(P_UNIPHY0_NSS_TX_CLK, 2.5, 0, 0),
+	C(P_UNIPHY0_NSS_TX_CLK, 1, 0, 0),
+};
+
+static const struct freq_multi_tbl ftbl_nss_cc_port1_3_tx_clk_src[] = {
+	FMS(24000000, P_XO, 1, 0, 0),
+	FM(25000000, ftbl_nss_cc_port1_tx_clk_src_25),
+	FM(125000000, ftbl_nss_cc_port1_tx_clk_src_125),
+	FMS(156250000, P_UNIPHY0_NSS_TX_CLK, 2, 0, 0),
+	FMS(312500000, P_UNIPHY0_NSS_TX_CLK, 1, 0, 0),
+	FMS(378788000, P_UNIPHY0_NSS_TX_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_cc_port1_tx_clk_src = {
+	.cmd_rcgr = 0x4c0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_port1_3_tx,
+	.freq_multi_tbl = ftbl_nss_cc_port1_3_tx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_port1_tx_clk_src",
+		.parent_data = gcc_xo_uniphy0_gcc_tx,
+		.num_parents = ARRAY_SIZE(gcc_xo_uniphy0_gcc_tx),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port1_tx_div_clk_src = {
+	.reg = 0x4c8,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port1_tx_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port1_tx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_rcg2 nss_cc_port2_rx_clk_src = {
+	.cmd_rcgr = 0x4cc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_port1_3_rx,
+	.freq_multi_tbl = ftbl_nss_cc_port1_3_rx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_port2_rx_clk_src",
+		.parent_data = gcc_xo_uniphy0_gcc_rx,
+		.num_parents = ARRAY_SIZE(gcc_xo_uniphy0_gcc_rx),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port2_rx_div_clk_src = {
+	.reg = 0x4d4,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port2_rx_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port2_rx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_rcg2 nss_cc_port2_tx_clk_src = {
+	.cmd_rcgr = 0x4d8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_port1_3_tx,
+	.freq_multi_tbl = ftbl_nss_cc_port1_3_tx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_port2_tx_clk_src",
+		.parent_data = gcc_xo_uniphy0_gcc_tx,
+		.num_parents = ARRAY_SIZE(gcc_xo_uniphy0_gcc_tx),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port2_tx_div_clk_src = {
+	.reg = 0x4e0,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port2_tx_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port2_tx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_rcg2 nss_cc_port3_rx_clk_src = {
+	.cmd_rcgr = 0x4e4,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_port1_3_rx,
+	.freq_multi_tbl = ftbl_nss_cc_port1_3_rx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_port3_rx_clk_src",
+		.parent_data = gcc_xo_uniphy0_gcc_rx,
+		.num_parents = ARRAY_SIZE(gcc_xo_uniphy0_gcc_rx),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port3_rx_div_clk_src = {
+	.reg = 0x4ec,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port3_rx_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port3_rx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_rcg2 nss_cc_port3_tx_clk_src = {
+	.cmd_rcgr = 0x4f0,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_port1_3_tx,
+	.freq_multi_tbl = ftbl_nss_cc_port1_3_tx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_port3_tx_clk_src",
+		.parent_data = gcc_xo_uniphy0_gcc_tx,
+		.num_parents = ARRAY_SIZE(gcc_xo_uniphy0_gcc_tx),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port3_tx_div_clk_src = {
+	.reg = 0x4f8,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port3_tx_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port3_tx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static const struct freq_conf ftbl_nss_cc_port4_rx_clk_src_25[] = {
+	C(P_UNIPHY0_NSS_RX_CLK, 12.5, 0, 0),
+	C(P_UNIPHY0_NSS_RX_CLK, 5, 0, 0),
+	C(P_EPHY_RX_CLK, 5, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port4_rx_clk_src_125[] = {
+	C(P_UNIPHY0_NSS_RX_CLK, 2.5, 0, 0),
+	C(P_UNIPHY0_NSS_RX_CLK, 1, 0, 0),
+	C(P_EPHY_RX_CLK, 1, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port4_rx_clk_src_312p5[] = {
+	C(P_UNIPHY0_NSS_RX_CLK, 1, 0, 0),
+	C(P_EPHY_RX_CLK, 1, 0, 0),
+};
+
+static const struct freq_multi_tbl ftbl_nss_cc_port4_rx_clk_src[] = {
+	FMS(24000000, P_XO, 1, 0, 0),
+	FM(25000000, ftbl_nss_cc_port4_rx_clk_src_25),
+	FM(125000000, ftbl_nss_cc_port4_rx_clk_src_125),
+	FMS(156250000, P_UNIPHY0_NSS_RX_CLK, 2, 0, 0),
+	FM(312500000, ftbl_nss_cc_port4_rx_clk_src_312p5),
+	{ }
+};
+
+static struct clk_rcg2 nss_cc_port4_rx_clk_src = {
+	.cmd_rcgr = 0x4fc,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_port4_rx,
+	.freq_multi_tbl = ftbl_nss_cc_port4_rx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_port4_rx_clk_src",
+		.parent_data = gcc_xo_ephy_uniphy0_rx,
+		.num_parents = ARRAY_SIZE(gcc_xo_ephy_uniphy0_rx),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port4_rx_div_clk_src = {
+	.reg = 0x504,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port4_rx_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port4_rx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static const struct freq_conf ftbl_nss_cc_port4_tx_clk_src_25[] = {
+	C(P_UNIPHY0_NSS_TX_CLK, 12.5, 0, 0),
+	C(P_UNIPHY0_NSS_TX_CLK, 5, 0, 0),
+	C(P_EPHY_TX_CLK, 5, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port4_tx_clk_src_125[] = {
+	C(P_UNIPHY0_NSS_TX_CLK, 2.5, 0, 0),
+	C(P_UNIPHY0_NSS_TX_CLK, 1, 0, 0),
+	C(P_EPHY_TX_CLK, 1, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port4_tx_clk_src_312p5[] = {
+	C(P_UNIPHY0_NSS_TX_CLK, 1, 0, 0),
+	C(P_EPHY_TX_CLK, 1, 0, 0),
+};
+
+static const struct freq_multi_tbl ftbl_nss_cc_port4_tx_clk_src[] = {
+	FMS(24000000, P_XO, 1, 0, 0),
+	FM(25000000, ftbl_nss_cc_port4_tx_clk_src_25),
+	FM(125000000, ftbl_nss_cc_port4_tx_clk_src_125),
+	FMS(156250000, P_UNIPHY0_NSS_TX_CLK, 2, 0, 0),
+	FM(312500000, ftbl_nss_cc_port4_tx_clk_src_312p5),
+	{ }
+};
+
+static struct clk_rcg2 nss_cc_port4_tx_clk_src = {
+	.cmd_rcgr = 0x508,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_port4_tx,
+	.freq_multi_tbl = ftbl_nss_cc_port4_tx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_port4_tx_clk_src",
+		.parent_data = gcc_xo_ephy_uniphy0_tx,
+		.num_parents = ARRAY_SIZE(gcc_xo_ephy_uniphy0_tx),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port4_tx_div_clk_src = {
+	.reg = 0x510,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port4_tx_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port4_tx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static const struct freq_conf ftbl_nss_cc_port5_rx_clk_src_25[] = {
+	C(P_UNIPHY1_NSS_RX_CLK, 12.5, 0, 0),
+	C(P_UNIPHY1_NSS_RX_CLK, 5, 0, 0),
+	C(P_EPHY_RX_CLK, 5, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port5_rx_clk_src_125[] = {
+	C(P_UNIPHY1_NSS_RX_CLK, 2.5, 0, 0),
+	C(P_UNIPHY1_NSS_RX_CLK, 1, 0, 0),
+	C(P_EPHY_RX_CLK, 1, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port5_rx_clk_src_312p5[] = {
+	C(P_UNIPHY1_NSS_RX_CLK, 1, 0, 0),
+	C(P_EPHY_RX_CLK, 1, 0, 0),
+};
+
+static const struct freq_multi_tbl ftbl_nss_cc_port5_rx_clk_src[] = {
+	FMS(24000000, P_XO, 1, 0, 0),
+	FM(25000000, ftbl_nss_cc_port5_rx_clk_src_25),
+	FM(125000000, ftbl_nss_cc_port5_rx_clk_src_125),
+	FMS(156250000, P_UNIPHY1_NSS_RX_CLK, 2, 0, 0),
+	FM(312500000, ftbl_nss_cc_port5_rx_clk_src_312p5),
+	{ }
+};
+
+static struct clk_rcg2 nss_cc_port5_rx_clk_src = {
+	.cmd_rcgr = 0x514,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_port5_rx,
+	.freq_multi_tbl = ftbl_nss_cc_port5_rx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_port5_rx_clk_src",
+		.parent_data = gcc_xo_ephy_uniphy1_rx,
+		.num_parents = ARRAY_SIZE(gcc_xo_ephy_uniphy1_rx),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port5_rx_div_clk_src = {
+	.reg = 0x51c,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port5_rx_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port5_rx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static const struct freq_conf ftbl_nss_cc_port5_tx_clk_src_25[] = {
+	C(P_UNIPHY1_NSS_TX_CLK, 12.5, 0, 0),
+	C(P_UNIPHY1_NSS_TX_CLK, 5, 0, 0),
+	C(P_EPHY_TX_CLK, 5, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port5_tx_clk_src_125[] = {
+	C(P_UNIPHY1_NSS_TX_CLK, 2.5, 0, 0),
+	C(P_UNIPHY1_NSS_TX_CLK, 1, 0, 0),
+	C(P_EPHY_TX_CLK, 1, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port5_tx_clk_src_312p5[] = {
+	C(P_UNIPHY1_NSS_TX_CLK, 1, 0, 0),
+	C(P_EPHY_TX_CLK, 1, 0, 0),
+};
+
+static const struct freq_multi_tbl ftbl_nss_cc_port5_tx_clk_src[] = {
+	FMS(24000000, P_XO, 1, 0, 0),
+	FM(25000000, ftbl_nss_cc_port5_tx_clk_src_25),
+	FM(125000000, ftbl_nss_cc_port5_tx_clk_src_125),
+	FMS(156250000, P_UNIPHY1_NSS_TX_CLK, 2, 0, 0),
+	FM(312500000, ftbl_nss_cc_port5_tx_clk_src_312p5),
+	{ }
+};
+
+static struct clk_rcg2 nss_cc_port5_tx_clk_src = {
+	.cmd_rcgr = 0x520,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_port5_tx,
+	.freq_multi_tbl = ftbl_nss_cc_port5_tx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_port5_tx_clk_src",
+		.parent_data = gcc_xo_ephy_uniphy1_tx,
+		.num_parents = ARRAY_SIZE(gcc_xo_ephy_uniphy1_tx),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port5_tx_div_clk_src = {
+	.reg = 0x528,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port5_tx_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port5_tx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static const struct freq_conf ftbl_nss_cc_port6_rx_clk_src_25[] = {
+	C(P_UNIPHY2_NSS_RX_CLK, 12.5, 0, 0),
+	C(P_UNIPHY2_NSS_RX_CLK, 5, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port6_rx_clk_src_125[] = {
+	C(P_UNIPHY2_NSS_RX_CLK, 2.5, 0, 0),
+	C(P_UNIPHY2_NSS_RX_CLK, 1, 0, 0),
+};
+
+static const struct freq_multi_tbl ftbl_nss_cc_port6_rx_clk_src[] = {
+	FMS(24000000, P_XO, 1, 0, 0),
+	FM(25000000, ftbl_nss_cc_port6_rx_clk_src_25),
+	FM(125000000, ftbl_nss_cc_port6_rx_clk_src_125),
+	FMS(156250000, P_UNIPHY2_NSS_RX_CLK, 2, 0, 0),
+	FMS(312500000, P_UNIPHY2_NSS_RX_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_cc_port6_rx_clk_src = {
+	.cmd_rcgr = 0x52c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_port6_rx,
+	.freq_multi_tbl = ftbl_nss_cc_port6_rx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_port6_rx_clk_src",
+		.parent_data = gcc_xo_uniphy2_rx,
+		.num_parents = ARRAY_SIZE(gcc_xo_uniphy2_rx),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port6_rx_div_clk_src = {
+	.reg = 0x534,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port6_rx_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port6_rx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static const struct freq_conf ftbl_nss_cc_port6_tx_clk_src_25[] = {
+	C(P_UNIPHY2_NSS_TX_CLK, 12.5, 0, 0),
+	C(P_UNIPHY2_NSS_TX_CLK, 5, 0, 0),
+};
+
+static const struct freq_conf ftbl_nss_cc_port6_tx_clk_src_125[] = {
+	C(P_UNIPHY2_NSS_TX_CLK, 2.5, 0, 0),
+	C(P_UNIPHY2_NSS_TX_CLK, 1, 0, 0),
+};
+
+static const struct freq_multi_tbl ftbl_nss_cc_port6_tx_clk_src[] = {
+	FMS(24000000, P_XO, 1, 0, 0),
+	FM(25000000, ftbl_nss_cc_port6_tx_clk_src_25),
+	FM(125000000, ftbl_nss_cc_port6_tx_clk_src_125),
+	FMS(156250000, P_UNIPHY2_NSS_TX_CLK, 2, 0, 0),
+	FMS(312500000, P_UNIPHY2_NSS_TX_CLK, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_cc_port6_tx_clk_src = {
+	.cmd_rcgr = 0x538,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_port6_tx,
+	.freq_multi_tbl = ftbl_nss_cc_port6_tx_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_port6_tx_clk_src",
+		.parent_data = gcc_xo_uniphy2_tx,
+		.num_parents = ARRAY_SIZE(gcc_xo_uniphy2_tx),
+		.ops = &clk_rcg2_fm_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_port6_tx_div_clk_src = {
+	.reg = 0x540,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_port6_tx_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port6_tx_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_branch nss_cc_port1_rx_clk = {
+	.halt_reg = 0x548,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x548,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port1_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port1_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port1_tx_clk = {
+	.halt_reg = 0x550,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x550,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port1_tx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port1_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port2_rx_clk = {
+	.halt_reg = 0x558,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x558,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port2_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port2_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port2_tx_clk = {
+	.halt_reg = 0x560,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x560,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port2_tx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port2_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port3_rx_clk = {
+	.halt_reg = 0x568,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x568,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port3_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port3_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port3_tx_clk = {
+	.halt_reg = 0x570,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x570,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port3_tx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port3_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port4_rx_clk = {
+	.halt_reg = 0x578,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x578,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port4_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port4_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port4_tx_clk = {
+	.halt_reg = 0x580,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x580,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port4_tx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port4_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port5_rx_clk = {
+	.halt_reg = 0x588,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x588,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port5_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port5_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port5_tx_clk = {
+	.halt_reg = 0x590,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x590,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port5_tx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port5_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port6_rx_clk = {
+	.halt_reg = 0x598,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x598,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port6_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port6_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_port6_tx_clk = {
+	.halt_reg = 0x5a0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5a0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_port6_tx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port6_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port1_rx_clk = {
+	.halt_reg = 0x5e0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5e0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port1_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port1_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port1_tx_clk = {
+	.halt_reg = 0x5e4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5e4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port1_tx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port1_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port2_rx_clk = {
+	.halt_reg = 0x5e8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5e8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port2_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port2_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port2_tx_clk = {
+	.halt_reg = 0x5ec,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5ec,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port2_tx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port2_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port3_rx_clk = {
+	.halt_reg = 0x5f0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5f0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port3_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port3_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port3_tx_clk = {
+	.halt_reg = 0x5f4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5f4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port3_tx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port3_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port4_rx_clk = {
+	.halt_reg = 0x5f8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5f8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port4_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port4_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port4_tx_clk = {
+	.halt_reg = 0x5fc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x5fc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port4_tx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port4_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port5_rx_clk = {
+	.halt_reg = 0x600,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x600,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port5_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port5_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port5_tx_clk = {
+	.halt_reg = 0x604,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x604,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port5_tx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port5_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port6_rx_clk = {
+	.halt_reg = 0x608,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x608,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port6_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port6_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port6_tx_clk = {
+	.halt_reg = 0x60c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x60c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port6_tx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port6_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap_mux nss_cc_ephy_rx_mux_clk_src = {
+	.reg = 0x610,
+	.shift = 0,
+	.width = 1,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ephy_rx_mux_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port4_rx_div_clk_src.clkr.hw,
+				&nss_cc_port5_rx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 2,
+			.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
+			.ops = &clk_regmap_mux_closest_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ephy_rx_clk = {
+	.halt_reg = 0x618,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x618,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_ephy_rx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ephy_rx_mux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap_mux nss_cc_ephy_tx_mux_clk_src = {
+	.reg = 0x614,
+	.shift = 0,
+	.width = 1,
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "nss_cc_ephy_tx_mux_clk_src",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_port4_tx_div_clk_src.clkr.hw,
+				&nss_cc_port5_tx_div_clk_src.clkr.hw,
+			},
+			.num_parents = 2,
+			.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT,
+			.ops = &clk_regmap_mux_closest_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_ephy_tx_clk = {
+	.halt_reg = 0x61c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x61c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_ephy_tx_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_ephy_tx_mux_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap_div nss_cc_uniphy_port1_rx_div4_clk_src = {
+	.reg = 0x624,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_uniphy_port1_rx_div4_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port1_rx_div_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_uniphy_port1_tx_div4_clk_src = {
+	.reg = 0x628,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_uniphy_port1_tx_div4_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port1_tx_div_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_uniphy_port2_rx_div4_clk_src = {
+	.reg = 0x62c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_uniphy_port2_rx_div4_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port2_rx_div_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_uniphy_port2_tx_div4_clk_src = {
+	.reg = 0x630,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_uniphy_port2_tx_div4_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port2_tx_div_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_uniphy_port3_rx_div4_clk_src = {
+	.reg = 0x634,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_uniphy_port3_rx_div4_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port3_rx_div_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_uniphy_port3_tx_div4_clk_src = {
+	.reg = 0x638,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_uniphy_port3_tx_div4_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port3_tx_div_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_uniphy_port4_rx_div4_clk_src = {
+	.reg = 0x63c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_uniphy_port4_rx_div4_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port4_rx_div_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_regmap_div nss_cc_uniphy_port4_tx_div4_clk_src = {
+	.reg = 0x640,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "nss_cc_uniphy_port4_tx_div4_clk_src",
+		.parent_hws = (const struct clk_hw*[]){
+			&nss_cc_port4_tx_div_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port1_rx_div4_clk = {
+	.halt_reg = 0x644,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x644,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port1_rx_div4_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_uniphy_port1_rx_div4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port1_tx_div4_clk = {
+	.halt_reg = 0x648,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x648,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port1_tx_div4_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_uniphy_port1_tx_div4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port2_rx_div4_clk = {
+	.halt_reg = 0x64c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x64c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port2_rx_div4_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_uniphy_port2_rx_div4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port2_tx_div4_clk = {
+	.halt_reg = 0x650,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x650,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port2_tx_div4_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_uniphy_port2_tx_div4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port3_rx_div4_clk = {
+	.halt_reg = 0x654,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x654,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port3_rx_div4_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_uniphy_port3_rx_div4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port3_tx_div4_clk = {
+	.halt_reg = 0x658,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x658,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port3_tx_div4_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_uniphy_port3_tx_div4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port4_rx_div4_clk = {
+	.halt_reg = 0x65c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x65c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port4_rx_div4_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_uniphy_port4_rx_div4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_uniphy_port4_tx_div4_clk = {
+	.halt_reg = 0x660,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x660,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_uniphy_port4_tx_div4_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_uniphy_port4_tx_div4_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_nss_cc_eip_bfdcd_clk_src[] = {
+	F(375000000, P_CMN_PLL_NSS_CLK_375M, 1, 0, 0),
+	{ }
+};
+
+static const struct parent_map nss_cc_parent_map_eip[] = {
+	{ P_XO, 0 },
+	{ P_CMN_PLL_NSS_CLK_375M, 5 },
+};
+
+static struct clk_rcg2 nss_cc_eip_bfdcd_clk_src = {
+	.cmd_rcgr = 0x6a8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_eip,
+	.freq_tbl = ftbl_nss_cc_eip_bfdcd_clk_src,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_eip_bfdcd_clk_src",
+		.parent_data = nss_cc_ppe_parent_data_eip,
+		.num_parents = ARRAY_SIZE(nss_cc_ppe_parent_data_eip),
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch nss_cc_eip_clk = {
+	.halt_reg = 0x6bc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x6bc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_eip_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_eip_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_nssnoc_eip_clk = {
+	.halt_reg = 0x6c4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x6c4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_nssnoc_eip_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_eip_bfdcd_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static const struct freq_tbl ftbl_nss_cc_cfg_clk_ppe_cfg[] = {
+	F(100000000, P_GCC_GPLL0, 8, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 nss_cc_cfg_clk_src = {
+	.cmd_rcgr = 0x70c,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = nss_cc_parent_map_ppe_cfg,
+	.freq_tbl = ftbl_nss_cc_cfg_clk_ppe_cfg,
+	.clkr.hw.init = &(const struct clk_init_data){
+		.name = "nss_cc_cfg_clk_src",
+		.parent_data = nss_cc_ppe_parent_data_ppe_cfg,
+		.num_parents = ARRAY_SIZE(nss_cc_ppe_parent_data_ppe_cfg),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_ops,
+	},
+};
+
+static struct clk_branch nss_cc_nss_csr_clk = {
+	.halt_reg = 0x714,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x714,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_nss_csr_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_cfg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch nss_cc_nssnoc_nss_csr_clk = {
+	.halt_reg = 0x718,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x718,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data){
+			.name = "nss_cc_nssnoc_nss_csr_clk",
+			.parent_hws = (const struct clk_hw*[]){
+				&nss_cc_cfg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *nss_cc_ipq5210_clocks[] = {
+	[NSS_CC_PPE_CLK_SRC] = &nss_cc_ppe_clk_src.clkr,
+	[NSS_CC_PPE_SWITCH_IPE_CLK] = &nss_cc_ppe_switch_ipe_clk.clkr,
+	[NSS_CC_PPE_SWITCH_BTQ_CLK] = &nss_cc_ppe_switch_btq_clk.clkr,
+	[NSS_CC_PPE_SWITCH_CLK] = &nss_cc_ppe_switch_clk.clkr,
+	[NSS_CC_PPE_SWITCH_CFG_CLK] = &nss_cc_ppe_switch_cfg_clk.clkr,
+	[NSS_CC_PPE_EDMA_CLK] = &nss_cc_ppe_edma_clk.clkr,
+	[NSS_CC_PPE_EDMA_CFG_CLK] = &nss_cc_ppe_edma_cfg_clk.clkr,
+	[NSS_CC_PORT1_MAC_CLK] = &nss_cc_port1_mac_clk.clkr,
+	[NSS_CC_PORT1_RX_CLK] = &nss_cc_port1_rx_clk.clkr,
+	[NSS_CC_PORT1_RX_CLK_SRC] = &nss_cc_port1_rx_clk_src.clkr,
+	[NSS_CC_PORT1_RX_DIV_CLK_SRC] = &nss_cc_port1_rx_div_clk_src.clkr,
+	[NSS_CC_PORT1_TX_CLK] = &nss_cc_port1_tx_clk.clkr,
+	[NSS_CC_PORT1_TX_CLK_SRC] = &nss_cc_port1_tx_clk_src.clkr,
+	[NSS_CC_PORT1_TX_DIV_CLK_SRC] = &nss_cc_port1_tx_div_clk_src.clkr,
+	[NSS_CC_PORT2_MAC_CLK] = &nss_cc_port2_mac_clk.clkr,
+	[NSS_CC_PORT2_RX_CLK] = &nss_cc_port2_rx_clk.clkr,
+	[NSS_CC_PORT2_RX_CLK_SRC] = &nss_cc_port2_rx_clk_src.clkr,
+	[NSS_CC_PORT2_RX_DIV_CLK_SRC] = &nss_cc_port2_rx_div_clk_src.clkr,
+	[NSS_CC_PORT2_TX_CLK] = &nss_cc_port2_tx_clk.clkr,
+	[NSS_CC_PORT2_TX_CLK_SRC] = &nss_cc_port2_tx_clk_src.clkr,
+	[NSS_CC_PORT2_TX_DIV_CLK_SRC] = &nss_cc_port2_tx_div_clk_src.clkr,
+	[NSS_CC_PORT3_MAC_CLK] = &nss_cc_port3_mac_clk.clkr,
+	[NSS_CC_PORT3_RX_CLK] = &nss_cc_port3_rx_clk.clkr,
+	[NSS_CC_PORT3_RX_CLK_SRC] = &nss_cc_port3_rx_clk_src.clkr,
+	[NSS_CC_PORT3_RX_DIV_CLK_SRC] = &nss_cc_port3_rx_div_clk_src.clkr,
+	[NSS_CC_PORT3_TX_CLK] = &nss_cc_port3_tx_clk.clkr,
+	[NSS_CC_PORT3_TX_CLK_SRC] = &nss_cc_port3_tx_clk_src.clkr,
+	[NSS_CC_PORT3_TX_DIV_CLK_SRC] = &nss_cc_port3_tx_div_clk_src.clkr,
+	[NSS_CC_PORT4_MAC_CLK] = &nss_cc_port4_mac_clk.clkr,
+	[NSS_CC_PORT4_RX_CLK] = &nss_cc_port4_rx_clk.clkr,
+	[NSS_CC_PORT4_RX_CLK_SRC] = &nss_cc_port4_rx_clk_src.clkr,
+	[NSS_CC_PORT4_RX_DIV_CLK_SRC] = &nss_cc_port4_rx_div_clk_src.clkr,
+	[NSS_CC_PORT4_TX_CLK] = &nss_cc_port4_tx_clk.clkr,
+	[NSS_CC_PORT4_TX_CLK_SRC] = &nss_cc_port4_tx_clk_src.clkr,
+	[NSS_CC_PORT4_TX_DIV_CLK_SRC] = &nss_cc_port4_tx_div_clk_src.clkr,
+	[NSS_CC_PORT5_MAC_CLK] = &nss_cc_port5_mac_clk.clkr,
+	[NSS_CC_PORT5_RX_CLK] = &nss_cc_port5_rx_clk.clkr,
+	[NSS_CC_PORT5_RX_CLK_SRC] = &nss_cc_port5_rx_clk_src.clkr,
+	[NSS_CC_PORT5_RX_DIV_CLK_SRC] = &nss_cc_port5_rx_div_clk_src.clkr,
+	[NSS_CC_PORT5_TX_CLK] = &nss_cc_port5_tx_clk.clkr,
+	[NSS_CC_PORT5_TX_CLK_SRC] = &nss_cc_port5_tx_clk_src.clkr,
+	[NSS_CC_PORT5_TX_DIV_CLK_SRC] = &nss_cc_port5_tx_div_clk_src.clkr,
+	[NSS_CC_PORT6_MAC_CLK] = &nss_cc_port6_mac_clk.clkr,
+	[NSS_CC_PORT6_RX_CLK] = &nss_cc_port6_rx_clk.clkr,
+	[NSS_CC_PORT6_RX_CLK_SRC] = &nss_cc_port6_rx_clk_src.clkr,
+	[NSS_CC_PORT6_RX_DIV_CLK_SRC] = &nss_cc_port6_rx_div_clk_src.clkr,
+	[NSS_CC_PORT6_TX_CLK] = &nss_cc_port6_tx_clk.clkr,
+	[NSS_CC_PORT6_TX_CLK_SRC] = &nss_cc_port6_tx_clk_src.clkr,
+	[NSS_CC_PORT6_TX_DIV_CLK_SRC] = &nss_cc_port6_tx_div_clk_src.clkr,
+	[NSS_CC_NSSNOC_PPE_CLK] = &nss_cc_nssnoc_ppe_clk.clkr,
+	[NSS_CC_NSSNOC_PPE_CFG_CLK] = &nss_cc_nssnoc_ppe_cfg_clk.clkr,
+	[NSS_CC_UNIPHY_PORT1_RX_CLK] = &nss_cc_uniphy_port1_rx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT1_TX_CLK] = &nss_cc_uniphy_port1_tx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT2_RX_CLK] = &nss_cc_uniphy_port2_rx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT2_TX_CLK] = &nss_cc_uniphy_port2_tx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT3_RX_CLK] = &nss_cc_uniphy_port3_rx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT3_TX_CLK] = &nss_cc_uniphy_port3_tx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT4_RX_CLK] = &nss_cc_uniphy_port4_rx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT4_TX_CLK] = &nss_cc_uniphy_port4_tx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT5_RX_CLK] = &nss_cc_uniphy_port5_rx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT5_TX_CLK] = &nss_cc_uniphy_port5_tx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT6_RX_CLK] = &nss_cc_uniphy_port6_rx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT6_TX_CLK] = &nss_cc_uniphy_port6_tx_clk.clkr,
+	[NSS_CC_XGMAC0_PTP_REF_CLK] = &nss_cc_xgmac0_ptp_ref_clk.clkr,
+	[NSS_CC_XGMAC0_PTP_REF_DIV_CLK_SRC] = &nss_cc_xgmac0_ptp_ref_div_clk_src.clkr,
+	[NSS_CC_XGMAC1_PTP_REF_CLK] = &nss_cc_xgmac1_ptp_ref_clk.clkr,
+	[NSS_CC_XGMAC1_PTP_REF_DIV_CLK_SRC] = &nss_cc_xgmac1_ptp_ref_div_clk_src.clkr,
+	[NSS_CC_XGMAC2_PTP_REF_CLK] = &nss_cc_xgmac2_ptp_ref_clk.clkr,
+	[NSS_CC_XGMAC2_PTP_REF_DIV_CLK_SRC] = &nss_cc_xgmac2_ptp_ref_div_clk_src.clkr,
+	[NSS_CC_PON_CLK] = &nss_cc_pon_clk.clkr,
+	[NSS_CC_EPHY_RX_CLK_SRC] = &nss_cc_ephy_rx_mux_clk_src.clkr,
+	[NSS_CC_EPHY_RX_CLK] = &nss_cc_ephy_rx_clk.clkr,
+	[NSS_CC_EPHY_TX_CLK_SRC] = &nss_cc_ephy_tx_mux_clk_src.clkr,
+	[NSS_CC_EPHY_TX_CLK] = &nss_cc_ephy_tx_clk.clkr,
+	[NSS_CC_UNIPHY_PORT1_RX_DIV4_CLK_SRC] = &nss_cc_uniphy_port1_rx_div4_clk_src.clkr,
+	[NSS_CC_UNIPHY_PORT1_TX_DIV4_CLK_SRC] = &nss_cc_uniphy_port1_tx_div4_clk_src.clkr,
+	[NSS_CC_UNIPHY_PORT2_RX_DIV4_CLK_SRC] = &nss_cc_uniphy_port2_rx_div4_clk_src.clkr,
+	[NSS_CC_UNIPHY_PORT2_TX_DIV4_CLK_SRC] = &nss_cc_uniphy_port2_tx_div4_clk_src.clkr,
+	[NSS_CC_UNIPHY_PORT3_RX_DIV4_CLK_SRC] = &nss_cc_uniphy_port3_rx_div4_clk_src.clkr,
+	[NSS_CC_UNIPHY_PORT3_TX_DIV4_CLK_SRC] = &nss_cc_uniphy_port3_tx_div4_clk_src.clkr,
+	[NSS_CC_UNIPHY_PORT4_RX_DIV4_CLK_SRC] = &nss_cc_uniphy_port4_rx_div4_clk_src.clkr,
+	[NSS_CC_UNIPHY_PORT4_TX_DIV4_CLK_SRC] = &nss_cc_uniphy_port4_tx_div4_clk_src.clkr,
+	[NSS_CC_UNIPHY_PORT1_RX_DIV4_CLK] = &nss_cc_uniphy_port1_rx_div4_clk.clkr,
+	[NSS_CC_UNIPHY_PORT1_TX_DIV4_CLK] = &nss_cc_uniphy_port1_tx_div4_clk.clkr,
+	[NSS_CC_UNIPHY_PORT2_RX_DIV4_CLK] = &nss_cc_uniphy_port2_rx_div4_clk.clkr,
+	[NSS_CC_UNIPHY_PORT2_TX_DIV4_CLK] = &nss_cc_uniphy_port2_tx_div4_clk.clkr,
+	[NSS_CC_UNIPHY_PORT3_RX_DIV4_CLK] = &nss_cc_uniphy_port3_rx_div4_clk.clkr,
+	[NSS_CC_UNIPHY_PORT3_TX_DIV4_CLK] = &nss_cc_uniphy_port3_tx_div4_clk.clkr,
+	[NSS_CC_UNIPHY_PORT4_RX_DIV4_CLK] = &nss_cc_uniphy_port4_rx_div4_clk.clkr,
+	[NSS_CC_UNIPHY_PORT4_TX_DIV4_CLK] = &nss_cc_uniphy_port4_tx_div4_clk.clkr,
+	[NSS_CC_EIP_BFDCD_CLK_SRC] = &nss_cc_eip_bfdcd_clk_src.clkr,
+	[NSS_CC_EIP_CLK] = &nss_cc_eip_clk.clkr,
+	[NSS_CC_NSSNOC_EIP_CLK] = &nss_cc_nssnoc_eip_clk.clkr,
+	[NSS_CC_CFG_CLK_SRC] = &nss_cc_cfg_clk_src.clkr,
+	[NSS_CC_NSS_CSR_CLK] = &nss_cc_nss_csr_clk.clkr,
+	[NSS_CC_NSSNOC_NSS_CSR_CLK] = &nss_cc_nssnoc_nss_csr_clk.clkr,
+};
+
+static const struct qcom_reset_map nss_cc_ipq5210_resets[] = {
+	[NSS_CC_PPE_BCR] = { 0x3e8 },
+	[NSS_CC_PPE_SWITCH_IPE_CLK_ARES] = { 0x424, 2 },
+	[NSS_CC_PPE_SWITCH_BTQ_CLK_ARES] = { 0x42c, 2 },
+	[NSS_CC_PPE_SWITCH_CLK_ARES] = { 0x434, 2 },
+	[NSS_CC_PPE_SWITCH_CFG_CLK_ARES] = { 0x43c, 2 },
+	[NSS_CC_PPE_EDMA_CLK_ARES] = { 0x440, 2 },
+	[NSS_CC_PPE_EDMA_CFG_CLK_ARES] = { 0x448, 2 },
+	[NSS_CC_PORT1_MAC_CLK_ARES] = { 0x44c, 2 },
+	[NSS_CC_PORT2_MAC_CLK_ARES] = { 0x454, 2 },
+	[NSS_CC_PORT3_MAC_CLK_ARES] = { 0x45c, 2 },
+	[NSS_CC_PORT4_MAC_CLK_ARES] = { 0x464, 2 },
+	[NSS_CC_PORT5_MAC_CLK_ARES] = { 0x46c, 2 },
+	[NSS_CC_PORT6_MAC_CLK_ARES] = { 0x474, 2 },
+	[NSS_CC_PON_CLK_ARES] = { 0x47c, 2 },
+	[NSS_CC_XGMAC0_PTP_REF_CLK_ARES] = { 0x488, 2 },
+	[NSS_CC_XGMAC1_PTP_REF_CLK_ARES] = { 0x48c, 2 },
+	[NSS_CC_XGMAC2_PTP_REF_CLK_ARES] = { 0x490, 2 },
+	[NSS_CC_NSSNOC_PPE_CLK_ARES] = { 0x4a4, 2 },
+	[NSS_CC_NSSNOC_PPE_CFG_CLK_ARES] = { 0x4a8, 2 },
+	[NSS_CC_PORT1_RX_CLK_ARES] = { 0x548, 2 },
+	[NSS_CC_PORT1_TX_CLK_ARES] = { 0x550, 2 },
+	[NSS_CC_PORT2_RX_CLK_ARES] = { 0x558, 2 },
+	[NSS_CC_PORT2_TX_CLK_ARES] = { 0x560, 2 },
+	[NSS_CC_PORT3_RX_CLK_ARES] = { 0x568, 2 },
+	[NSS_CC_PORT3_TX_CLK_ARES] = { 0x570, 2 },
+	[NSS_CC_PORT4_RX_CLK_ARES] = { 0x578, 2 },
+	[NSS_CC_PORT4_TX_CLK_ARES] = { 0x580, 2 },
+	[NSS_CC_PORT5_RX_CLK_ARES] = { 0x588, 2 },
+	[NSS_CC_PORT5_TX_CLK_ARES] = { 0x590, 2 },
+	[NSS_CC_PORT6_RX_CLK_ARES] = { 0x598, 2 },
+	[NSS_CC_PORT6_TX_CLK_ARES] = { 0x5a0, 2 },
+	[NSS_CC_EPHY_RX_CLK_ARES] = { 0x618, 2 },
+	[NSS_CC_EPHY_TX_CLK_ARES] = { 0x61c, 2 },
+	[NSS_CC_UNIPHY_PORT1_RX_CLK_ARES] = { 0x5e0, 2 },
+	[NSS_CC_UNIPHY_PORT1_TX_CLK_ARES] = { 0x5e4, 2 },
+	[NSS_CC_UNIPHY_PORT2_RX_CLK_ARES] = { 0x5e8, 2 },
+	[NSS_CC_UNIPHY_PORT2_TX_CLK_ARES] = { 0x5ec, 2 },
+	[NSS_CC_UNIPHY_PORT3_RX_CLK_ARES] = { 0x5f0, 2 },
+	[NSS_CC_UNIPHY_PORT3_TX_CLK_ARES] = { 0x5f4, 2 },
+	[NSS_CC_UNIPHY_PORT4_RX_CLK_ARES] = { 0x5f8, 2 },
+	[NSS_CC_UNIPHY_PORT4_TX_CLK_ARES] = { 0x5fc, 2 },
+	[NSS_CC_UNIPHY_PORT5_RX_CLK_ARES] = { 0x600, 2 },
+	[NSS_CC_UNIPHY_PORT5_TX_CLK_ARES] = { 0x604, 2 },
+	[NSS_CC_UNIPHY_PORT6_RX_CLK_ARES] = { 0x608, 2 },
+	[NSS_CC_UNIPHY_PORT6_TX_CLK_ARES] = { 0x60c, 2 },
+	[NSS_CC_EIP_CLK_ARES] = { 0x6bc, 2 },
+	[NSS_CC_NSSNOC_EIP_CLK_ARES] = { 0x6c4, 2 },
+	[NSS_CC_NSS_CSR_CLK_ARES] = { 0x714, 2 },
+	[NSS_CC_NSSNOC_NSS_CSR_CLK_ARES] = { 0x718, 2 },
+	[NSS_CC_DEBUG_CLK_ARES] = { 0x770, 2 },
+};
+
+static const struct regmap_config nss_cc_ipq5210_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x800,
+	.fast_io = true,
+};
+
+static const struct qcom_icc_hws_data icc_ipq5210_nss_hws[] = {
+	{ MASTER_NSSNOC_PPE, SLAVE_NSSNOC_PPE, NSS_CC_NSSNOC_PPE_CLK },
+	{ MASTER_NSSNOC_PPE_CFG, SLAVE_NSSNOC_PPE_CFG, NSS_CC_NSSNOC_PPE_CFG_CLK },
+	{ MASTER_NSSNOC_NSS_CSR, SLAVE_NSSNOC_NSS_CSR, NSS_CC_NSSNOC_NSS_CSR_CLK },
+	{ MASTER_NSSNOC_EIP, SLAVE_NSSNOC_EIP, NSS_CC_NSSNOC_EIP_CLK },
+};
+
+#define IPQ_NSSCC_ID	(5210 * 2) /* some unique value */
+
+static const struct qcom_cc_desc nss_cc_ipq5210_desc = {
+	.config = &nss_cc_ipq5210_regmap_config,
+	.clks = nss_cc_ipq5210_clocks,
+	.num_clks = ARRAY_SIZE(nss_cc_ipq5210_clocks),
+	.resets = nss_cc_ipq5210_resets,
+	.num_resets = ARRAY_SIZE(nss_cc_ipq5210_resets),
+	.icc_hws = icc_ipq5210_nss_hws,
+	.num_icc_hws = ARRAY_SIZE(icc_ipq5210_nss_hws),
+	.icc_first_node_id = IPQ_NSSCC_ID,
+};
+
+static const struct dev_pm_ops nss_cc_ipq5210_pm_ops = {
+	SET_RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
+static const struct of_device_id nss_cc_ipq5210_match_table[] = {
+	{ .compatible = "qcom,ipq5210-nsscc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, nss_cc_ipq5210_match_table);
+
+static int nss_cc_ipq5210_probe(struct platform_device *pdev)
+{
+	int ret;
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Fail to enable runtime PM\n");
+
+	ret = devm_pm_clk_create(&pdev->dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Fail to create PM clock\n");
+
+	ret = pm_clk_add(&pdev->dev, "bus");
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Fail to add bus clock\n");
+
+	ret = pm_runtime_resume_and_get(&pdev->dev);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Fail to resume\n");
+
+	ret = qcom_cc_probe(pdev, &nss_cc_ipq5210_desc);
+	pm_runtime_put(&pdev->dev);
+
+	return ret;
+}
+
+static struct platform_driver nss_cc_ipq5210_driver = {
+	.probe = nss_cc_ipq5210_probe,
+	.driver = {
+		.name = "qcom,ipq5210-nsscc",
+		.of_match_table = nss_cc_ipq5210_match_table,
+		.pm = &nss_cc_ipq5210_pm_ops,
+		.sync_state = icc_sync_state,
+	},
+};
+module_platform_driver(nss_cc_ipq5210_driver);
+
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. NSSCC IPQ5210 Driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0

