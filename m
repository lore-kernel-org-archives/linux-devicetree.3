Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA2A48BD2B
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808945; cv=none; b=jRDLqDLrhkLSUAUY01iWXtc5aovjDlch2UHrzpVsaiAXh+x2MEdy4dZpInFwdlln/Snd++xDPi7RoVwtuTrZyIX+oRHm9o/F335dKHcNG3eKUnXGajCBJ0HwKi6XXCfib+SHMFt/SygtgW+lWRnAVChhU30lnztPC9x44/f9v+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808945; c=relaxed/simple;
	bh=pUsDDKtATnBmK28A4OuyxbVjJHQFs1aoNgeFoAmpdAE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g2qWshbgH8gPyMi97fbAbxu3bLmJQIDAoWhQIEA/+VtuST7vIh9nb1vv6VMn3V0NLWBdgM+wfa93uHAFT0nZv5oIUI0/MJM+HWWhlCDWegxIZvd7vk3FAOsbdKpzLjT0lqJDWlt7+aE3CCgSlstq/dKcpavxStYzT1A9X9+aPQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YWMwgnrC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A9ocViR6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YWMwgnrC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A9ocViR6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N9DmOO3567745
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=h1+biSORydH
	ZCx/JXqW7RbDVKyEajOCJipzGAMVjUmM=; b=YWMwgnrC0nJ6Jlm6y2sZhzW9Bb+
	ifNDbO8KME2Cj+J3Ht+PS+7/9wskrH3twS4LbJpKpmMPTbsw10OM+kKCI0exvwMX
	ATuwBAR78+oLGGieJU+Gbi/9jsGcfy7HN6OTR9IbEcPVVdL/ehcq4LjUE9jYnSKr
	8mkvJ+/xMBBCAE9Ap+nB97YE/ebNspzeCaw7DVbZY56ozAosP9ddxdh7M+ZUqBHI
	LdvMHxrMu/Xj50sl9MbhO3DdHtUfy9y7DuxJRc90oIoleiTqlG/jllrPrICjOq1Q
	itxTQnTwWdq8h5/k3dm3rdHuLHruevQCJ1Zzid4UD8Isi7gCcEIu1Neo49Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkg520p49-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 12:15:35 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb467e56aaso727727a12.1
        for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 05:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784808935; x=1785413735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h1+biSORydHZCx/JXqW7RbDVKyEajOCJipzGAMVjUmM=;
        b=A9ocViR6g8xl9PKe/RuVvzxvHYAkX+5i85EpoMzaxq6ateaWBJTt/9nQdZSB9P3ncj
         rivuBc1fZMURIRa5GHnhT8HP4Oz/aYhw728BBNp8cVI4/OlcKWw8ml96/8hGbn022dM4
         elAh+SAXUJl6wuwTv7/FctmyjyiCEl07KndQqm0m38BFubvvY7r7TNzFGUxvQcaj++qg
         hQN/pImZaJopkqz6rSz5aIsdVgBTdty8S+hJBecUee+Bm7UP6TcAGOfMt9r15yi5sndv
         R4sWFhO7vwHPThG11ImpJJx0iogxFw0/99YkGnNGDsJXiPcKxW7U9l5W3zUsyYtsTpSo
         qoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784808935; x=1785413735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=h1+biSORydHZCx/JXqW7RbDVKyEajOCJipzGAMVjUmM=;
        b=c5lSCcE89hgfPP0YlD0VOSD0t9HxHRW2IV8UDPtgVW9L5byguTf+CEtx5HpZeuNHkM
         wDBdSdutHV5kpTgjvkBGJXaYIoqiLD6gnOaBp3daDvQN1kOVJ8rITyubm0841ekwSh+G
         MYRsMiBPXoCCBSv4O/f7MjS6hZt3G6zbzCLPHlk/g5ilO71qIsHHuSXpPvjkUwQ3lKn7
         OoMsk1GyvU2jvI1hDN06XmYmULvF75wPjxeuymyOdihSeGwrRMw9w8ACXwhOyrvAGLb2
         0NMUAjRnwnVxZYOGlG9AnQji660ik0srkZyJtv+mWOJoisp/3nH/W/pGlBuHMiYf0DnT
         0+IA==
X-Forwarded-Encrypted: i=1; AHgh+RoinGgEa5HPziiKhfNDt8IGAxS9WuZuvLcnmlAwoi0OZmxlskgkN0GpSZtgNByjZmB2UXJ/AC1r3s9y@vger.kernel.org
X-Gm-Message-State: AOJu0YwUIB7mt2ocf614vOYJzKT+fmgHoZAA5ylVD8K6H4OR0aNRZSWg
	uUm0YNWFV+GlRz73uZib2u0gAxW7hutyp4fAc8S7gjmOmlIUx6jYIKygDZ6DWzozbbguzp4CBM3
	gmpjYHfcJp8GHN7Txa1iHfNkeKsT02Hhu47ae7GKe9Jfr6YrO4C5xEal7AA2ds37M
X-Gm-Gg: AR+sD13y05XjgqlKtRDHFpNtDDue5b17c+qpzseWnDSX3uKMC/hvfAUMV9IUcZQoD+T
	trLJHnaU55gvBpgXo9uHU/SFuZg/TXxUswA9JePPzP96TMBxYO47Gfb0qG0k2sQ4MHFB0dEqlE+
	7AG9KEnYch0BtWcMiQ8YLMVpiYXzWDR0/vTxbHHM6hhD46I5gKGZ5rYXU3ky0eG3EzbDjCmAzzD
	bUYgLi31OxIhppRUf03Fwni/tXFPixkOF6NdQo5K/aYbVK/qCo6LtkdKXBKXxUKCXRglfwRLojC
	WxxGsRE5fPOOhlV6B8pJJCtDsdk+rBh1rETIoUs3iVsf6wEepeOY41EwepNkCMarEbusnOR28fG
	Irpijnz6fcSQCcxCVGm/67FzZzgV+Dw==
X-Received: by 2002:a05:6a20:c704:b0:3c3:7891:6523 with SMTP id adf61e73a8af0-3c44b0516e9mr3209190637.34.1784808934480;
        Thu, 23 Jul 2026 05:15:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:c704:b0:3c3:7891:6523 with SMTP id adf61e73a8af0-3c44b0516e9mr3209126637.34.1784808933810;
        Thu, 23 Jul 2026 05:15:33 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a8a1fsm2687005a12.26.2026.07.23.05.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 05:15:33 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v3 1/2] arm64: dts: qcom: eliza: Add LPASS macro and SoundWire support
Date: Thu, 23 Jul 2026 17:45:15 +0530
Message-Id: <20260723121516.2341900-2-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260723121516.2341900-1-ravi.hothi@oss.qualcomm.com>
References: <20260723121516.2341900-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DtZmPm/+ c=1 sm=1 tr=0 ts=6a6205e7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=Cc5UsSPITet5yPTV4qQA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEyMCBTYWx0ZWRfX62YirB3L5inl
 nxis5wY1mWX6KBT8TM/OhxCEQWdfmjKvfEZh2ntDqOBnQddcT3ToTHTshpQP+GM7G5xrp02sjwi
 dn3K2HjcgrLsHRJgCU0JMPbynqtdPU0=
X-Proofpoint-GUID: -UyCHGtXdsUjv-YNdbbJCwhlGQVLPaML
X-Proofpoint-ORIG-GUID: -UyCHGtXdsUjv-YNdbbJCwhlGQVLPaML
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEyMCBTYWx0ZWRfX8Cx/UitCTqLP
 k5zFHEscMJAhq7/NYal/dBx8WZg2M/3wbDYFp6QDnKAg0to12QFzpSCcD5p+SlRsMYFB5jfahkc
 p3U8B9rFxyfqKCaA0OL0b7g3P0+UI7e4kRFxM09lRhdbPd3StB4fbVxUAVAQMfSgHhcMSz4ZV2s
 RRJkvdFYHpxDYR5MwWcTGfG82wzv4aEURI4zpOsTU3ZTAGvXjVeSTwjzlRsl9bFIC9De4j5G9Dw
 zXhoMpbjWeLraQRRs3nbM6RzP9pBCaSCugRk4CYqNJe8cbR3S9YCGfeZcIFKo11F8EBioZAt7kK
 lo2/WeVIXBspWz7OkOVGxWjTK+8ex/eu6hYXUDgkCS5/uAHMOGBKesE4UWcVXmDvKPdn0bf1bMu
 SHUDNl148JJDyBxQBJvmhAy3x7VpQHL392tdFNJmzYxZfE1i1djPoqiT9KS2F5DHZljtpdrd0aj
 1E9k/8CY5p4BH07UVxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230120

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
index fa6a22f2da6a..33fcedfff7b7 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -19,6 +19,7 @@
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -2056,6 +2057,79 @@ q6prmcc: clock-controller {
 			};
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
 		lpass_lpiaon_noc: interconnect@7400000 {
 			compatible = "qcom,eliza-lpass-lpiaon-noc";
 			reg = <0x0 0x07400000 0x0 0x19080>;
@@ -2070,6 +2144,125 @@ lpass_lpicx_noc: interconnect@7420000 {
 			#interconnect-cells = <2>;
 		};
 
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

