Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6601236EAAE
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 18:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017288; cv=none; b=PnUF4Ndgp+l+K5VkPQ+p4Rame41BPyC5rWgaQQ+kKbfPKOEcw6FVkNG49pMVQBDpQCXGJMv0JG9h9azkkEeg2Tm4GRotgiqEgSgPxw1p0X+kqFawiicXrEWUu3yBwLQ06cMA64wcO5yZZt4MvkM4QL1yX9eCypC/LiMvTorfrYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017288; c=relaxed/simple;
	bh=cx9dH+fPvbGPwctfTnUVbOozhcl/R+Um3kyHRpThNdo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TUpoh9xHUn3UftO/0sbvm9zQIrFDrFpyCzlwgMbEhQxrw2c5xyw73wi0YdPoj6tPv48CrHCeL5QKwigJWzZkYpmq6g82C2UHp+jNAAg6wDUNwXJmpt9jszFAIOJD08OEF+ZVuRDpefYcNHtSctoSoNbmL0VAyfeXJO88hU3wl94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ED2RE4Sd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EL0iMdj8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ED2RE4Sd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EL0iMdj8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3XA4672747
	for <devicetree@vger.kernel.org>; Thu, 2 Jul 2026 18:34:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lgZwKjPlID3iGtsiOBE7KjJxEWUWSAaIZvGXlBxzDIY=; b=ED2RE4SdTZzGShsT
	7DTAoGBkpVfH8pz2vijZwCXHrQsoRrk8ikDpUKpkkXw7wypremxboNeBrgCID8/l
	hvphS14kNjw7AFUGclFU3vkD4T55bcBltLY+tVVhCZVx/0Zokd3rH+Wua9OxAa2B
	MzsWpfPnk9Xxpr2tBax2lVHXKSH55s3rQ0JSU7ybF+7UEokd1b/qMNnjCSDgIsyv
	z86+PotnyYOF/swrgVhO/yVKXJ/8p0D+bOeRVJTSjFN6dwNmTVhLMzG0Xmbzj8bf
	lfFc+PA3dBoFCzOHnSGXZiJDpBhkm4inEGsDZvL38JcA5cYY2T8Y1uIKQHoL8D/8
	bHv5BQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7nbcdp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 18:34:45 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8478d2bea7cso964103b3a.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 11:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017285; x=1783622085; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lgZwKjPlID3iGtsiOBE7KjJxEWUWSAaIZvGXlBxzDIY=;
        b=EL0iMdj8oMxMSJQvXDch+1Ouo+rEk6hVP9qwh+6JFNliKTNlXHr9/iL628JXvoSQyR
         27qX/4rBVlz2mbyE/NjHB5NTcckvTeVaf1+DD17ptG7P/vHY0dREOtep6VkGHgE0KuI+
         w+90VAuRqM7NUsSYg62FS1EB9YdpJbiNIk5TUPoCYRJY9s5y9Xd581DI7pVNCmSzfnTO
         z9cHKglJ60ypobZdXSj90Vg5XCRgFLeaSBWBPlJ6p05Wv0dezEc03PAsoLgYSQ36gjpM
         A2H60jxLEQru8StpqIEs3o6Y4wF/pJVD/rPtiPhnlYA/zLBopysWZ2kWlACsOVpWG9xp
         0m4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017285; x=1783622085;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lgZwKjPlID3iGtsiOBE7KjJxEWUWSAaIZvGXlBxzDIY=;
        b=nZv1YOqpRJjb4ZDt+nhOrX0vzK/3eZKxS+ITR3eDG73b/Fr/ya1pchQJYrsx0Vb/du
         E71bC9PZhK/et1uSSAjAglPROYpHSWxJE8h1Vdx5R9yIsgpSfKU987z4tP20fBG7bb1c
         kgZdCzSEC3a5z+XuRRuChH9NCvpXnpsiS4e2ia2yOz97MucVJlF2xTn/pqNAsFgrad2x
         YuiT9Z97D7a+XszzlkJ40vHZTR/01cjSLHdichAyPEEKQCxufxpdn13Oi8Y9z1EtcfDB
         FpgQQ582XMPcvbmMsQmEfJCrjTp57uqRr79tvR4nBEWx2YJSLXVz0VHv1otmpKVGhHZe
         H/Cw==
X-Forwarded-Encrypted: i=1; AFNElJ+4rYLrwnRx8n1tIiYYrmFzuKoY2h5YNKd+6Csfz0AERqRytXFhatvwUO2OG0kgHooeS/j2zZARZDdJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0n/5dHNsTs4nzY0ryi5U7+ZzHjXLpFdl/T8vMtbEcFo7Ol+vZ
	oQko+VgpReXF07v48aiGRHKfq0rECR3owjMH5rA3IZt7Y5vo8hc7GkudbPHRS4VoKajnxRV8VWX
	Y85xX+T+kA537TV8yKHgRWjDZcvea6rqebFXxRd+HtDoDSgt3lDWas8Loj8sGgSSM
X-Gm-Gg: AfdE7cn9JXKCSpdK7J5PrJOyr1mmq8HOVDRAuZW3d1r2/x9b38OYKjOlVEWCjXaKzL8
	kXVTYQ/TsJMuoyLGbKdqnEBIppy0ycH2WkrD36MtmHH+WUx91gEadEF0gqhhHmv0hghRkUyZbaA
	vNTnUdGhE2bynBTcbd1RTZod3PhVYEFNNxJIgaG+I7M7RwoxU2Kjk0xQs6AvT+NjxkWT+dlcUpi
	1ukP2dqAHaEuUbm4kcPRCIiLdbI5V2mUYR2/3uX/nnD1KzuVW+iITTXBxR/DkCA63kqOJw0frC5
	/wgus2tTqACjOB0lk10FkpJb9Vl8IzODeTedwVKYbs4YTCul8lJp5L0WH1DPeke7FoeHd+z9bDm
	wBGD4tQM989ZKtLuUm8nHwh7Pyml7F3v6A7uKwUtJEw==
X-Received: by 2002:a05:6a20:a124:b0:3b3:3506:cf3f with SMTP id adf61e73a8af0-3c01c5e8792mr1184364637.1.1783017285203;
        Thu, 02 Jul 2026 11:34:45 -0700 (PDT)
X-Received: by 2002:a05:6a20:a124:b0:3b3:3506:cf3f with SMTP id adf61e73a8af0-3c01c5e8792mr1184324637.1.1783017284738;
        Thu, 02 Jul 2026 11:34:44 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:34:44 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:41 +0530
Subject: [PATCH v5 19/19] arm64: dts: qcom: shikra: Add support for
 DISPCC/GPUCC nodes
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-19-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX0Ers45I8qqIN
 HTvqJJ+ds41eI6dXkV1yQ8WZ76RdILOwbiz8juPWVVO6GCTvxE4OmCStztJw8wW09ODVh/pBjxs
 9zaFugfBItQ9IQExHcWVzL4EHeCgDo8G5/OrHyBYhOKj9rTLewAgQLDjrrlMt8w85yUq0NFGSVT
 u1ZE60evbRs7MWCXBT6yLuNIkMa2GjybJgjNsra8HRXPR8P2XhTXQwvSLDOHG0WZCXVFYX2a2S9
 AfPlUttzJi1JcL7JyPfQT1CSMSGq4hZXcLiPn5ycIXq7F4fSaqKucQhkyubFHRQKU6i9jJ+4fzs
 uAg2tYtqAjRUjy3OGJZGUr3WzWbopqLzsjiQKQAl2xjMG1c3EOBfJ7JjKxIpI97YWagkJRQYb45
 Vbe2FpLf/UOTNfZQLNTLC7O/Yv4nYD92Jw2FEpJRP6VPRQtfEd3s60mcyLkmQYuHfSb1VNOvlbY
 UebkOW5Eu86Ufd0maVw==
X-Proofpoint-ORIG-GUID: Sf4zG0c2KWILUtfBibQSznHO6TdW1j_k
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfXxP4hmqClTMRY
 cYbklKs6anxP1TTA4HyMxjQhyT2SE/KST7weATQnd/PfLRfaOg1vzm11a7TFMyGMuVCtHlEYbVR
 Vdsyl++T0v9wPwr42g+Odi/nqoAopYY=
X-Proofpoint-GUID: Sf4zG0c2KWILUtfBibQSznHO6TdW1j_k
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a46af45 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=KUIDwAxYdJFQKfevFyUA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195

Add support for Display clock controller and GPU clock controller nodes
on Qualcomm Shikra SoCs.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 42 ++++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..39aa3a47564c55a3029763fe92cf485d2569a000 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -3,6 +3,8 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+#include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
+#include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
 #include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/clock/qcom,shikra-gcc.h>
 #include <dt-bindings/interconnect/qcom,icc.h>
@@ -640,6 +642,46 @@ &clk_virt SLAVE_QUP_CORE_0 RPM_ALWAYS_TAG>,
 			};
 		};
 
+		gpucc: clock-controller@5990000 {
+			compatible = "qcom,shikra-gpucc";
+			reg = <0x0 0x05990000 0x0 0x9000>;
+			clocks = <&gcc GCC_GPU_CFG_AHB_CLK>,
+				 <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+			power-domains = <&rpmpd RPMPD_VDDCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
+		dispcc: clock-controller@5f00000 {
+			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
+			reg = <0x0 0x05f00000 0x0 0x20000>;
+			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+				 <&rpmcc RPM_SMD_XO_A_CLK_SRC>,
+				 <&gcc GCC_DISP_GPLL0_CLK_SRC>,
+				 <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <0>,
+				 <&sleep_clk>;
+			clock-names = "bi_tcxo",
+				      "bi_tcxo_ao",
+				      "gcc_disp_gpll0_clk_src",
+				      "gcc_disp_gpll0_div_clk_src",
+				      "dsi0_phy_pll_out_byteclk",
+				      "dsi0_phy_pll_out_dsiclk",
+				      "dsi1_phy_pll_out_byteclk",
+				      "dsi1_phy_pll_out_dsiclk",
+				      "sleep_clk";
+			power-domains = <&rpmpd RPMPD_VDDCX>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		sram@c11e000 {
 			compatible = "qcom,shikra-imem", "mmio-sram";
 			reg = <0x0 0x0c11e000 0x0 0x1000>;

-- 
2.34.1

