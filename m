Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70A83EB0F6
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783938383; cv=none; b=heBqESSYUzuNa1AHsXtMRmCQGI/ZfBU01WKdas8xJOZtf7EeBkrQQMb5uwVJy0RGxUh2+TZT6r1QU4ltahyA1WgwT6A3NhVHvchiDq39UVzPZgO2JdDllXNCBE2H54KfpdHtr0m3sQSbm8q4UQO46b5ez50+EyGognSwV3eXf78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783938383; c=relaxed/simple;
	bh=F5QQkydgpPZCqaxBj9JMH1J8+JXDDC7Z9hXg2xkKoCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fjBXUrsQsDW6LEn9E7xrCxD85xrsTHUgma+7uy/SJGd64hXRyXwN2/mjBMaKD70tflH5vxGUMaj43zzataXwAFz8pcttZhEnTWzS65N4MaLbgI+yg2nZEeClIkl9++f+a5f51Rh1vu7Fe4Y88QNrboDE4QY3cQnpvpkTppr9J+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=STwyNpYF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6+mvECM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="STwyNpYF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R6+mvECM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NnXW732256
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BorGReUp/p4soUmczhDgqZANWvVm+Ft3jJ+c6lgqyEI=; b=STwyNpYFHFRPlpQ0
	ZRCZodhMwG/K7YxOAqb6gkgW5O4uMTou7DS96yWl56Aa/sacn8MiOEaiJtkJZumq
	a5aOhPNpayoFNsyC/N0ylT+YmPccbl9YhT6Hj8VfdTfa8f/07CEzIJGcjqau9ib2
	a2ty6gU3PE4zbT8XdeMSkjcDdEiBugO13SpuTarl0I+3KuVksBE77sNvlP2p46YU
	ZqsntCpUpXjvZohWkbk4KmcRwLErwpzAYJ8Ky6vrJALErSFtd93KDHdou0nNDGb2
	h/pvt+yEwWCgirV+sdkQkqe2yaBr1kRjY3PG9kSu3y9GqA3r9z6s+uPxS0c+4SPu
	OWorXg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3a27j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:26:19 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-385d2703b64so4108580a91.1
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 03:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783938379; x=1784543179; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BorGReUp/p4soUmczhDgqZANWvVm+Ft3jJ+c6lgqyEI=;
        b=R6+mvECMLTu8gQ989ABTVhA6wnoe8RqTMM/VJi7/td5sw6kum4gS4cLkZv9rT1Yo1x
         NCQdq+R7UvJmK9QztqpUA1GXxGAmWanGXx4g0EUh9m5a5lIdPuxtr67O8zOuIIKivHkf
         pA1RC6cmLNJuqtc5mJVoRNPnb8NYwTuPGYIooDRbKzrF0oTnzGJLfX0zSuU4idasNioW
         X/axpcQQJjKojSS9lyMcUcnqFilBet+pp7rjjOnFN/rHJUSu/1LaMYuULs/CUO0FbKJb
         2uXdRiwIEp0G3QPKUacgiOjhXiVVAYw0Vh3zaGjD+2nF/1zethSGej9iBRvyGH6+spo1
         bozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783938379; x=1784543179;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BorGReUp/p4soUmczhDgqZANWvVm+Ft3jJ+c6lgqyEI=;
        b=ApMj6zc3bnG9ToAw/QjF8eiCD74fOO2Us4Xnp6qIGzFEK2Wv2aNNWkn7y1ZbttoMsI
         CoQaBrEb5k+Vz8DpefKlsEvARP/M0KybvY2b/Ju6Patgf6EdkOqcb8z+5e33PcbDj+m5
         F0WvRRp31kDWGmZTMCNcQrvqHuqYJjNjOVkytW0M3oDVUNimjCAyMliCOVHzfwiqrQK/
         7VlfR8sGTEwlwKjALZBQs7Z0wp5Fx0kjGBDcdp/5FsmO3qs6E8gJAE/m2ztrRzmuP96u
         g/+BHASvqE8iYdYqsUf6fmcv5U+dmCKLPzTHnWrkwZKZ+i2gn2JyooOqH0Fy696ZkN6D
         N75Q==
X-Forwarded-Encrypted: i=1; AHgh+RqvNodbui+Du4A5ZzZQj62rrJzk5QoOyqrPCxs5sf94Kzv2NgE+rOuk4QBDuH4G0O9aLsJs0f6WLc4n@vger.kernel.org
X-Gm-Message-State: AOJu0YyAI0sjvqNb8y0O8zUPMEasiLAehrO+JZBY8TDTY/FPJWoIr8Rk
	4/xIeDKBSFgZMYbBnhKUUtpxJT2ktt8cH73pgFewGpXwQpi1rRRd92amUEJQi4GBAN/sHDy3WVU
	cc/d/xzyBfZWV03+xDbp0nFbojMgpqT0uhPSWrGd92nzhLRiBY3JFDHgj07Ws4dfm
X-Gm-Gg: AfdE7cmlMbHdc6ONNMI6foWouKwlJNpBZqiYYaz/6QEwzC8SaU0AKv7iGpTTeBf1c97
	fd0RXSuqyM9TEHm66vRmYzX2b9dKhrju19+MTyrHR3iG4nvqR8sshI0jsUEtFG9KIgZIHOoZDIp
	hcsXGGhH77ZKeQxmrcQK9r9Gf4SkmhwRWvU5eqLNX9VZruZz64emB1bxbRiX0lJeE6kAjhkqYbY
	FAgUzyzMtYXExFSMPHXry8MowvIj7F5DmZodIMUrwd122c7DxPhoEWdzSjJpA8JkU0sdJhAh35i
	3T6ETawEEe2sAVOelPKt3SOzmTd2on91v+9vOUYxV+j5tNzDm1Ik5/KshO+YX3RYy3REktdJ3g+
	wd01hbFq1gnbVx/iMA0rT6L3a0L+LYWpewfRBSw==
X-Received: by 2002:a17:90b:4cc7:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-38d13768de2mr14976437a91.4.1783938379256;
        Mon, 13 Jul 2026 03:26:19 -0700 (PDT)
X-Received: by 2002:a17:90b:4cc7:b0:36b:b903:994 with SMTP id 98e67ed59e1d1-38d13768de2mr14976399a91.4.1783938378735;
        Mon, 13 Jul 2026 03:26:18 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311950eb930sm48465704eec.8.2026.07.13.03.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 03:26:18 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 15:56:06 +0530
Subject: [PATCH v3 1/4] arm64: dts: qcom: shikra: Add MDSS display
 subsystem
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-shikra-dt-changes-v3-1-15102fca9570@oss.qualcomm.com>
References: <20260713-shikra-dt-changes-v3-0-15102fca9570@oss.qualcomm.com>
In-Reply-To: <20260713-shikra-dt-changes-v3-0-15102fca9570@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783938370; l=6842;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=F5QQkydgpPZCqaxBj9JMH1J8+JXDDC7Z9hXg2xkKoCk=;
 b=EW9S+c8R+Td+xnkrs54WisBlba1BcsHwiHuTBIiUOU1ZC4J8oRWseTdoaS/KgPSGWDFPgeQGo
 5rLxiIAXk9bBREH3rYi0DdWvJ3d2bhku6hU64wL1FufSUp7SFPOaeNS
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX48kQsrxXFtoJ
 DEfs3jaRi4edHZoogdMBL5kUgYCVj95WRlsLNs4ANkQ76y/+maHebBS/rZKR6vSf/RL/fOanrvB
 lKqTtu9w0Knv1ClT7xpOeO1aEiIy9yUmxLqcwGtae+bsFEmGfTXCSIGF2Cf3TeA2PAzMXGUUtsH
 gMVnnmmDzTpZqeN8dfXyBJCOsU9e1tcFF4P7kSPatMBr0xD9ISm2D+S+9GUw3rhu5qLXbUti+LF
 B94jbVgyAnQiJ9fdVeIQVFKvH2WaHQf5sFJN517ugUPWE0TSIJqz7FN/lJ518Uh1tJ+8I6JKfJN
 n6hvB23EWjyZtpPCyX4Bd3b+x6Ng2Knb6xhvtLnLb9nQsNT69CEYuvEfh91wSCs0oCFcxfZe6SL
 GwiMIwXNjTimumwfACeOn4ezihYqDwx+zlHxDss2iclX6y22Eef5O+VaT4j4KFrTs6SoDe7wylr
 34Ld9asMO6IlOnIL0mw==
X-Proofpoint-ORIG-GUID: PdVeAQVxgHVzYWv0BqROVwCORZUrvFUp
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEwOCBTYWx0ZWRfX5Iv0pXXoYkHm
 4a04sM6p6UYpqjmUOO7xJzQepjPRdkBOrb+PT9yBQSO51XUR76xgm7eTS7RtjbdFMlsJspimFtg
 V8q8jcIbTdtDhpK2v+oqMD3fg5HaU7o=
X-Proofpoint-GUID: PdVeAQVxgHVzYWv0BqROVwCORZUrvFUp
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a54bd4b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=t9ZUqVEILTzBR0fHAzoA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130108

Add the SoC-level display subsystem nodes for Qualcomm Shikra:
MDSS wrapper,DPU display controller, DSI host controller, and
14nm DSI PHY.

Qualcomm Shikra uses DPU 6.5 hardware (same as QCM2290). Platform-specific
compatible strings are used as the primary match with QCM2290 fallbacks
to reuse the existing driver support.

The dispcc clock inputs for the DSI byte and pixel PLLs are wired
from mdss_dsi0_phy.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 206 ++++++++++++++++++++++++++++++++++-
 1 file changed, 204 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index e67fe047a683..9169356cac05 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -4,6 +4,7 @@
  */
 
 #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
+#include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
 #include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
@@ -1990,6 +1991,207 @@ gpucc: clock-controller@5990000 {
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
+
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
+
+						mdss_dsi0_in: endpoint {
+							remote-endpoint = <&dpu_intf1_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
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
@@ -1997,8 +2199,8 @@ dispcc: clock-controller@5f00000 {
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

