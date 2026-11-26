Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681965;
	b=VGxldT70uNbHwQaEFEKFq6/1IGAUuKlnCs1xtYhfhUOEibLWkY0kfGVDp3OaQR79y+Wp
	 m+S7zaBI05TQTcCowFcCcdmgAaKLSFi8nhqVzIMgFIK2UrutAiXDnb2FlJwxsMjlsggAN
	 l0V5RgoLIN9VqDAtkq2vpdnZXlj1xPHcH7JlwqTNYtJ9m37tW/JWEbsqwssheRJEb3qEe
	 Z+E4iAdEyuQ02RJ63B0HjfGKSRxduZ0mVDqbLidZKoftSmYiVIE6opycgUyPklWDRw/wz
	 WOz2ge1ELpq5BfutIn4sljPFfw99qvXslrE3AAf9l/Fx2jyirDuav5+hnlZ67dzM3cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681965;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Proofpoint-Reinject:
	 X-QCInternal:X-QCInternal:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=R9xMNJyw5O0Y4j2Ct9Q4rbAnze0AMZx9lDadTr0LB0k=;
	b=tZdfTampYTdqxRanbcyyiZG4aqJ46ng8YqZBlm5QslH2y4FdC5dK/eYgHgTsHwlsORJM
	 mvuCBzi9IlVGNDbll/isWfw9zhjjoDndNKI/w5ebU67EMB856rp+OD7D5FZNN9NUq7uqE
	 Cc3Rxyz7uNysXyKg//5pJQ3dvldOScfVK1HsvqBJ215tsER/Q6KarHYdaFrQPD/GiesRO
	 LZQgS3IQrekT2lBw4MA/gbkIJDx6eIHmR+37xJXr++3J7MoJSnfrGt9Y5M+gRhJ2hsMTD
	 b/WdzozgJNvsThqFZp+gucjqp/imM7D5zOoHzAMTLM5Eb60ZhcHkNQqtO9ddAy6SWbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ipTm56nI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B7D606A693;
	Thu, 26 Nov 2026 08:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34B7D606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ipTm56nI
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7BFHl3315166;
	Thu, 26 Nov 2026 08:32:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R9xMNJyw5O0Y4j2Ct9Q4rbAnze0AMZx9lDadTr0LB0k=; b=ipTm56nI+Bh+mSZm
	i7QAcRGvl75cA8vfde+azKegKcLR2tNOMW0Hz/O0DB1lKTBRCAbBvfwIrjTv2lrv
	avuD29NMW6AAQhQngjX3urpu6s9SXF7U3N9xyKR21vhYbPEEEgWNfwinw2OJces3
	A2PiMXwqLnE0ASC/0jON7IsmYfnVLqVPU2GZjT+zxNBQkcRZW6cXQlIhz4vj5ECa
	jlsSvJgwd4SQ6+zoDPkeq0otv7wSMJacmEWvoTDHjGIOi7Mj/h68yjD/ioxxANf4
	ssyjGSkoby2soZTzwMgqHHp24fFdHhlPADo92MVDe7cKIMtqKZxupNEDFp2Gm21F
	8GMIIg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnvn34-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 08:32:27 +0000 (GMT)
Received: from pps.filterd (apblrppmta01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ8WODe2110216;
	Thu, 26 Nov 2026 08:32:24 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mdsor-hyd.qualcomm.com [10.147.243.209])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 6AQ8WOAr2110202
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 26 Nov 2026 08:32:24 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4770534)
	id 193756A2; Thu, 26 Nov 2026 14:02:23 +0530 (+0530)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 14:02:16 +0530
Subject: [PATCH v3 1/7] arm64: dts: qcom: lemans-draco-evk: Add LT9611UXD
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
Message-Id: <20261126-draco-evk-display-v3-1-6864d09e916f@oss.qualcomm.com>
References: <20261126-draco-evk-display-v3-0-6864d09e916f@oss.qualcomm.com>
In-Reply-To: <20261126-draco-evk-display-v3-0-6864d09e916f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795681943; l=3954;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=4JccREZgfMb4tSJIz5LRpm1F9XDV6RQ9v8eR9cgOx5E=;
 b=bv6H/K98q4eNVd6RqabGc41k4Mjoo16vA1QH4calwK1Ac7mZ0aCJkYIJNHg6liRoHfJMjAuXy
 R7WS0rWbI+GCWEl2EZNDo0ZF+K5UNCQnfPXqQk5SmRJrTs/qaUWXAzb
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfX73tDYgeNHvWq
 lyRHWyEJtKN6SWGQNza/MZJQHDEuB+UG3XvBMp4fEOU7YKY4B6516Dsqz/TegbRPE8anDXEeqqO
 +OqgiJuIGih2uBCVl6Iwupkg+LUwejb1xvYnsHtLcapcCW91woaXA1YovSEbJwwYT3/CRwTgqBz
 RWh7lD2mlEyubRhjZ6//HeZ62dRPtH5jtP9hsOevyGioR73/6OEfi4j20/f8FHKD4/B6B+eB7gs
 o02zdJVFmnuF4EKQQCxoQtC/yNa6EjvGMosa/VoC+P4PeN0OveU0SwuSW60pmjb2gr1rEaStKbf
 UZvvwl0Rf/pZCWa3wKls8JRQ/diSZoklabYxzu7E31ssvHbEdV7MAZTsT3EIkRL98j9OdVzhGEZ
 YLc8P0D3YE/Caesl9ZBTwtNy6A8JlFPVPFEL8GkC7tGm8dopp9AJ89COn3RO2kQfVq/vS4apcTE
 rRFkuiuABrGj8nmWn9A==
X-Proofpoint-ORIG-GUID: -_02gDpfEFN12IrLZAPh0cM_Yqkdxqnd
X-Proofpoint-GUID: -_02gDpfEFN12IrLZAPh0cM_Yqkdxqnd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzMiBTYWx0ZWRfX5pCkcaYenu2U
 ueFo0ZKxWG507+Y8aWXxdHgP2q7z0Vr2oXTRSHF4ypzwN3bZTjBv9ixh3I+Kivz20PKqNiTPMwn
 BngdYGbSo7Z9mmXtBEqb0jufeZhMuDE=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b07ee9b cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=6BwCeua4kPe1APY31UYA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260032

Add support for the Lontium LT9611UXD DSI-to-HDMI bridge on the base
board DT to provide HDMI output via the LT9611UXD daughter card.

LT9611UXD is connected through I2C mux channel 0 on i2c1, with reset
and interrupt on GPIO39 and GPIO97 respectively, powered by fixed
regulators on expander2. DIP Switch SW2.4 need to be ON for this to
work.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-draco-evk.dts | 119 ++++++++++++++++++++++++++
 1 file changed, 119 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts b/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
index 00a0a4315bf3..e478e16dede9 100644
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
 
@@ -644,6 +730,23 @@ &mdss0_dp1_phy {
 	status = "okay";
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
 &mdss1 {
 	status = "okay";
 };
@@ -838,6 +941,21 @@ &tc9563_pcie1_ep {
 
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
@@ -988,3 +1106,4 @@ uart17_ep: endpoint {
 		};
 	};
 };
+

-- 
2.34.1

