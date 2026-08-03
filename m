Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C701312826
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 13:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785763683; cv=none; b=RT0sExowo3WEEb1D3W4j/lciSfWt79Ikzwdr2urtm6kr/knFH5USEZ3u95Kt0SGwRkIcb/UTU3Loey5G6/Npnpxkh9DLv9rSFPDLiK5g4SPpG+47wSRkwjhy9nBdqXtdsQsb3rwa9Z91+XiXe5r7sw6OUuSbVw5zdp6z3VUBCxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785763683; c=relaxed/simple;
	bh=yCBoC7BHVElBvtf50HxFBrlW0nr9DDZpIz6Dih/OBHc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QRNEOvibNppvhuC6zJCAL6qWIyaYuqTY9johhrEMKgwLOkLBEhfMiAUJKa0szRh7CrGBeB3VSCrrLhQavQeUjip3qeDuDyEbmM7P8NSW6H9zHKm1Y4r7RsDDH055I38xCwJa/0vI5NG2KU/NlVGlzRZCtIIybN9EQhm6cwPL85Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A94e8Ccr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AiN2x77q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A94e8Ccr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AiN2x77q"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673DRTKq1250228
	for <devicetree@vger.kernel.org>; Mon, 3 Aug 2026 13:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Xf1cd4ocud1VtJ89eIHqhsx/lFHjRi+JfKS
	LseOT2qc=; b=A94e8CcrWd7TAlkwi/3AZjQn0PCzC48dZXADOwO00kGx15BXYhk
	elHzizgs2qhL+iksK/6reuVN5GHSOW0kIpkPHujl0txMz7iPr9kSzpomPlQqba6R
	DvCizW7vx4a72YFBIb2tBwgGDwNg9uqhks8fKXGMv89XEspkVjs2TVmebkGu94gB
	2yXVF8Pw7Vdc1pOdi1SdFCppZjqEod6L0NDRoc3RV4FneVuvCOhOLGI4vZ9rM8uc
	63D6G8GR8LfhnTuavjsqXDTTDxKicaX9q95LzdTY70T2a+9BYCjivdOAQ2Pdr8q8
	o8Yd4cA8eFBeXxKs5CKjTpfnHy79tMXw/4Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrd9q3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 13:27:57 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb835525b10so4524757a12.2
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 06:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785763676; x=1786368476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xf1cd4ocud1VtJ89eIHqhsx/lFHjRi+JfKSLseOT2qc=;
        b=AiN2x77qbbx4AGPxNCXC05lvZnf/pzzMKDfkmb1BfeBursrr6KdecUBPy1KlNRNByB
         OufbR4r2VYfU4v5s8PdVPQ/nii4dsH8ylpiIV5VYbEyYoEl3b3nnRgJ/5S6Ptj/MC4Ey
         FlHRy4jluv3LbjCE1HcyHnQkgy1VmQArSTlEChhgeIiWiybbj0S8zjVt0w/g2WMHuo95
         FaxNSUfFPZ8r7SN2utCPyS/kZzarbr0DA4W80naVsJ8XqcentR7Ro0MMsG5FCMTXkVtM
         Xb9i50D1Cj+wt1XP6bR+/dP3W6NBzGXSkLN84GXXpGWTA28enx2U2iza5f54KtUVefU0
         hxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785763676; x=1786368476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xf1cd4ocud1VtJ89eIHqhsx/lFHjRi+JfKSLseOT2qc=;
        b=guYCXh2tOcOF+Jh3mWDe1s6ecS7cJlR3Ll2u3zvxKK3Z//75VuBuug7sB2aV1R0rHj
         ggTSVkLEqECcoulfRIfhrE6nMC2ZZcmVK4o1okr4V6iQJ8/eQxDZ/fUlQpMoGOTt4SUe
         xuBEanZwq3bETxWK12EjWOwcakWYKFLELxMO0IrMAQHu/Y4XrQsvMybqCXvPdO5zOAXY
         +7f7QBRp5Se6d0BOI5xTiUJm1WdKnsXkR3egLd4K+HWOSA3EsNs9z+1cOJBLjEIIKE88
         0+K29qWvVbAr30CwLexuTe7jCe1o6obxjxa4sMbPv226+0JbnqXg55CeUsxEQ/kqkWlf
         3Ibw==
X-Forwarded-Encrypted: i=1; AHgh+RqBw2Ou/boev/l4LCL55pUx1bJmHWXh9evzmHo3lPMbrklWeK+SM3JMC1DSG7+vqjFxxYxU+wrLdvdN@vger.kernel.org
X-Gm-Message-State: AOJu0YwP3U/i6pLSOj1cLov+pwVIP+EDSc/WSx/skzAyk0hqbTIhMt0U
	vOH47Cf+vdBWgQDQglqqcu2FHrK7rcdiQ7IdqLHWqnk75p4Su+ZtULs53BxKM+pALpdM1axVkHH
	w56Rldgdj9dWm2qC5U6X1pzfxLmgL7SJ2uQgXA6CFR3hPvxunhDd2+JNsH/hdhqtB
X-Gm-Gg: AR+sD12TZs6gqKU9PA/1/6DhdSlcOtbCO3uv1RCQOmSD8OnzcS6PgLOE6eLRQcxtiEJ
	NP65wgx2qBMRX+GO6cfQeLt/FLaJhonpGfVnbvGtR+6JephQ3cSwqNkGkaMzRSBcJWEYUmAqWpr
	kY7OZFZ5sekNWiISW8W4pfQlgDxa0UxxkEz/uMqTrpJ8L3O3a+NSSuUAD93YFlyY2AiYwmNqTWT
	WjxXqCiXhB0ikzFqjPLSXDXROAjewVlB1POBLYtH9Hzc3bT8+3geXOl5z24bq1L2yBqj3K85FYD
	94V8QPaAhugodLB8TxX7/iTnzxR+kpEj4M5i96oxgJYhChv6hDD46ldUjvnZGRH8PW9XS1iSetj
	FOD2IoeDnOpNwcqNBrRE7kchRl8F9+AAf/JLTHgSXP7xGgg==
X-Received: by 2002:a05:6a21:9985:b0:3c4:46ca:3347 with SMTP id adf61e73a8af0-3c92a517628mr9857787637.2.1785763676392;
        Mon, 03 Aug 2026 06:27:56 -0700 (PDT)
X-Received: by 2002:a05:6a21:9985:b0:3c4:46ca:3347 with SMTP id adf61e73a8af0-3c92a517628mr9857760637.2.1785763675948;
        Mon, 03 Aug 2026 06:27:55 -0700 (PDT)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab050d8csm51766483c88.0.2026.08.03.06.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:27:55 -0700 (PDT)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, xin.liu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com,
        Guodong Xu <guodong.xu@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: switch typec0 to PS8830 retimer
Date: Mon,  3 Aug 2026 06:27:47 -0700
Message-ID: <20260803132753.994619-1-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEyMSBTYWx0ZWRfX7qub6l9/I7ni
 ZRaccID1OyAhPc4aZv0X5zM3Xvk06FDLknzXmZqAHylG12gmsQSwv34DQKxMLs/S66Zg3I0bjq4
 ukenGzj452PngMJyXv/S4qsK/p6h1pc=
X-Authority-Analysis: v=2.4 cv=f/94wuyM c=1 sm=1 tr=0 ts=6a70975d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=8LwbUeallTqhS2w2LGoA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: _Lk43-L7okKeD6kJpnYEu0nzUQ3hmhxx
X-Proofpoint-ORIG-GUID: _Lk43-L7okKeD6kJpnYEu0nzUQ3hmhxx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEyMSBTYWx0ZWRfX2yxt3MkZBvvU
 VZJ/niq+h9gVIA1pwrafwRkv+7WSPIGCAXcuzfRnqtdJAWLzfiZYihSFM9IsvK+XBh3R/M3KyDp
 49pWwR669P4N6r375jpXAKV/7aDz3mXPwezOwSrriaWOVWsIbs/1YCWo3kEp9lpAnRiXE7MbfVx
 PTbWNLbGNXm5L7VdULMm8vr27uqgZpD5H4dq9UBLomyNSA2xYI1IM5G8SbNAeo588rSH5cP0WKi
 b4sBtZWFv8Jlf8UBh0eyPjqIxAv199X6xr47bl9MZTAZMR3vV+mJb7UO4eoU+i8Q/CwEK8Ldhh2
 1GetlQh0bGroGVsrafH+3mLNQv9VZQvUC2BHUoQIcjpAGVUmx28uPk4e1wMbSCi5bgYSCEztTby
 9a9GA6NF9gD+RfhK0AdydUosK6NQiIYBgQr7enjqKfUqzN+eLdiQXZqhp8WVDTg0BRL1kXduA9J
 6O4wUzTo+hRTMa6ROAQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-08-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030121

The Hamoa IoT EVK hardware design uses a Parade PS8830 retimer on
I2C3 for USB Type-C port 0. Describe the retimer and route typec0
through it to enable USB 3.0 SuperSpeed and DisplayPort Alt Mode.

Supply the PS8830 from the existing vreg_rtmr0_* rails and remove
their stale "Left unused" annotation.

The FSUSB42 SBU mux chip is present on the PCB but with all signal
lines unconnected (NC), so remove the fsusb42 node and its pinctrl
group.

Tested on the Hamoa IoT EVK:

USB 3.0 SuperSpeed at 5 Gbps on typec0
DisplayPort Alt Mode on typec0

Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
Changes in v2:
 - Clarify that FSUSB42 is present on PCB but with all signal lines
   unconnected (NC), rather than "won't be populated"
 - Add test results (USB 3.0 SuperSpeed and DisplayPort Alt Mode on typec0)

Link: https://lore.kernel.org/all/20260721074145.1534100-1-xin.liu@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 108 ++++++++++++---------
 1 file changed, 60 insertions(+), 48 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 9fa86bb6438e..a3ca22f9c3e8 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -126,15 +126,15 @@ port@1 {
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
@@ -303,7 +303,6 @@ vreg_pcie_3v3_aux: regulator-pcie-3v3-aux {
 		pinctrl-names = "default";
 	};
 
-	/* Left unused as the retimer is not used on this board. */
 	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
 		compatible = "regulator-fixed";
 
@@ -658,25 +657,6 @@ platform {
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
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
@@ -793,6 +773,62 @@ retimer_ss2_con_sbu_out: endpoint {
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
+		clocks = <&rpmhcc RPMH_RF_CLK4>;
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
 
@@ -1458,30 +1494,6 @@ usb2_pwr_3p3_reg_en: usb2-pwr-3p3-reg-en-state {
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
@@ -1578,7 +1590,7 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss0_ss_in>;
+	remote-endpoint = <&retimer_ss0_ss_in>;
 };
 
 &usb_1_ss1_dwc3_hs {
-- 
2.43.0

