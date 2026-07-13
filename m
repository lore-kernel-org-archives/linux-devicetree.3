Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21F9408619
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783945121; cv=none; b=ucocdJwXLD7xSGypvd8oRcRhke8JBXN5sI3yYaEFhGGT6T0UmXFjq+Ic8L3XfgW+3s2Unu2jT+SeJm5jblOidl0brCY3eXDMlPPPTf7rqaUHB7/FtAHZCc/o7h6tL7vI9ZhDMsU6E43DMWDGsVejQ03lD54Rw/7beomfjnTwfnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783945121; c=relaxed/simple;
	bh=KR0BBZeb2lASNJ4/im4q8WiVNxgehLdJ6hZHz0ZmtGM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gUxDxBvX8e0eoFsE1ve33K/yVwSN4cQGv3QPAD5ZjieJcYoArsDB54PjlZmBHyM2yGS2LqZGli3Fjq0bxMxsrx76pfLrKcsX9sOnr2ZHHquDgsAHnzvAOKtS3Id6sT1Vx6F4Xkt2YYGIgcdH7DfyEryfHBfVpTRlqQJs3GGFWrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CENCMxgk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hwoLTxM1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CENCMxgk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hwoLTxM1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDVsP1299280
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UA7LCw1pRQm
	NvmLxL2+hfWUPNsSaDBH2DOoLdU+gEK8=; b=CENCMxgkIm7PVM12/ishIAf+9E1
	LArf2zUkPTCVuzxgHIL1BgYQq2SfJ/7O6ixDLZ1JUGVEyTS29SnI/38FxRdVx8Fr
	cIsR68cl2ayO95nINQ9gdGxxPs8aFPdFk5ZS2PeJz3S6YbXYjwnIUpoDJdGNiC9F
	ThMd1JwjcnkPG8X4J+5ldYXLrGRrH25NG25zjypRmRClth0VN6F6nBKK3OaP/Qd6
	cGq0hBVewgoBXDBgvFlNf/GN/bKo8aEu6mgkSck5s8BV1/RUY/ZHuqccD76vch8y
	CfJVXRe8ms5qgt1yAcP+EorRf4SNbWr32ke33Bnpj+oOpRzPc9DOlzkm06w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk3gj6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 12:18:39 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-84870e7f498so3598465b3a.3
        for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 05:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783945118; x=1784549918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UA7LCw1pRQmNvmLxL2+hfWUPNsSaDBH2DOoLdU+gEK8=;
        b=hwoLTxM1XGi7vQRbYmadPJuDpa5Vt+HZJx4YXZUojzQIx/dcmDDVaD3x96PdOO6ZsP
         QCzJVvdlUYbvpaN5sorJ19mjSu8ZgKv4A/aCTBxLuHhBOt//CHjO+NhLgFI24MivU0vV
         yLw7AjQ9e/3hzyEx2Zd35QBrqJz4U/H38Zy1NuelcA3KMD8CIdNIccBywA/0c5xX/f7M
         rmbR4WwXot25d35XFi//JhULBPdHhC5P94FjxPJX7qv3D2VA5jq4mFHcYaqZZHNVqSBk
         xK90aWqizgoP2m3kGjMV2yO+9yJYJX9gcAUrf20g+CCgByV3eVcfvtfxwVy6SbMMMkjk
         tq5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783945118; x=1784549918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UA7LCw1pRQmNvmLxL2+hfWUPNsSaDBH2DOoLdU+gEK8=;
        b=aETLLtzqp8dTeOU3bd3QVpuHonRJR8ZVxyTq2GutrJLCqtRFrbA9RN58BXPFOhSDys
         9ToN/YHNehw4E2mmfyzQJB3w4mQBFBzplne0nH/HP+RWNJJOn5e6TterImOCldnQyIxw
         NEHx3dDk1uHsuMobRX51/HyUkMuesNqHk8XRHCIfau9nF6RCCVSypMFWc+iyUDm5egz8
         9UQwYPbo1uny6D9AQzu7SRWmNrpcfs7drCfCZh0myiE0A0QFau6vLMM+uZ/Y4YGlcSOC
         6QO3Xi7KskAAOiEvr5x2/Hvm/zDkkH+ax/3STrzush8ZhvFtowxubZV5gjEnAVd5oTVI
         FI0w==
X-Forwarded-Encrypted: i=1; AHgh+RqcZYyT/Unt0lngaSFsQrS2+n6JPbXK//mdyLJVn13afAQrlWtxrk4Em+ZA4CMmw+pxajaBs/NIToWK@vger.kernel.org
X-Gm-Message-State: AOJu0YwqboZy9d5o7pOsRWY/MIOUfiMwfCPln4XiwrE0YDdF7wDnj3ic
	GAISfYX67o9/+VOXXbMHqy6n/J4wGQLmx357d+a3kLhZ2G6wb18+6Te9AGW3BREsVYBNuLFxusH
	QntuAjtja6YnfbcprwprbrvjwRQ34Gg/2/RY59QePBdjMhxo6X/InozfoA6kMnRSx
X-Gm-Gg: AfdE7cnyh1uGF6G9eCt+nx5IuR6fSTpY3bCujPWRAibZSAR14KjQ9AuA1DNtBbeEsPi
	NJXJIdNaHjiunK9Z0PXMQay5QvOeRJLMfbKvhKrFeCBaJUlk1EHSrVfPWFPifpYPNvJadUtdx/w
	18gHPUNkDescP3QDqEOZmnFdgJx4baCiIzRRpMhLtPiJw8owE+1i18nwnDFoFaJqL3yJCzOz8P6
	yx6zxu5PWVAGTUDbaRjLVRgxEp2uT7bpvxAKjEHbjc1lDkC78qd2p8lj/WH/OCjz7JlB0xV1zBE
	7cc7K/L5v7EVI55hxx7zM/bxppGMmrirk7w/HlCE4JPpqIzs6MIcQhhYtRKSw9R7SvncHRalLA2
	eHq2qeZVY6s4pDvFsfEXKc9K3tJGfcU2aya532Pn4
X-Received: by 2002:a05:6a00:c82:b0:848:57f3:8f99 with SMTP id d2e1a72fcca58-848897a0bbemr7774787b3a.56.1783945118416;
        Mon, 13 Jul 2026 05:18:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:c82:b0:848:57f3:8f99 with SMTP id d2e1a72fcca58-848897a0bbemr7774751b3a.56.1783945117719;
        Mon, 13 Jul 2026 05:18:37 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84880a4abf1sm4375340b3a.16.2026.07.13.05.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:18:37 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 1/2] arm64: dts: qcom: eliza: Add LPASS macro and SoundWire support
Date: Mon, 13 Jul 2026 17:48:15 +0530
Message-Id: <20260713121816.2728888-2-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713121816.2728888-1-ravi.hothi@oss.qualcomm.com>
References: <20260713121816.2728888-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: m6ecc_1VVgmhY-BNHaFohhVftlbu-2rD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX3bS5GkhAc8ty
 /CTBrIdPBjz07cER+gNZbkI5QLwxo5187krndPHPn2+4hKc1XXioD+WFuxd2Y1ON/fLeXdAnmMP
 mNeRkx91JPRXOlzGDREFJ44xau9NEFE=
X-Authority-Analysis: v=2.4 cv=e6c2j6p/ c=1 sm=1 tr=0 ts=6a54d79f cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=PcHVJfkmTI8Dtvd-WTQA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfXzVBiNfoEIpUO
 CQwEdLzZc3PPUplwNjKitchi5cc7dUkyBx7rBQ3gj7LmS5eiSoADegivEzDA+bQs8oCh/Ei7pi0
 kNadC3Zp2SshHAsz2aDcMGZ1RL+c9lLg5ejpvfMF0lAOlMkIcvZa1iqWgaP9l5CajEZdo/pZvw+
 wu7ytrAlfts6bJJT6Y/5+etq2cuJKndvjQvqVD4quy2MqaZ/7q7DntqUswE9JQ8fHUl2fB6EAO1
 E9vkIVDHCpHtxb9wkcj+OXX4YgcGRsA0i1drzD9V4UxNLBv8JFaP2hyMPRj1EHuXAcq6Rzrrh/f
 8PI0tHZevFL0QGpgDQuyRxY5hikXYnCaeiYaSovT031dNNsa2hu17uc/P/g956YcHOsisqMxEaN
 dIAu32PwWe0UBLJOVGk794hDzVgxB2Oxp7eelpLGmpt7C+KD/lFgpEDr6b8QATOTCwMm5PK3+lZ
 yF4hjj3Yn2/FPt5Uqsg==
X-Proofpoint-GUID: m6ecc_1VVgmhY-BNHaFohhVftlbu-2rD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130128

Add SoC-level LPASS WSA macro, VA macro, SoundWire controller and LPASS
LPI pin controller nodes. DMIC and WSA SoundWire pinctrl states are
defined inside the LPASS LPI pin controller node. The hardware is similar
to the SM8750 platform.

The WSA macro, VA macro and SoundWire controller are kept disabled so
board DTS files can selectively enable and configure them.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 192 ++++++++++++++++++++++++++++
 1 file changed, 192 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index fa6a22f2da6a..d9f5ba6219f9 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -19,6 +19,7 @@
 #include <dt-bindings/power/qcom,rpmhpd.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -2056,6 +2057,78 @@ q6prmcc: clock-controller {
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
 		lpass_lpiaon_noc: interconnect@7400000 {
 			compatible = "qcom,eliza-lpass-lpiaon-noc";
 			reg = <0x0 0x07400000 0x0 0x19080>;
@@ -2070,6 +2143,125 @@ lpass_lpicx_noc: interconnect@7420000 {
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

