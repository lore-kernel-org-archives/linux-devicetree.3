Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBE647011D
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786711722; cv=none; b=lUBFKwABa8HZxrsBATnix80gDsyRkP2NtbcadnndgKip5OthvYM1gUXBFN6q2lUz/p6Ici3a3SzNNJ0ZTrGyvYsBRRDwN2U4bt1vtPTbnSIbVPCrcL0n1cWUcP370vqqdXcQwX0BQG6ZskCRUm5Wqhdqa+zloDVQKWHU+35+ZIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786711722; c=relaxed/simple;
	bh=1uiCHrTWTMMP/3AiU96tmnxABMeYVBDWOwYY3pYto6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZHNrkozjlMzyPeXVa+0UnXPv71D99Sa6PT08n+NAmxQw5rJ5ENKNEin93nGoV9WP+AHN6YgyMMtxlnkki8R2aJ01yD3+2agg1E8nDgT3qNy3A4kR64b6aLtHFS1VXq6NqpJJh+HaBD+2JEKc4uqoSQesGFI/Pk+dERMUFZoiXo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LXKETUAE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jVkTu1Us; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LXKETUAE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jVkTu1Us"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EAbGP91100044
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:48:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	coyVbFHnLrjMsqjFcJevU0ryfQuG/7YEwRkmhOrAVFg=; b=LXKETUAE/0uPDlwo
	k6uSaPNTVngDnv6emu5FORT9Oi5jByQRVCfOh4ubvlBY6cwZfKD4lyGn2Aay4/Nd
	SaEFNn3BUgEIJ6dDlgi5Tah8eS8D4KN+Xa5EF9VtVklxWIUEEMwsCXkJzCKWe1+6
	JAiv+siazEdAlD4ckk+E93spUuyYZ+74xp+yoYEL/dpyCvrwjG/X8uZteHczjv3t
	z4XDoXgx+4XOxHg95+x+CPfVvjkc17UPEkoNcW+DxtDvPc5THhyJnM6CV6EJEYXI
	IEhDApr1fdCAlT0lvc+nY2bLtdpO5V/2Aw66YKGrE0A0Z5zBzHc8mIGmIACXbd5K
	esgBOA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g20tr0n0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 12:48:30 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84885a4fcabso834422b3a.3
        for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 05:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786711710; x=1787316510; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=coyVbFHnLrjMsqjFcJevU0ryfQuG/7YEwRkmhOrAVFg=;
        b=jVkTu1UsrTcr3iV+STwOY6nbIF0uoH8NoXxmzUIPMW2FOVU8k0fsgjunInvH9wDpve
         9VqCJQPNJMk1rOKTs5l1XC4wgCkZP+fy58khP5LGRKEXWJN6H1dEGYwCROh1fyXijnLf
         DIZvqvzWY6gidXTWyGBqg9sSJEAU5DH4ipSRRystWSA/K4qoX4OOPBJbBB+3U5Eg7Xny
         EFE2FZDt5zmlo1VgS64KhqQhSX7h7nZnmj6zqxzYOoPka4xETknYHVyX/2N8Sh65BbYa
         1/TUgJ5uI2/G/sPvB0PJPm/vvrd3Wd9QvqJErW8+cZ0Wdoy8na0Ee/3100adbjuRv0U1
         RuPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786711710; x=1787316510;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=coyVbFHnLrjMsqjFcJevU0ryfQuG/7YEwRkmhOrAVFg=;
        b=BaNN4jb5bJJ4TjcKkVBq64u5afRRhSE+2THPI9AJtIiYUoaN41SDWxInnOAJs2LFg4
         e06aRuSCIPe9Q2mSAM9uBPGxXQXpe3lRVEIxVppD7+1sryAfUxB9JJ5BW7+n+wqON+XF
         CAezzZLLPNu35kPeWxrc9s/A2DNgIZToHSqZjAGurM5e7hOx3tJDDBnRylgE4iC+kwIR
         cn8WGI/hWUFV55MwW5b5AwW7CdpJQwjdXwAhgkd9PU7ovSt92ksGW/Y6EKCjPC2lpoga
         pehkg1LlAwmEmvJ0w861HZvsilq55q3pXARPelQwmzfFWDh2BnMjQ6Rer1oiW/5LTkrH
         x3ow==
X-Forwarded-Encrypted: i=1; AHgh+Rp1hMemcLWPZpocqr259Tt7dBtOlVmeYER/ONzo8VGRWIo/EaEsjZZVYfPi6wFXpSRANkDbuPdc2m5W@vger.kernel.org
X-Gm-Message-State: AOJu0YwhzfliBqxOnQ8NYWa5zJTwYeCV8wQrOSZcSMdxxZvv7ZLlU3Jf
	syHuoOmaev90WAHjHW7f3O755wC2hgABFErO9vuZYQ1wPBtNCURFapPNz9ImUOTjYYgnqX9Iwzv
	59Mnu6KN2sQL+fG31jaZ8RADOOHPMT9C8kB6axw7J+y44aKqIxr4OlEx1IHNWUZbt
X-Gm-Gg: AR+sD13s++Qgr5Z/bK6V6SrdKeEcGReYQxj8j37nHBWXV9qbLC8V6mePA6+Gjr4MFHI
	kv0NWe3KCEXt2fuZs60KFQM3fltCdaI3FOBhqF3xprTo34HrM0V64f8+MKOZSYbxNBT+B4JU2LH
	GVb0yjUxDM11nrwbg/7+B3/SN6cinrSVfthXzAjR6ZODTWCG0i6X/fxMvEep9SBC5t82ADuFFhl
	Q2Cm/zqVeQLafNa47HPQR/QgEZyw6xDnzt7jKUpaV0scFE8Hxb03dzsssGarD5S9XtYqaJi+5Ks
	8YPwCgly13/EqJYx05ZZw5E2iUeW+xXCgGJCAXFpNubNm/MGVk8POkHkwsjoQENzQrCC4Gs0KIR
	/UtosLHWVCpuQfyCC9tygDZCKqdkCW88syfbAJGZg1Go=
X-Received: by 2002:a05:6a00:4087:b0:84f:a392:51ad with SMTP id d2e1a72fcca58-84fddfbf13dmr6246537b3a.8.1786711709867;
        Fri, 14 Aug 2026 05:48:29 -0700 (PDT)
X-Received: by 2002:a05:6a00:4087:b0:84f:a392:51ad with SMTP id d2e1a72fcca58-84fddfbf13dmr6246486b3a.8.1786711709465;
        Fri, 14 Aug 2026 05:48:29 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d26726bsm405934b3a.54.2026.08.14.05.48.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 05:48:29 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 05:48:21 -0700
Subject: [PATCH v3 11/12] arm64: dts: qcom: ipq5210: Add CMN PLL device
 node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-qcom_ipq5210_cmnpll-v3-11-21c3db378611@oss.qualcomm.com>
References: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
In-Reply-To: <20260814-qcom_ipq5210_cmnpll-v3-0-21c3db378611@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786711693; l=3014;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=1uiCHrTWTMMP/3AiU96tmnxABMeYVBDWOwYY3pYto6Y=;
 b=pEgveHlYwnzWeI9Fv8tQ60pvTkemiU5q7/C64m2RcwcUTt0HMgABfYEcOq+vZ40XvqTzXsZXW
 /IT+D1AV26PBUAPoTg96SwNb5wYbGnZlMYvA//Fnk+EPdrHnq8kvL72
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-GUID: qn2fxYSz1D4je02a-x1_9Zffa9O7dGwy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfXwEdzu06Ju/yh
 F3WrF0BGR2iIglrpiN1kLK68BpxiJevT9GjNyLmVjLDMNAW1lgB1dIJjuT9YAZJkLWWI5doZ8Oo
 9gqvKGdYxyKH2kAql+VxKE5U0T3SkI3UQPoqnw+ONiC5NgSIXNCH3KfRl2nGgz4cNqMEdE9gxvC
 vKirqJfPl907grIWHF1j4ydpCi5qiQxwyh6DZS5oHd5laYq7WUk1WIOREjjDHsFL/ya2GG0mI0C
 jPp+gsmP40k0VcN1aci0uFEuxge/DMREynKB8Xo4zs9zGq1Zh4FltAAv4T2fMMRK9pfSAyHujEo
 9x6YZiJlqLY5q0N6xLTTNJs3Uw/4YiBMflKsBfQiorTBJ8z3h0k2AY0ZuXYoD99RFeh95tzI5Uu
 M0vT099mIskO4ND3131QE7z6qwNr8GTZ7Sw8pjVga0+UImBcY9IxBMDbtGuNhLoC+7GjFBpIsvp
 rNsUxt9qv9ajDmQeObg==
X-Authority-Analysis: v=2.4 cv=UrdT8ewB c=1 sm=1 tr=0 ts=6a7f0e9e cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ihdlGfXGyWBHLSVGZBMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: qn2fxYSz1D4je02a-x1_9Zffa9O7dGwy
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA5NyBTYWx0ZWRfX2O7X+5sVimsq
 pRqWic8nCs7x9FYU2q5/j5TnefYl3D40yk5GdjJkDBmq9DbO86rGgsxwCT1ZQpJq4r5RbcRqKsq
 fo5OCO8qgYycJ6UXmgRSfYjp2iq2Dos=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608140097

Add CMN PLL node for enabling output clocks to the networking
hardware blocks on IPQ5210 devices.

The reference clock of CMN PLL is routed from XO to the CMN PLL
through the WiFi block.
XO (48 MHZ or 96 MHZ or 192 MHZ)-->WiFi (multiplier/divider)-->
48 MHZ to CMN PLL.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts | 15 +++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi       | 26 +++++++++++++++++++++++++-
 2 files changed, 40 insertions(+), 1 deletion(-)

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
index 2cdc10529c48..52d851a0dc2b 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -3,8 +3,9 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
-#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,ipq5210-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq5210-gcc.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
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
@@ -130,6 +142,18 @@ soc@0 {
 		dma-ranges = <0 0 0 0 0x10 0>;
 		ranges = <0 0 0 0 0x10 0>;
 
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
 		tlmm: pinctrl@1000000 {
 			compatible = "qcom,ipq5210-tlmm";
 			reg = <0x0 0x01000000 0x0 0x300000>;

-- 
2.43.0

