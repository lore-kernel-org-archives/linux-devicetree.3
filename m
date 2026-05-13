Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAE7421A0F
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682249; cv=none; b=EtAO5SMVQCn/XR/iBiAlyJPlyxfPjQbojK2W8oYdeKsq97BSdldF6cfkHy6C6/CaHcfZnLX5IZg5He7WluBsJPvezFG6A0BQ+mTH1/OSiwcHTL9q21xDNz9gTETcXa/XpAGHvopLWI+sUnyl1N9qT+9yE/jw53cjIKDvMo9engg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682249; c=relaxed/simple;
	bh=d7hMOx395aOSc3mk2s7bGfKESt3HL65Usnpe/Jf9s/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iG8+Ghgb98gkploA9HyEybC1O1/VLXU0ytGqcz+e9IhlnKyAqmdRGFPS9Ivz9rPzV3j3x2qWEi5c1c+WliLqNla65KRtpDlsBJXSbPWdFU5SC8bdC5CmOIrMR6YcbhzVAwAPWGoGsdrotq9hTWaBp/hWBNd1TiXBM+c4cCPmdvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JmUl7uW1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HFg97ypF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JmUl7uW1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HFg97ypF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8nBjt2887848
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bv9MTFIgK7RFKHc7n/KdA9PcHAo8/akOMScX0ExYt74=; b=JmUl7uW1J5WFqGSX
	6F3nvyG9fAV3nWnhsroFhEN66SRZt/4N1PuJC85Ju8bMOAn3dQNcvhaJk3qkGDKK
	TS/D24r78CfTndlo7pqmSy0uP4xXuAfGRFv1ouh0Bs9NuNj77NPlSYjxyvAIS+Bj
	RvoCXzCW1i/YRpKATkw+gzu7VJKDnJdQvBx6Nb9iuKpaCJSToMn2OAKO9qevfkFo
	MAj5B0wYpu/sbtkMDhKOUsIL5Yw7phm5/KH3BFMqLckAASVfyAezgB/FVBr+mfiL
	CSVzJ/HBxLTGOxdAT5USJ852rb1u9yzz7SHZp/3BPlaiMriiZaTKDx0pGugTglvV
	IKM1jQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p4gh923-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 14:24:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b9fe2d6793so123853125ad.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 07:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778682246; x=1779287046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bv9MTFIgK7RFKHc7n/KdA9PcHAo8/akOMScX0ExYt74=;
        b=HFg97ypFmkrJJV9K6358aF95YMNNPr+lgHPB2b8XziAR9ecADvop7Y8+aY+38cv3M1
         ORnO1VkNJWKM6EKF7d3AWhhVU2cLUVlCk0dr4i7LfM4/UJRXrZsNVW5/onWJCn+AjD0M
         bxq1O2YPemuPxd6iBQP8IQ7E0+zQKaZs+l7/ecRBlkbmKAEwXS/U8rdn1nTh9Y7Q2w0R
         +QxnvwjvgszcqtC5KGMarECKYRcK9riPGrVHtZCq6uCwZ3g/za2JNlHJ5nqZYdaT+xyC
         fTv1BTLYSd8zBKBnRRX71nla/ZcOF8ECh0ZdsCyXCDIBnqXir0MP/HRm0TDSPZa0gQnp
         IdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778682246; x=1779287046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Bv9MTFIgK7RFKHc7n/KdA9PcHAo8/akOMScX0ExYt74=;
        b=U2nRXE/1ta+ezGBm6KXXissCw4zoXlR4yhVXV5dBlUIlcXbnSAjtyuxOeZe9GsDRNg
         5Z7iYNZQC+Z52Ws/NIIWmkOnl2IkLZ6lDXm41ykFq0eDfJn6MAbVOMlseUY9XAWvp4s2
         05OYgVnvPolVeTRKcy2HJBEwglOlAMRZsrUyEWVUaXbcFkTZtRQWk36VVGE6XwqfBkIy
         d3cAjuUhrv0FnkjpBXnlLI86TjrbeeQBxl4bxlx0Vd8NGp4AxsSVIflw57DxejHdE9Je
         v6rui5FQnFbC/kc12xY/60RvfFGdi0WvjCgMUPRDlvY4P4EtwC0i9bgzSpgs0iHDS9AV
         cj/w==
X-Forwarded-Encrypted: i=1; AFNElJ//K1j0Nu+fkFRDxa08/dmcChTSPAKoR7jaQmYjZVS6ZBFzNYNY0voVRwT8Zz7yUTV8Hzzkym53PDbH@vger.kernel.org
X-Gm-Message-State: AOJu0YwQamXhwnCWqKPUUT7wmp1QUU4c5KI2xCKiuwRcQDPEu718KEtF
	J3auc2aEb1ssvvmJxT/hqYrRqb3sfJd81Ub6laNTYXgm/4D8QP8/W9r35sFlcynNP2OSsGFgvOW
	XtmTkvqIdOYwoYq3UvFTIR2OEnptBlJS6ZVcHhNa/Z446JmYx6wyQGiBD887hGIJ1
X-Gm-Gg: Acq92OG3XtJ8TjroiPuZMzRLf5Xof/2uSmWSUap52YJ6LJxbL2m8OfN7ncVNh5NaVnb
	wHVSHitep05DAP6YLno4lHBS+ofsFqg93c5wX6J3hYOckaWJ4iJCv8IM/RFlUztsBmNvk06G5+0
	dWIYRsjGGKOtsqt6P9vR3o4TrqnFwL5TEKHMYbS9XOEZ1m1vajKjXS8VUqX4HdgICduroDsZ94R
	bfELCnm+kCUCMT3qShL2giaYd8wGsx1JDbvQhsBgndgqPs9hF/1EwTNWNAQPQneaHmafL6QV7BF
	Piq2bVUZlzZKqCmd3nYVd2VcRsDnL19aLSP3Ot/oWyNcIltmpamIWqg9+59mcIT4t+/MaYSiHp9
	xJh0JzmGuLO61tRfqS1VI6MAwzbvPVTO9+y4MN1kNq4xM0Q==
X-Received: by 2002:a17:902:f650:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2bd2772e10cmr39657385ad.35.1778682246221;
        Wed, 13 May 2026 07:24:06 -0700 (PDT)
X-Received: by 2002:a17:902:f650:b0:2b2:4d36:7aa with SMTP id d9443c01a7336-2bd2772e10cmr39656995ad.35.1778682245716;
        Wed, 13 May 2026 07:24:05 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d40427sm179296105ad.24.2026.05.13.07.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 07:24:05 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 19:53:12 +0530
Subject: [PATCH v3 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza_mm_cc_v2-v3-7-b59c370dc281@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
In-Reply-To: <20260513-eliza_mm_cc_v2-v3-0-b59c370dc281@oss.qualcomm.com>
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
X-Proofpoint-GUID: v9m1ASaDk9YmzyuyGS-j3wY7A-XUtfxg
X-Authority-Analysis: v=2.4 cv=DOS/JSNb c=1 sm=1 tr=0 ts=6a048986 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VHfLmW6ThCf22OJDftsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: v9m1ASaDk9YmzyuyGS-j3wY7A-XUtfxg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE0NyBTYWx0ZWRfX9AJkEDR1+/f7
 ZhOT8UoXLA0UmtJ3Gl62rabnPkZWlmExS7tEBrCwgMMQrS3W7AKbjoadbKyC3QAtpQPlSPMPOLe
 aepEzsNfol92BPnQ1oA3IXW8bwLND58UyPVCQl2ixJmV+97u9D3Kl1MMPWeLHjYtzsV9Cok/4dS
 IdUGP8yyBtBgvohHh9GStED+50911u/yj7elaGtppTDzjp6gZp2MGl76f3wLcm18UPLl9vtrWWx
 RKtNuah+PXXADUObgswCSCvcx43BGdux+Oq3U6lf8A7qoCodeRFBKGlsOwFebZCPXIOvEoX6ksc
 9f6aNu6UAufvjst4p1mPVWBAc8RvDCvTdwzgVmzY9r5ZD7VkHHhi9diOaz8Ki8n+FpOQx752Dsm
 Cx9wLg5mEALHAi5CPyzwDhDHRrPEQVHw9hNhzx11e0bPOWe9QcGnv78re49cpyhkzV+6HBpLWtK
 EUurt+gPwWlJr+Wx66g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130147

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 59 +++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a7a0ac40ce6252a138bed06c7c190ada3ea61a3..07c871c1d4b0b22ccccd7753e8b7af26811c6956 100644
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
@@ -709,6 +713,18 @@ aggre2_noc: interconnect@1700000 {
 			#interconnect-cells = <2>;
 		};
 
+		cambistmclkcc: clock-controller@1760000 {
+			compatible = "qcom,eliza-cambistmclkcc";
+			reg = <0x0 0x01760000 0x0 0x6000>;
+
+			clocks = <&bi_tcxo_div2>,
+				 <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>,
+				 <&sleep_clk>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		mmss_noc: interconnect@1780000 {
 			compatible = "qcom,eliza-mmss-noc";
 			reg = <0x0 0x01780000 0x0 0x7d800>;
@@ -862,6 +878,23 @@ tcsr: clock-controller@1fbf000 {
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
@@ -883,6 +916,32 @@ lpass_lpicx_noc: interconnect@7420000 {
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
+				 <&gcc GCC_CAMERA_AHB_CLK>,
+				 <&sleep_clk>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,eliza-pdc", "qcom,pdc";
 			reg = <0x0 0x0b220000 0x0 0x40000>,

-- 
2.34.1

