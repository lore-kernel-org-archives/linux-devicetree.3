Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1346242A175
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380764; cv=none; b=khhqQJnVmNVOHJ3i/ivSh3puMh8rHHthdw0I+8HDJXaeXHiyUbQsdjTtQjSftGI0tAM2J+N205nmyeu9/JRk1oYxLKskSSTxMXSXLxRwMzQ4cme+dJ7FXkreg8b37+RbNwMHLUbAWk/2V+zhQTVrg9Ye3HeJokuiRQLppDFf/Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380764; c=relaxed/simple;
	bh=Fu28UbyxzjDPNZJKvrhaDpt8VOyhtW+O79q4STS49jU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UUM3M+H9AptcHG5dI3/fyvVClHcwXhtpzgfoYfoDoX3zVXXqK0n4+i9DlD8BKuZsnFPJnoIOrb5HdJeXQQvwg9rI8+GMaKpnqf3xWdxXWvwqMfNvel4FThaUbWfwfSvvGKEH6DJy9JaRa3HjrkeZtFETmgGG0YzDh+QMlr99fxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OaKwmwa7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iDWhbMqF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OaKwmwa7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iDWhbMqF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nNeL247387
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0nEY/GZceuR
	pm+/tBc75KsRba6MypvhCQ5MZoRctDrw=; b=OaKwmwa70U3nLnGOSKVEfIoPern
	kz7/+7rcRplTX0b5Yh0cPaY9fzNswBIupkrz+y29hSeh4XW+5f8CW0a8YBINSacS
	/5TtwjHII5NH3yD3XeubQ0OMRUZSRaNXyGOmLBq0fOGsKUv972AMw1T3RfKMjF2G
	54vKgdglBzC34ydNsvex1N0wew+MQ9t1+uz4sY5Hu4DtKxgBfGsuQd3M/uuy8ipw
	JpHueB0Pd5dPDnH/qvPtmtBVs23tzO6hQpN6r4nbcTXSB26HNUul2qjQVGBibigj
	Lyo1AnLgA5ijzZ3U+3KWdTUACtKwXT6rjkS+lKQ/8ZM+d2we6jfUJcvFS0g==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs84ba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 10:12:42 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4c307941971so4380427b6e.1
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 03:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789380761; x=1789985561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0nEY/GZceuRpm+/tBc75KsRba6MypvhCQ5MZoRctDrw=;
        b=iDWhbMqFyUf7q5YBFCzP6X4gEZt6ajmSQgA9thO2F/FHHsJVlDtYmhN8L0wDoe4JOK
         kHkGDHnLWpeRUH1VOKqHZKiHQ6V9xKb+9+5cIhkNvJs7SLdcvNOJ3Fc+cF/+030miMmR
         9Xb0IcDcCUibc+xh1BjLnK3ZSUbZji9iWNFVYxJ6es1CipqQsJcPzNfPzLetAgo+mYps
         6jfbhPbnhkpKEzoD0lBfLRSOawvzXTMg+3pixQI9Jw/ubUCd5ZfleSJ2bPf+uOSnzZ0X
         bhwDmaAKJo45HS+vtrSl4cTeeos3gKrP7NQkKRG7irqH6wY3tm/KFTK8O87yjp9Jt/cT
         FXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789380761; x=1789985561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0nEY/GZceuRpm+/tBc75KsRba6MypvhCQ5MZoRctDrw=;
        b=lz70fiQ3ExFwz8qdz/rBd+lpXC/kpPjPG36YaeM1hzmb+enBdxzm3WLzLaQSy568TD
         N1U0nTPbMZ879zw51xw5ovVi9dnUY3M9t1z0PRMb4IcU6rhPTwaEiaBbEGFHvW4GbT76
         oNbFAzHnItqEEq8smpGLuLajBXtzDxkB+PRkm2Ir72ulIZ9Tygy60VxdV6ucqAL63uOO
         nhPXOya4/C0QyzdQueV97iloEUifPpKs14ViSexlCwtKBYSZu9uEqkMVIjFiYwkANp30
         2QPimpcWygVm5/0h23GTX0/fOFjBS+gLMsCQ9iXWh+xV/+tXl/yAznQytInY1bvar5fM
         XHcw==
X-Forwarded-Encrypted: i=1; AKwUvByC44mO4tTvRl/AV0JPX2MslmOtdLtsJzL2FKpPOxr96mnFBdtqBj6Vzs6l4jD6ZG5F+MIskXqRRVMa@vger.kernel.org
X-Gm-Message-State: AFuF++nuxjpUaXcHJms+ihNg1S+pX44sa1d0fJiSqsOhMJ7cjQeol9lW
	wwwpNesM5kbjArh+Vk/hep2n1yA8Y7uIS98akpHmACA3bkbRWsUc2VOfkAa+DVyy4pVA88GLK2Y
	tl4N4QYRX2nu3Dc8a30IMpKq7Sj21Q7rYWMCIp0O0jKMEDG8bVA0iecTc6y1faSyX
X-Gm-Gg: AYBFou2Wg6T8STg43RW2WpSQnG+mr190AWguD672UbrM6QP8qnoe94y5h3crA6mj5q9
	fP8Cs5xmqIxCXxm/6xfY33/v9xuAjtHN1bWwrsQoUigER7MY+ixMdR48XDjBG/YjGdkESHdhSJ6
	4KHADyzcVQh9AeMYrcNEClryyt8BHn/aKsXy6A5J59uGaGx0ZA5/0jzdhCb8wWE+PFB7F73kzcF
	Pg4bopDqJK124MXOaNUg/gPZXWPZgfvdEg+TJW7/X4XfIV31VAePf+8/t8ketDs5DUgnq2QRrOX
	QmE3rJ9oR+cEZYPHHwcp0GiLV6DqxPPiWYji5Qd0P7t7Bti8wwrCSE5lunsVQig3YV2/JrxENMw
	8axJwsp5WMRimOi9SsGkIqlP+IykLHI4CYm/PO/aHAi2m/A==
X-Received: by 2002:a05:6808:190c:b0:4c4:a240:9c3a with SMTP id 5614622812f47-4c7b2df8cf3mr1291003b6e.4.1789380761386;
        Mon, 14 Sep 2026 03:12:41 -0700 (PDT)
X-Received: by 2002:a05:6808:190c:b0:4c4:a240:9c3a with SMTP id 5614622812f47-4c7b2df8cf3mr1290977b6e.4.1789380760977;
        Mon, 14 Sep 2026 03:12:40 -0700 (PDT)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed64fcsm29020697eec.16.2026.09.14.03.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:12:39 -0700 (PDT)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, xin.liu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com,
        guodong.xu@oss.qualcomm.com
Subject: [PATCH v3 3/3] arm64: dts: qcom: hamoa-iot-evk: switch typec0 to PS8830 retimer
Date: Mon, 14 Sep 2026 03:12:30 -0700
Message-ID: <20260914101233.981643-4-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
References: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfXyuIvBYLx7ifn
 KXCnInpPywjLMJXcMxFG2E0CIFmcJBDEQiZ37NCa6itPtrEqwFDVptgl/EMlcqWMVdR2vES2YeO
 9UUREZTfj34LNUWkN3sYDlpk5tLkc7Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfX28OW73Y7alul
 0i3rtLgRin6CPkguRPIo0mUAHDpx30H8YfucP1Z8gfaPDF5jQPUd1LTyg1VK7sX7m3m0edMKhZa
 /1TBqJ5xZ/i7nz2pxIxVkYu1Wmm1hrWk4UZqfua7k8QH8EDJ3NnHI5D7MXzgN4Ajje3Q1wzKmVd
 O1PELfdYm/QJBcZmB+K1fWIE/1XSYfa3+AWGqOm2HDNuxRxZrPMa2u5qugwq/o+/8wNc0D99lyJ
 hBEiKS7ZIL/puSmY8EPwUWsGIKxbuC7YzNKdeY5kd4GiiNua4NopfLqMlJQlWKMbhHqcQdy9I2f
 /FmC1tpTWIoLN6FZfsFfA6bpspv9PjbX10WfQjuZM+YRedhnG9KOfpRB5BZT/3V9reMOTvsQ7wf
 ApXw/87MITg/XCGitvpjGw+2YlZXI9eF/4UVBUud4FIZ4YEAjScqJLDRtGYQtWwpcZW8ge/tVFV
 dbWHMX+qNHje4gFrK/g==
X-Proofpoint-GUID: by7hQcxjDlgvbktc1WisBe_3L2lMtH09
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa7c89a cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=8LwbUeallTqhS2w2LGoA:9 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: by7hQcxjDlgvbktc1WisBe_3L2lMtH09
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140145

The Hamoa IoT EVK hardware design uses a Parade PS8830 retimer on
I2C3 for USB Type-C port 0. Describe the retimer and route typec0
through it to enable USB 3.0 SuperSpeed and DisplayPort Alt Mode.

Supply the PS8830 from the existing vreg_rtmr0_* rails and remove
their stale "Left unused" annotation.

The FSUSB42 SBU mux chip is present on the PCB but with all signal
lines unconnected (NC), so remove the fsusb42 node and its pinctrl
group. The chip is retained as a hardware fallback: should the PS8830's
SBU path encounter issues, the FSUSB42 can be activated with a simple
rework, avoiding a full board respin.

Co-developed-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
v3: Replace RPMH_RF_CLK4 reference with a fixed-clock node; split off
    clock fix into a separate patch (2/3).
v2: Updated the commit message to clarify that FSUSB42 is present on
    PCB but with all signal lines unconnected (NC).
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 114 ++++++++++++---------
 1 file changed, 66 insertions(+), 48 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 57c8ae2e7d4c..a4a2a1fccf11 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -36,6 +36,12 @@ mcp2518fd_osc: clock-40000000 {
 			#clock-cells = <0>;
 		};
 
+		clk_rtmr0_xo: clock-rtmr0-xo {
+			compatible = "fixed-clock";
+			clock-frequency = <25000000>;
+			#clock-cells = <0>;
+		};
+
 		clk_rtmr1_xo: clock-rtmr1-xo {
 			compatible = "fixed-clock";
 			clock-frequency = <25000000>;
@@ -138,15 +144,15 @@ port@1 {
 					reg = <1>;
 
 					pmic_glink_ss0_ss_in: endpoint {
-						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+						remote-endpoint = <&retimer_ss0_ss_out>;
 					};
 				};
 
 				port@2 {
 					reg = <2>;
 
-					pmic_glink_ss0_sbu: endpoint {
-						remote-endpoint = <&usb_1_ss0_sbu_mux>;
+					pmic_glink_ss0_con_sbu_in: endpoint {
+						remote-endpoint = <&retimer_ss0_con_sbu_out>;
 					};
 				};
 			};
@@ -315,7 +321,6 @@ vreg_pcie_3v3_aux: regulator-pcie-3v3-aux {
 		pinctrl-names = "default";
 	};
 
-	/* Left unused as the retimer is not used on this board. */
 	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
 		compatible = "regulator-fixed";
 
@@ -644,25 +649,6 @@ platform {
 		};
 	};
 
-	usb-1-ss0-sbu-mux {
-		compatible = "onnn,fsusb42", "gpio-sbu-mux";
-
-		enable-gpios = <&tlmm 168 GPIO_ACTIVE_LOW>;
-		select-gpios = <&tlmm 167 GPIO_ACTIVE_HIGH>;
-
-		pinctrl-0 = <&usb_1_ss0_sbu_default>;
-		pinctrl-names = "default";
-
-		mode-switch;
-		orientation-switch;
-
-		port {
-			usb_1_ss0_sbu_mux: endpoint {
-				remote-endpoint = <&pmic_glink_ss0_sbu>;
-			};
-		};
-	};
-
 	wifi-bt-connector {
 		compatible = "pcie-m2-e-connector";
 		vpcie3v3-supply = <&vreg_wcn_3p3>;
@@ -759,6 +745,62 @@ retimer_ss2_con_sbu_out: endpoint {
 	};
 };
 
+&i2c3 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	typec-mux@8 {
+		compatible = "parade,ps8830";
+		reg = <0x08>;
+
+		clocks = <&clk_rtmr0_xo>;
+
+		vdd-supply = <&vreg_rtmr0_1p15>;
+		vdd33-supply = <&vreg_rtmr0_3p3>;
+		vdd33-cap-supply = <&vreg_rtmr0_3p3>;
+		vddar-supply = <&vreg_rtmr0_1p15>;
+		vddat-supply = <&vreg_rtmr0_1p15>;
+		vddio-supply = <&vreg_rtmr0_1p8>;
+
+		reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&rtmr0_default>;
+		pinctrl-names = "default";
+
+		orientation-switch;
+		retimer-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				retimer_ss0_ss_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss0_ss_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				retimer_ss0_ss_in: endpoint {
+					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				retimer_ss0_con_sbu_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss0_con_sbu_in>;
+				};
+			};
+		};
+	};
+};
+
 &i2c5 {
 	clock-frequency = <400000>;
 
@@ -1413,30 +1455,6 @@ usb2_pwr_3p3_reg_en: usb2-pwr-3p3-reg-en-state {
 		bias-disable;
 	};
 
-	usb_1_ss0_sbu_default: usb-1-ss0-sbu-state {
-		mode-pins {
-			pins = "gpio166";
-			function = "gpio";
-			bias-disable;
-			drive-strength = <2>;
-			output-high;
-		};
-
-		oe-n-pins {
-			pins = "gpio168";
-			function = "gpio";
-			bias-disable;
-			drive-strength = <2>;
-		};
-
-		sel-pins {
-			pins = "gpio167";
-			function = "gpio";
-			bias-disable;
-			drive-strength = <2>;
-		};
-	};
-
 	wcd_default: wcd-reset-n-active-state {
 		pins = "gpio191";
 		function = "gpio";
@@ -1524,7 +1542,7 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss0_ss_in>;
+	remote-endpoint = <&retimer_ss0_ss_in>;
 };
 
 &usb_1_ss1_dwc3_hs {
-- 
2.43.0

