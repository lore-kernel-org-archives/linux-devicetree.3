Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F6F48663E
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 07:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875411; cv=none; b=RI83C96Bt3tJcUaYIfJrXTXyI4XZe7pLVm2JUe2wjdjBff4qklEh9uBfbcyrRFe5sqbbcA5h0U27g+Nk5lwITpIXipwDKY7EGycdP/Mpvm8ZOQ+fd279zhhexWlBwKLpdyPFuijLit2cFrP1P2QdiQOX5DWxufy98E3tG0SYaYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875411; c=relaxed/simple;
	bh=GT4nQWfAHHvUyvID0wXUdxYaJ9PYrHZUrmHJ+kW7nDI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l2+d8faMlIM/oNSzpP3l4Mpcf6H7HQ8Eaq8KGCKVxjQvQNAhh4A62IOCaX8P7YeF76PUCf/UbfFrzCEA3iPgeoDrt1jrZBJiLb/GoKJPeNLys2Yw3WUwP1Q7YWD+M5pvAm7RiEN310q1EbTe1nnl47ZcBqBsg8ATF4cf354illQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o2B4vkQ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kZKYpQPc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o2B4vkQ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kZKYpQPc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D21hNe3753284
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 07:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4ZfDSPkxZWxiCfJTiYTWUgSm+iAf7ms4spkP7C4FtQY=; b=o2B4vkQ9dgvGAZ62
	hx5SBfB96tWb8IInoRfzOsGLvgnpE9fZl4ovzPvVKiDQgCfxTLTs04FMk3TR3vHg
	V9W3IIOjyhG0gmg/Cy427W2tbCAeRskl3vq/YOEmtpAW/8EmZRNMyiguCgfJyr8E
	OB2Xq8aMppvR+h6Q7MwfntiusqDiT8ZwyP5OFr8w0WoqM/wLOcLvqjpOmUvecaxu
	0iqHpxWDXoOUTdqaM8h/AYDfmfM9DIQbBr/NmVJiMZ8HLLlQm1+oecLwFoNGhs18
	Y59VdQnc4bnoi9FO3vHEz8eXOegy2vbzBdfLVvGW30mrGni31MsEP8j4L+pBOn2x
	iW6ECA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h940w2rmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 07:10:09 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so7853170eec.1
        for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 00:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791875407; x=1792480207; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ZfDSPkxZWxiCfJTiYTWUgSm+iAf7ms4spkP7C4FtQY=;
        b=kZKYpQPcYpVaJ1FMr9p+yFIOmMjLNAorIVba90ZD09JzBO1YPUBP0hnwDBeDD7cy7Q
         bm4H1P+913i4mOM5HaYpkCVPP644XYEUz0PgUy0vQyuPGeXPj21ekDmfY9PK1br04URJ
         gHd+fVImKdqdrfOS2791+NI57FvDB5T/cLH2FET7a1IULiQ9BrSei6OAXtgy81I+Jn77
         rzOju71fl1EcutBL1QX41MZ+2qggfbXJARZ+Fxz6T91vt/pnjuYBzR97QJYqzaKpf9bv
         11l9ScwUpjGoBFXX2t+eFPR1wVTqawmCE9sZPJcONgSY2lF/5vcG8orsk/EkfIxzqbju
         Craw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791875407; x=1792480207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ZfDSPkxZWxiCfJTiYTWUgSm+iAf7ms4spkP7C4FtQY=;
        b=f+d9YVMxJAP88BluWY3RU8ufP7qtww1QVhDAIRWMTxQ4d8ZTKxKh8m9fqJn57f7oif
         K7K8qerdwqGzFOhlnDa2CM7aibF8jGxHgDaM4yZ6rbMi6aNRUCWDmL/eDEUxG3fbX6NI
         YqqBkr/MeHydmk6+eqsbhwZ5lKEioabmF450BUKNAR/vWFlngmcFhbWhkxxshyo3biRA
         lBlsmGsdezrEUpeieJH5aRMjTw8WoSFvsVuXRdwZg5qpydA7tJT3GxoVlf0lsgRT2Pso
         9W0WhNtujcZ5rttB8rCRjFVqycx+Zg2B0xBoMHRPUWhadiTo/LzD9ka+dC1mW7AVR+C/
         i6SQ==
X-Forwarded-Encrypted: i=1; AKwUvBygfMJptNCb+saYZbMDKCxgGglH3IuXj8PgIC3y4ofDy3dw7DEutzjuWRXAXFUgfDfk7bRlyAJDV/qL@vger.kernel.org
X-Gm-Message-State: AFq9FYK/2PHmK4lG1ZSgSgSuhrQOZAl+Rz2zIKVvbCgJMHfDF5Wgma/c
	d5joGawpua4Yp9TgZpMez7Drvc0BsmyPDDnJ5X9fXL+oTADDqEqWVizBk8/pMzDxUzg634dkLix
	Mm+f/Ix92cs/arypoAKuHGNw+ryOsAa/EYpL6KY93JiRWIWKNMOh/pAFH0+2F798N
X-Gm-Gg: AYBFou2/RJiJT7Lh8PqYva7+XFBePLnbwIusT671HeQfvHKvtOgl0gFAVDPOj4bCj9E
	GhNOJBvZaP/LAakprPZnrYfiGKGqkF/Z4svg9H3rv93fXugELAllhQU0dMF3ypUDhs7gNeRTNtf
	cFscGMmBapDdYmgXYzlYVMjKU4lfB7sRnwlzbN92UNt+xmA8bk88kaFhq0VOEKLDfrNhwstd2tc
	xRr8ZQOwUP3Uq3HjhdFoS7go9sRU6j6g91U6MLMKhWaQMkjGXJTQh37D74qVIkn8KkGrsV8p16r
	EM1Y40M8UWkusSrglo36LeAdt/uxEJieN8WTDP9DAvzNlAl/steihbHyywp19oxy1mWr8TryNp0
	qTHGfQGfEZ681E3buRBpPDrM4Na7yjK7atxlMmWHNbDUyCm5kOHtNdm5uaGH7YeU0hGeo+QbG3n
	pP84LQ2I0fiFV53BJKwc4Rj0ujOgUfGw==
X-Received: by 2002:a05:7300:c00c:10b0:35a:22a4:12a with SMTP id 5a478bee46e88-35a22a420demr8884442eec.18.1791875407324;
        Tue, 13 Oct 2026 00:10:07 -0700 (PDT)
X-Received: by 2002:a05:7300:c00c:10b0:35a:22a4:12a with SMTP id 5a478bee46e88-35a22a420demr8884412eec.18.1791875406757;
        Tue, 13 Oct 2026 00:10:06 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cab27d5sm46081248eec.17.2026.10.13.00.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:10:06 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:39:44 +0530
Subject: [PATCH v2 2/3] clk: qcom: ipq5210: Use icc-clk for enabling NoC
 related clocks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-icc-v2-2-196b219e25c1@oss.qualcomm.com>
References: <20261013-icc-v2-0-196b219e25c1@oss.qualcomm.com>
In-Reply-To: <20261013-icc-v2-0-196b219e25c1@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: Nko6_6KU6ROPLc3TvyRmhMHdhDZOcir5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAyOCBTYWx0ZWRfXzXDDCRJD2qcu
 G2Qu/Zz3QuoCXHVE6osE/BMFVYKjqp4uao7u9RYDEliulyR/qH8oixhZ0ka8AqOViF/M6eSvmuu
 USOv8blfwk4CaTk0xvyb12BduoqNwKoUZTQOia+XO7AmDgg/0Tg4wtrgaIMcw6kVKx3Dh0OhZtJ
 HqufcOnpR/Prc9Qt5p/u/7lSRaqQgaUs5zNkpAY2Ag1tUO59S5MPbRCSaeVBnWSFBzsjchhdrI+
 MCg2XlcIYurBpTTOkQfUrki9TFeGHk6p5kWPD/vwKvGMj6AsLSAXDaAtsed6AkWow7EWA+WyQAd
 6WgsDx1VW2JXFSYbgbzwz4+KRble13MsEAHO64o/YUvwgcFdklv7u+FgGUOgmMezXGcYAFIzDzM
 PgIRfIENFM30xk/tU32o+fTCByYMmz6LwI0QPHUARsJrOSXPEtG96POanazyD8786sSwvwZFwjL
 D3YnyaL/Rb+PHTryoqA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAyOCBTYWx0ZWRfX3+L4V0XYSZ+I
 M/chg51jEyh13ie8qNUflXhoBrUzdn0iUs2/wcH0lIWP/4LiS3Op8mbikcHqtlDfG1ZKZVXtl2d
 3J04jvN1hHQtW70R5/rQszA0TRPy62Q=
X-Authority-Analysis: v=2.4 cv=ftZJ914f c=1 sm=1 tr=0 ts=6acdd951 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=2vMkRBvVivtXAe3DWLoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: Nko6_6KU6ROPLc3TvyRmhMHdhDZOcir5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130028

Use the icc-clk framework to enable few clocks to be able to
create paths and use the peripherals connected on those NoCs.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-ipq5210.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq5210.c b/drivers/clk/qcom/gcc-ipq5210.c
index 76adfa8bf2ad..b6d93a5a7691 100644
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
@@ -2603,6 +2605,16 @@ static const struct qcom_reset_map gcc_ipq5210_resets[] = {
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
@@ -2631,6 +2643,9 @@ static const struct qcom_cc_desc gcc_ipq5210_desc = {
 	.num_resets = ARRAY_SIZE(gcc_ipq5210_resets),
 	.clk_hws = gcc_ipq5210_hws,
 	.num_clk_hws = ARRAY_SIZE(gcc_ipq5210_hws),
+	.icc_hws = icc_ipq5210_hws,
+	.num_icc_hws = ARRAY_SIZE(icc_ipq5210_hws),
+	.icc_first_node_id = IPQ_APPS_ID,
 };
 
 static int gcc_ipq5210_probe(struct platform_device *pdev)
@@ -2643,6 +2658,7 @@ static struct platform_driver gcc_ipq5210_driver = {
 	.driver = {
 		.name   = "qcom,gcc-ipq5210",
 		.of_match_table = gcc_ipq5210_match_table,
+		.sync_state = icc_sync_state,
 	},
 };
 

-- 
2.34.1

