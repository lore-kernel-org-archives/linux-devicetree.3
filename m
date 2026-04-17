Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2444C2DF6E9
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 15:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776439226; cv=none; b=UMw8KbaIJv8QpAqy8utjApsom5ILHv1fRVkJKYo3RVDlxTT+zDVquIgKB0sXA4+sipbGAHPWgqXig/oBX0TTqDEf6ARHG3ooJh/SiUfwpZxdMIimE1PHt0ovrwWWUwJsjjKEnNFUawd8N/jKOnpx9sRwcG0OrCyiJWCfAtS5D7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776439226; c=relaxed/simple;
	bh=a+WFpFLZBsaqzg12XI/jkp56yPXr8RkKvea/iafe0U4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=Um9DRRY6HLeBoBzx+OPZQIIzoNSSvtNd/zvMPSx8V6SvzpSIP5F0n5XrhGVkMu7Rk++1NwDgXfR3UfDyJ0aSr7te6HX1adX1YLNPG+dVJJYL1qysoaRQwdRx74oIV/UQ4SP/vypy8Hj+KRn5QeHS2EMrySMoIeqH60BxHiJA4AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iACiFt+I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SkPqhne4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iACiFt+I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SkPqhne4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H9keAX1042273
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 15:20:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=06tNW4cbqK3OdZ2r2WgitT
	1IYug+KY06HCOgPE4ReZ0=; b=iACiFt+IQ4yvCMbk3D5uQT80Q7FwpC3I8/NJWj
	2U3sc5GQF7Nj22aWcWobHETi1IuwqzvqjBYX2HgNZxMTTbD4Awqq7h6KFEkTfx0r
	ljJW2HyAYkF+l1GU7GcOIoRE+7UPLTQv3GH5wpwJkZV8XaeHXmRQYGEQ1bJljnse
	f/mkpprlzG4SgRDfc9jt9AeR66KrVW0gViIlyezVyqMGxwLwfJ0SzLPr7xE7UIxZ
	KH7aHew+D1WmZVjr0li71x6CABv0uDQdc5jFLAtCwNLz9hj6uU4P33WoDOFseWOq
	D+7hUD2QLtTr1Lr/UmksRcesYW0qUY08R6pW+WNVWJiJPrKQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dkjhds562-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 15:20:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2b249541063so7489515ad.3
        for <devicetree@vger.kernel.org>; Fri, 17 Apr 2026 08:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776439223; x=1777044023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=06tNW4cbqK3OdZ2r2WgitT1IYug+KY06HCOgPE4ReZ0=;
        b=SkPqhne4uqmXZmFQY5RdK6b+vlpAkkp7Bcd6SDI6Lf5thFsBxBNeLz7R0RzmbvjLID
         U888Lv6A/ciFtymU6xFrXstVAmCDAj8a2m4sacdfzAn9Le89twsbRHD+1Lgs1il+rIXy
         YPyYAgBjWcpka8v3lvDD5ZnkNn4hV5FIWvzdZaTSdzwK8mAd8HwMx4ivciZUXaHQSH3Y
         Gv7nn4wTeuz5Ei9lsyTVXM2Vu4wYHLs+wHtLjcNHJDlkqt526F4tCLhYUaTGzx02jp8J
         kcD5IJq53TPEOf25E6VRwu2h4MmeZvnlz2mAXhnOf9g5GmlvfgPMJlycWjW8Ock/sS3p
         t1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776439223; x=1777044023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06tNW4cbqK3OdZ2r2WgitT1IYug+KY06HCOgPE4ReZ0=;
        b=Lmd1hmdhiCDxIAdrBfhZuZqXR5+uoD3oUW7GXrSIwE0zlDqlG9BVH0VseEdMcZjMwd
         Aj8tMhDD6N7czTTG1UIDUfUqg34yVI1JH/AlJ21yGjMTrm8nbftT4LBn5pIJbSoj5VR2
         Hnxaho0Y8yR7b+a2bcNtpjUn70uxplPE6cP87bjPSixIy0LcOawpKKe5/TQisOkpMSMI
         wpA1KmhQVLnfuXPkrg1qxDIsjRbQO+/mmpaTrKCkgLcZyG+OYkZYhXMQBW4FA395+Wy2
         sFiOeOAKmvX5TPNhYoge+B0WkLWfvPel9Ofyyl9S9wOyuKNnV4yuvA5a091Wtgd7chjj
         MpQQ==
X-Forwarded-Encrypted: i=1; AFNElJ8+3l/PSIrWovNjDRsEWAayXJlEXEna21YkHjt8jB0nZuT6pWhEL7zf7AiYmtdIg8OfkSqp9/4AZwxZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yw13rsvu28z8O21799k/dYiXSjOLCSySpRUTCbyg4+sAvJC86Hp
	FJ6ZpoXxiXi/hXnpwuX/swd84/Uq/PFWSngUByL5JGIxdphRNm9NhSREERtHVtHdKV3SZQcsFhQ
	PzjRwRZmp9YolhvUC0DON8OPw0MUEsRAhFTz+26z4ZbAq7a05mfrrn8TADNLo/Lem
X-Gm-Gg: AeBDiev+0UfHdUUfdcXCeBmJc1MxxLxRJG/mjw0A3A89nPmPm0rlPy5M6eBoU6M8Bhv
	RtEHzt7fNB6HK9NhW++iuYHvJ23dqX3VDFbdxbNJzwteFOMzI1Mhw7aKwA0TT+q1GX3KWh56kja
	IjCWsogx7Y9TObS1//s0i5hZBauzVQGCQPohyQcFdESZsv4pEvN08IsrUwmeuKTG8uzOosaoKI5
	vSfOoW0t7ARkLxV+PUUiXr9IAoIL8nR5+9rs2QUGIJniI21W/SUjhIZQEcfJ8hGSyL/DEIIKTu3
	8z8MaDjkzYW1i3PVxRvDDUJrrtH0WLtZelZ8ZRGsUHMVwE8/k35iTH0v9IaCShQGXXuLukimUrG
	2x9TOhe00LbBdBmD8benicoOwvphlTzG3QTKfnb0GM+2SmkvRM+rsfy4Y/f4oGO95Og==
X-Received: by 2002:a17:902:d30b:b0:2b0:673a:7c90 with SMTP id d9443c01a7336-2b5f9f50051mr24678155ad.28.1776439222557;
        Fri, 17 Apr 2026 08:20:22 -0700 (PDT)
X-Received: by 2002:a17:902:d30b:b0:2b0:673a:7c90 with SMTP id d9443c01a7336-2b5f9f50051mr24677855ad.28.1776439221995;
        Fri, 17 Apr 2026 08:20:21 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff390sm23491605ad.9.2026.04.17.08.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 08:20:21 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: monaco-evk: Enable primary USB controller in host mode
Date: Fri, 17 Apr 2026 20:50:14 +0530
Message-Id: <20260417152014.3000797-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Pt3exE1fZBHjSvMNi6pDOTjRZpK4iKzD
X-Authority-Analysis: v=2.4 cv=YpQ/gYYX c=1 sm=1 tr=0 ts=69e24fb7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=MCf0qIOZ10eql2xmLHUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDE1NCBTYWx0ZWRfX4d5rajF56Utp
 m3lcsV2eNCZDpjKEvlKBHmCOBVDeyx4hjy3yXhoXIQNqfThHZ6zSa5K6WgBThJR8jGhLMFCQm2E
 QVfxJzEQGtIvlTmf8TdlIbgQzMsjSZIey+PVHVnu3v+Q8W/2uQXR7YSpalreObcxmaXyjTNP9Bs
 esNQ9mqLNVHpL8hYI/Slf6aVwDc0tFhqCKOYFbZnsZtX/ywZXYiyk+V7nhTLEcW77GunuEBVVVh
 jd7iYhDI71QQtpAAZiodJvg5GeW7oEeajREcyIg9g0caTb13haf3PQ4ECvfeNIhHrQZbVey5zz2
 jXVaRAgHmLK/BLiUTZxaDc2KeQQKNlnS4pdADY9dEt8GVwzqBElwB3hOZUAM6/q8PSHQdtWohV1
 DMbNDJbzCyk5oYn/+lIQKHKsiSFqYNo6TNJRUSSwH7gS+cI27OLIfbtarPqjy2cuaQdfh5Rr/Fp
 iB9kvlFOV6lqgCwX3Yg==
X-Proofpoint-ORIG-GUID: Pt3exE1fZBHjSvMNi6pDOTjRZpK4iKzD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604170154

Enable primary USB controller in host mode on monaco EVK Platform.

Primary USB controller is connected to a Genesys Logic USB HUB GL3590
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

Primary USB Controller
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

Mark the primary USB controller as host only capable and add the HD3SS3220
Type-C port controller along with Type-c connector for controlling vbus
supply.

In hardware, there are dip switches provided to operate between USB1 port 0
and port 1 for primary Type-C USB controller. By default, switches will be
off operating at USB0 port. After bootup to HLOS, it will be operated in
USB1 port. Added support in the software for both HS and SS switches as
usb1_hs_sel_switch and usb1_ss_sel_switch to avoid manually changing the
dip switch position for USB1 port to function. Also, added usb1_hub_reset
pin for USB1 hub to get detected after bootup as USB1 hub will be in
inactive state before bootup.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
 .../boot/dts/qcom/monaco-evk-common.dtsi      | 173 +++++++++++++++++-
 1 file changed, 172 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi b/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi
index 12c847c03757..6316a8270f57 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-common.dtsi
@@ -23,6 +23,37 @@ chosen {
 		stdout-path = "serial0:115200n8";
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
+		};
+	};
+
 	connector-2 {
 		compatible = "gpio-usb-b-connector", "usb-b-connector";
 		label = "micro-USB";
@@ -77,6 +108,15 @@ dp1_connector_in: endpoint {
 		};
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
@@ -445,6 +485,39 @@ lt8713sx_dp1_out: endpoint {
 			};
 		};
 	};
+
+	usb-typec@47 {
+		compatible = "ti,hd3ss3220";
+		reg = <0x47>;
+
+		interrupts-extended = <&tlmm 45 IRQ_TYPE_EDGE_FALLING>;
+
+		id-gpios = <&tlmm 13 GPIO_ACTIVE_HIGH>;
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
 
 &i2c1 {
@@ -556,6 +629,13 @@ expander5: gpio@3d {
 		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-0 = <&expander5_int>;
 		pinctrl-names = "default";
+
+		gpio5-hog {
+			gpio-hog;
+			gpios = <5 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "usb1_ss_sel_switch";
+		};
 	};
 
 	expander6: gpio@3e {
@@ -742,6 +822,28 @@ expander5_int: expander5-int-state {
 		bias-pull-up;
 	};
 
+	usb1_hub_reset: usb1-hub-reset-state {
+		pins = "gpio7";
+		function = "gpio";
+		output-enable;
+		output-high;
+		bias-disable;
+	};
+
+	usb1_id: usb1-id-state {
+		pins = "gpio13";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	usb1_hs_sel_switch: usb1-hs-sel-switch-state {
+		pins = "gpio14";
+		function = "gpio";
+		output-enable;
+		output-high;
+		bias-disable;
+	};
+
 	expander1_int: expander1-int-state {
 		pins = "gpio16";
 		function = "gpio";
@@ -784,6 +886,12 @@ expander3_int: expander3-int-state {
 		bias-pull-up;
 	};
 
+	usb1_intr: usb1-intr-state {
+		pins = "gpio45";
+		function = "gpio";
+		bias-pull-up;
+	};
+
 	expander6_int:  expander6-int-state {
 		pins = "gpio52";
 		function = "gpio";
@@ -863,9 +971,72 @@ &ufs_mem_phy {
 };
 
 &usb_1 {
-	dr_mode = "peripheral";
+	dr_mode = "host";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&usb1_hub_reset &usb1_hs_sel_switch>;
 
 	status = "okay";
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
+			port@4 {
+				reg = <4>;
+
+				usb_hub_3_4: endpoint {
+				};
+			};
+		};
+	};
 };
 
 &usb_1_hsphy {
-- 
2.34.1

