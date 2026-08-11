Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3DE3BF662
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 15:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786463611; cv=none; b=Kxb3wAyLOkL6qoZriA0KJ3TsJk6glJ6rsbJNNBak8P94DykLyhA/Ga34/zq3IfHpfaDNzhSYc+Xr8KL3GZhSGGewccJ4Jq0M/Gw9xFWf7NeQQNIs05x+0v5eFF37KNHgUe0upCp5BK5q7RXRcz2B+h7ifLM4/Cq1OCY+j9cwUwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786463611; c=relaxed/simple;
	bh=N3bzVgGYgnlRE25Wi/JRlMp6LLGb6HwkYWniEoPG70s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=afabUleqPv3QZoJifOFLk1l5g/kqym+ffQy9w6NI2fWs5ixqGZlPlOD+JzLBGW6La69dpnsrFYSuwI9upBbs65x2S9vkgM8lH7ChsxJ3010P5UAg5vFALf+1gdzD9FbsLXrpPO38JRmIDOnKAnFsGA905QP/C6AGsaauOgLRD/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T6/qqfsC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fI4liYbF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T6/qqfsC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fI4liYbF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWxV7767062
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 15:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JieE+JnpXB5ZYV5RHiKi1Ls3vQ+XE00EuUx/8B1aRTE=; b=T6/qqfsC1xmOIVOh
	XP9wNLp0Tx+C2+GLmXRmBuCHtUmzN0P8PMPeK6itKRi3yXyqRzeXqPL3Nk5duPN6
	il6/aaSy+BsfM/b/ACVoB+cyaND+puC/fLTClC7AsRJXljX1w41bzxtRSJiChkIB
	gWjC5l3K/lx6X/CttcX3w66R3/ZaLiED2/xm2tpme/T9AKK4Ury14aRjz1L7A1tl
	xMNR/06Tm+5U8P/gGLB73bmpRj0xAgzzZTZyIDMp5QbKy5qf7z7I49oSD4bTv4dC
	QZ+Y9Mmvf5A2bhPAIPDxOR4J5TZOWRgdpvbRrTpA7tsztQVyYwf7FbLrHnrZkfGa
	OZmOiQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01q11bkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 15:53:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-caf5fa127d4so5405529a12.0
        for <devicetree@vger.kernel.org>; Tue, 11 Aug 2026 08:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786463608; x=1787068408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JieE+JnpXB5ZYV5RHiKi1Ls3vQ+XE00EuUx/8B1aRTE=;
        b=fI4liYbFuJGDXMx1Oc2vPm2gqnID65wKF80ueDuMxN1cF10vfosxKGUGE0ad52i1Kd
         GZ7TrCLWWaMXMVR7eKtph6m2+BqBz+T5efeX2tNgYD/idZ9oX+lupwJNmS5f7PpRGe15
         PtIVYJxscqXXPpbRFezUuBLRiQib3L4TiN6F8mZ9jnm0u8b59BdgMpmhfAfPzAYrYmuD
         Jbk65MbGQJr7tLXy9GnxpZtZcOm/qlWu5Qg0rKCMX0NjyrsRkU/8YS9/DgqHTRklpHYk
         mK/vHweQjRF1MBpmdfqagpa8TZogd+1hYgkhTiScSG9/BMiOKIkhd0+GJuc2mEPgVWOH
         nZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786463608; x=1787068408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JieE+JnpXB5ZYV5RHiKi1Ls3vQ+XE00EuUx/8B1aRTE=;
        b=Nugt/Dnl8B4LAoANOyOhO7+OMndbJWHJqpzMClBOE3jwqMdK84R1B83eU8cNM56081
         h2vpEcit/9yHgCoh9DQEn8PTjRmf+1vgT/iWaSMIutnevVkQCyxtWI/j5RWlG/zOddgr
         0pMVqRdvKEVSg3z3VXH5Tim+alyfHBuz274sjvBb1XzwIGD8yBS444dG0T0RzkbcFIau
         dBsKX1ctJEna9y8kaeRtQwo5F93D799ezF95C0yzSEtl/fDVV+9qxqKPKBrH6YxkI+8B
         YKg/gd/lwfffpR/Z/0bRVtp5HOUZPDkNZjCLZz7EAZT4i8SvcJWGONO0/Cgfyer0/a9q
         +fSQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp2xrdt3xyX92TJnOIyArISXhEO3zzUdfWDvTbrDDouPejLpn4N8xZRIDQ7GGPDzKpKebIf3nMiS3sS@vger.kernel.org
X-Gm-Message-State: AOJu0Yzhy8Lx7MYcc0Hx4eOBTzr0DRHsRT0Bz5V2MZS9aspWWsF4U+hT
	KBz3+jkAP3xEY4JLEJxFQXOugkkq8SFMBJqPhmT23uZR3XjDD6+vRk9J3r5mqssmTQm3PzUdpN4
	Hu82Hs9ce6cK0uc5ODjpruuiyMrSoErkWkb45AsPwp7wSaVrmdhZnvIHdAcqh3Ikj
X-Gm-Gg: AR+sD13mGfhqZyjDvJ7ANF1oG2uKYFnMkYQWSLD9XEDdbJa/59/5pscK/WyOVKSUMEi
	RXOXNsji1Oa+gTcnM8SF5+jC6R3V+wq+Qw8q4Bofn00W04Fv29VR87R6RcSzMlaviHYisbq+1Fg
	TQny8waxu74BdVScMEfjc7EXStemB9NK8Qao25q+HcFbAtv4Ty+nIPVI2CeATOboEiINWp2pa61
	1nudzsLsSTGHzGeFoJET86I0YYlmiTyZFZcWAT+qqjqmdfn0W3jS6ZmO+s5h8yjXjsHN/TIRhXD
	b7cH2a2GLXuFceteWVQrLHtaBgznIPjPKUYkWCB6LRxSAvZFY9DsN/NLYYGI6qbznx2Shr29If9
	kpZD4W9ZUQnpFhU90i2T9oMIjBMGe+ePIrKyyXgsKu48HTE0iMEcK6UycAbwiPiG6BtnEUHIP4r
	1mpcuczduuL1zxbnQiWmEx+VDCAa85MRyB9WQ=
X-Received: by 2002:a05:6300:8811:b0:3c3:b57b:6285 with SMTP id adf61e73a8af0-3cc2b8304c5mr5860467637.13.1786463607704;
        Tue, 11 Aug 2026 08:53:27 -0700 (PDT)
X-Received: by 2002:a05:6300:8811:b0:3c3:b57b:6285 with SMTP id adf61e73a8af0-3cc2b8304c5mr5860364637.13.1786463607094;
        Tue, 11 Aug 2026 08:53:27 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf6d726f1sm1143032eec.26.2026.08.11.08.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 08:53:26 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:23:09 +0530
Subject: [PATCH v2 2/3] clk: qcom: ipq9650: Use icc-clk for enabling NoC
 related clocks
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-ipq9650_icc-v2-2-55b8efbd62c6@oss.qualcomm.com>
References: <20260811-ipq9650_icc-v2-0-55b8efbd62c6@oss.qualcomm.com>
In-Reply-To: <20260811-ipq9650_icc-v2-0-55b8efbd62c6@oss.qualcomm.com>
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
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: VxqHj8r9aZj-IkGtUaWumVisgCW4Ozps
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDEzMyBTYWx0ZWRfX7XdlAy2pkvIU
 f5MYya0OixO4/Jb5isGDzBEOI2MvFdTYjRVcm3P8tzPj9Bi5E6W7wDtFee0UaDGFdhtwPkHHYvO
 y9p/KOZhUXd17twy0pYEkIoFPE0ZhLcwfq9aCjAc377ExC0aSEu8ykL2FIICurs8P1V+gpd0g50
 STKyFtybq5I1nQYEn3g0LO/mTvD4riOGjpbj+92TwW2zgc/08gHboKZUwmDnWD0eZlOz9A3xHwA
 tsrsja68kwsC+FS1u/N0QMLraJ9bwnFghLkpwI6HG/jf6O9yqgLmVxocCORh5a9EOZ6zpMMAIq4
 rSV+lggVQ4AI4cIqcoLH7BR1UseQ/EGY+ILlIpVbJJPOkmHzASt44dLxx2qyetpZIdT1s+wfPSJ
 8mJujyPyy6YZJ45OLXVYQUMg536mJ6dUxzVA+TfMV5tMTRt3meriGtqEU/qzvk6zHv/XCM45Bn1
 j2LI0j266+h7gNpSCMw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDEzMyBTYWx0ZWRfX2Ze00AI5Yv0N
 kZIQk00uvgJWHxbiS1VNrpNJbLvWzzPjUWmdB+GosIbjSG5TiXoKWMWtyz7CWnoX8eC2LinUHAa
 qfm1YTf7KWQ6ThCXJA4L9yltjIM84f0=
X-Proofpoint-ORIG-GUID: VxqHj8r9aZj-IkGtUaWumVisgCW4Ozps
X-Authority-Analysis: v=2.4 cv=brt8wkai c=1 sm=1 tr=0 ts=6a7b4578 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=mQEdNAxdQoGx0Htu_1MA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110133

Register NoC clocks for PCIe and USB interconnect paths using the
icc-clk framework. Without this, the clocks required to create
interconnect paths and access peripherals connected to these NoCs are
not properly managed.

Also add icc_sync_state to ensure clock states are synchronized after all
consumers have probed.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-ipq9650.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/clk/qcom/gcc-ipq9650.c b/drivers/clk/qcom/gcc-ipq9650.c
index e65a52fdfa91..8c09a757c11d 100644
--- a/drivers/clk/qcom/gcc-ipq9650.c
+++ b/drivers/clk/qcom/gcc-ipq9650.c
@@ -4,11 +4,13 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/interconnect-provider.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,ipq9650-gcc.h>
+#include <dt-bindings/interconnect/qcom,ipq9650.h>
 #include <dt-bindings/reset/qcom,ipq9650-gcc.h>
 
 #include "clk-alpha-pll.h"
@@ -3474,6 +3476,22 @@ static const struct qcom_reset_map gcc_ipq9650_resets[] = {
 	[GCC_USB_BCR] = { 0x2c000 },
 };
 
+#define IPQ_APPS_ID			9650	/* some unique value */
+
+static const struct qcom_icc_hws_data icc_ipq9650_hws[] = {
+	{ MASTER_ANOC_PCIE0, SLAVE_ANOC_PCIE0, GCC_ANOC_PCIE0_1LANE_M_CLK },
+	{ MASTER_CNOC_PCIE0, SLAVE_CNOC_PCIE0, GCC_ANOC_PCIE0_1LANE_S_CLK },
+	{ MASTER_ANOC_PCIE1, SLAVE_ANOC_PCIE1, GCC_ANOC_PCIE1_2LANE_M_CLK },
+	{ MASTER_CNOC_PCIE1, SLAVE_CNOC_PCIE1, GCC_ANOC_PCIE1_2LANE_S_CLK },
+	{ MASTER_ANOC_PCIE2, SLAVE_ANOC_PCIE2, GCC_ANOC_PCIE2_2LANE_M_CLK },
+	{ MASTER_CNOC_PCIE2, SLAVE_CNOC_PCIE2, GCC_ANOC_PCIE2_2LANE_S_CLK },
+	{ MASTER_ANOC_PCIE3, SLAVE_ANOC_PCIE3, GCC_ANOC_PCIE3_2LANE_M_CLK },
+	{ MASTER_CNOC_PCIE3, SLAVE_CNOC_PCIE3, GCC_ANOC_PCIE3_2LANE_S_CLK },
+	{ MASTER_ANOC_PCIE4, SLAVE_ANOC_PCIE4, GCC_ANOC_PCIE4_1LANE_M_CLK },
+	{ MASTER_CNOC_PCIE4, SLAVE_CNOC_PCIE4, GCC_ANOC_PCIE4_1LANE_S_CLK },
+	{ MASTER_SNOC_USB, SLAVE_SNOC_USB, GCC_SNOC_USB_CLK },
+};
+
 static const struct of_device_id gcc_ipq9650_match_table[] = {
 	{ .compatible = "qcom,ipq9650-gcc" },
 	{ }
@@ -3503,6 +3521,9 @@ static const struct qcom_cc_desc gcc_ipq9650_desc = {
 	.num_resets = ARRAY_SIZE(gcc_ipq9650_resets),
 	.clk_hws = gcc_ipq9650_hws,
 	.num_clk_hws = ARRAY_SIZE(gcc_ipq9650_hws),
+	.icc_hws = icc_ipq9650_hws,
+	.num_icc_hws = ARRAY_SIZE(icc_ipq9650_hws),
+	.icc_first_node_id = IPQ_APPS_ID,
 };
 
 static int gcc_ipq9650_probe(struct platform_device *pdev)
@@ -3515,6 +3536,7 @@ static struct platform_driver gcc_ipq9650_driver = {
 	.driver = {
 		.name   = "qcom,gcc-ipq9650",
 		.of_match_table = gcc_ipq9650_match_table,
+		.sync_state = icc_sync_state,
 	},
 };
 

-- 
2.34.1

