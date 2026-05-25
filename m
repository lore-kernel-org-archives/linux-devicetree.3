Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F154371065
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779706023; cv=none; b=BrU5o5LwipjjVj2hyMKKRAR6n3CdwARTdqiuLRekp4BgBkTJ2FaUf6R8Ms+GnjiI43wPa1FkWFGhLQ0BctrNz1exQow8kuzLSby3I8AtSHjh9iC9d+lOACA+Ku4C9CzraX9XjjpXdA3YZGuF2o88/gcL3DnImrmlTlXCY79QW3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779706023; c=relaxed/simple;
	bh=BpkrJZIwOoOmknc998FqklvIzt2YbIRvEWZvMafgO0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QQt1/BUw6JKVrMDJrRrlkBod3gVj6mQhgOY2YeXpDYOH+kcoseRBRYCLvIhSt5OH6ln5+uO/9vvpMG2AzqClMrhv2mZ+QKXrfUlHm8LjDsrKfneMGNAMv+Ewhcjuipb6G/2kJ7rUKJb+3gv9IVVXfZkWM8EFZuwlw3zLmUS5j8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YPCBmmv1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dM8P6aJo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YPCBmmv1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dM8P6aJo"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P6Dltn723934
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hSMJbr1PGvgD3m2WqZy4NZpdMn7GQjSQRsHMugwc/oI=; b=YPCBmmv1j1oD2Rzs
	9KFYS60zUJ+4ap74UyWpRcQKuJtpnlXowA94aQIzNm7BXU0KpLlcZekyszuEGenN
	+aHtYHyXffKyjOSsOXX3kLtgsaGCJfBdT7pM/SQjy0bZkDuHRVli2VuPhubJSlp1
	0ugp5ZkSdHQBHWQxvdvuUSp2tLL0WzAmD5ib4csuQg0rZt7Y5uyzZAVcKiLe+C+v
	ieBG/l0GOXPLPw/ad1icgL/ZBUtSugp2Q/7oJQLn3c0KDQQBXUaR7GABUZ2BC1pj
	T7O+YyuTBy3Ah47U9QR+M/gUmaaaU5RuCELfRbxogxTCeIQVjk3UKozVa8pzhOXH
	7Yqkwg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eb88w5sce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 10:47:01 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba268cb5e6so99695335ad.1
        for <devicetree@vger.kernel.org>; Mon, 25 May 2026 03:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779706021; x=1780310821; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hSMJbr1PGvgD3m2WqZy4NZpdMn7GQjSQRsHMugwc/oI=;
        b=dM8P6aJoVobh7QmLXblyILl6XG63xVgFWL6YGkSe5QBojyXsmgoQAOSrFbF3+q+DYj
         1gukTm7I+u+N6hhNfVrfdrc+VkFmtedMhuCdetC38I7NONWKGM50kzRj/abo18rD/8k0
         AGXSjWwlf04b4D8ntkWX0i37lrhRIesLMkiGew5MY0JN7kQljwv7VIfo6x69zIdnSrP0
         4tixfKw0kYZ94jbieViYjX4RNDiLv9GlLuUlW4rd0dZNWB4n07UnGVJueIPcUJnt2Kog
         8OY8uv8DOda6ZQJfHQRksiipLNij0uRjA191dz+yWPBxi3nWOjAerpxLTwwoODOqDzVO
         rNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779706021; x=1780310821;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hSMJbr1PGvgD3m2WqZy4NZpdMn7GQjSQRsHMugwc/oI=;
        b=GyorEOLXPp6IAH4q/g3su/gFxMMFlkBHLDyWGrF9dRbkpAqyJmC7lPxr3jd8HJ9WAL
         DFYnTEgSXnDEZT/2+oiueTwF+3YBpmqyG46u51SnWr7T2aLe/5h1zhg1mIyDACbjhlmp
         U9QkRwXA24ohQrwYaCZsmmOUUtwpZLh3pn8vvW3QuUskHSXtUfClKZG4iYxlSpqnxPzh
         wUr3TRsFcwZRLvsUwT7djxPIvXbpjO44XstI8U/WNFed21bcQNXSqY4YJZ3sZ4D3kVG5
         oDEve2OU+FwIH611CuI45uzFmcVAbf/WaSHagCdXItaaOP0jyKhE5FPpoSAjMfU8ZMdF
         tftw==
X-Forwarded-Encrypted: i=1; AFNElJ/MTgPTFMdPvmxOWqbmEc8Q37C63G8thhXy7uTvD+ZAUvG0eIqM4Uy043xnjAhd8Nh/fNcpr6nMRTNI@vger.kernel.org
X-Gm-Message-State: AOJu0YxuJOuOvl1AlGuTGENDM1U7SKwgqvFR795CC6LswszzJGRXKFYD
	Xu+HsmkSPiQUtMEWoXyArhWiy4Khk4qqGk432Sv3VpVUg8BesqfxCNViT2HylNfLKJ/92th2fti
	yt4f/ympvRQ4uUJz4XCbdcr+AzD8bTKFdkDhr9nRr2Wn4qDCPNslGihR/hgA64V1I
X-Gm-Gg: Acq92OExmRSaFGQs00PPQymRValccPfRvsJVV22RDqTBDG/nyj+cbSQAbREDNVqrmsI
	fYBhb1eLT8NKtUSwWxMyinCvjUY5e4gL0p5msr9a/ofVgfPYZe/hP2AYR/iNzh3yU7rNNAAia2e
	YBHunkdDgT0Tmg5PZVbqRGLfSTtU6fZukqu2R6xepaRaxbz9SUNhRtxktRvYs/4HvgZZ8OflqaR
	b1XWlYe8nYCvvqv+Mm5aFxC1pJHt5GnHIABHquZybZ2BXmGfDu5aBjHlcvxYwDapN0gnJk+cmPu
	nQKOYirMtOMTmx0ISSOef0X8+UvDYa5QSXNJq5zmXmPPF6DmvfdB2T/GD3YnLdmUkpcARiwcA2J
	D9Z19EsQDu5itTCd7wj4YDxuLLT0BNYxZfyBBVbFB0X3BIw==
X-Received: by 2002:a17:903:2c04:b0:2b4:61cc:37a8 with SMTP id d9443c01a7336-2beb037a5ebmr150819515ad.17.1779706020575;
        Mon, 25 May 2026 03:47:00 -0700 (PDT)
X-Received: by 2002:a17:903:2c04:b0:2b4:61cc:37a8 with SMTP id d9443c01a7336-2beb037a5ebmr150819125ad.17.1779706020078;
        Mon, 25 May 2026 03:47:00 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb591f63dsm118666175ad.83.2026.05.25.03.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 03:46:59 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 25 May 2026 16:16:09 +0530
Subject: [PATCH v5 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260525-eliza_mm_cc_v2-v5-7-a1d125619a5a@oss.qualcomm.com>
References: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
In-Reply-To: <20260525-eliza_mm_cc_v2-v5-0-a1d125619a5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=S/jpBosP c=1 sm=1 tr=0 ts=6a1428a5 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=nFpjIs4uCRy3fSY36ugA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEwOSBTYWx0ZWRfX4CzJUaOPp3HV
 0yeljg+3nU+aZBP3fvnRJF6YEfzfNtjqA4ldtEEy/2y3gcQfm5GpxgtNyrzZvEBEw1yADY2mGR2
 a/f+zxKTil27uDcVJay7pGFLZrHI092RyiUlOWpa/YDJ2XKLKjK04ZgtNpvj6DCUWNktt6H496u
 WDorli1UoeIKhUoLLy3yEbEkzinQKJpIsQCrLmJsWewRjNAuL9oCVPxc+AuDQvJKcAwvlkF/O6u
 BMVqMW7cLWwR2BMETu5gqrYTgh5rlrtWcPbLrSlncRAWK49C1WH8pmtLXT/Ueu18xwKt+J/tzqu
 7Sxfi8lsXnmZdEYNoSC7MnXXcTPudnqdmhqgnwOjioaQi8OLQxd84trCT6ICT1bBWKI9qQT19nB
 p7hN+XRuXILYoyJTXHtBxbIWSUDEAy7dIu7Z/PkvPOcjQni4zb7bee6bEPN4jE130md0/OIku85
 Vb8tcZSMcogv0jsT6Gw==
X-Proofpoint-ORIG-GUID: 4oTOWc1zxZUMKsYCT8sBBATv_lWH1knD
X-Proofpoint-GUID: 4oTOWc1zxZUMKsYCT8sBBATv_lWH1knD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250109

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 61 +++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a7a0ac40ce6252a138bed06c7c190ada3ea61a3..88673e7b2a5f0b38675aea517daceed9c3f9a386 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3,8 +3,12 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,eliza-cambistmclkcc.h>
+#include <dt-bindings/clock/qcom,eliza-camcc.h>
 #include <dt-bindings/clock/qcom,eliza-gcc.h>
+#include <dt-bindings/clock/qcom,eliza-gpucc.h>
 #include <dt-bindings/clock/qcom,eliza-tcsr.h>
+#include <dt-bindings/clock/qcom,eliza-videocc.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/interconnect/qcom,eliza-rpmh.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -709,6 +713,19 @@ aggre2_noc: interconnect@1700000 {
 			#interconnect-cells = <2>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,eliza-cambistmclkcc";
+			reg = <0x0 0x01760000 0x0 0x6000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -862,6 +879,23 @@ tcsr: clock-controller@1fbf000 {
 			#reset-cells = <1>;
 		};
 
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,eliza-gpucc";
+			reg = <0x0 0x03d90000 0x0 0xa000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_GPU_GPLL0_CPH_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CPH_CLK_SRC>;
+
+			power-domains = <&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_CX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		lpass_ag_noc: interconnect@7e40000 {
 			compatible = "qcom,eliza-lpass-ag-noc";
 			reg = <0x0 0x07e40000 0x0 0xe080>;
@@ -883,6 +917,33 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,eliza-videocc";
+			reg = <0x0 0xaaf0000 0x0 0x10000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&bi_tcxo_ao_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_VIDEO_AHB_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		camcc: clock-controller@ade0000 {
+			compatible = "qcom,eliza-camcc";
+			reg = <0x0 0x0ade0000 0x0 0x20000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&sleep_clk>,
+				 <&gcc GCC_CAMERA_AHB_CLK>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,eliza-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x40000>,

-- 
2.34.1

