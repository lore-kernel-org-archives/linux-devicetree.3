Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69485430319
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240043; cv=none; b=hq7FTgDVODE/Sf50iwQ88S7ULErHtUKxIEoHNbgh+7dwu86A4kFyVwVYKWeLWkDe9jBRTY1nhPsWrMUQDql9mNswktjnAVoy4BOj2hlXGgyQV9Cldt9ZWGtZ+iDIY7ntzPKy5PwUwmnt1RnVEuDaOS5XtsAmov/55XJx2i0XqsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240043; c=relaxed/simple;
	bh=6Aw1+WVUAI+DwvYgJIhS2tW7UksriX+yE64VtlPavBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rsJb818TmrdZhYDyGS/ZkdJAOCBsiYBb/2v4Y6BXwDpOFcd3y2JraTRGck2VdTjW5bSMVKrZ1j2ypZtoSxFAsxDoByPp/IGfKwY1Ro0Idzu/sUX7Td+VUHqgU/G/D3hs73vI1xQYp+Ds86KesX65nsxkYW7r+6WYkeTPhkwRMRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SnTFySzu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GmsNCA2x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SnTFySzu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GmsNCA2x"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBsh7p2673552
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UwhjDu23om1aeisOByNZTGIDNH2y0MHYqk2a/K2tqjo=; b=SnTFySzu+XFNERM6
	nzQ//iQvosJBi7/O3bGdwXZkufyUtrurt00j2SQ3xBi72SloYocGMbdXYszCYWgY
	2ts8H9P4MFrUbf4REB5tSsx9XHf7aqy2LJj6Ai5hO+nz9yuMGf1o7K3dQHIeQnup
	yIKkDWrts7lj/l8qs/z+3X6/KX9etEp4Qs9PGN5WG/X6RVLfwmqx3Ct2eOjuDeTb
	lvmwL2uDmrf73vHXJM3Gq9RaHJLNPJL08pN27ZNXegTM/r/KidAB+Td3zcsMYJh6
	yBnAcgwYgJpS71dMAk3/FxTH5SpKBzAtAr/puCxDS2Uda8c1Q2Xn7bs/qN/Xm1lq
	zSJfqw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpuyg8133-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:00:41 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cce870a060so72843285ad.2
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 05:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785240040; x=1785844840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UwhjDu23om1aeisOByNZTGIDNH2y0MHYqk2a/K2tqjo=;
        b=GmsNCA2x82G+umkTlZcCC/REfJN7d/6Jtupq1grdLwdQ+WbWWWb9n5MxcJLQ2q6xlx
         wvIDrlIjxHkbMx+AfkNXJEs9AuypKo56tGb2sJ2uD7wCQclP5ENhGvKkexsZnBLfBSxJ
         msZc3GvwAm/pWbz49G/BvDYw/Cdjc+VDVfxDdV9iEBQuezVJbzFIfQxbHtRf7XejVRYQ
         FbjdOVb5BdrF9f9Ujq5NHyp53fXJcpdcH1X/Xb5L1i7sy7g35n8g3RMe1iWAsEXlwwhc
         bt7Ebo71UrxC4AgCr6/9koipes28zmQ/sTrBpPFmcqwy3mAHLZPVSIZsooZVq7b0zMuT
         lmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785240040; x=1785844840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UwhjDu23om1aeisOByNZTGIDNH2y0MHYqk2a/K2tqjo=;
        b=NCxwXhJWQo4DhtlWMHr5+yCG+Cr09TpFDBMlcymif8pYJmX0hQcEk0e7Q9l/wYlq+S
         umMSeiMAIcONaQNUxfpz/1/woMWcgcWwRWS5Vd2G0+e2aPrnh8pGlwLLIpNLFDr7B5z4
         WHEp6woN2c5fwwm3Jco66PmsidpQEbGkRBHpZIy5mM80rlHxc+/6Y3BzDVWWL3ZsJ5sT
         hKxDSn+SQIP25KMQJ5TpJOeislxFU6wyYrFZYt9PBcnQpamZ5Q+5GuQuX9UNTqAW2/NN
         dVZ2UzwZYmCiAAZ8wRoCU3zF28HDLWu+62Zz2fr1+ZtkDYjtNvEA8tsdaxIPVGB3EPil
         EDDw==
X-Forwarded-Encrypted: i=1; AHgh+RpnYV4tQZQqO9TVuN0JjXbWArYufietgEZ3c6FqP5FW/YLoCEu+X35fhnhqoD9T05y4bZZWYUv6cMxz@vger.kernel.org
X-Gm-Message-State: AOJu0Yweatzf4oreKlG+EeU4CnBblkTaal32qzhBF3fMo8iMvCpDidjg
	oENzXouOld7bBgrfMDiFNlYsAROSXV3w7yyeN7Z5Ce/isXzF+XF8rzByOnUoB+PgAegca5XXzf4
	frNxveA3t4RoIZ5WXtkWpMPOBFsMKJYuVR9YBb2zqWjZotWc2tTacLA5bXr7g3tCz
X-Gm-Gg: AR+sD11wEo83UADckZeTMuUr+diPv+XVS1kXWjXYlPv3wfHDRAuu5iyU5kvNCXdyi/G
	+zmXorqwSWpI8dVwB3BU7fjWTpF3UDQHE3gDXmC8YUUGlYnshXjJKp6i4eAoC9dzYagMaRYY0LI
	ttq1eLwluPiNrTGCmKXBXyw7WcAafsIe1NOAVd+hBQt4uxLTf3x56XWmCgSP83Kjtql3T+4OVvD
	zd1Xw1TXJDCTkLLzhVjpH9DcvKdMs5s30rvnR3r6TnNIqzE3QepCIXmi66FBQyqYVfLE0UwsNYd
	1dezPW5yRi6U5XsEnrN8AIINKVBdkXOi3vCkn4Adgm9edxLixjUDXjpgitaXXbUQYAwz05lZRrI
	blZKKcaHVNoOyI0V9SeWLbKoQCQ==
X-Received: by 2002:a17:903:22c9:b0:2ca:9d5a:8b6c with SMTP id d9443c01a7336-2d015a315f5mr25455955ad.5.1785240039392;
        Tue, 28 Jul 2026 05:00:39 -0700 (PDT)
X-Received: by 2002:a17:903:22c9:b0:2ca:9d5a:8b6c with SMTP id d9443c01a7336-2d015a315f5mr25455435ad.5.1785240038881;
        Tue, 28 Jul 2026 05:00:38 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bbe01sm51764895ad.48.2026.07.28.05.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 05:00:38 -0700 (PDT)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 17:30:16 +0530
Subject: [PATCH v3 1/2] arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-shikra-work-v3-1-e08c322596ac@oss.qualcomm.com>
References: <20260728-shikra-work-v3-0-e08c322596ac@oss.qualcomm.com>
In-Reply-To: <20260728-shikra-work-v3-0-e08c322596ac@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: aEj4F_ZIi0VDk5zF6gfyIU3p07dxS9sl
X-Proofpoint-ORIG-GUID: aEj4F_ZIi0VDk5zF6gfyIU3p07dxS9sl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwNSBTYWx0ZWRfX65zAwhlhPdzH
 5ZqF0sklTDIHSMac75hmt+BtmeEkZFv2jvcLLYPx1ddz5qLoutd0ZkIDB+24ytzafuwXrFSs0Sz
 E4cWJR/fbMW132z0hHEBFsviQeRJ7MKcezLEA3grLc4AFr0nXLES9ehSSNX4rv6GDiQD7E0979B
 WPD3yDYgmz5h02/KHnHL+m3iIRXV4K8ksDcBoX9YSINSbDA+HADpyxV2HaA+h3UNZrGWP+m8qBY
 Rv4bve/rpe3VU0/uT5OXiAHaP48GI09qZqW0qpe454P5LcGLiGFI7vyYPOUYuATTJdeJ+JSTjCm
 13b99SNzcLvI3h+ZY9lrJ3Q9gck1VJlKPSg5YoLKTEll15+iIyYOqb5SkviseAtbUxcRdU1R6Ba
 Bh4dIOTMt2FoxhlUooU+myhVZfm/ZuxfjKVvtFFjW1CyFWZ8Ma47a+rfnrpuGefiACLU42gfZzc
 wzJIzNmC/JFbN1MSZAQ==
X-Authority-Analysis: v=2.4 cv=aoWCzyZV c=1 sm=1 tr=0 ts=6a6899e9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Dh2IlRrSrxxA8ivr3KQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwNSBTYWx0ZWRfX98lfGObdUaZC
 HifsY4jLm3eMwgnc9YXnUcy0UAQnhXGVKYOENAynXtMHClPQ3IBmmLBcl9ejokfZzv5VYW/y1Y/
 Fg0SCFmGhaVfrrER/8Nh3+GHbzZbHgs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280105

Enable the Shikra MDSS display subsystem on the Qualcomm Shikra IQS
EVK board and add the Lontium LT9611UXD DSI-to-HDMI bridge node.

The LT9611UXD is connected via I2C (bus 4, address 0x41), powered by
a GPIO-controlled 3.3V regulator (PM8150 GPIO4) and an always-on 1.8V
rail. Reset is on GPIO76 and interrupt on GPIO85.

The bridge receives DSI output from MDSS and drives an HDMI-A
connector, with the link wired as: DPU -> DSI0 -> LT9611UXD -> HDMI.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 117 ++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3a6962388dfd..27c4caf55193 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -7,6 +7,8 @@
 
 #include "shikra-iqs-som.dtsi"
 #include "shikra-evk.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra IQS EVK";
@@ -21,6 +23,106 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
+
+	vreg_lt9611_vcc: regulator-lt9611-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "lt9611_vcc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pm8150_gpios 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&hdmi_reg_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_lt9611_vdd: regulator-lt9611-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "lt9611_vdd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+};
+
+&i2c4 {
+	status = "okay";
+
+	lt9611uxd: lt9611uxd@41 {
+		compatible = "lontium,lt9611uxd";
+		reg = <0x41>;
+		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 76 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&vreg_lt9611_vcc>;
+		vdd-supply = <&vreg_lt9611_vdd>;
+
+		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm8150_l11>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9611_a>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
+&pm8150_gpios {
+	hdmi_reg_en: hdmi-reg-en-state {
+		pins = "gpio4";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-disable;
+	};
+};
+
+&pm8150_l11 {
+	regulator-min-microvolt = <1232000>;
+	regulator-max-microvolt = <1232000>;
+	regulator-allow-set-load;
 };
 
 &remoteproc_cdsp {
@@ -64,4 +166,19 @@ &tlmm {
 			       <30 2>, /* NFC SPI */
 			       <138 1>, /* NFC Secure IO */
 			       <155 11>; /* eMMC Boot */
+
+	lt9611_irq_pin: lt9611-irq-state {
+		pins = "gpio85";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	lt9611_rst_pin: lt9611-rst-state {
+		pins = "gpio76";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
 };
+

-- 
2.34.1

