Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA8534E75A
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 08:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783067690; cv=none; b=WQ/mkLaaVRzKI0tNDqOrh5d/l/4UTl9MM3oviss6hdn3SIoy4jwwRx+0JFOEeHzi84MeJSGf0AqqQYeSMa2ynQcijWR/tttbCu7WmCD5wWjk2cHrl3PEPMJwxriLJMD8+revF15I5wJtgAF7M+6gmPlIA1bTQXFFk40ljSr0iw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783067690; c=relaxed/simple;
	bh=YKvSYXOcZAFf/SUwWLWa5gao8l3OIUQCsF3ji+Ar2g4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uGfFeTahZoY/1FJEVh4haL8/Dp4jUyoXqtj30LG+WNVHttWWc58CisdHFeJK5Nu+rmU6eT/krW7cKvimCxYU/OyV8ueKjoCa16J4sYJ1SbIAHamPXXGUpCV8ie4hxBeDp5hKLp95BBjFJcHLYSNNBzdgFNBU3yEgB0jLUeMF050=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hzhpj5at; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EmrhnSVq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hzhpj5at";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EmrhnSVq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rwt93126425
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 08:34:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CWwE5upxYuo
	5RiLtxxc8EPnMf9u/aWNu8vxZbG+Te5o=; b=hzhpj5atW/gu+h0CJDL91Zc7gOQ
	JrmQ+atbmHhH1pqCo8mMyiFKcl4fOP1vjVJd/uWC3IoOIbqIY8QyPlfr62pkq+f9
	Z4E5uTq/FesjOb009+c+84/SEtiOB34oKMjvpT1UYrrWEyIr5n0/LbYl3iVee00K
	cw9PPBKWz9AWJDKp98Bszt+rFLMX43+2Pwm7RB1dRQEIff+tWA6UQduBw3QZkrqJ
	0iub4P1pDKLOeCAt6WWQ5e1+oyBvw9i9gCyYaoVtJl8bFohSKUXp7v57WUFc1khq
	BdnxjJNPV0O3h3L4vCmlGIwP05jfNsfLQzs/FFPQ7JIVYY2u1kDXRaWW6Ww==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5tpnkj7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 08:34:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-37fccad2b01so1346583a91.2
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 01:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783067686; x=1783672486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CWwE5upxYuo5RiLtxxc8EPnMf9u/aWNu8vxZbG+Te5o=;
        b=EmrhnSVqVMYUIADfEL7o2NZUlXvnR2+Hg2Q562hpJ1JooaWwD5LENPsfYSQ/LaxmpY
         ZzzNnfiE/xmRjyTRuEXlsy7xd9ScFfHxIib5ioFBt3qAiTSouVD/VvlWlxtUk1Hg2v2R
         6Uvs7sOx6Mr/AT3cCvQS42BiVZaZKr0MdKE4WYTK/LrhhRJrUDDNtiTrU3Vcvkct8sgt
         iuK97LzgXs118MOgeL4HmmJ3qsQ8uBc4Y8S0+ZoPxnr1hlGRbmiuv/dX+2V7E/FlUPe6
         u9OpWCl77YaaPn/6xK/zA6SPKU2H/uKx5lX4h5k9qT2cCLHFy14Xkc9/KJWVeZHkMelR
         NjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783067686; x=1783672486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CWwE5upxYuo5RiLtxxc8EPnMf9u/aWNu8vxZbG+Te5o=;
        b=PbGpacs4tgzrRFJCpcFJx35toFfc1MlPFBSa79ZJfrOA6tN2ftLcWIZ8S6M7qsoVbk
         OAxiXpCcjQE3tfq5AMyxWLxcB6VRIIGED36134IeX46IPcMV51gCajtwxQRW82ZM2KjA
         wReiL2tVZOhUc32ZJiWwGQYtp0aT2T6cfzGLyKWLOSCdyZLU/0QBDmme05e0nwcC3v9W
         6aqqtzI1SzRPKxeFBE4oVmHmQumqiNejNzmQUR+wktehBiPwS+W9Qw81FdI57Mg3pnJ8
         cm5sU33HoXuegmcRTNnVDifCPceEgZVHYO8KH+K2ZEyUaP0ACWWi6nmGMYpmxhZ6tVQW
         XpNA==
X-Forwarded-Encrypted: i=1; AHgh+RomEobCjjfIEMf1yUbCRj1C2Pe9fD1sOkNrSWpySZnTvjg9LaLkowec3AOmBkTZH/vQnxMWZ76gsbv3@vger.kernel.org
X-Gm-Message-State: AOJu0YyJtOS95PTovnpbWAc9Klld3HPOmphJU88opS6Y9pkTHz8MNP4o
	o/wLwfZR7kA/OnAIMyeXh0NWD2g5U7jhtJx4HQUk/ITlJ6skBKWL0cNxa+BtIW4qEWoP6uoMQWS
	YinosKm7MU7TzIi2ckYzLoaRH2LAvA8I0IrxxDYpjiROU5RZGpe+QYVTyOfFcI1Pm
X-Gm-Gg: AfdE7ckIeUjJZjf7VySRMFGP1NNbbIOZORAiiaDYmAbv5ivOsQJ6pKhu/ZED06Bp0oE
	p1mY4TP/T1P4KRWnum1AbxVx0eiNfVHrv1cmnQxuCu4jScGwVSoYQEk+EUaaslx7SL07bdlUq17
	ytSWBPac+QX1O+YvXXY+oGih4/SuNyPbgt+0jE3Jyh6GCAPRSjSqGNYgHgx8ZajEGIPIzfKLcNe
	KDybKLEuiIIgiLUCJl8SfBzwbLbo2BNylycxCmd+8sD101c06rJ7HTvNJ0O04iihRpFDcsrZum2
	An3wvefg/KuUlkJgjf3SZpR8EcGH3FRs4+TkNDrGvBjPu8rMvQX3X4dLiS/gHiPiACjvtmOD1jg
	5buk41v4DS3LNCom3qfVUjxx8GHbsaO/XGAg0LWf1
X-Received: by 2002:a17:90b:3f8c:b0:381:854:dba4 with SMTP id 98e67ed59e1d1-3810854e536mr4144025a91.20.1783067686327;
        Fri, 03 Jul 2026 01:34:46 -0700 (PDT)
X-Received: by 2002:a17:90b:3f8c:b0:381:854:dba4 with SMTP id 98e67ed59e1d1-3810854e536mr4143991a91.20.1783067685819;
        Fri, 03 Jul 2026 01:34:45 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm18797839eec.2.2026.07.03.01.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:34:45 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v1 1/2] arm64: dts: qcom: eliza: Add LPASS macro and SoundWire support
Date: Fri,  3 Jul 2026 14:04:20 +0530
Message-Id: <20260703083421.2736184-2-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260703083421.2736184-1-ravi.hothi@oss.qualcomm.com>
References: <20260703083421.2736184-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9ZidSWQewa6qa5w7ql1Vc5CnsetoWOoi
X-Proofpoint-ORIG-GUID: 9ZidSWQewa6qa5w7ql1Vc5CnsetoWOoi
X-Authority-Analysis: v=2.4 cv=UMft2ify c=1 sm=1 tr=0 ts=6a477427 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=hg4zlKkQFggHIW0abPEA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4MSBTYWx0ZWRfX7itUOFueaLeu
 cttBxw1qc7xkjYHGDrzSaafg1yiEv83AYC4cFJZZTAYUMQsoiIxsmJS0751suanaag+fOmUJFqd
 m13TuH2ZWY5gctNL6oJauY/JLJtTsmg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4MSBTYWx0ZWRfX+GpnlmAW8mrY
 txlltdzpiPfip51yOon1Hxxr2ANPXZv6TdGD9gjCGWjf2svEHaW115w6AXbDCi/p3KG47WjYPwr
 C6La/NofcHAkDW0vcj732LQVcDmps5rtOCHSzlW1NVO3O6MdPmeyOx25WODaTuDw02SbNm9WhOq
 skT63z0+xRY2XauXwRwUxkOBMJ5tcyqb4i9HfVF+2BxbBgWvYuc2+IuFbkgCEBZAeoNFQkdqeul
 YwqUwbiZenCWVIQTclDC9mZsmEQEDE0ryIZskJqOK7ctkLpDMJ3InGLe7ziijUC4zYrHY3NicUy
 xspacUs/ATBD0nOV8DYpegq1ThnwRPTGmnNfgPRVBX5xjJ0V8xyWcb+1YvdmInCS4s5WI5btD2l
 QAD/JV8WJL+W8k0GF7/lx1mvjrYg9XaeL/e4n1uYrBEUWY24NEofFHflIeg3lmYhKo/gTPd4rJ6
 RH1kTyPQpvC90hqLsNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030081

Add SoC-level LPASS WSA macro, VA macro, SoundWire controller and LPASS
LPI pin controller nodes. DMIC and WSA SoundWire pinctrl states are
defined inside the LPASS LPI pin controller node. The hardware is similar
to the SM8750 platform.

The WSA macro, VA macro and SoundWire controller are kept disabled so
board DTS files can selectively enable and configure them.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 193 ++++++++++++++++++++++++++++
 1 file changed, 193 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 8dbfd0504598..142f43a1e6a3 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -19,6 +19,7 @@
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -2072,6 +2073,198 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
+		lpass_wsamacro: codec@6b00000 {
+			compatible = "qcom,eliza-lpass-wsa-macro",
+				     "qcom,sm8550-lpass-wsa-macro";
+			reg = <0x0 0x06b00000 0x0 0x1000>;
+
+			clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&lpass_vamacro>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec",
+				      "fsgen";
+
+			#clock-cells = <0>;
+			clock-output-names = "mclk";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
+		swr0: soundwire@6b10000 {
+			compatible = "qcom,soundwire-v2.1.0",
+				     "qcom,soundwire-v2.0.0";
+			reg = <0x0 0x06b10000 0x0 0x10000>;
+			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&lpass_wsamacro>;
+			clock-names = "iface";
+
+			label = "WSA";
+
+			qcom,din-ports = <4>;
+			qcom,dout-ports = <9>;
+
+			qcom,ports-sinterval =
+				/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f
+					   0x18f 0x18f 0x18f 0x0f 0x0f 0xff 0x31f>;
+			qcom,ports-offset1 =
+				/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15
+					  0x00 0x00 0x00 0x06 0x0d 0xff 0x00>;
+			qcom,ports-offset2 =
+				/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f
+					  0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
+			qcom,ports-hstart =
+				/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
+					  0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
+			qcom,ports-hstop =
+				/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
+					  0x08 0x0e 0x0e 0xff 0xff 0xff 0x0f>;
+			qcom,ports-word-length =
+				/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
+					  0x08 0x0f 0x0f 0x00 0xff 0xff 0x18>;
+			qcom,ports-block-pack-mode =
+				/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01
+					  0x00 0x01 0x01 0x01 0x01 0x00 0x00>;
+			qcom,ports-block-group-count =
+				/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
+					  0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
+			qcom,ports-lane-control =
+				/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff
+					  0xff 0x00 0x00 0xff 0xff 0xff 0xff>;
+
+			#address-cells = <2>;
+			#size-cells = <0>;
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
+		lpass_vamacro: codec@7660000 {
+			compatible = "qcom,eliza-lpass-va-macro",
+				     "qcom,sm8550-lpass-va-macro";
+			reg = <0x0 0x07660000 0x0 0x2000>;
+
+			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_MACRO_VOTE
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "mclk",
+				      "macro",
+				      "dcodec";
+
+			#clock-cells = <0>;
+			clock-output-names = "fsgen";
+			#sound-dai-cells = <1>;
+
+			status = "disabled";
+		};
+
+		lpass_tlmm: pinctrl@7760000 {
+			compatible = "qcom,eliza-lpass-lpi-pinctrl";
+			reg = <0x0 0x07760000 0x0 0x20000>;
+
+			clocks = <&q6prmcc LPASS_HW_MACRO_VOTE
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+				 <&q6prmcc LPASS_HW_DCODEC_VOTE
+					   LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+			clock-names = "core", "audio";
+
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&lpass_tlmm 0 0 23>;
+
+			dmic01_default: dmic01-default-state {
+				clk-pins {
+					pins = "gpio6";
+					function = "dmic1_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio7";
+					function = "dmic1_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			dmic23_default: dmic23-default-state {
+				clk-pins {
+					pins = "gpio8";
+					function = "dmic2_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio9";
+					function = "dmic2_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			dmic45_default: dmic45-default-state {
+				clk-pins {
+					pins = "gpio12";
+					function = "dmic3_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio13";
+					function = "dmic3_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			dmic67_default: dmic67-default-state {
+				clk-pins {
+					pins = "gpio21";
+					function = "dmic4_clk";
+					drive-strength = <8>;
+					output-high;
+				};
+
+				data-pins {
+					pins = "gpio22";
+					function = "dmic4_data";
+					drive-strength = <8>;
+					input-enable;
+				};
+			};
+
+			wsa_swr_active: wsa-swr-active-state {
+				clk-pins {
+					pins = "gpio10";
+					function = "wsa_swr_clk";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-disable;
+				};
+
+				data-pins {
+					pins = "gpio11";
+					function = "wsa_swr_data";
+					drive-strength = <2>;
+					slew-rate = <1>;
+					bias-bus-hold;
+				};
+			};
+		};
+
 		sdhc_2: mmc@8804000 {
 			compatible = "qcom,eliza-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0x0 0x08804000 0x0 0x1000>;
-- 
2.34.1

