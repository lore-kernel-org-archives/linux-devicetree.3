Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795679455;
	b=InSpIZQrYLJwXwYFEkkar1ihZsJBdZU0XgZGjJBvlMN87TlTKRVsXTtGxvMm+7XP2Y4q
	 Sr1szYrYbA4cWyP+5MU5g5VELdnIh2YyHAVTEz8KOW39IstoDuGUNcnLU7UtBs7ZXls2U
	 x299OBaXfzzbCgQ24greBoy6vO9xDDWCfn0+51jutiG1fxn+Dvh8HFfFeenAW90Fjyiye
	 URdIdMf5hWN1G8Vqn6c1VuY07lhORq/0ko5pS/JK+euaKv8tsXhJ8QlYzrmWtPl9xwW4f
	 hEIb0gP89iqK/2ME9T3oHkLXbjqqVULhBn3LCeWZdZxN4FTpfiofzJA4kw8sA0aSruw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795679455;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Proofpoint-Reinject:
	 X-QCInternal:X-QCInternal:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zJDWoKHRwJ9pY7Zn/RHZGCc7FFHban29LYqhA6N06TQ=;
	b=BGZ3E14c+6nKQiUexm51UZA5264ofNBJC8Q0oUo/jp0BcCHNjYnIqnM62QpgpVenrHyL
	 TCYEP3MC2ee7WNCrp7Xm+9aekXPyVq/6YMYT8Zifzxh5dB+ikBA6wtoWhxO3zbCzEVckd
	 imL6rYvV5UUlB4DcPQLxjiiR0O6OmWQuT5kXxubqNrQ6bf/CAYLWdKZ2tw7pMN+PZQFSW
	 ZVUjWZSTKlbsHOi9w692f5T1nVKoGKIObxyA9FAUG8qhshGJY+pPEKtTSvZijf1DcsU48
	 xkm9gcr91JYEgpWGruLrIiA04XQmzVq9xX9d714mRv5p+cWCSK7l4MJcsxhs1NGJg5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DDLtSEcQ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0987606A31C;
	Thu, 26 Nov 2026 07:50:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0987606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DDLtSEcQ
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7Aw9p2175562;
	Thu, 26 Nov 2026 07:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zJDWoKHRwJ9pY7Zn/RHZGCc7FFHban29LYqhA6N06TQ=; b=DDLtSEcQ1nZLJfHy
	eAe9ixXW5kVi2dschnIHDrwDLvEfMXqnpCsmQjeqUJi//+HnNY9HaTpY4Dim95Ug
	p+jKYlpupkHlRn7UXaO2PiOtXRBUc9UiJedTAf2Adzou2w0DjFL/6a0Q4NQiZkAG
	vtpDcm539l1JL7kO9A4wOlGLiY+vohuDHBV5NbRZO9+EbBEHFkji41HW4LsLuvZq
	m5FuLDgjn/7DIbiw5D2zg1w0IUTfw+WeFwcUdUp5OlfmOH/qev/pN6Td+AU6Qi4x
	gmsDmYICfrPSSjOyCFuY1Lr9DOwSEwxsmZRHULvmimYdH2Xg6rhB9baI24BH3gtU
	RRnRFg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahubn5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 07:50:45 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7ohrd2051596;
	Thu, 26 Nov 2026 07:50:43 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mdsor-hyd.qualcomm.com [10.147.243.209])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AQ7og0d2051578
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 07:50:43 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4770534)
	id D06826AF; Thu, 26 Nov 2026 13:20:41 +0530 (+0530)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 13:20:34 +0530
Subject: [PATCH v2 1/7] arm64: dts: qcom: lemans-draco-evk: Add LT9611UXD
 HDMI bridge support
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-draco-evk-display-v2-1-95395c5ee387@oss.qualcomm.com>
References: <20261126-draco-evk-display-v2-0-95395c5ee387@oss.qualcomm.com>
In-Reply-To: <20261126-draco-evk-display-v2-0-95395c5ee387@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795679441; l=3849;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=yworwSWr8QhLWmtHRPwnjwMTCEyBUrGo9UrQXaZGMng=;
 b=t7O2Jig84sas7AjHHyILyUPaekG324CXF8t0eU7MG9tlxnBB+3C7z/ZHkejJQPmINZDgYRr5t
 0Lk7JySWMc2BFMIbNNZa3rBdmiOfhPNflMTaGkErwOPXXhoOUJMQgFS
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: N9_tZ84_eyTVlHEwxlJwPYEhdW550ZFa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfX3N5gCFAmmd3M
 6uRCgLOI5JpS0Izku8nWSjOKdt08YMAeUXbEv0GB7Iz8FI33/QudJn3bXN11YCI7MFbxwGsOW9/
 5jdj3fCQ8U0374yWvbfwZ+LR3KBnLJ8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyOSBTYWx0ZWRfX4qM86F9E1gJJ
 UFOmVpdTTJPDombzv2ir3rXK0D4RS32mDSi+GL68bzDNMGEDwPmNTJk1ubDdbYYu5HuvuRSQU91
 qKl1RtwBiFBCDLfy5a2GzzZ+QxouOvzEAkBnzpRPy36ptPNDJc+GALAEbNDprojHXMlz3vEAIp2
 r4LOdKP0ihEJ9jIHT47HQwoJQ/e8SqDnT7R4GdzXA6Nq7oY1k8QImfn60qLvrTAm1HWZChT0mgC
 kRlVV4amv7OUfkSespOi83Y0qvQwPkRUkj8tSG85X1FNhnCdfCgLIhohzdZ7WWzT22GtQiAmjC3
 UMBxc+EH14w5TFLT6cBlbHGbK5/Xd95cM++6cnRlaMQVtuQbks2wN80C7Wng56ms1Ho9DeLYQe1
 t6hO3SRJcrUfrvp/fMSKuUP26L68DWsj4CSSWbsj/PrF5AyA9lmbPvQaOg/ljGTHk6IvVABQpGq
 c1ML01my8X3QgtOj4pA==
X-Proofpoint-ORIG-GUID: N9_tZ84_eyTVlHEwxlJwPYEhdW550ZFa
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b07e4d6 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=6BwCeua4kPe1APY31UYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260029

Add support for the Lontium LT9611UXD DSI-to-HDMI bridge on the base
board DT to provide HDMI output via the LT9611UXD daughter card.

LT9611UXD is connected through I2C mux channel 0 on i2c1, with reset
and interrupt on GPIO39 and GPIO97 respectively, powered by fixed
regulators on expander2. DIP Switch SW2.4 need to be ON for this to
work.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-draco-evk.dts | 118 ++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts b/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
index 00a0a4315bf3..b0b733169aa1 100644
--- a/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
@@ -16,6 +16,7 @@ / {
 	aliases {
 		ethernet0 = &ethernet0;
 		ethernet1 = &ethernet1;
+		i2c1 = &i2c1;
 		serial1 = &uart17;
 	};
 
@@ -93,6 +94,34 @@ vreg_1p8: regulator-1v8 {
 		regulator-boot-on;
 	};
 
+	hdmi_connector: hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_out: endpoint {
+				remote-endpoint = <&hdmi_bridge_out>;
+			};
+		};
+	};
+
+	vreg_bridge_1p2: regulator-bridge-1p2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_bridge_1p2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&vreg_bridge_3p3>;
+	};
+
+	vreg_bridge_3p3: regulator-bridge-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_bridge_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&expander2 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	vreg_dp0_pwr: regulator-dp0-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "VREG_DP0_PWR_3P3";
@@ -551,6 +580,63 @@ max98091: max98091@10 {
 	};
 };
 
+&i2c1 {
+	status = "okay";
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9548";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		vdd-supply = <&vreg_s4a>;
+
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			hdmi_bridge: hdmi-bridge@41 {
+				compatible = "lontium,lt9611uxd";
+				reg = <0x41>;
+
+				interrupts-extended = <&tlmm 97 IRQ_TYPE_EDGE_FALLING>;
+				reset-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+
+				vcc-supply = <&vreg_bridge_3p3>;
+				vdd-supply = <&vreg_bridge_1p2>;
+
+				pinctrl-0 = <&bridge_rst_pin &bridge_irq_pin>;
+				pinctrl-names = "default";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						hdmi_bridge_in0: endpoint {
+							remote-endpoint = <&mdss0_dsi0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						hdmi_bridge_in1: endpoint {
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+						hdmi_bridge_out: endpoint {
+							remote-endpoint = <&hdmi_connector_out>;
+						};
+					};
+				};
+			};
+		};
+	};
+};
+
 &i2c2 {
 	status = "okay";
 
@@ -838,6 +924,21 @@ &tc9563_pcie1_ep {
 
 &tlmm {
 
+	bridge_rst_pin: bridge-rst-state {
+		pins = "gpio39";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+		output-high;
+	};
+
+	bridge_irq_pin: bridge-irq-state {
+		pins = "gpio97";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	dp2_hot_plug_det: dp2-hot-plug-det-state {
 		pins = "gpio104";
 		function = "edp2_hot";
@@ -988,3 +1089,20 @@ uart17_ep: endpoint {
 		};
 	};
 };
+&mdss0_dsi0 {
+	vdda-supply = <&vreg_l1c>;
+
+	status = "okay";
+};
+
+&mdss0_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&hdmi_bridge_in0>;
+};
+
+&mdss0_dsi0_phy {
+	vdds-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+

-- 
2.34.1

