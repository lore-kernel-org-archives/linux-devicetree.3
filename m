Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78F7481664
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778686122; cv=none; b=sO2wWix8Spyg5e6ySPqZ9zmroSetvtKLF3L3hfMktumXdYRVScbg5jpXXbUjJyWcaIkMbc/yeloQVK8twJBLDbETrZHIWCpBf5HDQZX+avoIQmOjIVSfyslxMBwwITjFvDg+G9INQBbJp8ZVkdQBpZeCrCRuh9IH6h+fJ2M+U8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778686122; c=relaxed/simple;
	bh=Zet80yGH2Wsf7rssHrQxPFjARZlF0KRaDSyB904g8Rw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rN333dxMEOT2oFrBGOjaEcLqRaejMLMiyd7xe6dg5hmd+ERLL8XHBZLkoRdeZ9BHt4qWIqn90SpqWc4t01bqyM+jhSkwszWE+E+mopSmHxI1LbHOcUYcB9qAzNi+3wot40fz3t5FgcXUGRi8wJyXwH8BlyFk1oidIraB0J75Vgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NugxWcVn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VBxQTCnR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NugxWcVn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VBxQTCnR"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DF5JkD4082597
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TZdMzcyQrpCXxC+UwRjMMK37TpjTRGuomgSL0bNjicI=; b=NugxWcVnbPC0SIzn
	jD5buxOhkIkG+XVwRsLyXqay5wcrGanDz85Q6clFz0r82jB+Wphm9XU9CbqvUJ8R
	ejeqQKBmbdZ2hmq1qu+X4yMjce0bsYYG/rq7BCPftggA47GnmyYtefj33/gdOb7B
	stbxsiagNbESjC9tq2udMGWmZEKqtuxwXwewIkzd1kEl3CqqIHLkHJ4uRzZa9xax
	nDU1miCehQv66Zmts+T1YdaaJp3N5CkveTe55KjyvGa6buhpDp+KyQFl4pNfdm3l
	TFzHkdgr6bZTyMx4HavY7fwqWmaSRwOwJ7JffNAClPfUjqOUewkTWJRTMps4ksRs
	sYeBuA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p6e1htp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 13 May 2026 15:28:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c6e24ee93a6so4914042a12.0
        for <devicetree@vger.kernel.org>; Wed, 13 May 2026 08:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778686118; x=1779290918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TZdMzcyQrpCXxC+UwRjMMK37TpjTRGuomgSL0bNjicI=;
        b=VBxQTCnRmG5Iy8kGrzYxN087G2AakQi6N3T0XDAq8eZsD3GDKUGe98WroCIR9vzxAv
         a2DuyDyi7SPIlAYQlkMK8WN5y5aHnWxqPdhG6ZBVNRjA5L76kDZWHYXFjkXje9nkbmse
         27BtLZWoyQIRSYJq4TpxpYy3IzUWluR0K7GfB/awNTZrHBzZtSMQNNA8q4Xz6Ew/tugz
         a+6Ku32AY7N+HFAAZ29YnlAkz7xk6jGfLrIvbhk/vtbEXqjL0BzDGqd0lDBe5U6e4f0s
         vdKSH3mYNRvABP1BnU7T/3rttBGZC9hr+8zfYTFZFbTF1BkJUa/SZ8c5ecjjUtsD6mFK
         VmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778686118; x=1779290918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TZdMzcyQrpCXxC+UwRjMMK37TpjTRGuomgSL0bNjicI=;
        b=mpwoUcoQn9h34lFUwnN+H8Lk68OjszjunfATKIPAKpWaOwfJaixFa2Kl9mQIO/0Bbs
         co6y8sqG03bUrPEl9uyscrodIzDeBaAT41RSb1D8uocfut/73WsUjh5q9r5MuOBaKF2C
         wvTai4QFr6gUiSwr5++kfhJOxh4HxPYmsEZWeQMggbEO8Er5HcGIB8zNTWRvY6xEGQFM
         cqYO0OpX0r0c1IPXLHestjQmYauIfUZlk/1ff29IK/UhElsmKWG5reBgV6YL2AUG2Kps
         Pr8Bojeppxohx0zIicIvRJbsz/zX+Ibn8HR076qxEEU/Fu+l8pIa9m2Xol/zS9FNPsqy
         wT/g==
X-Forwarded-Encrypted: i=1; AFNElJ9Ugq5i8zRSQ/ZDi3EtYhUPgzkMjpsQQomVez2XDEBP34YZKD4kJt+hTtB3j2H9LdHtqmm9QEzGhpUu@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyj3IhUbGTdVsu54Mc51BA1Llq2Z3bjyjytwgD6/bHU1mgkPDj
	GCxmOfAwc4PVBTGSSuh+ylULGcw7C3ua7UiPChPAmxXAXg3K84Q0IJYv5bTIR083wX6c8Vu5zP1
	Zqefvbc6jYRRQezSlfWrIapj26NTr9b/iG4Ra7iE+wRryQAP2T9iz2txdWYMdP3oO
X-Gm-Gg: Acq92OEchHLqPbwpcoxP8xN3KKXJR5tA7PCnWF/BrYPUJMyAwKPBEPfIK6MPx9SMuSz
	4vmFyBmphihroeFnVUoZDuewzFbcmwLoKMb3LdRdzxfHPpniMsjeUPCXwfesD/aFUnbdKVaQTbc
	6kBIIkjL9oHST6aGpsGTBCLjPGwgtIXWyeQdMzPgpkQtEE5jb/vKjZs7bD9Q/ZV1iQKuiVKUSq8
	AdUy9yNBiXHg37TpmcP7iQqY9c+xR9tFC2vwuKFm3ZGP0PlWXCoq7EjpG/9LbcWokNz1yCesRia
	eQnREA+DioJZLNLx+lEDWwo0PQkoPW7LvKUn1xtIuc4IGFlqPScAOMT57XwRznQXtoXeMIPvHEI
	rdbfkcw38uEs9s/UykhI3pvdf871JQPTCjCDVeAdPvm9W9A==
X-Received: by 2002:a17:903:1b6c:b0:2b9:6cde:c34b with SMTP id d9443c01a7336-2bcfd379c0amr80738035ad.15.1778686118399;
        Wed, 13 May 2026 08:28:38 -0700 (PDT)
X-Received: by 2002:a17:903:1b6c:b0:2b9:6cde:c34b with SMTP id d9443c01a7336-2bcfd379c0amr80737665ad.15.1778686117892;
        Wed, 13 May 2026 08:28:37 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1eafa62sm185042375ad.74.2026.05.13.08.28.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:28:37 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Wed, 13 May 2026 20:57:42 +0530
Subject: [PATCH v4 7/7] arm64: dts: qcom: eliza: Add support for MM clock
 controllers
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-eliza_mm_cc_v2-v4-7-e61b5434e8d9@oss.qualcomm.com>
References: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
In-Reply-To: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 5BXb5c33NM85sW2Uu2_Gbwn_jmOdw2Fu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1OCBTYWx0ZWRfX25leA2RVMfuZ
 spjDD6Xk90zM/YyhaHYFT4BvZIW3Ixcu5y2q/Vb+NavlbArxjt/Mvl5ZG/zWEnLKUro2R8s6lU6
 YY4k87YQBzCwOkTBHyquV+dg9BH+CP4KxwMFkEg5vrmslmAZ6VezpJnUpD17SCRgK6n/L3c16Xd
 Cj6izrhjMXUK/I0W8Tu0F/JVCo7oVV/07nYuG0JT+jdfoc9T5y2ibNi2lskVc4frXh4Ym3iqVsV
 BbPhA2G5zoMGjDjHGRu96Bys8TA0a99Kg6ZYaODflDPiCq2eVzy/A42lXhEdtF0oZD3ZRYWYdtn
 aXBOYMyo7Z4+pdn7vaouomwKfCSdox2ocFq3UzX11RC/CHPSDEcT3Ww3HqSKw6cT0j5Ul+2Bn0W
 Ca7G3viNTMZfAXpXkI37v1owcuOj7eCSVVcoyEUxGHbzbiqlsqwBNbiBo10gldf96IzvLqT/53x
 QJ0zGNHbRxME9anEqHQ==
X-Proofpoint-GUID: 5BXb5c33NM85sW2Uu2_Gbwn_jmOdw2Fu
X-Authority-Analysis: v=2.4 cv=Wukb99fv c=1 sm=1 tr=0 ts=6a0498a7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VHfLmW6ThCf22OJDftsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130158

Add the device nodes for the multimedia clock controllers (cambistmclkcc,
camcc, videocc, gpucc) for Qualcomm Eliza SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 59 +++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 4a7a0ac40ce6252a138bed06c7c190ada3ea61a3..1a47eb2a865717dde3fa0ff82665eecc8ffb87e2 100644
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
+				 <&sleep_clk>,
+				 <&gcc GCC_CAM_BIST_MCLK_AHB_CLK>;
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
+				 <&sleep_clk>,
+				 <&gcc GCC_CAMERA_AHB_CLK>;
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

