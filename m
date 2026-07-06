Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96AA03E557A
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 07:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783321898; cv=none; b=D8RSxKDWNnT+JrcHT4hR16RYk3lkWiskmSj8AFEhv5GkWIL3joy5eIkIKY+ivbCUCnXXudbyl38RQTAlfdApHJzjDmj8430Zo+sIGAZhCEb1wofBo9TESWvABh/6Ytk5Zys7ca5owl8A9Bxo6qP2qdZl1G6BBRUiN7Hi1JCFfnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783321898; c=relaxed/simple;
	bh=TOQJxNULiklYva5GtZvPg2vR0ieetZoPJmde1SseNns=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=apMdliZr6LyxOv5DyFqu6RSO65/8tFserEiS5QNzMr6uOvB3aqxldY72tsdJ7MIWqGA7DSe+0xaDW6nK7GzKP3wVrH0N1/enKifvP0reT7kKGNm3S0pZG5S/rwwv3s7sI8Q7yGeoUKifkPmxrPX3gv6IBsEy1g9kc3B8yFXqsJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlq8kI0h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cLBjVKVB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlq8kI0h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cLBjVKVB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641js13624558
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 07:11:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=STeIGRcFLrK
	xSeTilY6t4degzcf5r4/MkwEugpmVYMI=; b=hlq8kI0hP8x7GBUXObcjV4k17PW
	hiJ7ePBh8hfcRCX01r1fz5UkzMMzUbEVfRmNcMNDx0WUnQZUJvKXHXEpQad0LUmX
	UuODIDldJXFxvRtCnKGxVn4L+z7W5wemI/KuYU3u15Elt5I6ALwrtfs0TEaG7fUp
	x1TuH+wLlMGCSvpPjnGUBIW0RNEELiA+kLPVl+suQ9dl7Kucu1Pmwea9a04DzDER
	T2TfB42Pkfw327GEgdXUDJEaRt9Oe+xDNqTTCVrDjDM2MNNZnmsuNtdCgWqBJwP/
	ipzXfFNr+Teeqbc7VCYtv1yVwVzyId98IGSYixTknx7VNUuuYh5N5lD8YrQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4sw3d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 07:11:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e6ed4fe99so461624785a.0
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 00:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783321885; x=1783926685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=STeIGRcFLrKxSeTilY6t4degzcf5r4/MkwEugpmVYMI=;
        b=cLBjVKVBUSyLIOSnvzMnLD6yOW3Rc7NXOHlH8EdfqEl9VwJyODDytZJmV9WDUhOho8
         kyySCgowuQGlXPoexFSKKYvsBckk+4L3C/TBIYu1537QW0MnRzAsMAhUgBcOnec+DBO3
         wLTFD1J0Qj/m4hcz1QXK7MYDfXpPx1QX8g+xKCDtphuwdekLF+QfGA9XPY7jSu5Ewz3I
         VtEx4Cl6Qc31m2yElnNp2wtJU8Pg0zeFtPsA+BIfaoH2sHDPuj9e/68bondOi9r/ZpKe
         GcNyyfP2y0rK5JD0d1bZEMkeCKQkU+ppgqTatFrJ72pImqRPeppsl24CKLK7u1sO+WYs
         MN4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783321885; x=1783926685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=STeIGRcFLrKxSeTilY6t4degzcf5r4/MkwEugpmVYMI=;
        b=qOEV1nBADxiV4tzAmkcO9PZG/j9cha5tC4Aw60y70JVZZ7SZ33eMjseNngJzUbVz7Y
         pbn+VYwfqIdLe0RVdiDNZfUAtcUKrMWDZ5V5TPjT8Z8WBc4IqWrJobi9wO/8mAxkWAMK
         LjdRaq7RE+usJIglMcEIhE8pBlI23MsL+N1MULSWmGkzuIi7Dk5hkcNZHYQRLCj7frD2
         4rUktGOzQR5N+tCz06tBJPBaQdxZHBJAWb6My87CM4wOPoXvhILyWVbfP+qPJbmldh7Z
         gMWSKwL2qGu2rxzTguwrvbIKSNnsJJD4EHXKrLAyWMLvtZHQ9geZtoOYwHgEDlqSNqQy
         7Jlw==
X-Forwarded-Encrypted: i=1; AHgh+Rpp99xxG6O5+rR68ikicYW3noTuZz+mz9my5Aeax9izw6kyMhHeWyHs1INrDV+zNCGJQiYpR7CQmIOW@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1VNI1A2xTH7VRLzzhKCaz8cl6Ot62dXywEDgFlLZm4msqO9Od
	Sks1uxIlIZPYFksT6Uj4tbtqZ5QdoZ2kf2DrWGsdfAi30qVm47/sxAve7+rJzaob36JKLHS66Fh
	/2WJdBAIqmhQ8PLYusLqbhVfMUOymJQEzCUnzzVDfSwzWmTxHBch1lzTb/uwNk5Hl
X-Gm-Gg: AfdE7clVSvwD7ieIrg7Zl/cOKIs7mtuHzJcBza5TV/m+lxXMj/DnVuqIqYZYHy2rtJs
	bGGlgp0rjm0exuHiQZbS+Ydrh92Vj4bZlAClkgqNGlMzGvqWiWO472WuDYvXn5jYbigMEl86DWE
	3UtXm6S6OV1qS36VuKGxfZLzFzSlJb9F5IvF4Xopo5z/un4sqHyzoeLuCMfnyMGrxmrYLLtwF4q
	x8/sHTTRrafWkvw/uyzggh82cYISuZIpbo5Mh0RRcE1StwXt6IChQ23ejsI3AmPfUCgRSMu4ZEJ
	sgiIauacA04kJz95Y6jXN9PbA08RBz71ODoQ5HOdyxLIB323mZpn6QzHHbZ8hGqNNa/YAfjl0eG
	yWUKT3uyOpyDETMYkpR/n6P6VBaOT9zpMXKU=
X-Received: by 2002:a05:620a:4503:b0:910:87f4:9a26 with SMTP id af79cd13be357-92e9a419085mr1274121885a.41.1783321885171;
        Mon, 06 Jul 2026 00:11:25 -0700 (PDT)
X-Received: by 2002:a05:620a:4503:b0:910:87f4:9a26 with SMTP id af79cd13be357-92e9a419085mr1274118785a.41.1783321884602;
        Mon, 06 Jul 2026 00:11:24 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62f3b40sm674673866b.56.2026.07.06.00.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 00:11:23 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Subject: [PATCH v4 4/5] arm64: dts: qcom: sm8250: Add JPEG encoder node
Date: Mon,  6 Jul 2026 10:11:12 +0300
Message-Id: <20260706071113.383215-5-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
References: <20260706071113.383215-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA3MCBTYWx0ZWRfXw/9705lCibck
 JQb+JxPP68hwOXP9gKkaewr6PkyPzs7OVzf0oQI/g8V6/CTkUFNOxJcBGRML77nrCwRstKPnXew
 v5zPQhfWCoRBKgyj0x26nCxfWX3P4xE=
X-Proofpoint-ORIG-GUID: 2oA_GeAXxswl2raT6QA-ACaUaaPO13nj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA3MCBTYWx0ZWRfX1Yr1mKyCi54b
 ojnAw5y0alfyKSvfeeFzIV6jIMIxXhkuxOvA2VY+B9IfaXy2KcNUycKGv0FnE4tFw81+yM0zSqW
 rGkbQrOAYTQc4ZmXZSHOBvYpUd9A2jBr1ABY2CwwLaxiJA7wew30MDdX7bHwxWYGnjcyMkdLOmN
 LetXPLn46SI/nSLSGbB5YP43U0XGprxCn0N9Vucb9n8jqbvRZW+XRKjbRMhuf12eBOVr22j6u7C
 C+YT+xN5GnmR9pMWN5qYREYvx5AfKD6VADorC/w0/adJiM7KMHimEZIiE9QI2YTTfSKq94fPFLC
 D49fK4JylkODgmwupB4N7u6eQvzji1Kq8+7JJ5/f3R7lTjtGfocPNohOpl25oodPv/4fJusKatT
 giejVVoCFgEyj93o1BKB+htlPVk23L5d3hfgkDE5/3j5TRuOPPIPlMCkfIcq4+70jZAD0YExxeR
 aiVkHf4RPtPnuAPm3+Q==
X-Proofpoint-GUID: 2oA_GeAXxswl2raT6QA-ACaUaaPO13nj
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4b551e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=iYwodULRRiReAau0VbEA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060070

Add the JPEG encoder hardware node to the SM8250 device tree so the
qcom-jpeg V4L2 encoder driver can bind and operate on this platform.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 81 ++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 7076720413ab..a089b706f60c 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,sm8250.h>
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
@@ -4471,6 +4472,10 @@ cci1_i2c1: i2c-bus@1 {
 
 		camss: camss@ac6a000 {
 			compatible = "qcom,sm8250-camss";
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
 			status = "disabled";
 
 			reg = <0 0x0ac6a000 0 0x2000>,
@@ -4649,6 +4654,82 @@ port@5 {
 					reg = <5>;
 				};
 			};
+
+			jpeg-encoder@ac53000 {
+				compatible = "qcom,sm8250-jenc";
+
+				reg = <0 0x0ac53000 0 0x1000>;
+
+				interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+
+				clocks = <&gcc GCC_CAMERA_HF_AXI_CLK>,
+					 <&gcc GCC_CAMERA_SF_AXI_CLK>,
+					 <&camcc CAM_CC_CORE_AHB_CLK>,
+					 <&camcc CAM_CC_CPAS_AHB_CLK>,
+					 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+					 <&camcc CAM_CC_JPEG_CLK>;
+
+				clock-names = "hf_axi",
+					      "sf_axi",
+					      "core_ahb",
+					      "cpas_ahb",
+					      "cnoc_axi",
+					      "jpeg";
+
+				interconnects = <&gem_noc MASTER_AMPSS_M0
+						 QCOM_ICC_TAG_ACTIVE_ONLY
+						 &config_noc SLAVE_CAMERA_CFG
+						 QCOM_ICC_TAG_ACTIVE_ONLY>,
+						<&mmss_noc MASTER_CAMNOC_HF
+						 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI_CH0
+						 QCOM_ICC_TAG_ALWAYS>,
+						<&mmss_noc MASTER_CAMNOC_SF
+						 QCOM_ICC_TAG_ALWAYS
+						 &mc_virt SLAVE_EBI_CH0
+						 QCOM_ICC_TAG_ALWAYS>;
+				interconnect-names = "cpu-cfg",
+						     "hf-mnoc",
+						     "sf-mnoc";
+
+				iommus = <&apps_smmu 0x2040 0x400>;
+
+				operating-points-v2 = <&jpeg_opp_table>;
+
+				jpeg_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-100000000 {
+						opp-hz = /bits/ 64 <400000000>,
+							 /bits/ 64 <100000000>;
+						required-opps = <&rpmhpd_opp_min_svs>;
+					};
+
+					opp-200000000 {
+						opp-hz = /bits/ 64 <400000000>,
+							 /bits/ 64 <200000000>;
+						required-opps = <&rpmhpd_opp_low_svs>;
+					};
+
+					opp-400000000 {
+						opp-hz = /bits/ 64 <400000000>,
+							 /bits/ 64 <400000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+
+					opp-480000000 {
+						opp-hz = /bits/ 64 <400000000>,
+							 /bits/ 64 <480000000>;
+						required-opps = <&rpmhpd_opp_svs_l1>;
+					};
+
+					opp-600000000 {
+						opp-hz = /bits/ 64 <400000000>,
+							 /bits/ 64 <600000000>;
+						required-opps = <&rpmhpd_opp_nom>;
+					};
+				};
+			};
 		};
 
 		camcc: clock-controller@ad00000 {
-- 
2.34.1

