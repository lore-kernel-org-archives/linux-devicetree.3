Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CC05592E5
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089297; cv=none; b=XyYmFpr5UpEna0b73Wc+98l48MMNXnNMSZGdPmU1yL7lPbUAEXhuYSYIRiAK4AE8ze+0097kewY1+2wm7N6EhYLsHnlDrlC9uu6CoIFhhPOZPZlT6oxFyqShjH2e0XqLSk9MTEJ8dNYgdRuubTamjQMmHT6cmJLqNNe1VOru4o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089297; c=relaxed/simple;
	bh=fdFTNi1JS574KVjsXFHOw9imMKbmWY7UN9NKmm0tCtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ojMkDmtlN8h1WFjtJha+7PA8sYolYfakItcnwIrVmAOYQPPP0rgeAFYJF9wdmxytfBrH87VQo4bYndp/UgFui4pEIeTPeAGr+fRpnE92vHLVOA2FGUigWsJSsueM+1uQVqBzOVYImzzBl7bs6wghAPLAbhc9xlzu7UDXwqNvmQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lQPwP8sz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DZGDUGHy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lQPwP8sz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DZGDUGHy"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEiqBY1584004
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tTYb9zv7p/NEnfBX/yS3A3iM4dDzvTAqnirhEeFwt/s=; b=lQPwP8sz4QZqnxif
	P+ps2FrTBW86jFnnQB+Ooynv5cIWBH31TjDMXQFTRM6H3BVMcu0BBntF5aVlvGoI
	yYwCbN0SdJi4rjQtMOvyNXdkGIDL+Xe0YQi2NZWBNtkxSksadPZcHcgSEfYSd7tr
	Q8irgx04OJlfHKslHYsXouA58yx9zwOxJ01lcJ0GX0MRZgmi2OOANWWK14gFcDpW
	2CzflBJ/JG1TJCQOivSC3uz7KWa0ZlP9OiYk5vWArLVzdVqej0Re408Xwrb9peak
	vOIAZ7J3NarzSukcMY2FX1ezRDwYtNoE/zZwOIyKEYfMZtZOdPAdD7XqlRDhXVX8
	gJ7xpA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqycs6k6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 15:01:34 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c9a55c0cbdso1260146e0c.0
        for <devicetree@vger.kernel.org>; Tue, 22 Sep 2026 08:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790089293; x=1790694093; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tTYb9zv7p/NEnfBX/yS3A3iM4dDzvTAqnirhEeFwt/s=;
        b=DZGDUGHy3LrDGT5mzmPa9KYgZAcGYwgqE6WdBYIi0bAFDksWTtr04HvwvnSICrJI85
         zHPPwljoX28Y7xzuxlNXdC3uHX3TY7XwysvJiFw5gz8/CbIatIMMGm2czqEObw4Z+pTx
         1nVSnYTj/D/XKbqZrGY5FJyR/xDX+6a2l1A+AhURHs1cwvGzKuAmUPgD8fH6ncLw172E
         BSDlWcp4DMoheh4d2sazB4lJhM2Pe+hv4uAGs7MnYsHtAOxAdM8WYQLaSBrAXcRZndbi
         DyxW+PzEQ+6qWqww0KfBkul/oAGG6uMsnVm8dqf6F620tuV9rwHq5M9txgsQO6z2tTEq
         MnWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790089293; x=1790694093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tTYb9zv7p/NEnfBX/yS3A3iM4dDzvTAqnirhEeFwt/s=;
        b=Zie1M9yelN7mLlJESb0fUKRxy+xaaeUvSafEWC4hBLeNpuKwc7TsjXClITS6Wsz+bb
         FBF/3g1R9fGa5FAnAOcqWkktOM5PcTESMivIh84UMLkMOWM6cTVF1vNbId7oBYa7CwgL
         nZk6k4ThGUwLd/j+RMlGGk5ne26suQ+88tUlFiyFvNFfSid0vL62J6+6iH1+jM/yluMr
         9GfyoOBfdfWsBXn872yGYyauYtPhvrZAqrQOkM0lUX4CYwxO3B9XTOIcEsD3keu6K+Ve
         jPmAgHIyPqPB6NFHlShUS15FOOUKjG7rqdkd7YlwYw/Bq0RfVIUczt778IcOy8gE+d+G
         KSoQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6M5zbpr0OHH9pEMwk8UqXly4yNQ30uINIExZnkQlwm8k9JpDWgrlzzdfHVEn6LOdHy6gfRmI+TjNV@vger.kernel.org
X-Gm-Message-State: AFuF++kKKf4N26fyCZiItXX8uEojnD956Cdm6fnJvOE8WwrqkkYz4uIl
	k+5EQCk2YCofyPNqCwxiLf7RVAKyWmwIaKyFtfOkKtqhD0M4Q2A1gBApJvgrrhd92SZW4mDpFBX
	tCXUXzVAO0Pw4XODjYrVh+E6m27mFL4IYT5Q0EWUjloxQ5LHl40GaAhY55QTm74mN
X-Gm-Gg: AYBFou0Az4Myevi5PC6TH1jWFuWWPowm10PIZ6yozXlYXmzEoauAK3RcfxT95d6aW1g
	9Rh+FyylFrkozhYh8UtTAEzxxWbtB/VIgv25dm25W64/DmPhu1v9HCAE0Oi5XpciGMxH7FFvzXZ
	2vjk/9gazM5XpjVzySsM85OA87zjsiY7w+awz+YWKBKiu/tGFwZv+XT46FlwAPYzcj/TgFxucf4
	Ks5IZCOru7DaVLEyRhjZFXeyLvPw8b7UF7BdrQBzH92Rg0pFKc4VKLzPwf1LcuWsgOws/F/CAt0
	4Mo8pUb98WhXA7ZO1OIi49IjxhclpSnszIGAmCdipqh1uYNtQH++QSuIkK/pS9KlGzUmYBUbOrP
	AzMRNSGMyfRBj8wKk46ftq2vwraM=
X-Received: by 2002:a05:6122:3281:b0:5c2:ac92:eb18 with SMTP id 71dfb90a1353d-5c9b58f163bmr9311625e0c.7.1790089293071;
        Tue, 22 Sep 2026 08:01:33 -0700 (PDT)
X-Received: by 2002:a05:6122:3281:b0:5c2:ac92:eb18 with SMTP id 71dfb90a1353d-5c9b58f163bmr9311556e0c.7.1790089292187;
        Tue, 22 Sep 2026 08:01:32 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5105:ff9:e148:c440])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488627929a4sm4504298f8f.35.2026.09.22.08.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:01:30 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:01:09 +0200
Subject: [PATCH v2 3/4] arm64: dts: qcom: nord-rrd: Enable USB ports
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-nord-usb-dwc-dts-v2-3-ba2b39f1a843@oss.qualcomm.com>
References: <20260922-nord-usb-dwc-dts-v2-0-ba2b39f1a843@oss.qualcomm.com>
In-Reply-To: <20260922-nord-usb-dwc-dts-v2-0-ba2b39f1a843@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>, brgl@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5403;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=cPz6Ggdiwm4cLEyRzsRwJlv++jLipMcNhAETj9sBqsE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqspg/gpcxxU07nHkOyyI6w7bU+RatDW/Ag7CrV
 gylMzSMeVCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarKYPwAKCRAFnS7L/zaE
 w6V4EACwTiyUr8Nxn7W4OoiXDpSnPKuJAcc+Gu1hZpRu9Ca2/aiHMJKJ3kaaeqceDww/++gFuCT
 w47DfTpqASjP7FHqDCVMCgs0Qbydh7qOaqisVaTBNUmbom33ashF8kb1SQm5sPoyGcbuSoVF2IN
 3k6McyCT7EHzdZ62g4rrKfsb4Sv4OE2QzuhDEuBywls72xTt9hFAWuVtp/ep0pMCY+B1t3GSu9H
 T9PLETNqMEKkYztkRj/v+2OUIvIaKvtssJnGLeoJGP/F6W1bkeXyzLNrZglHxLRlPXKdie8L6dl
 W1ELTpfjUPzUILWj1astPKvPNRMPp4vV5HzDK4LAp5D7QIKhxyb8lKRA5xWmBvqD9p4byZf2O7Z
 Yzl8VZ17Hz66Ui3FX9Q/yPiXC/zJF5eCeXbRrOsQqgUHf+ewEqD9ht0a834xECYhWByPMJ9MTKd
 kUERQivC51T3/+u3IY/xcWWALj0I8BXBPTPWgk68fAm5h289iPTl4H3GZy8kw9IHWBS06BfNlzo
 +4b9RJ59C4GaixAdyTZEk8uacAlU5ZzEINysp+N06Nk00xgnW5q0eNtko5yttjQVYH2UPzZ7ppq
 uLyK0y95A1wJB38Uju1LuoQDn84y1LTJ8x+SpQ8BbO87y3yHYecCQEtBLtJzVg4j3PVmf2evM+v
 2dM6xYY1G1aOJ3g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: _ly_HRP9chvTEFt9Nu42NjLyqILK2ckt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIxOSBTYWx0ZWRfX29CGc742owPL
 Wzx1S+yZKi+8/Rj1v2oyhcZH2Wh2WfzQKCMtqHGRH7PUgcQw/KjmDZ1JvCOaibNhvZHNnBswmA7
 VDIOZxRSn0yKOmsrIaToQ7XP5hVjrzoEr31YgojCXrBOIJMEuqmUNmcqFAZYNxZsrODuu8gnJPt
 a0XT2uUldNrUmHJmskyZ31qlTDJ0hfK/XiMz4EYbCVMDHh1pODxwmmFY4B6lqF9TTvUr3YKhhXl
 gm+jFncgZZse7zYbHnBwlScJ9WS0oaMV4muqrD2NSw+Q+jAXKzHGYKQDbuqyyQgRnN7tZmrs85K
 lV/fmWeEVg3Ver/7QcSUnpMbilaRV/Vmo51sOnMIxF7gCRaqrqI3Az+oKC4jdVnnn+A6eu9xLmF
 1FZyHX7/HS718XUN9vRrm0OudBw8+2Kz7Q7VziTLI+KX3kt7qZWSkIwHlgWTi9qcNJcnBMIxayU
 ahb5RydWmUeOGWveg+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIxOSBTYWx0ZWRfX1iTe0n3kyNcV
 O9+z6PTwg6KvORWo9NJv0Js+gfRv7Yg3DsMof+3/wJyvA8XIudSOg+N26/ITyCDb5Gqhvt50z5c
 27hlFBK7R23diUFE2oEN/f2OUe9Ddxg=
X-Authority-Analysis: v=2.4 cv=c8I+0h9l c=1 sm=1 tr=0 ts=6ab2984e cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=DIsXSFffBO_R8zc2K-IA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: _ly_HRP9chvTEFt9Nu42NjLyqILK2ckt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220219

From: Shawn Guo <shengchao.guo@oss.qualcomm.com>

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
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 166 ++++++++++++++++++++++++++++++++++
 1 file changed, 166 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index c547963371b4d05fad1028655a49a9f9cb952f64..46f6913b5808a4f230d61ed6de35efa6b4addca9 100644
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
 
@@ -459,3 +556,72 @@ &ufs_mem_phy {
 
 	status = "okay";
 };
+
+&usb_0 {
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
2.47.3

