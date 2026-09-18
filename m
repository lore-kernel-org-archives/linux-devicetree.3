Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92933955E2
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 01:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789695502; cv=none; b=R1ASrxTOIhwVNDFwtks9bHgDSUjqwGeygQAJgu+bwj1fPPIWY29Myy7rpRrhDBImNLk8o66g/H3tY1PQzNlRnJA6vHNcbnZk85xSfG5ubEJAZ/s1CKHKkwOKFpXkHOLNEJ6EFComCjxRWVcprQ9cYQQ4ZlXtwkvtk1efvASytME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789695502; c=relaxed/simple;
	bh=ouOi5RC15n8KmwXbE3YuwXTIinyJkUTlb+tkJzuNwyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XFUxULjdeQVulvE2gRch4+inU2e0eIawNHdXPLtGPXD4GDbO8mHa8HrSt8mLldsxoe7Lw2N1dordtzRbuZ0t8ji02y4Vplyn8isdw7NPVSc03NwB64oIOyRs77M7i9XbM8B3GofO6VDD+IH/tP/Vfxz4tTKFDyRNCgTJl1kO92Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WIDXG/uw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b6Sqttj3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WIDXG/uw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b6Sqttj3"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HLpLkw3859906
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 01:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ry+E2GePSST
	EpAaj5PVBJ9AdLKYaQPvE9phG5L/WvX0=; b=WIDXG/uwd4lO+sqjJBcGQlP/rFv
	Mubil/qSo+xhQp1M4FN1E5IDBqgeEkonu1NrttJbFDI3a3cP96q98xpFv53lVUs/
	Sj4rdb21L6SEAYYLxcPprci/+FLv4FxTO1mTq5e8wIs8vN/fagx9bDlyjtNXKemB
	zr638U5Zzz9orry1/v6WWc33dyJlYTh5t5ejf/e7XvTB90AU8WrMSCzu6SOUgBZv
	TMh+1pn64QG8XcH8GZpyQWA4enm55IuMvAiYunja22bf/Y3mbGHJCakY0SV3iIof
	gof/6Dq9bKk7MbC3DasBdHbbrydnYd5uDGs5zOatqNc+S3bYOZH78LRDl6g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrg40rmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 01:38:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-395543dc382so348443a91.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 18:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789695499; x=1790300299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ry+E2GePSSTEpAaj5PVBJ9AdLKYaQPvE9phG5L/WvX0=;
        b=b6Sqttj3+hxWU59kdP8w4R8F+06eOFIfcQdckqe9DyVK6X/IXUfLrBFsv0MfdVqIoh
         Vem/+zdD0PvgffvqMnr15DBSBnrTDauE5U/7uZGFTwpT+ASfP83HKhf+wUBrIpiatTRm
         rJl+8UkXJTWA7YK7tnxi8rDeR7NU15LN4w2lZl9dylCT1pL+VDM2FRTD3ZkBNlFmdHsp
         w945SOQOIkh0eJn4RyY4F6uLegFVqpstPqS5vCHuqhIfw3y7fJwXOrmT5ilnbmN9uVvy
         LyevziTRpJatBW6LExVHhUnzQ8rQKMVUDS0zJlhBnvtoYv1gj0M+PboZtqHD737F5+bm
         ZFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789695499; x=1790300299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ry+E2GePSSTEpAaj5PVBJ9AdLKYaQPvE9phG5L/WvX0=;
        b=JW/zvWy6KLQ6YNU/kBvZYhpDi1RxMF1FAHT5I51iqMUHFo5DPBEKSzjJFFPOnqp6uj
         9vzwvzdD4FBK+2O11lJGTYkWR6zc5EePQ8R8EQpwwc9H5h1E5mAxjPM9VXb0yaSWZjCF
         soD8D4vm1OCGmHpOAC2o3w18AfQbB787lADe08w09achePlYpsR8C0EoChqz/q7REHrh
         bhPYY0dUOrW1gey+SabZnxZ1pWWmFja/RopCPfe2SxVR66ozLSm8aN+o9f7d3vbyo8mN
         okv8H4YexZvgqFEXepCfoCjXCQmme9sft4eiO8ghuyH/Bc8ILPaskTS8LUXum/9O5unZ
         EUFQ==
X-Forwarded-Encrypted: i=1; AKwUvBwulsxCpVPpprHiVtoaoEanKvfo1KF2tL5E0D+XgS/bT5voaf9p/n5fcZjaCekMkNrY0xumQYedxoYW@vger.kernel.org
X-Gm-Message-State: AFuF++lwhh/zEjBzQx11yP6+Mbvs7OaQPZpn5bOKOLRa2HluA2aH2vij
	Qorzs3yCPgmlAuIsfCT1Hm1hsMQUMeDSc1nMx7JRmSjKrlQLFCZJaRsauPzJ5M9TsQsO3GkpL2h
	5Qd8mUgyiWYG50wAnivdcZUdBWmKzgUITySspreP9svllK+A1zsNHXfmeaClvsZpv
X-Gm-Gg: AYBFou1LrqU//nWgVBx1xilAnxfQ5z0lSP1nlwv5bqy7JqCch54E4gzArgTmLEqa3JL
	Q/wi4Ul0qRzhnJIIt5ayNFxcYEpN6Pqsg2DAvX0l0iecRJLzHBmMt4XCbdkwk1mKeZnFlbrCQkt
	Oj3Ed/yC0R0gtSDygjUc55QOvdHbDizUqO6z7O0JntFxuKz7DuaL/lHOIdyUJvpEfL0H2K4SPaO
	a6gsTuJfJ8cvTcRnsA5eiXBW2MzEj894tFhPtOedhm5dZ/MJR4ymSCaPjRtOFe50JfsuYaW+Fl4
	5oGy3FrQyf4ZSyvywGX3sko0+vBbANTLcPA64eBXGAWSaAqfWjCKqQnz0zsCJbeFKrxbD+hqzpN
	8zW78hxmsBUcyuGEp8Tdm/QX5efHs7aGuPbltiQeTCwNSbWGB342i+/V1uXrS
X-Received: by 2002:a17:90b:398c:b0:39e:35e4:d31b with SMTP id 98e67ed59e1d1-39e54ce1651mr3129184a91.5.1789695498795;
        Thu, 17 Sep 2026 18:38:18 -0700 (PDT)
X-Received: by 2002:a17:90b:398c:b0:39e:35e4:d31b with SMTP id 98e67ed59e1d1-39e54ce1651mr3129078a91.5.1789695498280;
        Thu, 17 Sep 2026 18:38:18 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144ce03c682sm821276c88.10.2026.09.17.18.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 18:38:17 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/4] arm64: dts: qcom: nord: Add more clock controller nodes
Date: Fri, 18 Sep 2026 09:37:37 +0800
Message-ID: <20260918013740.1355096-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918013740.1355096-1-shengchao.guo@oss.qualcomm.com>
References: <20260918013740.1355096-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: C7MTBQPBUxxQYOCxKfoPTvTapls93n9l
X-Authority-Analysis: v=2.4 cv=ZO9CCn7b c=1 sm=1 tr=0 ts=6aac960b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=lLTCYSv0VJgAjLIAHVUA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: C7MTBQPBUxxQYOCxKfoPTvTapls93n9l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDAxOCBTYWx0ZWRfX2wtK/inD88GK
 VEGNeBIflZ3JVBossDeuYi/TwCRmTs/WnQqGXLPEh4NsMJ5V8T0Zc4NthTJYkEItWZOZ4rETxCS
 7bVwg8bJR+6RkcfOyp6hq/uIiWVkUfDmxy/VODI2zRbkALxyuITmGXzUT8bxKwNFike/AO1O7nL
 J1K+D5qfuHnjO96EkDgJ8DdOIms//4podCObWzh0M7hBcb4XFFT+TjOTjS/fSI/LRQeoo+IdUKw
 r5IseR/KcetJSIibeDPrbKboc7gs2ZqbAsi77ZVmKxNuqyLGcgScnQpwWNXt/FZ4QM0MKJsV7BS
 KlAwb6qGaEbhbQvP1QKcbRxSmrYUAJwwr+jjeIIsFdvqLITU/e4K2MZYPAWZnQ6Rja3Pi5QJDmy
 GE9WzZ0XEoRAneHyCZhiLHAsXl8M708wjDZ7ihsGRwjOtbEDzcOV3UYqBOWzBqHb9/scIUsJSOI
 FCI9PEFj9ba5SYpJLDw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDAxOCBTYWx0ZWRfXxkymUM+gHYk7
 me1ySiJv9J6jlih1j3gmFIhljnk8BlUaScIQcckPHEoiboixgXHmhLVLYefwBompgOUXEfWLEXC
 FNuX2RxQWcUAMaF8OQ9sp9arqRbnxgs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_05,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180018

From: Taniya Das <taniya.das@oss.qualcomm.com>

Add the GPU, camera, video, and display clock controller nodes for
the Qualcomm Nord SoC, along with their required dt-bindings includes.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 108 ++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index c7ac2e66632e..6dc4c871f41e 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -3,7 +3,11 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,glymur-videocc.h>
+#include <dt-bindings/clock/qcom,nord-camcc.h>
+#include <dt-bindings/clock/qcom,nord-dispcc.h>
 #include <dt-bindings/clock/qcom,nord-gcc.h>
+#include <dt-bindings/clock/qcom,nord-gpucc.h>
 #include <dt-bindings/clock/qcom,nord-negcc.h>
 #include <dt-bindings/clock/qcom,nord-nwgcc.h>
 #include <dt-bindings/clock/qcom,nord-segcc.h>
@@ -835,6 +839,17 @@ hscnoc: interconnect@2000000 {
 		qcom,bcm-voters = <&apps_bcm_voter>;
 	};
 
+	gpucc: clock-controller@3d90000 {
+		compatible = "qcom,nord-gpucc";
+		reg = <0x0 0x03d90000 0x0 0x9800>;
+		clocks = <&rpmhcc RPMH_CXO_CLK>,
+			 <&nwgcc NW_GCC_GPU_GPLL0_CLK_SRC>,
+			 <&nwgcc NW_GCC_GPU_GPLL0_DIV_CLK_SRC>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
 	hpass_ag_noc: interconnect@5fc0000 {
 		compatible = "qcom,nord-hpass-ag-noc";
 		reg = <0x0  0x05fc0000 0x0 0x37080>;
@@ -877,6 +892,99 @@ nwgcc: clock-controller@8b00000 {
 		#power-domain-cells = <1>;
 	};
 
+	dispcc1: clock-controller@8d00000 {
+		compatible = "qcom,nord-dispcc1";
+		reg = <0x0 0x08d00000 0x0 0x20000>;
+		clocks = <&bi_tcxo_div2>,
+			 <&bi_tcxo_ao_div2>,
+			 <&nwgcc NW_GCC_DISP_1_AHB_CLK>,
+			 <&sleep_clk>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>;
+		power-domains = <&rpmhpd RPMHPD_MMCX>;
+		required-opps = <&rpmhpd_opp_min_svs>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	gpu2cc: clock-controller@9890000 {
+		compatible = "qcom,nord-gpu2cc";
+		reg = <0x0 0x09890000 0x0 0xa000>;
+		clocks = <&bi_tcxo_div2>,
+			 <&negcc NE_GCC_GPU_2_GPLL0_CLK_SRC>,
+			 <&negcc NE_GCC_GPU_2_GPLL0_DIV_CLK_SRC>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	camcc: clock-controller@9ce0000 {
+		compatible = "qcom,nord-camcc";
+		reg = <0x0 0x09ce0000 0x0 0x20000>;
+		power-domains = <&rpmhpd RPMHPD_MMCX>,
+				<&rpmhpd RPMHPD_MXC>;
+		required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+		clocks = <&nwgcc NW_GCC_CAMERA_AHB_CLK>,
+			 <&bi_tcxo_div2>,
+			 <&bi_tcxo_ao_div2>,
+			 <&sleep_clk>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	videocc: clock-controller@aaf0000 {
+		compatible = "qcom,nord-videocc";
+		reg = <0x0 0x0aaf0000 0x0 0x10000>;
+		clocks = <&bi_tcxo_div2>,
+			 <&nwgcc NW_GCC_VIDEO_AHB_CLK>;
+		power-domains = <&rpmhpd RPMHPD_MMCX>,
+				<&rpmhpd RPMHPD_MXC>;
+		required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
+	dispcc0: clock-controller@af00000 {
+		compatible = "qcom,nord-dispcc0";
+		reg = <0x0 0x0af00000 0x0 0x20000>;
+		clocks = <&bi_tcxo_div2>,
+			 <&bi_tcxo_ao_div2>,
+			 <&nwgcc NW_GCC_DISP_0_AHB_CLK>,
+			 <&sleep_clk>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>,
+			 <0>;
+		power-domains = <&rpmhpd RPMHPD_MMCX>;
+		required-opps = <&rpmhpd_opp_min_svs>;
+		#clock-cells = <1>;
+		#reset-cells = <1>;
+		#power-domain-cells = <1>;
+	};
+
 	tcsrcc: clock-controller@f1d9000 {
 		compatible = "qcom,nord-tcsrcc",
 			     "syscon";
-- 
2.43.0

