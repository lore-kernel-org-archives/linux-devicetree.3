Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E4943BDB0
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905243; cv=none; b=NASlLKa/4rA35oj1MoHEBUw6zAn3o1s12L47F8wRwm29ioPaGvoKeiDBAr08zaY5aSXrpaCeR8oN9egAi4oSUzhGxalLviy6gAK+4pDMtvWh7SCt0KdAhEn5mE5s6JLMUJPUYetLoUTGpvzt96ILzQemFmC2AxRDMNmtP8T+edg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905243; c=relaxed/simple;
	bh=NX5KasTfSKSbMXviS2FdTitdo/PZoLn00u5pTFfve+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kDp2X08sNENPnR84DtNNcWJODdpJzhx2KXKWPOFyDqfVS6nOCw7KrLS0kO1Cf10ILRIBpc4bpDXkTX9zFjmg/uxDou7avXV29UocRt/p11XkgeiSBG1zPPITpS0T+3jmtB4WZ1oX5fSg/aU5fHRc7HD9vXw7rKqJkrcM2kbUh/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDsKG5J0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hGzgWQld; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hDsKG5J0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hGzgWQld"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODb8rB151467
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQfWpDlFYUpXwES98z5okhU7Uu/y/brvW4wJP/P4HzI=; b=hDsKG5J0/4+lV1NJ
	oz0PF0Md6RdmNC6TX5Iby045cgtHxSJ0BmKYCF5N53VdFxzdJNuXHZ59Bi22+90Z
	3EIG7YNaguSO6eb0aTc+87oo+HmUWsCP55ihUil/BCH7NhxhbH18OhPMAJ7CyMZk
	gKNJ5pEEJhxPKIYUjVHS0KS0m0rZJkSTqnNXOEwVB2yG/TmfxmLrWXoKsNqx3GIw
	UND/20jmNJHnuLvY02dtoTRB0B/g34CZV58okQb9GeK/RSWaC0POB2RDW56sEsCL
	lmgT6ohp1VLkOe8tpetd3PHVBcOZMuyJsQd3CiuO2O2TgAw53NTzMepnr4267U+C
	AitfsQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8ck8fut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 15:00:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb7d6ba548eso619600a12.1
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905238; x=1785510038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yQfWpDlFYUpXwES98z5okhU7Uu/y/brvW4wJP/P4HzI=;
        b=hGzgWQldFU2lC0Uh+fNUjUOIWquwpBc1MY0jd2MKw5KoujE6fIMg9UencALj/XHHX3
         oDdsdcTV8RntFPeAGgIQjoaB6jGztGdHjJ3YBI7uPDpQkFdxYIL00INjVS+TgcTnG2ek
         dSV2EzG8y1vQrYN2xE8J2jVmVrGl5YSZM8O53q/W/PD0PEljFJXevDYS6qOQI2JSoF99
         wvr+raOYnMTgNjxf3a++jPCNswR3/3avHT0IlH/nhoynaRMmj46JTJd4ngR1GGneWixG
         YOaYQ2tKenuYFgSZ7WUFKFt7tKT0+zjMwYRDDE7WJrvl7YIsaO1nQ8surXeInqxiq06C
         0nlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905238; x=1785510038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yQfWpDlFYUpXwES98z5okhU7Uu/y/brvW4wJP/P4HzI=;
        b=N1gqzm5MF//N/Trsac4s2wXg1Fm7wRdBcS1kWJ5tMnn2hjJQwZFylhabbWBHK9/dSa
         nWVgOib5U6Rr11H3qNUr+O2bh1wRriibCBjgVE3eQ24RSdNdkTXtqy0+u55Ct5dYgBnn
         9lRY+Uhr7EDMyfyZ5OCx9i3PHYalBDqfagzidS22e8Sb6AnOwJBP4EF4RiwltYVQ7ENQ
         oMTbgrBFUG0y4Il54i7eLZNwN0OaxPWStgKTZl/JbwuBTdFqt4kOGcR0KhyoprLLCYTF
         4mjjVr1uAqdjWLGz0R7ZwjWwcEh41+jZk+PQ45jimI2D9LjPmfsUhn0cMuOLi3OHz8x6
         5NDw==
X-Forwarded-Encrypted: i=1; AHgh+RrZI66IipV5SYCBTtu86PuldVaC6/JUudATouA7aoxG7MeU7smxI9LpcZ6L2aGejIuM2Vn82ezWn841@vger.kernel.org
X-Gm-Message-State: AOJu0YwiU3g6Eunq5/nbqJBtaQgrp1wV+4Bz5fjI1EhmRE/FzdT9a4/k
	D8JFmWCmI6ItXNCPnJU49MJisq6fUg3rphH9rOfONlrv/j7p5xa4H3efb+srNp4nsqrxU1jq3Nz
	8dVoaRCb15lsGcljsdPeK+u7Zr2ZoeAQqvuqRckJpTzn+uflZW4S/L8NM7FwfZWsLKhN+/ulueW
	JHbA==
X-Gm-Gg: AR+sD13LGBdR6Q872BesVo4ufGGuyb0a5dKtR6KzyKYdlVU81RP5kd4Uu8cAW/JMzTk
	Ak5z3zF32YUgNsu8OAcBkp3U24Y9S7+8VacSCJiwRS1333+2QtFXJNQ4evjXVZrkRAs5NruBW9W
	G+8SdonfCobqZZbMRPxMN0yFSY2XNW4tRd5YlXWiG0p8ypERX5iDWhB9/RX/4fHt8y8o8y26Dm+
	TtYQGDHx2nKY4AsR/1hFrok/WunGWF9um1ZbU6NOxjRP1pN5KuhSxWqJwVE/lcIYYsqBgge8Ht1
	g2SEE+OYbP1PRARwWdn/DJV+jU6QkXRk2TTUb0lFO8HcZVOCWU2GYZQJfohBLNwW6u7kZr5tQBK
	M4hwKc6WTk3EFfrwOBMBJXabhMP0mQyoF01x6bZC1vQA=
X-Received: by 2002:a05:6a21:918c:b0:3c3:6af8:ab24 with SMTP id adf61e73a8af0-3c44b21eb32mr8865014637.56.1784905237313;
        Fri, 24 Jul 2026 08:00:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:918c:b0:3c3:6af8:ab24 with SMTP id adf61e73a8af0-3c44b21eb32mr8864945637.56.1784905236677;
        Fri, 24 Jul 2026 08:00:36 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm621809eec.25.2026.07.24.08.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:00:36 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 08:00:33 -0700
Subject: [PATCH 11/12] arm64: dts: qcom: ipq5210: Add CMN PLL device node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-qcom_ipq5210_cmnpll-v1-11-a8b8679d215f@oss.qualcomm.com>
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784905224; l=2855;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=NX5KasTfSKSbMXviS2FdTitdo/PZoLn00u5pTFfve+U=;
 b=gcQ7OhdE0DgGlhmsNp5bB83DWWLXlQAVb3RRgWRFGCxxWA1L+jSeziLbglT90osY6QuuO6AwQ
 S30eUzn984NDohmj1qfgNH239MNl04xUzEvSwIhOFMWQQPtTHNENHMw
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfXxcs6Zz1FoQJV
 ErRDk1siAZLEvC73kZ1Aym8BcQnXoEOiplzsM6/VzPtASRmY44X+0pkAOkzGKbH4VW386DTVxc/
 3cKF+zHOHGNVsrpIS8740P5ihNM3wHjoniN0pFXWqkNAH3leju1T+VdF86PS1OKwgkYxZBd66jU
 on4D1+qS5UqMlWmr9zg7XTjRBtorXlO9KU+kxAP4onx6mrmlatsruxgU6u8sTYIRK1wIr0/gsk5
 aH2uS1wLmCu7Cj3/9snC1rPj6tG9dLG2oiVHhNxX4AYAytxrKaD05RUtbzlbriXV8raGFN3cVHW
 2lG81oC0t/dk/FOAbeWaLSwB/lT5R6EBzzWP3JcNZRYKv124qjBjJ/K5g9si4RYhkv9J3CQTL0k
 dRtOtGEF6idIAc+8wzS99flR5c4YyXm4LWICgqnrPPZzWkUHNwu9pNy8+vD6pvnNUong7l4oJm3
 6FPxfVa/T4937YZovMA==
X-Proofpoint-GUID: ytOrlCwTQzda8Ib_CFzwpDIoeVGsrzvw
X-Proofpoint-ORIG-GUID: ytOrlCwTQzda8Ib_CFzwpDIoeVGsrzvw
X-Authority-Analysis: v=2.4 cv=F79nsKhN c=1 sm=1 tr=0 ts=6a637e16 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ihdlGfXGyWBHLSVGZBMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfXybaP5zFTxrZu
 xztd5IyLXyFIStVoFGuxa91QUhdBowWThf22554BGZ7zfBUvWunasIMcu0GjdJAt6SkjgCItpJq
 aOa6bVkWKnWik+tSElAJaylWkzjxc3w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240135

Add CMN PLL node for enabling output clocks to the networking
hardware blocks on IPQ5210 devices.

The reference clock of CMN PLL is routed from XO to the CMN PLL
through the WiFi block.
XO (48 MHZ or 96 MHZ or 192 MHZ)-->WiFi (multiplier/divider)-->
48 MHZ to CMN PLL.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 15 +++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 24 ++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 941f866ecfe9..7410d092814e 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -74,6 +74,21 @@ &uart1 {
 	status = "okay";
 };
 
+/*
+ * The bootstrap pins for the board select the XO clock frequency that
+ * supports 48 MHZ, 96 MHZ or 192 MHZ. This setting automatically
+ * enables the right dividers, to ensure the reference clock output
+ * from WiFi to the CMN PLL is 48 MHZ.
+ */
+&ref_48mhz_clk {
+	clock-div = <1>;
+	clock-mult = <1>;
+};
+
 &xo_board {
 	clock-frequency = <24000000>;
 };
+
+&xo_clk {
+	clock-frequency = <48000000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 2cdc10529c48..9bbd55cc1e75 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/clock/qcom,ipq5210-gcc.h>
+#include <dt-bindings/clock/qcom,ipq5210-cmn-pll.h>
 #include <dt-bindings/reset/qcom,ipq5210-gcc.h>
 
 / {
@@ -13,6 +14,12 @@ / {
 	interrupt-parent = <&intc>;
 
 	clocks {
+		ref_48mhz_clk: ref-48mhz-clk {
+			compatible = "fixed-factor-clock";
+			clocks = <&xo_clk>;
+			#clock-cells = <0>;
+		};
+
 		sleep_clk: sleep-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
@@ -22,6 +29,11 @@ xo_board: xo-board-clk {
 			compatible = "fixed-clock";
 			#clock-cells = <0>;
 		};
+
+		xo_clk: xo-clk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+		};
 	};
 
 	cpus {
@@ -141,6 +153,18 @@ tlmm: pinctrl@1000000 {
 			#interrupt-cells = <2>;
 		};
 
+		cmn_pll: clock-controller@9b000 {
+			compatible = "qcom,ipq5210-cmn-pll";
+			reg = <0x0 0x0009b000 0x0 0x800>;
+			clocks = <&ref_48mhz_clk>,
+				 <&gcc GCC_CMN_12GPLL_AHB_CLK>,
+				 <&gcc GCC_CMN_12GPLL_SYS_CLK>;
+			clock-names = "ref", "ahb", "sys";
+			#clock-cells = <1>;
+			assigned-clocks = <&cmn_pll IPQ5210_CMN_PLL_CLK>;
+			assigned-clock-rates-u64 = /bits/ 64 <12000000000>;
+		};
+
 		gcc: clock-controller@1800000 {
 			compatible = "qcom,ipq5210-gcc";
 			reg = <0x0 0x01800000 0x0 0x40000>;

-- 
2.43.0

