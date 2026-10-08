Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD574DA9AC
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 14:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791471130; cv=none; b=fVhnEqMVcV9luEc4mp+kvbzu3i2fBZS+q8IG8+ysNeOnZlz7eLTxsHRGLDnjSC7M7lhkvRjiXnU5JMzwFUBDbmxGYjJIYJu5tDFi1lScbpoYFsjnYB6FxueVF2OEMeiMnLYIaeGjnyOZi72zeTRKY1bA9Lq5t6r0XCTI8m9DgXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791471130; c=relaxed/simple;
	bh=mp6D0oOUv26EDKVfLKfYz3oxZLckyUzpTBMUv8dvbIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MKgsSyj6fbmFWvZ29CvwoySjXsn8rUhy2c/2eRXs2CD9ZNs2zAvxogMvVcfRyqoxv1h1Sc+ROvW6tDVq/46OKsJqHDCYo8gYBVs2J9+LcUZAOMv1iqOhPtBj84vnKYDFyhoLCK5PPRffymJWSjmVQJqbehai2tEKnnnogySmstg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qq5IxXmR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YL7xehTQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qq5IxXmR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YL7xehTQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698EVGm14148903
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 14:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CZaooxuxjYQ15OV3P2JEWTKRaG38C44w+UoENix4JvU=; b=Qq5IxXmR3PB6UrN2
	wduwdIPA8isEeGodhvK18I8JvG66of4sogaYfJr6sbaiGq01Qv1mWTBoGAgJRHR+
	1s1xffMdQXcG+vCm7aOwG9oRuafs1Xo4plnO9wIpMaf6Lsd8DIDFGyyP2WxmS2io
	hU1L64Mxvqvy2YkSqcW+0n5PtBgw39dqrHLrrlIsRegACqLCXSt9lA3BXlmQ+VqW
	h4mdY3pROYhCWJZ8hedyaFsF316Pku9ki6qIlvbgqLGpLvwl4qZV9Utuq2FTpTLw
	3IMJsKpP4U1fPhqiDLR6VgSbMwHoxCNDSrB6wT52dK+cK2SoQZmH0/gA41TFc9/w
	sgI/vg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe6bd9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 14:51:51 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8ace1d95f5eso73278897b3.2
        for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 07:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791471111; x=1792075911; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZaooxuxjYQ15OV3P2JEWTKRaG38C44w+UoENix4JvU=;
        b=YL7xehTQr/TEfpDbv8ofkJ4VQlMqXRfEUnSMNpm1Ty71880VwhyhNgo2x4n24eemon
         wf8p4sux/ply3TreO4Gcy7bKJu2e0oqiu+9I9mXzGezbpN8qLtc8FxDPLslRmZhOBWBf
         tAyk6hE1juozNZajBbCX1Mc9YMZUBpw/9X247HuggrZnaOuVpKsNvaOuUFAOleTNTHKq
         qYkCHYkzAJ8HOuaEawj5LN68B9IE5pfGLBo0ZmkEiSSnNs4mBASrsSHT/b3g3DWx2b3h
         B4cS1t7V8wuyTrX935MUNTwqBsemcr/Jtid1J+plmgH+DBkYVwPbEyfekgPyni2ngejV
         kFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791471111; x=1792075911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CZaooxuxjYQ15OV3P2JEWTKRaG38C44w+UoENix4JvU=;
        b=j/JwP33/EgHdst9ioVhXXbmNbZN4LG2KPCe/DgPuu23jMXqj/2gWDlsB3EjU/W3eWD
         eLp7eWZ7N2PlzYUouRPnXj5sh5SQgUATJL35b2A4ABDSHpjxDfC4+UlY+GoILyS6zIoL
         tb2BB0RrHjWL8HYcZjlDRAF5CmH1hX04e42s7Ngs0/PUz9E6E+aXkBeqXYZNY7wAbt5e
         WHyYQfUFzG2Ri0Bf7kgwBI0xtKM+6WSSHLbifCvGAuTMghhON2/MDAcoLlewH9gWz4NU
         Y6U/mNe5teDL1Eapmxvm3ZZiSV4F3vxRasEDI9hIL79qTquwp859qqd9iYyGYrF5kCvl
         2mLA==
X-Forwarded-Encrypted: i=1; AKwUvBxln3KR5fkilNwIV1Z91t3mRYstPs1eWiWDPKCHEO5mdoMwHctb8/kMplC5tTIYi2UCJ2hUMvkavNGT@vger.kernel.org
X-Gm-Message-State: AFq9FYJMAEheIwvoqxq8e+hvf02eR0n8gLM5khLRqdm8WHQacAPQx2A2
	qtpi/owQPCNcoESOB89G4q2lDo4eEu6E0JTdup0EvjzH2t3CVWVluI2RvlOwTx5BXXhxJ6QDSKS
	D5Mcqhein95TBeu1tvbuANigsE+jk1XsZb5QeEBbBi+bPR0tLh/J1WN2USgFB3rd8
X-Gm-Gg: AYBFou07lgHT6KCx3vI1XtbPdDDo2z85BzHriYPovTSwRkraAZ2l9VCmZvwz9SJJcvD
	KcPbdz4dNnRY5UhN0egRC5Caw2PrEWoP9mdhO7uJuKkU7KNT7SwCuPhXDUNSzALkr4zF31FSI2i
	ACrfx4R6c2F96hlsGyWUzBxOBI/SCWtKx3qTM1KcmgbTj/ax/Zqz9k+Xc3qx9xAkdq8I6NMNluN
	vK2/FiD7oAmsL9kk5EwGyCJt/Tvi0VeyhXXGikiBwnNc2HvxBB9YCF5LmU8O97qpY+utf44ykGD
	g/wyYyHAUtYhiCJkepS3xpAOI1bprSCbUrFOjdT6B8QvjtIZiWis3a+q1BcrMiCt5F/q6egGjOU
	gTGBdCfNTYSiPxrKrvZPJimNOsSInBbJ1j9gHwNRgbNo=
X-Received: by 2002:a05:690c:a70d:b0:8b0:702f:2984 with SMTP id 00721157ae682-8b070300f24mr7265917b3.15.1791471110370;
        Thu, 08 Oct 2026 07:51:50 -0700 (PDT)
X-Received: by 2002:a05:690c:a70d:b0:8b0:702f:2984 with SMTP id 00721157ae682-8b070300f24mr7265637b3.15.1791471109638;
        Thu, 08 Oct 2026 07:51:49 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b05ab62607sm20903407b3.22.2026.10.08.07.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 07:51:49 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 07:51:37 -0700
Subject: [PATCH net-next 05/11] net: ethernet: qualcomm: ppe: Add platform
 support for IPQ5424
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-qcom_ipq5424_ppe-v1-5-16caf43e44ee@oss.qualcomm.com>
References: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
In-Reply-To: <20261008-qcom_ipq5424_ppe-v1-0-16caf43e44ee@oss.qualcomm.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lei Wei <quic_leiwei@quicinc.com>,
        Suruchi Agarwal <quic_suruchia@quicinc.com>,
        Pavithra R <quic_pavir@quicinc.com>, Simon Horman <horms@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791471094; l=7410;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=mp6D0oOUv26EDKVfLKfYz3oxZLckyUzpTBMUv8dvbIQ=;
 b=7mmIY5bW4mlFdM6K0ugzyp91RoGnGTHEUUNKwZNRI0Pkqvhu/bCAHf318M9/5QBvNHHhE8oDv
 VLRMxAlaLKrCjTHA4RlApuHu7T+NM8udxB1ai2lIAxxh9c/z/NN1la+
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-ORIG-GUID: h_lFVxnZxyz97cGSV6FhxzgM8E4-RPjg
X-Authority-Analysis: v=2.4 cv=HcWB3SE8 c=1 sm=1 tr=0 ts=6ac7ae07 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ofAQdJVYYEMyJCF-WxoA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: h_lFVxnZxyz97cGSV6FhxzgM8E4-RPjg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX/QehBElmsebY
 caR9uFOY+6Q1zw51IF8izaxm+QK3/t/8BUeYjfNqERpoVcWDzrYcfDgXCvfK1ggAPtADzGGzZTz
 HAhUC/i/N8oeBfusvg1W5Do0QHlCuh/0emDQyIx3gzWfau1eonw5Rv52704SsDzitjax2ge0BQj
 QErnv45VP2qeMhppHtGrsBOylJQkYXffnEwLWvrcEZfnY2zM2+n+bHzl+8pqpzPx+tOxmkhAVE4
 dSZvtAR59+BF+9Ws5A2PEsNDhr5KCDbGkK9smSDWxaq3OvOHjYXoawYRznq4fEOv5+1sUI9d+8l
 wmvynfcta87o/+hyAIrLgzYgjiBnS246aNTOdgP4GHEezncNtFPZ/hFSLazFVbcsMWVisg8mh1W
 /poYGHIgxYoMwzDubj8+umUfX5V6Evuj5pwUVF0Ah6YTGtCh6ko/iSWY8PyrnZphi3FxLN9ki27
 fI71flWXCL4ZhHC9jtw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA1OSBTYWx0ZWRfX+ZQTdZN0yo9T
 gHI69QsObsQhzGUJEZn5j0HGx3QfB5kNeCcCkmvOWYTbujQVPbqtuQuN4dbjBy43XMH12RVkH6T
 /lb72Ld71jFZOrL66a5U7cJ70WL6VTQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_05,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610080059

IPQ5424 integrates the same PPE switch core as IPQ9574, but has only 3
Ethernet ports plus the EDMA FIFO, without the EIP FIFO. The PPE clock runs
at 375 MHz instead of IPQ9574's 353 MHz, and IPQ5424 requires a different,
smaller set of interconnect paths. The register space of the unavailable
MAC3 to MAC5 must also not be accessed on IPQ5424.

Add the platform data per SoC to describe these differences, and add the
IPQ5424 compatible.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/net/ethernet/qualcomm/ppe/ppe.c | 132 ++++++++++++++++++++++++++++----
 1 file changed, 116 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/ppe/ppe.c b/drivers/net/ethernet/qualcomm/ppe/ppe.c
index 3c301e609d3e..f71b673b6f97 100644
--- a/drivers/net/ethernet/qualcomm/ppe/ppe.c
+++ b/drivers/net/ethernet/qualcomm/ppe/ppe.c
@@ -18,13 +18,34 @@
 #include "ppe_config.h"
 #include "ppe_debugfs.h"
 
-#define PPE_PORT_MAX		8
-#define PPE_CLK_RATE		353000000
+#define IPQ9574_PPE_CLK_RATE	353000000
+#define IPQ5424_PPE_CLK_RATE	375000000
+
+/* 6 physical ports, 1 EDMA FIFO and 1 EIP FIFO. */
+#define IPQ9574_PPE_PORT_MAX		8
+/* 3 physical ports and 1 EDMA FIFO. */
+#define IPQ5424_PPE_PORT_MAX		4
+
+/**
+ * struct ppe_of_data - PPE private data of IPQ SoC
+ * @ppe_rate: PPE clock rate
+ * @num_ports: Number of PPE ports
+ * @regmap_config: Regmap configuration
+ * @icc_paths: Interconnect paths per PPE type
+ * @num_icc_paths: Number of ICC paths
+ */
+struct ppe_of_data {
+	unsigned long ppe_rate;
+	int num_ports;
+	const struct regmap_config *regmap_config;
+	const struct icc_bulk_data *icc_paths;
+	int num_icc_paths;
+};
 
 /* ICC clocks for enabling PPE device. The avg_bw and peak_bw with value 0
  * will be updated by the clock rate of PPE.
  */
-static const struct icc_bulk_data ppe_icc_data[] = {
+static const struct icc_bulk_data ipq9574_ppe_icc_data[] = {
 	{
 		.name = "ppe",
 		.avg_bw = 0,
@@ -62,6 +83,34 @@ static const struct icc_bulk_data ppe_icc_data[] = {
 	},
 };
 
+static const struct icc_bulk_data ipq5424_ppe_icc_data[] = {
+	{
+		.name = "ppe",
+		.avg_bw = 0,
+		.peak_bw = 0,
+	},
+	{
+		.name = "ppe_cfg",
+		.avg_bw = 0,
+		.peak_bw = 0,
+	},
+	{
+		.name = "nssnoc_ce_axi",
+		.avg_bw = 0,
+		.peak_bw = 0,
+	},
+	{
+		.name = "nssnoc_ce_apb",
+		.avg_bw = 0,
+		.peak_bw = 0,
+	},
+	{
+		.name = "nssnoc_nss_csr",
+		.avg_bw = 100000,
+		.peak_bw = 100000,
+	},
+};
+
 static const struct regmap_range ppe_readable_ranges[] = {
 	regmap_reg_range(0x0, 0x1ff),		/* Global */
 	regmap_reg_range(0x400, 0x5ff),		/* LPI CSR */
@@ -108,7 +157,36 @@ static const struct regmap_config regmap_config_ipq9574 = {
 	.max_register = 0xbef800,
 };
 
-static int ppe_clock_init_and_reset(struct ppe_device *ppe_dev)
+/* For IPQ5424, there are only three Ethernet ports, the register space of
+ * GMAC/XGMAC 3-5 is unavailable.
+ */
+static const struct regmap_range ppe_reserved_ranges_ipq5424[] = {
+	regmap_reg_range(0x1600, 0x17ff),	/* GMAC3 */
+	regmap_reg_range(0x1800, 0x19ff),	/* GMAC4 */
+	regmap_reg_range(0x1a00, 0x1bff),	/* GMAC5 */
+	regmap_reg_range(0x50c000, 0x50ffff),	/* XGMAC3 */
+	regmap_reg_range(0x510000, 0x513fff),	/* XGMAC4 */
+	regmap_reg_range(0x514000, 0x517fff),	/* XGMAC5 */
+};
+
+static const struct regmap_access_table ppe_reg_table_ipq5424 = {
+	.yes_ranges = ppe_readable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(ppe_readable_ranges),
+	.no_ranges = ppe_reserved_ranges_ipq5424,
+	.n_no_ranges = ARRAY_SIZE(ppe_reserved_ranges_ipq5424),
+};
+
+static const struct regmap_config regmap_config_ipq5424 = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.rd_table = &ppe_reg_table_ipq5424,
+	.wr_table = &ppe_reg_table_ipq5424,
+	.max_register = 0xbef800,
+};
+
+static int ppe_clock_init_and_reset(struct ppe_device *ppe_dev,
+				    const struct ppe_of_data *data)
 {
 	unsigned long ppe_rate = ppe_dev->clk_rate;
 	struct device *dev = ppe_dev->dev;
@@ -118,15 +196,15 @@ static int ppe_clock_init_and_reset(struct ppe_device *ppe_dev)
 	int ret, i;
 
 	for (i = 0; i < ppe_dev->num_icc_paths; i++) {
-		ppe_dev->icc_paths[i].name = ppe_icc_data[i].name;
-		ppe_dev->icc_paths[i].avg_bw = ppe_icc_data[i].avg_bw ? :
+		ppe_dev->icc_paths[i].name = data->icc_paths[i].name;
+		ppe_dev->icc_paths[i].avg_bw = data->icc_paths[i].avg_bw ? :
 					       Bps_to_icc(ppe_rate);
 
 		/* PPE does not have an explicit peak bandwidth requirement,
 		 * so set the peak bandwidth to be equal to the average
 		 * bandwidth.
 		 */
-		ppe_dev->icc_paths[i].peak_bw = ppe_icc_data[i].peak_bw ? :
+		ppe_dev->icc_paths[i].peak_bw = data->icc_paths[i].peak_bw ? :
 						Bps_to_icc(ppe_rate);
 	}
 
@@ -173,12 +251,17 @@ static int ppe_clock_init_and_reset(struct ppe_device *ppe_dev)
 static int qcom_ppe_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
+	const struct ppe_of_data *data;
 	struct ppe_device *ppe_dev;
 	void __iomem *base;
-	int ret, num_icc;
+	int ret;
+
+	data = of_device_get_match_data(dev);
+	if (!data)
+		return dev_err_probe(dev, -EINVAL, "PPE no match data provided\n");
 
-	num_icc = ARRAY_SIZE(ppe_icc_data);
-	ppe_dev = devm_kzalloc(dev, struct_size(ppe_dev, icc_paths, num_icc),
+	ppe_dev = devm_kzalloc(dev,
+			       struct_size(ppe_dev, icc_paths, data->num_icc_paths),
 			       GFP_KERNEL);
 	if (!ppe_dev)
 		return -ENOMEM;
@@ -187,16 +270,16 @@ static int qcom_ppe_probe(struct platform_device *pdev)
 	if (IS_ERR(base))
 		return dev_err_probe(dev, PTR_ERR(base), "PPE ioremap failed\n");
 
-	ppe_dev->regmap = devm_regmap_init_mmio(dev, base, &regmap_config_ipq9574);
+	ppe_dev->regmap = devm_regmap_init_mmio(dev, base, data->regmap_config);
 	if (IS_ERR(ppe_dev->regmap))
 		return dev_err_probe(dev, PTR_ERR(ppe_dev->regmap),
 				     "PPE initialize regmap failed\n");
 	ppe_dev->dev = dev;
-	ppe_dev->clk_rate = PPE_CLK_RATE;
-	ppe_dev->num_ports = PPE_PORT_MAX;
-	ppe_dev->num_icc_paths = num_icc;
+	ppe_dev->clk_rate = data->ppe_rate;
+	ppe_dev->num_ports = data->num_ports;
+	ppe_dev->num_icc_paths = data->num_icc_paths;
 
-	ret = ppe_clock_init_and_reset(ppe_dev);
+	ret = ppe_clock_init_and_reset(ppe_dev, data);
 	if (ret)
 		return dev_err_probe(dev, ret, "PPE clock config failed\n");
 
@@ -218,8 +301,25 @@ static void qcom_ppe_remove(struct platform_device *pdev)
 	ppe_debugfs_teardown(ppe_dev);
 }
 
+static const struct ppe_of_data ipq9574_data = {
+	.ppe_rate = IPQ9574_PPE_CLK_RATE,
+	.num_ports = IPQ9574_PPE_PORT_MAX,
+	.regmap_config = &regmap_config_ipq9574,
+	.icc_paths = ipq9574_ppe_icc_data,
+	.num_icc_paths = ARRAY_SIZE(ipq9574_ppe_icc_data),
+};
+
+static const struct ppe_of_data ipq5424_data = {
+	.ppe_rate = IPQ5424_PPE_CLK_RATE,
+	.num_ports = IPQ5424_PPE_PORT_MAX,
+	.regmap_config = &regmap_config_ipq5424,
+	.icc_paths = ipq5424_ppe_icc_data,
+	.num_icc_paths = ARRAY_SIZE(ipq5424_ppe_icc_data),
+};
+
 static const struct of_device_id qcom_ppe_of_match[] = {
-	{ .compatible = "qcom,ipq9574-ppe" },
+	{ .compatible = "qcom,ipq9574-ppe", .data = &ipq9574_data },
+	{ .compatible = "qcom,ipq5424-ppe", .data = &ipq5424_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, qcom_ppe_of_match);

-- 
2.43.0

