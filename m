Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBC13BF698
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 06:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783317897; cv=none; b=Wq+DEuo2Kz8fGQRjnb8Dnm80DuWX8OGhuRzpLfy6xyIEY7nGH7Y2cfF/qddNCjGMaB3ixYXrvfoGGSjTwMpM7b423cRmUBGA6dzF086MycSwKbyqaNQSx/+DJn/reZ2a9USlEp4RdxwxN3OkWLTdpqWdvtLaX0KMEQTB9TEDn14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783317897; c=relaxed/simple;
	bh=EhEGeYU4pRy8n2Cw7A0MRhHkp5JsK4k+Wbw0kH7Aa4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QVEpE2KO6t/EnbDZqn0Qe5N+koI5fYrMP8zNJvGsbP2GIqQp5L65sOHiOzcmmic2x0dYc8IbmGAjXB1XxGu9uVtWV19U3YGjI3YpXs2zr5jnDg86BI+/GfGBnK8g9CjpkcGJiK2us/M0mP6UwYRSqtj13N6s23CHyXTq89eM/kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XSAMomiS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W0ef9Jhe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XSAMomiS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W0ef9Jhe"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66641iMf3438334
	for <devicetree@vger.kernel.org>; Mon, 6 Jul 2026 06:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0z5POYW6IrzokPg0hco/Ud+42+y5j5CIXNj06/sjuaw=; b=XSAMomiS3nQvP6tv
	elUEovdWubO2Ww7fGrncZmQ/S6Tpg2w+uAYJxQ3hcz31u40oU1QZwibESUPFBxN9
	mf2ZtCXXVsSJ8T4GM1/FtOCU/7UbPzh25cEZV7clsuBvFkR855h2o+IZInb71Faw
	7KlBKR021hGDIXYS9WXQKq+v0EtO/viKdo4+w0rnJzfse5D9tCKy0brrcWF0X9c2
	HnXBQnPuzt1xQlM5c01EGUVQNU2a0FXm7iReTmcdNJN0SBV5IMSETtZrQC7PJEys
	9nnYLxySO9wMqgLGXHf1N8rGQ3yhEF63cAxh3VlyvLqRsLzHPcrUoqP3cH7aTo0h
	T8k/pA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6tj8mk7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 06:04:54 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-847ac21582cso2789219b3a.2
        for <devicetree@vger.kernel.org>; Sun, 05 Jul 2026 23:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783317894; x=1783922694; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0z5POYW6IrzokPg0hco/Ud+42+y5j5CIXNj06/sjuaw=;
        b=W0ef9JhesNAecuCAtDJ0Y1e8QF2VUEY1gOXCDKYz7eP/qo9ugioMHfJiXEmIB+0gsy
         Z2N2+5qUWzhXcNY7VwGFZ9aywBHIMn87RjSLAxHrkPJ9Qc2OJZ9VQyQu/+mzFdgCQTf/
         LsrcuGApFicuZDdLDB+JCVl2RvDnIpM9yTSaHFuE/sTLXoXjffdOg1323YklU9pxin88
         eFvcAQYo0xbXMhdx8vZG14Bn0hs9KIhtPs9aCelViEZuY56Khq7t5LDXPifVA+QzXkTp
         7JpoJZlRRBHq0zYsiBowoyjUvJmdGAMWP5z1wUvMejyilQICjH7HuFl4h2RC77QKxDKN
         z/Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783317894; x=1783922694;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0z5POYW6IrzokPg0hco/Ud+42+y5j5CIXNj06/sjuaw=;
        b=InYC+mqBQGLK2spXwmP6LjC76eNiUAvWQlDbWX4pQyFt95fiwGQh1XNu8ychoRHZJu
         hujoO8WQutXuZK2jU4XFukFIuI4YO7dhWCE80CKXecntfOMpGE+cmlrf1XFTECXt1lab
         CvSvlC2wYR5nl0wvqygrH4U6vbKpeut65+e6Wj6/wOaDzaREaScw+W7EKe0OPRFjFv3i
         z8iOqZUX/iPBVxRRwQBhZqT9gCE/f+s+09o6Qz6W6JjAMU9Q5Ke00XXiIB/4ro1NEzLW
         JJZWK4YEGy4reCsZ/rv/QsxkHiV29oZhK6bqi3+NmMGrw5UTuH7l98uN272v9XUe/XSh
         IrLQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq/r6v/NLsP8iKCxsgdy4JAu7q56Eg0sHOhiZcFcY+OjuLmk2scR26u7PwAFpCFgi7p5U9GNDrYGdMM@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8zdAbjoIEPwTkLStSbPoGOiP9A1fsCzBOqZxqFrGN33fjI53H
	1P3NWzO1ltLX2Bthr1E0Y3Z2QrqHYdyEwTrLOSxCeqykqioveSmQvH4FY8Ww88b2fbbWj6DvwJx
	qSGqkbJ9f1WPLpcbivVL0ND3Ta9XBLzOU/O1cU8duAuByPOVxB+iR+suP3eokoCML
X-Gm-Gg: AfdE7ckWzeN1oC51MhDpa/FAEt/LN0b/lX4qLc2+adUJAOVKGcLmu5BjwU/6s2fvYY6
	IguELJsxZZ96R4g2w0EvPdwszJ8cP4j4+4f6vR8aSxEtZj6Px4XbkGT5aFLMU5l+97/fllNr+eT
	o1k1JHrd/SWKFIU/ldrRGwJ/8XzkIZqU6hCbN2i0SR+kmJYTagdBoU6qx970pMvSSxqshO6NupJ
	1qvaPL1JJwPvMv5cnQNO80rNN2rjFwPKOLmF/a/0u8Xvx5mMPr8kbT4P9ouCZaeHdhIVjZcG/0L
	6EhO6UJtuzXBnoGsBR0IGnYJIUgwvaTQUAWigMjtsefwvuaSAwke/vVW2iaQegQYSjdaim4S/+I
	QkZN+j5q23jkBclE6q6nOMvI5NbX67ohoQQhMew==
X-Received: by 2002:a05:6a00:1a8f:b0:83f:2568:d45f with SMTP id d2e1a72fcca58-847f6dd0d9emr7471325b3a.23.1783317893806;
        Sun, 05 Jul 2026 23:04:53 -0700 (PDT)
X-Received: by 2002:a05:6a00:1a8f:b0:83f:2568:d45f with SMTP id d2e1a72fcca58-847f6dd0d9emr7471287b3a.23.1783317893282;
        Sun, 05 Jul 2026 23:04:53 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d498dcsm3113266b3a.30.2026.07.05.23.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 23:04:52 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 11:34:41 +0530
Subject: [PATCH v2 1/4] arm64: dts: qcom: shikra: Add MDSS display
 subsystem
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-shikra-dt-changes-v2-1-56fcd1659ea4@oss.qualcomm.com>
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
In-Reply-To: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783317885; l=6772;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=EhEGeYU4pRy8n2Cw7A0MRhHkp5JsK4k+Wbw0kH7Aa4U=;
 b=fsYE4f7qK0a0yRDpncjS4+CW6OWbKEqLqonpQdxoCwKC0Dp+id1w0xPvPU4KdbEo6cEN4kGpC
 oL/qbwdICYIA1VioPeQCftXCR8dBETexZnfocEmYgLyJFk46oeaX4QU
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA1OCBTYWx0ZWRfXzVvuhlJWeAF4
 gK7KQK25jAnmhw/2wF/q3tXm/XrOl7YnhN5gH8erEyu+uzPXWeF8OgxYce8BjPVmrwQVG5cbuTp
 CkYzzXQ0zwSaRInsfKKGmyzDLerQ2FKmRLXur4/5Ucr2opuuBO1Tpc9JCcIqWnPqwSOt52UC1Mq
 yCMIuLBDu/elr+13jB8CEUgQd5LYdFFj/RLmT8C7V14gCciJmV3OOvziPj9qVM8lm5cBFJPW2Xb
 NmCeXLyBDqArThgg5fpJoZlgLAuaKfCYJHj1PgXe9wF+ggpTAhI594N1kmgfg2ExSUdvpLO2hHw
 4Vs5TjrvJiLX54PgkUFmCmFqdzO19AuTE5WT48iewFlDvT9InHfPkUTRfPl1kYERsvEB8Lq3r3k
 xab88ZJYNV/1+N++UA0j9sQOg788XtlXHuYajnoYlzYhsjX1jQuNjg98gEYpxlWbltIKONxyurn
 2YHUCE2NgTDv5gr1Xcg==
X-Proofpoint-ORIG-GUID: S4xGmJnBeMxrHHXpZugsgUzRSMuwfXCx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA1OCBTYWx0ZWRfX2N8q9kCEmqr4
 rt4A3MIWeU0jhiPJOL7b39x6G3hbRtnUuS+nULi6/hxSDtyrSYppq/72kvAPgwHIdXBhE/RqxGO
 snmWBdZgewp26HCEM2r5fcRXk5/FPzA=
X-Proofpoint-GUID: S4xGmJnBeMxrHHXpZugsgUzRSMuwfXCx
X-Authority-Analysis: v=2.4 cv=H6TrBeYi c=1 sm=1 tr=0 ts=6a4b4586 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=t9ZUqVEILTzBR0fHAzoA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060058

Add the SoC-level display subsystem nodes for Qualcomm Shikra:
MDSS wrapper,DPU display controller, DSI host controller, and
14nm DSI PHY.

Qualcomm Shikra uses DPU 6.5 hardware (same as QCM2290). Platform-specific
compatible strings are used as the primary match with QCM2290 fallbacks
to reuse the existing driver support.

The dispcc clock inputs for the DSI byte and pixel PLLs are wired
from mdss_dsi0_phy.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 203 ++++++++++++++++++++++++++++++++++-
 1 file changed, 201 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index e67fe047a683..8edcb81fedc5 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
@@ -1990,6 +1991,204 @@ gpucc: clock-controller@5990000 {
 			#power-domain-cells = <1>;
 		};
 
+		mdss: display-subsystem@5e00000 {
+			compatible = "qcom,shikra-mdss", "qcom,qcm2290-mdss";
+			reg = <0x0 0x05e00000 0x0 0x1000>;
+			reg-names = "mdss";
+			interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH 0>;
+			interrupt-controller;
+			#interrupt-cells = <1>;
+
+			clocks = <&gcc GCC_DISP_AHB_CLK>,
+				 <&gcc GCC_DISP_HF_AXI_CLK>,
+				 <&dispcc DISP_CC_MDSS_MDP_CLK>;
+			clock-names = "iface",
+				      "bus",
+				      "core";
+
+			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
+
+			power-domains = <&dispcc MDSS_GDSC>;
+
+			iommus = <&apps_smmu 0x420 0x2>;
+			interconnects = <&mmrt_virt MASTER_MDP_PORT0 RPM_ALWAYS_TAG
+					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
+					<&mem_noc MASTER_AMPSS_M0 RPM_ALWAYS_TAG
+					 &config_noc SLAVE_DISPLAY_CFG RPM_ALWAYS_TAG>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			mdp: display-controller@5e01000 {
+				compatible = "qcom,shikra-dpu", "qcom,qcm2290-dpu";
+				reg = <0x0 0x05e01000 0x0 0x8f000>,
+				      <0x0 0x05eb0000 0x0 0x3000>;
+				reg-names = "mdp",
+					    "vbif";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <0>;
+
+				clocks = <&gcc GCC_DISP_HF_AXI_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_CLK>,
+					 <&dispcc DISP_CC_MDSS_MDP_LUT_CLK>,
+					 <&dispcc DISP_CC_MDSS_VSYNC_CLK>;
+				clock-names = "bus",
+					      "iface",
+					      "core",
+					      "lut",
+					      "vsync";
+
+				operating-points-v2 = <&mdp_opp_table>;
+				power-domains = <&rpmpd RPMPD_VDDCX>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						dpu_intf1_out: endpoint {
+							remote-endpoint = <&mdss_dsi0_in>;
+						};
+					};
+				};
+
+				mdp_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-19200000 {
+						opp-hz = /bits/ 64 <19200000>;
+						required-opps = <&rpmpd_opp_min_svs>;
+					};
+
+					opp-192000000 {
+						opp-hz = /bits/ 64 <192000000>;
+						required-opps = <&rpmpd_opp_low_svs>;
+					};
+
+					opp-256000000 {
+						opp-hz = /bits/ 64 <256000000>;
+						required-opps = <&rpmpd_opp_svs>;
+					};
+
+					opp-307200000 {
+						opp-hz = /bits/ 64 <307200000>;
+						required-opps = <&rpmpd_opp_svs_plus>;
+					};
+
+					opp-384000000 {
+						opp-hz = /bits/ 64 <384000000>;
+						required-opps = <&rpmpd_opp_nom>;
+					};
+				};
+			};
+
+			mdss_dsi0: dsi@5e94000 {
+				compatible = "qcom,shikra-dsi-ctrl",
+					     "qcom,qcm2290-dsi-ctrl",
+					     "qcom,mdss-dsi-ctrl";
+				reg = <0x0 0x05e94000 0x0 0x400>;
+				reg-names = "dsi_ctrl";
+
+				interrupt-parent = <&mdss>;
+				interrupts = <4>;
+
+				clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK>,
+					 <&dispcc DISP_CC_MDSS_BYTE0_INTF_CLK>,
+					 <&dispcc DISP_CC_MDSS_PCLK0_CLK>,
+					 <&dispcc DISP_CC_MDSS_ESC0_CLK>,
+					 <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&gcc GCC_DISP_HF_AXI_CLK>;
+				clock-names = "byte",
+					      "byte_intf",
+					      "pixel",
+					      "core",
+					      "iface",
+					      "bus";
+
+				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
+						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
+				assigned-clock-parents = <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+							 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>;
+
+				operating-points-v2 = <&dsi_opp_table>;
+				power-domains = <&rpmpd RPMPD_VDDCX>;
+				phys = <&mdss_dsi0_phy>;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				status = "disabled";
+
+				dsi_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-19200000 {
+						opp-hz = /bits/ 64 <19200000>;
+						required-opps = <&rpmpd_opp_min_svs>;
+					};
+
+					opp-164000000 {
+						opp-hz = /bits/ 64 <164000000>;
+						required-opps = <&rpmpd_opp_low_svs>;
+					};
+
+					opp-187500000 {
+						opp-hz = /bits/ 64 <187500000>;
+						required-opps = <&rpmpd_opp_svs>;
+					};
+				};
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						mdss_dsi0_in: endpoint {
+							remote-endpoint = <&dpu_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						mdss_dsi0_out: endpoint {
+						};
+					};
+				};
+			};
+
+			mdss_dsi0_phy: phy@5e94400 {
+				compatible = "qcom,dsi-phy-14nm-2290";
+				reg = <0x0 0x05e94400 0x0 0x100>,
+				      <0x0 0x05e94500 0x0 0x300>,
+				      <0x0 0x05e94800 0x0 0x188>;
+				reg-names = "dsi_phy",
+					    "dsi_phy_lane",
+					    "dsi_pll";
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&rpmcc RPM_SMD_XO_CLK_SRC>;
+				clock-names = "iface",
+					      "ref";
+
+				power-domains = <&rpmpd RPMPD_VDDMX>;
+				required-opps = <&rpmpd_opp_nom>;
+
+				#clock-cells = <1>;
+				#phy-cells = <0>;
+
+				status = "disabled";
+			};
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;
@@ -1997,8 +2196,8 @@ dispcc: clock-controller@5f00000 {
 				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
 				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
 				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
-				 <0>,
-				 <0>,
+				 <&mdss_dsi0_phy DSI_BYTE_PLL_CLK>,
+				 <&mdss_dsi0_phy DSI_PIXEL_PLL_CLK>,
 				 <0>,
 				 <0>,
 				 <&sleep_clk>;

-- 
2.34.1

