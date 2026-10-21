Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579638;
	b=Y7Ql4KxV+C04fB4mTtnqqVyRHZpzArjqdAb0HhMolHgHD8zg9fzqrpRrxHN7GFS0xXuu
	 27U53NlynqkfAQ0mkBp2B5UvYGl5aTZsD2HJuOjskcU/ota5fqiw3fYBPlx/wMkuklmuE
	 SAeVlgnxpku+CQ+BDn1MK7QpmE6sgolS+ZQhOE1mPR78eLlC3ae/dlZNztgXrcIoQKLa4
	 QIqJ+2QuR2qyR7TU4W+H677EW00COleCD35S3v6pT1pyuq9UudBA44QEEDdIq4AKcIw98
	 HgNU2o/tTvo16sZeWyFxeCaE0GPPyDL3a2SRW8cchEWky1PN2OBIA57JeRSnldLKA0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579638;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gWvlJD9jqoJDzMW6TsnVK/PUEbWsSXVaCGhDNvYutCY=;
	b=SWckAkOHxPkUAs7P1ykzUakJaEInWolncgDWs2uX0WbvqTzw1veletL3840cEUxv6Lrz
	 Y6MFJL4Jlm4tknseGepGmaxjkzZKCWfDOrlAs4sS/56y/Ip7SmaIfINJJ3Pm6Vk1MnPJs
	 7KwYI/J+zvDxxCqefbSVkbGsg1aulgiGP4LlHMeZr2R/TgWnRsnyRi694RgzuhlIjmeqJ
	 ZUBNWnh+0F3MdvC/7S2uC9tfLdn3LrgNb8uGrYE43uBXGoGWtSUNRkZiCujqpz7HasYla
	 y+6Tno4IsAbqiK8ZDXemZrREtp4GfT9ip5nl84pUQ5aGCi5Ahy1UvqfMDRa2PeddRuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g1WfvW0A;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KfaoW3bu;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38816606A320
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38816606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=g1WfvW0A;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KfaoW3bu
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA63K1768661
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:47:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=gWvlJD9jqoJDzMW6TsnVK/PUEbWsSXVaCGh
	DNvYutCY=; b=g1WfvW0AaESZyUeMTMvdTSfTxSVfmFRWxZ3a25yZ0QSUwGVtnm/
	o08gqqEqM0GBDrBBESbaQ1iewaOTTvC+1lxcBB3NZvFyZ57QVJxSMUO/UMgvIs/U
	lNrzVpTH0JhF7EEgs44kIiDDT2KDhPg1n1fALdFOTwiR6YjPiPBwj3oe3VRoA/sk
	Imw+QyV3kNEO+8X3Zcmdsf90VcQQLfugnhXSGpwKDgoYeRA4ba0sb15GIaGlPAMg
	/2LLvhocCaVoBxoUQx1ew/vD/NvCpeKBOn8sGJumejPeX9nOj2jhNao71obc4OIY
	lVoZ/AISLtFYyVbi1e1O2dXSIHzUEwEmocg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs02rk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 10:47:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad3bf3fe2fso226252a91.0
        for <devicetree@vger.kernel.org>; Wed, 21 Oct 2026 03:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792579636; x=1793184436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gWvlJD9jqoJDzMW6TsnVK/PUEbWsSXVaCGhDNvYutCY=;
        b=KfaoW3buMWcx/84GRsAvQrQGtmNyIyxJgzU8o4RDO/B8oNYft9tchHiv16M05ZslU4
         WJ0wvC62ev0dcaPHFcI+xEEGanwJYkgVKhrE0d4XmHcufOBqHJ1kyo+vwmduiU4x8fqr
         DyQ+hK3bK+K/pI9J39IHOpBItru/dQJgiVTDjWNVRDGno5tYy/79nbk5w59qpjufBAO/
         3cNTDqcscdlnv7YE8Nl0+sKA2vBgZy0iwudmC9ZvAKdrUrTjOBbdlOwBmJLEXcbdQRxC
         rddbXXbwLz5slZfh85Ye25NjFEJf3upoZOMRVzPEA3oFdtE7tk/IjQgUJ4J/aeaMvGS6
         scgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792579636; x=1793184436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gWvlJD9jqoJDzMW6TsnVK/PUEbWsSXVaCGhDNvYutCY=;
        b=xGAbUkSvgInVmctkKM8+Za4tJb7lYg9eXN84gT2Uh/Y9qcRjMrAd1bn84L04FZqBT3
         B+ujTNUJ9nJXa6Yi8Bi0KwI2aGfQOV7iKPrJI1RixZjn46ySxMhrPU21d0EocHK/BqEi
         DouR+3PKp/YRpw+TE6yUMQju57saA6DFD19pYSnMZy4kCKue6qtDAO0fY7YC4lUN6QTH
         9iW+vQtq+9QvqHir91LdFOCAX9BY97UoKjLQx4xwhIhZUijbF7AjupHRyxWj6Vtj5qQw
         lM+Xsvuo9RsDRSQb0FkoeXru148ViqGcGZNPtUCi021z9EJRNlYsHsJI8rD3pDLymT9t
         MLsA==
X-Forwarded-Encrypted: i=1; AKwUvBxkzsLKAtpdFTDg04ANV1kC3Ax0k4gOpMS4Z4XDdqUhlRlrCkx9ik/kZy7/Zn5Pme177HSqAGEAOPja@vger.kernel.org
X-Gm-Message-State: AFq9FYLLAHypq4lwicBPDmxviKKzkvNLtp/u21bqXyu59KGegjnyLwN1
	6CujPI7LnsUAqtSoCP/g7lGS7d7LWFB2QAF61h7dv15IYngV7hAT0WPQjP4kMb1meeiccV5TUCG
	ftKoQgBPKVctjbjO5666yNaFPHkipfbsoiyfhed7oFJMMC4R9KuH7Pad06llT0xmv
X-Gm-Gg: AYBFou2tSmo1Fni0/IqquAoT29yLE86PwpoAv/mcvkEjE7tebemuqEteAVSuCOeDy7M
	zujV7yQ9dd/ZZDHPlmqt3y7YAp9N0IjEGCRUs03MCNg1nwfhj7oAcBlC7/7Z5QW/MSRttLcnvaI
	xj30FZavtcCsQuVST+rqt3+rAccv48AcB3vi4p831iQD0SoHv3wTELNFfgtAmdlz5/XNtFC0zQW
	kqsEitxf3zid35mIPfSxhtApuZ/swNGlR19L/tQoKLZD7v3lRNs+9uqK++oSk0aFBzEt7z3ijME
	9mongFTuk+wwcdHBVn0z1o9UaKRbLTgHRY76DqA6g+h05KddEGRwHO4f8bVr3FmYZm5sJF2oK8D
	ytnzEjzuN4BYiUCkGCut9PZg=
X-Received: by 2002:a17:90b:4c0f:b0:3ad:818f:3db4 with SMTP id 98e67ed59e1d1-3ad86dabbcfmr2842875a91.6.1792579635933;
        Wed, 21 Oct 2026 03:47:15 -0700 (PDT)
X-Received: by 2002:a17:90b:4c0f:b0:3ad:818f:3db4 with SMTP id 98e67ed59e1d1-3ad86dabbcfmr2842844a91.6.1792579635532;
        Wed, 21 Oct 2026 03:47:15 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad85f6ff0dsm1619244a91.4.2026.10.21.03.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 03:47:15 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com
Subject: [PATCH] arm64: dts: qcom: monaco-ac-evk: Describe the PCIe M.2 Key E connector
Date: Wed, 21 Oct 2026 16:17:09 +0530
Message-Id: <20261021104709.1428234-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad89834 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=9xWqd1REYw3mqEFhcE4A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfX/DCw3nkx23/4
 PsrNgW+RqFrcOIdcylEW0bFykgOLESTJHJIQt0MgnOFobYyLgWGdhomBltYryzIEWZTGs18y9H4
 sVL8yQxHRyzr33A/Fj4rnxuKmHSeyRQKCrGpVEe6BIIg5dwrvrVZ0BEfwh+yeBUi9nMlzC13GBN
 PER2tSn7gLkvQL97LsrKpfZ+whfUVunSXbVSmN6UJk0L5n41YbFIpjJlr7/DpXRnnTkMVvka4Yg
 EjPbog9ySU257TFn7lxKWmH8xOmnIGl0KJk8+dHTfAvdpuUEL2AFvKi9MANEP+6oUdgzy8x4Inx
 YFbYu9ffIPighw/YHLy9//5C17KpCA2uHzDbqR9oQSriZEfBWW0aawiH4CVXaJM2xGFZ2f1RWTK
 LmRup9qO+aLJnwx2ZP2oOXFe6R/6CZjHkcOqcWfCs2xqDrZCyTHu6xWQYA7kA+w8R8G0PSRiAbz
 99m5wmC94ioocvvuKPQ==
X-Proofpoint-ORIG-GUID: bZC9KvIpQMXwtaXdTwNN9K0gI14O_xU_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MiBTYWx0ZWRfXzBF9h+M0SrbC
 +7K9rj7dCpIcuE06EluVMHkjW6MaHNsVOyiwCUTwHluQrUPXjWRGUg5ksPw5V9io/Obq48xuo34
 3JF3RvEwRpRsAyVdVltQ8WMQAElH9oo=
X-Proofpoint-GUID: bZC9KvIpQMXwtaXdTwNN9K0gI14O_xU_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210042

The Monaco AC EVK has a PCIe M.2 Mechanical Key E connector to
connect wireless connectivity cards over PCIe and UART interfaces. Hence,
describe the connector node and link it with the PCIe 0 Root Port and
UART2 nodes through graph port/endpoint.

The port/endpoint nodes are defined inline in the board file rather
than as empty anchor nodes in the SoC DTSI, so that
of_graph_is_present() only returns true for boards that have an M.2
Key E connector present, preventing unintended pwrseq probe on boards
with soldered wireless chips (e.g. qcs8300-ride).

The connector's 3.3V supply is described as a fixed always-on regulator
(vreg_wcn_3p3), which is required by the pcie-m2-e-connector binding.

Also add the serial1 = &uart2 alias, which is required for the
Bluetooth serdev device to be enumerated on the UART2 interface.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-ac-evk.dts | 60 ++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts b/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
index 6f3c3ffefe34..3780642fe483 100644
--- a/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-ac-evk.dts
@@ -21,6 +21,7 @@ aliases {
 		ethernet0 = &ethernet0;
 		i2c1 = &i2c1;
 		serial0 = &uart7;
+		serial1 = &uart2;
 		serial2 = &uart6;
 	};
 
@@ -47,6 +48,38 @@ usb2_con_hs_ep: endpoint {
 		};
 	};
 
+	connector-3 {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vreg_wcn_3p3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcieport0_ep>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart2_ep>;
+				};
+			};
+		};
+	};
+
 	dmic: audio-codec-0 {
 		compatible = "dmic-codec";
 		#sound-dai-cells = <0>;
@@ -91,6 +124,17 @@ usb2_vbus: regulator-usb2-vbus {
 		enable-active-high;
 	};
 
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	sound {
 		compatible = "qcom,qcs8275-sndcard";
 		model = "MONACO-EVK";
@@ -657,6 +701,12 @@ &pcie1_phy {
 &pcieport0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+
+	port {
+		pcieport0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
 };
 
 &pcieport1 {
@@ -875,6 +925,16 @@ expander4_int: expander4-int-state {
 	};
 };
 
+&uart2 {
+	status = "okay";
+
+	port {
+		uart2_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
+};
+
 &uart6 {
 	status = "okay";
 };
-- 
2.34.1

