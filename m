Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1CC32ED40
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775792957; cv=none; b=dEEgZcdvUBpIZrrogTLqUxXWiYGlh7mdnT1TFP1yK+qimCAUJ7eBdMVprsp98Gh6qcQlOZx1dXncfcV4djKxQRbc9x3bYiJ5lsIBk7jNBMoVKTJqmRaFmJnR9wIPkSMmn7B3DNxR2TeLQm8dp7gbU3ASPlWJOVswa1fZXV6OcEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775792957; c=relaxed/simple;
	bh=x2ig3ztx/pCNBsU2RDX+qUxTCnjru/y/N3ithO0cCK8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BT6+dh626hspU2blu39bFUWaYuqWZA3aHqUQn8Y68ZjVeusjj2d6D4bI9uNXGOxWDrwrHjKB86J7VpJRsalIuo0y6+u3+zSYpa2/xiUyk53qt/xwnQhaidX596LLo98HlqVG8JfJA1UoowvLMia5sZtC7+OYHkp+Gggol7cL2w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmT2lBqg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LAJ/Ntdn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmT2lBqg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LAJ/Ntdn"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639Kh1Vv1729917
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:49:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/4BZ9+e+nH07j2RJhNwamObCoja4D8QcrG16OYEgdt0=; b=kmT2lBqgPgNOj9Mi
	RWBEvLPUlErIPGT6r0O2iFR8TdjQ4p6mTq9sVwK54n16c2957kSHZdwlbjuOYET2
	PhDS4WJAk7++OkoNeIsBBvBaBhEjU7HPhFZogqUhvoCud87oY4IWl2hoPeQebJx9
	6dzuVU7tdHvOkMMrhIAvmfl2O5YWo4dlKmhf3JvpCClJQYGLgE++M0m3dGn9NPZh
	l4N8+7yf6/bAMPKbf5FpedJagYowhY9MmCzaOjxH4P7nIoiEZ1VtDLzxbdGlvCTW
	HuYLrT+j2zUOOz1G+hFnQbCt2lyI9ZpDUt8nAVT8hS+rgibOPpbHY2CXBYirwWHl
	YvrmUQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckxjjpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 10 Apr 2026 03:49:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b2d83e7461so1855435ad.3
        for <devicetree@vger.kernel.org>; Thu, 09 Apr 2026 20:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775792955; x=1776397755; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/4BZ9+e+nH07j2RJhNwamObCoja4D8QcrG16OYEgdt0=;
        b=LAJ/Ntdn5CGtT3e323pZD4YemqV0CeDfxZK/4NQ5bVZWjQLFLJkxixWABZUgJdH/7A
         MdsKooKHtmRj8mfw5+wEM7A5X/r/hXsTr3sEMH3h4f2X08zgqdWl/Z7jOGvGM3K/Q3oJ
         Tax4tQrXp4NR1BaxqsnNoBdM8pA2pqXfUWiPOvQRxIlouKjUslAzQa0A0xdMogpT4/xV
         lLEnwOST8rhfLfsBsUGG2NnJ65YYqU9nA3Vsc+kMAgdVXu6TC0R0qYA6SX9gl65G7Wff
         PbqXQMcPFuQ/Rxr0EPjaHeV8hfERClLBrqLJZMtUzyO3NQLYsy7S2m6ZpOXnGeaUlo1m
         QSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775792955; x=1776397755;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/4BZ9+e+nH07j2RJhNwamObCoja4D8QcrG16OYEgdt0=;
        b=UbiaCVCayfuT9ktXnnjGeyezz0mzB+T/esDRW4t7MXbXYGelLj4N3Bmhr4RffD286u
         zOIn1n04D0XTP307xBjCswX5FjrcHidvit6WR5XUgzrIEoG1WuS2RSvu8q5lVS8fF7bk
         iQEVNF3dhRrhjUYh7koO1pziSdk6gNJ/EnjroE8xPfOgiFTc4rcTCuV40hUlKoSPQFT2
         qCwjTxl1ScPgwhEsRv1izFrlePB3naAqRR2WVlbucriKWdmKdnFlEzbSRdGy7v/MEhSx
         7BKH8iCgvLOm3keuqZ9gX1GBOFJ0aKzB+V7UwVddf9SPeqrlpBA1Nd9QV3TBKrFonlGq
         A8Ug==
X-Forwarded-Encrypted: i=1; AJvYcCU3VGQpyyfmx6Y2Wplcj6UjI3gYI5qpOKV+Vp6YPaOpWDIyRU+M6HzOfSrxEPWF9mxRxc2QLZ4QZdpy@vger.kernel.org
X-Gm-Message-State: AOJu0YxqskXk68d58IcLdr1dIu+IIwCgJ1D2MtPwlmRGlUvkMa7pFdBf
	B58z5SuG2SSI5ZVTuO5an1dkcaBEpj9jiKcXEUUgJqf+9hSv58vrEQ853wDOROnxMJDgQoUm91N
	HCKgsatyghxlIgaB2ktnjwxX286l0TdeHgqqb0QolmRhx3fxD8bUAcC9B0j0zZ24A
X-Gm-Gg: AeBDievy8H0u6kKsJW9ikbCmqJre35diO5GkuwZLTEAQmIpa1EFXncdvvFNxEW1LaHK
	cIttijuYL32qAUqn6MOXNmaU5mtxBvOkX/qsLofICIdAvFs4V+xmWYcM3fNj/HdO8UlbJ8v1T7j
	kVakF0/dzfTA2D80YR7miwfMef3K9Le1Qh/r+0HlcHppYoM6Xe6R+q+oTEHGTvjD+9xY/1sdaq5
	umSMXzXZjhreaHDHOIBQHvT7bCcttv6oDjxfpp3vhiGQLY81HFS/3Gtb5fzf+bqDz36GVm0u7Zc
	oCX5TlF/NQWQTFMa7xPI9ZKDBRFHN8JLDMqlJ1+EyA0C2IxhbquvFGOb00DnF20WU2fDUVMh5Er
	0tnplaL8uCgbvG7Uz8koLj4DON89HqIsQRl8r+KomNUR9HQ==
X-Received: by 2002:a17:902:f787:b0:2b2:539b:d29d with SMTP id d9443c01a7336-2b2d5944ae1mr16135585ad.2.1775792955055;
        Thu, 09 Apr 2026 20:49:15 -0700 (PDT)
X-Received: by 2002:a17:902:f787:b0:2b2:539b:d29d with SMTP id d9443c01a7336-2b2d5944ae1mr16135185ad.2.1775792954577;
        Thu, 09 Apr 2026 20:49:14 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4ddcda9sm11588185ad.28.2026.04.09.20.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 20:49:14 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 09:19:04 +0530
Subject: [PATCH v3 1/2] arm64: dts: qcom: Add support for MM clock
 controllers for Glymur
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-glymur_mmcc_dt_config_v2-v3-1-acce9d106e72@oss.qualcomm.com>
References: <20260410-glymur_mmcc_dt_config_v2-v3-0-acce9d106e72@oss.qualcomm.com>
In-Reply-To: <20260410-glymur_mmcc_dt_config_v2-v3-0-acce9d106e72@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: Wb-BfIsNWoRv_48faZ_wyjokxoIDDuON
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDAzMSBTYWx0ZWRfX0081aFDPAla0
 8OeB4XydYpS2Rs5rLwEIqDaU65Hucmpa1j4Wh88+Fi7PC0Sn2z8LGDqSjZtJTxLC2fIkZEm9IIL
 ss5hwA03fMsrSwMfUVfPWuW29NBezgW2ZSOi9RiUuNnSgf8u+OEkjhzU8DDkPsGVMjg1pCgFU4C
 SjVgaDgGwcmzAl2HzDUSaTOqtiOlCpNCwIjZf2lvb5B7QT6D56Ye9Pojx+c0K+ouAnxJFBRfwcI
 tz3Faa+NLfBfsJ1tKFMGofTeezIj6S4r+cwFLN2oE3SkwFHrSK43T5N2gFzl2iolAlzgI/pCCR8
 kdfqIBZxSB1HdtmSuAq4l/9QqEJqfa/eSqb32vSgB7LAXji0HGRGIlQqVrwymb6RVkvzBvQQdfa
 DYYtdPnlsyoTFn0ifaBtabJxiCv05qdLR9QJbyvX93lQdTn22TgrGDxnwoe5YqE9xkSPC5vqcFY
 HZ9LLZOizMDPstw0n1A==
X-Authority-Analysis: v=2.4 cv=OMcXGyaB c=1 sm=1 tr=0 ts=69d8733b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-oN0OLM605FvJlsggzQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Wb-BfIsNWoRv_48faZ_wyjokxoIDDuON
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100031

Add the device nodes for the multimedia clock controllers videocc, gpucc
and gxclkctl.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 47 ++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index e269cec7942c85447892c0661f83171eded94f3b..882b8fe025e78ec7a9916226ea3b9c9c9e5c03f3 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5,7 +5,10 @@
 
 #include <dt-bindings/clock/qcom,glymur-dispcc.h>
 #include <dt-bindings/clock/qcom,glymur-gcc.h>
+#include <dt-bindings/clock/qcom,glymur-gpucc.h>
 #include <dt-bindings/clock/qcom,glymur-tcsr.h>
+#include <dt-bindings/clock/qcom,glymur-videocc.h>
+#include <dt-bindings/clock/qcom,kaanapali-gxclkctl.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -3335,6 +3338,34 @@ hsc_noc: interconnect@2000000 {
 			#interconnect-cells = <2>;
 		};
 
+		gxclkctl: clock-controller@3d64000 {
+			compatible = "qcom,glymur-gxclkctl";
+			reg = <0x0 0x03d64000 0x0 0x6000>;
+
+			power-domains = <&rpmhpd RPMHPD_GFX>,
+					<&rpmhpd RPMHPD_GMXC>,
+					<&gpucc GPU_CC_CX_GDSC>;
+
+			#power-domain-cells = <1>;
+		};
+
+		gpucc: clock-controller@3d90000 {
+			compatible = "qcom,glymur-gpucc";
+			reg = <0x0 0x03d90000 0x0 0x9800>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				<&gcc GCC_GPU_GPLL0_CLK_SRC>,
+				<&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+
+			power-domains = <&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_CX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		ipcc: mailbox@3e04000 {
 			compatible = "qcom,glymur-ipcc", "qcom,ipcc";
 			reg = <0x0 0x03e04000 0x0 0x1000>;
@@ -3367,6 +3398,22 @@ lpass_ag_noc: interconnect@7e40000 {
 			#interconnect-cells = <2>;
 		};
 
+		videocc: clock-controller@aaf0000 {
+			compatible = "qcom,glymur-videocc";
+			reg = <0x0 0x0aaf0000 0x0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>;
+
+			power-domains = <&rpmhpd RPMHPD_MMCX>,
+					<&rpmhpd RPMHPD_MXC>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+					<&rpmhpd_opp_low_svs>;
+
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		dispcc: clock-controller@af00000 {
 			compatible = "qcom,glymur-dispcc";
 			reg = <0x0 0x0af00000 0x0 0x20000>;

-- 
2.34.1

