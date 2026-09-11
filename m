Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8AF35E955
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 14:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136485; cv=none; b=Ef5DVrIaxyLso0lIiAnrs8U7IqTDwrG+ZHmDN5mXm62sjq0uBSq8xyjoovLiaAXXhHsbbDkpC23igM4KbQXuX3mEhPkYwaLypu5A7n2dncDUg9k5UWmn8iGhEtJG3dXp6GBqxWBF+Jn86GfONlpG/w9y6FHm2/ltJw3KDu5Lc18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136485; c=relaxed/simple;
	bh=Y/hvlFXG9GLs1AM2S6LZjNChMvP7T7olaEoMqfTajbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LNe8sqOur4A3zrNtVt4b9qJYW0XZHd8D66R81vYP9n1Lv8OnqNWWzVGXLEQh3xMfE71H22Mr+IlBr/yJFHfruwwRYwUMKyzzKajpL7BvgqjgxpYDSEK3QXyiGK6SYqE+fNyHO4TkCkIRBM0k20PmGX7SOksOSCuUnEQJ4C2gDZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oX+seEQW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZMZLE3L8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oX+seEQW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZMZLE3L8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCicwS3505484
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 14:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=R4glxcAwmtc
	nwT/5Sgeo+cgLNqx5F0q3TY8ltfG2568=; b=oX+seEQWQRxmDCM7Y/7Sf4HIMDY
	CmXsdPB1wfIq6RdCO2Zw6Gpy+CT+sG192BUKGrrUjX9oPYfs7ILQz1QKRlhT9jM0
	C9oXBM2gYjf3FxBvlhJEreAP0sEydyvQKkGxTgUbkOOK9Bvh3tMjbMbeUqEIiN9g
	vJx073zwL79zylFnCrddJEJaemsQjA0Hiu9qO0SRjlAPhEN3DQYH6DCLeTskPO95
	faLRjMsSpXBOFutzjxUw5F6FWXtxPyMgFoRyqoJAU/3q7HmR4HO554wThy6XNmd1
	mwT6xRj+TAUgKG59ETv9WBXqF9LxCkDYqMKzQDebJzW8kMYzrngyuJwXXSg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfhvmt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 14:21:22 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-837aaa9a3f6so13338467b3.0
        for <devicetree@vger.kernel.org>; Fri, 11 Sep 2026 07:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789136482; x=1789741282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R4glxcAwmtcnwT/5Sgeo+cgLNqx5F0q3TY8ltfG2568=;
        b=ZMZLE3L8OcgFyGmYuDKRsiOG9sZSTzEM4Y+du7wGj1HRGOjD55dMSU/R5mbb69b4TV
         H4yDl2iMmnWjPrrrm9ekzDOtiY0xG6UnshzG0/zDAt3KMJP97vFvuiCQZ8lmXk4LEF5I
         K9xoXDXETQXX69fehXfvSQObQTII2qpNHiAgjSAeC3jeUc9Rr06Oew2UFj6JXnNBaIW1
         mzb0g50j7383+NOyRmfMTd7fEU/1GxcbLSPUni5ASI6ZGK9YshS5dIQMr2W6hzZ0FzQL
         u1MWkn+ItC2qMdEt4DQYhMh5E8SLCq3eLGwjRn0QePMJ8GXTYyCz8CjMIRgTT94kRRPa
         IOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136482; x=1789741282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R4glxcAwmtcnwT/5Sgeo+cgLNqx5F0q3TY8ltfG2568=;
        b=gP2fMepCqNyZm2TPGpj2lo4XfLhW0VVPZ/Pqzl3Ns1/Si283v4xVrp0PSY6e5av5zp
         5mP6xz0jZ1+g13jvNvkvbFboVkPeXezUoETJDfqOKma1XUWmI5yP+05TGaWGNEqVQboH
         V26vGi/vzAdSP+YCpTte4CZipsEVOHuY0Xb8SqfFh4VD/LrthcCFhxTsT6hNakMZ07rZ
         oGZnL5NrhzcjMPwZ/U+lWm51xhYOQFs0li2ODg72p7Z1Bot3HTnlM6JU7YlspAH1g1E+
         AAVi9HeElM4nHtjKteZn2zK5M0RKAjhaNzZ81jGKUrmjjTr0Ljkrfz7vsbt+Unmv1+kE
         +XyA==
X-Forwarded-Encrypted: i=1; AKwUvBwbQRPzIuPbUCvMhWtxcxmONV8y1w7LOrvvkRax8co2w4rKRk35sMJKkSp6RzwTvERipyHWPvsYZ3c6@vger.kernel.org
X-Gm-Message-State: AFuF++lz62B3erJLOfCTRSxPpV8VMzwHm634ZOceVSw8GOZtnKYmp0Hh
	dnKXnHu2qO7P7KAusc58lHLo9/W7Y87N7PNW+XME/4X9sL2l9o8YNTT3xdCzyuzSGYEHbJ7IMmC
	kKV3fGE4dvDGRBoBcNfyX22WWG9qr/UsdSrsd/1yHAfLD14mzTUjYTQuSYn3lWxXR
X-Gm-Gg: AYBFou3dHle+gkAQ3wJkSeKAky6OY9Z/YIq5VQpVWvww+VtCPD5U01Sz2H4S1If1XbW
	MevSk+FlfqlryexQNxYIFCB5havovLSa73H7WCoThbrcb3R9rjGl9AdpqCk8vK9EKwBRjs2+2Df
	2K9Oyf9cJg7FX5IxuxTSX65RElkiAQOFRdeYpV/IG1PzDpc2pao26aA1aiVdCK9tPwDiDiz1Fdc
	WQbclCsPBQz0o+c7LyT5clYS0Syl5LsNqBujr3hW1KlV0kbHg6rc8y9ducfZ1HttQsM3DnkZ7lU
	UWT6iXb+NA6rTin3zor11j7YFoBLPIemA3Ngf8i7NGjNIrfuWFX0s9+1Y7oIsAVjjG9lDHXB31c
	F9Ot98i5P57TnXyBU+4KYdYG5du9qgUvkT3dhuG33miOQlMyHSWxEtVafITWr
X-Received: by 2002:a05:690c:4b83:b0:81e:b78d:688b with SMTP id 00721157ae682-88201e57c63mr24323987b3.12.1789136481473;
        Fri, 11 Sep 2026 07:21:21 -0700 (PDT)
X-Received: by 2002:a05:690c:4b83:b0:81e:b78d:688b with SMTP id 00721157ae682-88201e57c63mr24323737b3.12.1789136480825;
        Fri, 11 Sep 2026 07:21:20 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-884895001fasm10483237b3.45.2026.09.11.07.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:21:19 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 4/5] arm64: dts: qcom: nord-rrd: Enable USB ports
Date: Fri, 11 Sep 2026 22:20:39 +0800
Message-ID: <20260911142040.100263-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwMSBTYWx0ZWRfX9TXCxwI1P9Ik
 ZTi8RQwJvzIvWlkzYRVqb/MGnjnDVRj3GQRVLYw5wS2Ude/uwyTlxapfXwsk9Wi7Hs8PnXAwWxl
 jUGIoz60MXoqyoLQwpFoX0pcLItEquzflSll0DI1CvsRKCuUrj8IyZOuOD4l1LrjYgwxC2V39ar
 +vy3iEvuUMmBa3N3CR9ScCVUX9chvzn6UakxWNlHBy6ccZGgA3rRP+XhyLUUswWFj6dOCqiWxoe
 RJmMLtbYHIL6ocMpX4NW2vNpxnklNbVZopwDan/tnDF7+i0Ww1HOhJsOcZ6UZBsLhJSTd5i/xJk
 4qem2VocH45aAiigUqN2GFpKqtOdN5+VcVP1IvghsVLXZPXgcikq57FVNQMEWKFdXR6AOFQZVGS
 F+0vd5v58igD1OR6RzogdWeMXjx6sP9u/ohDdBSUO5JmxCpS9vfBNW1R+oYXBNcZicHnYqnv65g
 YeeV/s89TmoXBZ6ZAng==
X-Proofpoint-GUID: EU69kJShJPMv4Ay0TiHESoDhWZwD7Jez
X-Proofpoint-ORIG-GUID: EU69kJShJPMv4Ay0TiHESoDhWZwD7Jez
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwMSBTYWx0ZWRfX3NqK+UgwyYWE
 roN+xJqAYNBaWkYf6zbe7wI8w5byQS36/uzoybhzdaekWEePxDhUs4CpXdNS10Fi3BKrI4IbRZa
 CkagNu7GMKjFLo/m3otMELnZ0q6Vdv0=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa40e62 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=kAg6WJeHQ7d9V-TtBpYA:9 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110201

Describe the RRD USB topology. Enable i2c9 and add the two NXP PTN3222
eUSB2 repeaters for USB_0 and USB_1, supplied from vreg_l3l_1p8 and a new
fixed 3.3 V pre-regulator, and reset through pmau0102_i GPIOs 9 and 10.

Add the onsemi FUSB15201 Type-C controller at 0x50 with its interrupt and
pinctrl state on pmau0102_i gpio8. Unlike RIDE, only port A of
the controller is wired on this board, to USB_0, so a single
usb-c-connector is described and port B is left out. USB_0 is configured
for OTG with usb-role-switch and its HS and SS endpoints are linked to
the dwc3 HS endpoint and the QMP combo PHY SS output.

USB_1 is a fixed host port feeding an on-board Genesys Logic GL3590 USB
3.1 hub. Add the HS and SS hub pair as children of USB_1, linked with
peer-hub, with the HS half reset via TLMM GPIO 170 and the SS half
additionally supplied by a fixed 1.2 V rail.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 169 ++++++++++++++++++++++++++
 1 file changed, 169 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index c547963371b4..c2f870ac4234 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "nord-embedded.dtsi"
@@ -53,6 +54,22 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	vreg_per_3p3: regulator-per-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_per_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	vreg_hub_1p2: regulator-hub-1p2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_hub_1p2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+	};
 };
 
 &apps_rsc {
@@ -377,6 +394,86 @@ rtc@32 {
 	};
 };
 
+&i2c9 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	usb0_repeater: redriver@43 {
+		compatible = "nxp,ptn3222";
+		reg = <0x43>;
+		#phy-cells = <0>;
+		vdd1v8-supply = <&vreg_l3l_1p8>;
+		vdd3v3-supply = <&vreg_per_3p3>;
+		reset-gpios = <&pmau0102_i_gpios 9 GPIO_ACTIVE_LOW>;
+	};
+
+	usb1_repeater: redriver@4f {
+		compatible = "nxp,ptn3222";
+		reg = <0x4f>;
+		#phy-cells = <0>;
+		vdd1v8-supply = <&vreg_l3l_1p8>;
+		vdd3v3-supply = <&vreg_per_3p3>;
+		reset-gpios = <&pmau0102_i_gpios 10 GPIO_ACTIVE_LOW>;
+	};
+
+	typec@50 {
+		compatible = "onnn,fusb15201";
+		reg = <0x50>;
+		interrupts-extended = <&pmau0102_i_gpios 8 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&usb_pd_int_default>;
+		pinctrl-names = "default";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/*
+		 * Only port A of the controller is wired up on this board, to
+		 * USB_0. Port B is left unconnected.
+		 */
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C0";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_0_con_hs: endpoint {
+						remote-endpoint = <&usb_0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_0_con_ss: endpoint {
+						remote-endpoint = <&usb_0_qmpphy_usb_ss_out>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&pmau0102_i_gpios {
+	usb_pd_int_default: usb-pd-int-state {
+		pins = "gpio8";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
@@ -459,3 +556,75 @@ &ufs_mem_phy {
 
 	status = "okay";
 };
+
+&usb_0 {
+	dr_mode = "otg";
+	usb-role-switch;
+
+	status = "okay";
+};
+
+&usb_0_dwc3_hs {
+	remote-endpoint = <&usb_0_con_hs>;
+};
+
+&usb_0_hsphy {
+	vdd-supply = <&vreg_l1h_0p9>;
+	vdda12-supply = <&vreg_l2h_1p2>;
+
+	phys = <&usb0_repeater>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	vdda-phy-supply = <&vreg_l2k_0p9>;
+	vdda-pll-supply = <&vreg_l2h_1p2>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy_usb_ss_out {
+	remote-endpoint = <&usb_0_con_ss>;
+};
+
+&usb_1 {
+	dr_mode = "host";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	hub_hs: hub@1 {
+		compatible = "usb5e3,610";
+		reg = <1>;
+		reset-gpios = <&tlmm 170 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&vreg_per_3p3>;
+		peer-hub = <&hub_ss>;
+	};
+
+	hub_ss: hub@2 {
+		compatible = "usb5e3,625";
+		reg = <2>;
+		vdd-supply = <&vreg_per_3p3>;
+		vdd12-supply = <&vreg_hub_1p2>;
+		peer-hub = <&hub_hs>;
+	};
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l1h_0p9>;
+	vdda12-supply = <&vreg_l2h_1p2>;
+
+	phys = <&usb1_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l2k_0p9>;
+	vdda-pll-supply = <&vreg_l2h_1p2>;
+
+	status = "okay";
+};
-- 
2.43.0

