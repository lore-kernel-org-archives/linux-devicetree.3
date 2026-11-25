Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611287;
	b=ooSN1tighpfL30H0tSvmx8DSmqwwdlbn5ZTlqO4JeFKnKke/f+4aUcV9zDz33KWY66np
	 rLpia8xiaHI95qnRSb1q4eCkxYft/xG6yvjLhwMZx71vpni2IdBDfnL+kHxuuAOQsw2o3
	 NK/9f3gzNhtKSiF0BRLfc2fCCWEOP+LyO6l78eX2uv2oX6MTpiW22lBpLY80ZTecCsBWk
	 doRM3/bNbDc3MLBw9u0vhHLrP9TCoGQjpQm/q6cGWOat6NQs2hTOdeLL8rOYQDBGNFtKs
	 Su33oAIF+QnH4iTpbi7ymXVwku+e1C6R/jWVwy573qcEBNmWS740YLiLu3yb9podieA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611287;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=m0qvppSArZkbASP9QAvO28LtZ1jSmhVi2ETMvHqOGT4=;
	b=dvTxarqF7vr6ohaGqHCK7rRC4YyDzGGE97wuhs78Puc9wCfQI+1iGThY642yv7lTGZK/
	 84zYokNd9QdJWKNgKnqP35E78VWawx+gMk26fMgYzfBxdKwErS8eyxzD4TgRDcBuVRATh
	 /2Je6yVMYIBsU1l/3Z/YFXoTMPaseLN5IyXa9Bk0Z2GkTCunwj4sqRo8XoDoo+SodTUHZ
	 ovm6vaFwM9Hwwv/Xpx5iGctzdyW3c+i07feTBjnJva4RYUuiiFJWpAJTJxDsqzAExaWNq
	 BsnQ6hDj/bsHab+bKk5Rz0ZzvuyH9HzFW93gF+BFjajH5HbgKUdSXn+9SUR9OKxkhxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=esalqPlP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CuNDsYYL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E571C606A693
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E571C606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=esalqPlP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CuNDsYYL
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mcrD796772
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m0qvppSArZkbASP9QAvO28LtZ1jSmhVi2ETMvHqOGT4=; b=esalqPlPWxzP/g0J
	k4HZQD5ZVf0eKZcbhHw1/oEYiVEXXVs7XWeTqOWRsacrAZTMtPa6J1RuOM5t8fJ2
	bV6dkjzARDZtDaZvEgHdTWspQJZrdS3w/7O4f2bfBcpXeRob4GR+aIKy2WruZnLs
	n0FNr1RWA6oiT4/yUq5bX7j14c91IgJAIri8set26o9uCZFCCPg3znFb40urcUDB
	A+BbTQDLIJo4oM9ee7XZQ1O3Ekov+qJcDFOkNwcH31BTWqv6xM2fnUYDlpny90h3
	LKo9X2GV0NK5Q0KF7cBjBtCxwNRXnf0BDtoD8pytwK/j/H7s3dncgD/HEVzyzSn9
	Y+D6ig==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5n6rtrmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:54:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f0d0fe0851so2148215ad.2
        for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 04:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795611284; x=1796216084; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m0qvppSArZkbASP9QAvO28LtZ1jSmhVi2ETMvHqOGT4=;
        b=CuNDsYYL5JaakHPVdIdlSLV9qncMIS7J9mQ/XqDKov6JDffHwdY6ipHTYFfW1FP7Dx
         XRxSLTNREks8sqRB00izrae+1p2i8IcrCe3R0ZAuCCnsgARxSfJOGYL8OgZBpH2LknKo
         0xgmrXdVcB5+P7DYBTEqAH9StamNK4D0pH1VNHcmy0xcnq+qCK8s/g9KYdydz2czAtQz
         GiyYCT7FZ+4c+ODHWFyUDIw9dE6cl/9bey0sLI0LbbmYZ9/H10/hw0SRxRHFyhmz07CK
         OZ3/Mx8rMkqKslElOo4ncsnWJuBMH4UXrNVHJ/8rM7G4Qo/bwWW5b9l86h4ywRpWCRJx
         9m/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795611284; x=1796216084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m0qvppSArZkbASP9QAvO28LtZ1jSmhVi2ETMvHqOGT4=;
        b=NHzXhAFOmTLYBxYJRo7O2YYvJStKlkrU8Nv9OT/Qk0aMsXAXuWet3ou1ZfV29z0tfT
         r3e/zHfXyAC2658O12bgKpeq7So4G2FrBNV09BLFv7R7CDjAxry3UGsSjqbop5kKx0yc
         lUThcMRgsM+o30IpvrhAyW0iP+W+rOudXmOZ1D2XuQDhkBrFT7kAP/Kov7SZ7O0EvWAm
         S2x0nQzdqHdA0KLYhbIUz7Ol1RUPHScPb11sidvkHLBiz8XRSRTa3OD0nMEzMSSRE+P/
         jwZJ4OmfNsf3kTqILGxgyQdXYK4Me1lYEWsNyPDJCgu8wLC3q6ETpNMNKWb9Cu9+sc+3
         8Q2Q==
X-Forwarded-Encrypted: i=1; AL+hErEblPFbP8q/vdWeaZ+tpPNB8NXXZss8RdnzG69RKzntXUbirRL9wsKyn0XI4cy9Jeb382BUchMNWdT4@vger.kernel.org
X-Gm-Message-State: APuU4Z8KcQ7kBw1i4nRE+skTxIMTUQ5W4XkA3i5k7vcp+B/iDoZgK28/
	PuK+z04lMidyPqm/DzQPtU7p2K0xHr8pjH5gmmXsQ+sXnqtuZ+H6OKYtxAnkhvke9xuPBzFudMA
	o8IRaA3eqZp0kvp1tKMaPRCY3EAziA8Untn/DGS6gaMY+K1ksQbcDBEAptj4dcrNr
X-Gm-Gg: AZFdTZfZW8vk1/Xm+XQC/YaAWRW6b3Nixq1BNa1ph83Oz4R3QuZjEJyaWQlvkw2SBPZ
	iSaxJd9cDIr02/8vpTw+Fx8Ogt7y2c0TVFccKQ99XmlINQz10cyMOHbKSIva6HOJtAiGFRfyxYA
	pIXk2Tjr35UlW/Xaom0maqavg7ZbpsOW1xDpgHOgzT0Ubt2uAYXzMcd/hAqH7PUVLa1DJIJeyUF
	Lt5dNL9GcPEI0FZCjYuRnGLGkMqotoP8EG/LWL6hYOuyJF3lgxTUbq6CpCZRdPORavO8oDSAj2g
	Y6TnrqdAUIUQJGk7m/3t4PDuF9CCGnXk2Mfv8LdXn32d5gaSeT3Amn8gtgepEHKngUAbZtLLrhE
	v17/96EnooQZ5NL8VULAwc61hUFukPBaA5FUXntbxNhK3QNfa0f0oT52XQKwEj3XrE+z8f4hub4
	fwXy6Diq5/4C313E6mcqOxKv8g9j8YeP8JIxnJv7WXYhhdxhjbjoE7sejUn9/cADr9rM7eXohms
	r5ctHvD+BqifrUuwWDNZQRuz73q
X-Received: by 2002:a17:902:e948:b0:2ef:eadc:5c98 with SMTP id d9443c01a7336-2f03ee6a938mr277094565ad.0.1795611284265;
        Wed, 25 Nov 2026 04:54:44 -0800 (PST)
X-Received: by 2002:a17:902:e948:b0:2ef:eadc:5c98 with SMTP id d9443c01a7336-2f03ee6a938mr277094355ad.0.1795611283782;
        Wed, 25 Nov 2026 04:54:43 -0800 (PST)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0b58fce71sm31940575ad.45.2026.11.25.04.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:54:43 -0800 (PST)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 18:24:25 +0530
Subject: [PATCH 1/5] arm64: dts: qcom: monaco-draco-evk: Enable DSI to HDMI
 output
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
Message-Id: <20261125-monaco_display_intf-v1-1-8a27d60b0d94@oss.qualcomm.com>
References: <20261125-monaco_display_intf-v1-0-8a27d60b0d94@oss.qualcomm.com>
In-Reply-To: <20261125-monaco_display_intf-v1-0-8a27d60b0d94@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795611273; l=4094;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=wukGK8SFYBcyix28xgtPVXDGmh1LmddhG/WWF4guGB8=;
 b=IvIHPijtCs8lIqvB+7dTACq31qISg1IFESAERxJibCntNxbGAlDhqyzXs/QzmB2Ky2r+4jhPF
 eEbPILGueAvDidyx232V6Brpo9BmBZTFk/BXnLFHqbk2LhlCmB+CEpw
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfXxekJyE5GNg9Q
 JBe1rnp3JE0Hg6TQx3KfIcrMDUMsgsC4GhtpOCqqucJKGnR1QtH8WQSQG5VYG31zJ8hOvAHGLJo
 sfZTFCb72/rnuzgG7S/nDbV43pS6l/QyY8G4eZ56ZvbilA5MYRgBjOMBPxqwPYhs8ucvGrq4vLX
 jfBdUrGV+RtJCd+yg8cyZ+vt+E6mDn9fMJWnKZs8yZjn1lL2ZZ7iSGnH9g3vpyGjRUnDyDG4ISf
 0ub1NlJZAFmXZeieTcogN8Nr4A13fF1q/yPP46u1ANJhQemDmQ8ye5d5lNldQtXGPJfRzEoKlRJ
 hHbOSbFnhwM1yj7yxBI1DkReix/NOQo44wVrk3wFK5Kbb5Yx9fYbzYJ5XvQxRCmD3/ruJHjpJz3
 kxkAr5opwIUJJv4+PwaGq2npMzEhJGSvDvi/9GfH2msa3Srihvsv9p04kEGfy/riK7bmk4Uch1v
 NUW88pw3vVWJnYgMvrA==
X-Authority-Analysis: v=2.4 cv=Voa2kO2n c=1 sm=1 tr=0 ts=6b06da95 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=u4DayWPH-NzsctlWCTgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: bKUIwWcLtC7v-uJ5hdXpDjXvR3k_hBki
X-Proofpoint-ORIG-GUID: bKUIwWcLtC7v-uJ5hdXpDjXvR3k_hBki
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MSBTYWx0ZWRfX5kp9xLmJqBZO
 R8UHJYnNyY3Gp/uznPtvvlfjQbatrPCS/mMtgLK+mbjn2+yx474PxSH7d9b4Pch0FtffBt3PJN8
 vXhldE/NiYJ7s8W8gje1QGk9+9T317E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250051

Add support for the Lontium LT9611UXD DSI-to-HDMI bridge on the base
board DT to provide HDMI output.

The LT9611UXD is connected to DSI0 and sits on channel 0 of the PCA9548
I2C mux on i2c8, with reset and interrupt on GPIO3 and GPIO76
respectively. It is powered by a 3.3V fixed regulator enabled by a GPIO
of the I/O expander on i2c14, and a 1.2V fixed regulator derived from it.

Also add aliases for i2c8 and i2c14 to keep the I2C bus numbering
stable. i2c8 is used by the HDMI bridge directly and i2c14 indirectly,
through the I/O expander that controls the bridge supply.

DIPSW2.4 needs to be ON on the board for this configuration.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-draco-evk.dts | 113 ++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts
index ae34538e6fd3..3e1b18de8920 100644
--- a/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-draco-evk.dts
@@ -19,6 +19,8 @@ / {
 
 	aliases {
 		ethernet0 = &ethernet0;
+		i2c8 = &i2c8;
+		i2c14 = &i2c14;
 		serial1 = &uart2;
 	};
 
@@ -69,6 +71,34 @@ dp0_connector_in: endpoint {
 		};
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
 	wifi-bt-connector {
 		compatible = "pcie-m2-e-connector";
 		vpcie3v3-supply = <&vreg_keye_3p3>;
@@ -261,6 +291,57 @@ queue3 {
 	};
 };
 
+&i2c8 {
+	status = "okay";
+
+	i2c_mux: i2c-mux@70 {
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
+				interrupts-extended = <&tlmm 76 IRQ_TYPE_EDGE_FALLING>;
+				reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
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
+						hdmi_bridge_in: endpoint {
+							remote-endpoint = <&mdss_dsi0_out>;
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
 &i2c12 {
 	status = "okay";
 
@@ -425,6 +506,23 @@ &mdss_dp0_out {
 	remote-endpoint = <&dp0_connector_in>;
 };
 
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&hdmi_bridge_in>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
 &pcie0 {
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
@@ -624,6 +722,21 @@ tpm@0 {
 };
 
 &tlmm {
+	bridge_rst_pin: bridge-rst-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+		output-high;
+	};
+
+	bridge_irq_pin: bridge-irq-state {
+		pins = "gpio76";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	int_codec: gpio-irq-state {
 		pins = "gpio51";
 		function = "gpio";

-- 
2.34.1

