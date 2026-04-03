Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1ED323EAB0
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 10:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775210904; cv=none; b=UZl4+FIFIYZAHEHkHwMpfCEX7AM+hTlJaHA5RJdk3L6veiW4j2/w5IyO0ras4PmTUdDyyc911wsknzRmKtTzE4H4lrjUqU2pLdXIx9PQPtR/w+Vhu+VI9srdFcj7pxk8ts+Ql27t91SlXVDXzmYSvkHB+7cHQVRaLUUY9RjWzn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775210904; c=relaxed/simple;
	bh=1bVEC+WfJcvZ1uctIKmoAJ7fAsmw5MbJ35tM1wKE+QY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sKIUg9fMZN8hE8DSHUKYuEFxqVEf2u/0abufoxGADQJO3u/VPb0bCm13XFvXZ0bRMunyNxF4Pk8SWuKTmTIZM7dZsXb/zidzwMSrPu10FAZGoK90yEk14RBh+TCUHZVFHH+YM36olECb4cIJmstsZTNpok/xiXbige3LOHud9/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CDsSkTgC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N3duAUC3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CDsSkTgC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N3duAUC3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6332uwgA1380820
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 10:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BVGLaEeFYY9c72Ew3ZZnPD4GNjo1JzVn3GROkPfzp0M=; b=CDsSkTgCkS9eDMZR
	sRGjWC1eGGg4mV14gALi8y04RiyREJtcjsZBtDxlA0t/SbbQhglkDNvkCYWS9KEB
	pKEIq1WE9jRT1d4cqCx9AREXzNvswgYWFgOCI40BoTfwoKzoNrrnFFDQ6u5+8V8D
	GsCYFUawZo0yMrqrNH5MvsawgkW+EO0XJJ+RxUpxL9I1tCd9txX8RdSa6cSqtPqL
	J2awFmhQyJ+Hqr10LFn61eIQfs3lJzpolhlWS7YXtw8YFrJL7bbyRrnjzWhhnhBe
	0+8PZU5Mq+GznnhHwFlfLl7Vb6+aVtqNsrYITtLhmIxUAravVP7IHlMSJnbfsbLD
	TOFAhw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9myhcssx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 10:08:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35d9f68d00fso3811752a91.2
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 03:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775210899; x=1775815699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVGLaEeFYY9c72Ew3ZZnPD4GNjo1JzVn3GROkPfzp0M=;
        b=N3duAUC3pBiKl1kKNrMOs3X+X7THQYht3umKZnxaE9jRba634CZ5GUVS6KgyLyJtuh
         y3uVIn09Cm9aPFFrMNngTBvFMHCzvK4zknaLdPV2SW04Pq6WioYuaEeVwO9GS/YfpbAR
         aNzxirg5Mr71zwNDEM4Sgdl1aN+U3tglYkWP5pt97sgNfHqvHtpEUSI/f2PtTtQF5Kel
         8eJetjlNv7LtfuOfOE07feTXubLIXFWtK/6tNIRAWw7hG2M3xMc4KgyZBhMHYu5U56JT
         Q/oQWO1Wu4eZ+aiCuG1wu7HmKIpXfA8uoPYHq62eC9e1d3OFqFb4WMdEGCNi8Z5ltVJk
         i4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775210899; x=1775815699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BVGLaEeFYY9c72Ew3ZZnPD4GNjo1JzVn3GROkPfzp0M=;
        b=iAuCC16hCV6sYTdpa/MRHVwp+S146Mx2RyoejVg49u0n96vtN9LPsgl6XtgEOG40eZ
         pmHMbijulvuJtO7f8e48a629IPzSYlRNvzH0bDlzr/eoRY0FpCwrymzPziSYZOCvYhtg
         skupq3iWpua/aYcd2ob9rDnB09sbMMNdvht5OeCW3FQUn8qy0NKItIYCcBG013SWFewF
         c6//xnl5c53BxsKrRattFwGCQ/MZVr4Dr2u3/MNVipvKYjN7oiIjjkptzumgJ1B/V5/I
         YGpNuTKrF2BfxlIiM43l+plR2m5pmiOBlUY9KzQhTyMRwBPGlh9n6E0bgb3i048DCN99
         Bi6w==
X-Forwarded-Encrypted: i=1; AJvYcCVkmJFBxu7RIyl38jxE7guB5dQJncBOkjSXH3zyfmV2y3r2MlaVGfPtIjiabAXuqp2Wkbkv24540N/L@vger.kernel.org
X-Gm-Message-State: AOJu0YyaiCHiPHpijBhORNcNpjQeeEErtPdcRwQpGjQPxsdqogCJBULc
	CPrpp4Gu91DORZ1LXO4LE0tW7LUwz/yLP6O2qdZ9icXedPw5tFQsOW7lHdR/x9A76r/PhTrSrgW
	kJwMFR9m2Wy5fKcjtAuViDlP7M6ckZ2mep8midFtGyTyeMlnnZY/I2mS3/Me2Qz47
X-Gm-Gg: AeBDietQyL5u64R/fSr0Pad/lkPE/tkBKEEnraRiY3LdLKLgMlhXf1xYBkf+K+fdxOQ
	3EWtEm0xgXLBhBaT8s+SSPsakbHwvVz89vY2VjmQqJlT/swTkOPkswvG+9dsxSQQlZZyj6NSwDs
	GATVbrAbJbWbv/eysW9oz1p/zeymmE+kN0EPPpeiUfd1fWykI4QbI6neLDt/1LuH5UoDFqnYCge
	NnV+67ZpApWaZGRPQdVWE7iOBGFUPOy8SU3Eg1FI/iBExNxHxdVJdYn2OkXURRO1UvkNpQy2cXj
	XTPNEUJk5yB8Y9cK7WR73mYDIGjYyq4VsUxg6m5WT8Ysg+DM1hL8C59jsdjrtmiBJ17jUeAVIg2
	za3r23OOTekttQ1p9oiHo29pcNb1zKaDLV4OXFrSZ5r+i+zq7tFRF93U=
X-Received: by 2002:a17:90b:3811:b0:359:1130:1047 with SMTP id 98e67ed59e1d1-35de68ebf53mr2468399a91.17.1775210898710;
        Fri, 03 Apr 2026 03:08:18 -0700 (PDT)
X-Received: by 2002:a17:90b:3811:b0:359:1130:1047 with SMTP id 98e67ed59e1d1-35de68ebf53mr2468376a91.17.1775210898189;
        Fri, 03 Apr 2026 03:08:18 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe624756sm13497522a91.5.2026.04.03.03.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 03:08:17 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v7 2/2] arm64: dts: qcom: lemans-evk: Enable secondary USB controller in host mode
Date: Fri,  3 Apr 2026 15:37:53 +0530
Message-Id: <20260403100753.3477925-3-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260403100753.3477925-1-swati.agarwal@oss.qualcomm.com>
References: <20260403100753.3477925-1-swati.agarwal@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0XIr-vX7DJTxIzojUPOIFZZSsXx4ejqo
X-Proofpoint-ORIG-GUID: 0XIr-vX7DJTxIzojUPOIFZZSsXx4ejqo
X-Authority-Analysis: v=2.4 cv=JII2csKb c=1 sm=1 tr=0 ts=69cf9193 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=6A85_hAfsEMDmSNDHIoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDA4OSBTYWx0ZWRfXzMVC0eUb6Flh
 YBH4/qJkmB/TWWRJl7c9C/w3TKLGFyH16Vx9HEAIr5ViPDE6nJnf8cmLeaj0acLwnOYU2tTS74P
 XhQUZ2R/2PYwj27d/qrTA49EhAPrR/cScxyE1aB5GgW8ilYSz47fK5LtKDp/s/AIkEz+WyL19mN
 n9rd3CKrYqiPytR4ZnjJLPe7I2uxb81l1dvcZ0N0xJ60gRgh08MFobzGzz63scQAPdLoXsYY5U/
 6pwS+7synGIkOQlaO92mdfTovmP4p+prnQXvcKwsWogvEXGseDaBhSnTG/eb/FGPP9mmFwcoLCG
 nWdunE9V+kok4FO1ZidZElHmv9aRl6KGoExePtIFkta+4CD54rR0PDdhwjGVT0IEjek9HehcSjC
 3s4+oGMZVB9AKXhMWObSdT6rmutZpDFrV6+7CzqrELPnY/gBFr+D1Ka1OMlhpPl6g0+S+wJGI82
 6G24L7tdvIxJiR7xtDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030089

Enable secondary USB controller in host mode on lemans EVK Platform.

Secondary USB controller is connected to a Genesys Logic USB HUB GL3590
having 4 ports. The ports of hub that are present on lemans EVK standalone
board are used as follows:-
1) port-1 is connected to HD3SS3220 Type-C port controller.
2) port-4 is used for the M.2 E key on corekit. Standard core kit uses UART
for Bluetooth. This port is to be used only if user optionally replaces the
WiFi card with the NFA765 chip which uses USB for Bluetooth.

Remaining 2 ports will become functional when the interface plus mezzanine
board is stacked on top of corekit:

3) port-2 is connected to another hub which is present on the mezz through
which 4 type-A ports are connected.
4) port-3 is used for the M.2 B key for a 5G card when the mezz is
connected.

Secondary USB Controller
          ↓
GL3590 USB Hub (4 ports)
    |
    |-- Port 1 → HD3SS3220 Type‑C Port Controller → USB‑C Connector
    |
    |-- Port 2 → Mezzanine USB Hub (when mezz attached)
    |
    |-- Port 3 → M.2 B‑Key Slot (when mezz attached)
    |
    |-- Port 4 → M.2 E‑Key Slot
                         (Default: BT via UART;
                          USB only if NFA765 module is installed)

Mark the second USB controller as host only capable and add the HD3SS3220
Type-C port controller along with Type-C connector for controlling vbus
supply.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 206 ++++++++++++++++++++++++
 1 file changed, 206 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 522d407c9925..f0010c4e69c2 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -69,6 +69,44 @@ usb0_con_ss_ep: endpoint {
 		};
 	};
 
+	connector-1 {
+		compatible = "usb-c-connector";
+		label = "USB1-Type-C";
+		data-role = "host";
+		power-role = "source";
+
+		vbus-supply = <&usb1_vbus>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				usb1_con_hs_ep: endpoint {
+					remote-endpoint = <&usb_hub_2_1>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				usb1_con_ss_ep: endpoint {
+					remote-endpoint = <&hd3ss3220_1_in_ep>;
+				};
+
+			};
+
+			port@2 {
+				reg = <2>;
+
+				usb1_con_sbu_ep: endpoint {
+				};
+			};
+		};
+	};
+
 	connector-2 {
 		compatible = "gpio-usb-b-connector", "usb-b-connector";
 		label = "micro-USB";
@@ -161,6 +199,15 @@ usb0_vbus: regulator-usb0-vbus {
 		enable-active-high;
 	};
 
+	usb1_vbus: regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb1_vbus";
+		gpio = <&expander1 3 GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+	};
+
 	usb2_vbus: regulator-usb2-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "usb2_vbus";
@@ -565,6 +612,39 @@ hd3ss3220_0_out_ep: endpoint {
 			};
 		};
 	};
+
+	usb-typec@47 {
+		compatible = "ti,hd3ss3220";
+		reg = <0x47>;
+
+		interrupts-extended = <&pmm8654au_2_gpios 6 IRQ_TYPE_EDGE_FALLING>;
+
+		id-gpios = <&tlmm 51 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&usb1_id>, <&usb1_intr>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hd3ss3220_1_in_ep: endpoint {
+					remote-endpoint = <&usb1_con_ss_ep>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				hd3ss3220_1_out_ep: endpoint {
+					remote-endpoint = <&usb_hub_3_1>;
+				};
+			};
+		};
+	};
 };
 
 &i2c18 {
@@ -749,6 +829,14 @@ usb0_intr_state: usb0-intr-state {
 		power-source = <0>;
 	};
 
+	usb1_intr: usb1-intr-state {
+		pins = "gpio6";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+
 	usb2_id: usb2-id-state {
 		pins = "gpio11";
 		function = "normal";
@@ -949,6 +1037,12 @@ usb_id: usb-id-state {
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	usb1_id: usb1-id-state {
+		pins = "gpio51";
+		function = "gpio";
+		bias-pull-up;
+	};
 };
 
 &uart0 {
@@ -1007,6 +1101,118 @@ &usb_0_qmpphy {
 	status = "okay";
 };
 
+&usb_1 {
+	dr_mode = "host";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	usb_hub_2_x: hub@1 {
+		compatible = "usb5e3,610";
+		reg = <1>;
+
+		peer-hub = <&usb_hub_3_x>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+
+				usb_hub_2_1: endpoint {
+					remote-endpoint = <&usb1_con_hs_ep>;
+				};
+			};
+
+			/*
+			 * Port-2 and port-3 are not connected to anything on corekit.
+			 */
+			port@2 {
+				reg = <2>;
+
+				usb_hub_2_2: endpoint {
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				usb_hub_2_3: endpoint {
+				};
+			};
+
+			/*
+			 * Port-4 is connected to M.2 E key connector on corekit.
+			 */
+			port@4 {
+				reg = <4>;
+
+				usb_hub_2_4: endpoint {
+				};
+			};
+		};
+	};
+
+	usb_hub_3_x: hub@2 {
+		compatible = "usb5e3,625";
+		reg = <2>;
+
+		peer-hub = <&usb_hub_2_x>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@1 {
+				reg = <1>;
+
+				usb_hub_3_1: endpoint {
+					remote-endpoint = <&hd3ss3220_1_out_ep>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				usb_hub_3_2: endpoint {
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				usb_hub_3_3: endpoint {
+				};
+			};
+
+			port@4 {
+				reg = <4>;
+
+				usb_hub_3_4: endpoint {
+				};
+			};
+		};
+	};
+};
+
+&usb_1_hsphy {
+	vdda-pll-supply = <&vreg_l7a>;
+	vdda18-supply = <&vreg_l6c>;
+	vdda33-supply = <&vreg_l9a>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l7a>;
+
+	status = "okay";
+};
+
 &usb_2 {
 	status = "okay";
 };
-- 
2.34.1

