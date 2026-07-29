Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DB8444706
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785320870; cv=none; b=LKSMdYBfU4vB2X6HsY5fCzIQPqmSTM1h1OjbddIF6zYt9PdP8FRvLmp+hAi/0NCqOae+RWOWSvTS5jDdW9UxLOFX/nm8iD1613elWh9SH0BFc6VeA9TOZaDmcREgv7OreRxQXM/ZtESUh8ctODHKO6yz+1ExP9BrzVhUHmcPWOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785320870; c=relaxed/simple;
	bh=qAYoyP+pPP7eZDuSytpTJCmFQs2DJRNvaK9uhyQU3E0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ABFT0mfdBhg6hUrBzxKZNINjuTk7Ppv2RWdCZJ6RotDkfs6fOVMrcOP8Jl2wcl1AjDdU9ldl3gmETCSzKuxwnRymHvPOPFol4GtPhe6pMvcZOR/S4AbNHha60JlNpj1tG3/w8/vcvdWwQcT4EEIOQxqfPql0DCPwTl7zdLgVp3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmroLBxB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YZobkHST; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmroLBxB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YZobkHST"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T7f3iA1309770
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MGjHYPWSAqlU3qMkzc1rPYo+YF4ghABRIYUlxbmHTZQ=; b=cmroLBxBHPyZHLJ/
	QniOkIFl1W0FEliI4tMMXHlDBlkqOe92eio2VitmGNoFnEg3qR8R/f1T5wDCbj1Q
	FJ4SPpFWUDpjhETMDNDN0vTCT7tFeNoC4oL8HnOgHie2TaeMNl2R9tzVDeF7MZn2
	TpjlDIgqv4MvLi7M/rzEyJmwrZpoWnUR/XlUSKEtsrB5G9+XnM8YpVTjHIrNldcS
	UJupPOwndB2R7dMg1u99kfwuslnvFtYcnHO/crhhy0w2nkpj8YU618i2M5OrCY0R
	6bws5xsmeeDVfjhW+anfg9wvzDEPJjjXZ7M09sOzX6mWs+Y+ji+ywXSdpdZr/swU
	wv/FgQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqa331g4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 10:27:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dc0eee75dso185850a91.0
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 03:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785320867; x=1785925667; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MGjHYPWSAqlU3qMkzc1rPYo+YF4ghABRIYUlxbmHTZQ=;
        b=YZobkHST0DRmbMcN/lU6ZRGMbFI1v3qX0VNKAfYiEohaIfs7aGhi34hmbAlOmQfjFA
         dUQZTjjjfzpVov2LPKJBIl8m5omadFVFROV3uDov3LIKudxCKxQsVfyfwNEoMSbWBddy
         +59YcdtzFPtoP7UqlEwdHMyUl9Pov+s/eXRS5YOs1nQMgkRoPV/mTW29vFtcqLYUr+c/
         yX3SwKJcD8ETnx+W/l3ezJDidS6Ahg1v0i0kP0enN67NK4Z4KlbJGugV/RFEYkQvfERt
         l9OUHAcVhFfFWJnDVf0iQjf46SRM2uLge+GP41Zliao9Klx6VXj+FEUCX6F67YYQExMM
         3xjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785320867; x=1785925667;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MGjHYPWSAqlU3qMkzc1rPYo+YF4ghABRIYUlxbmHTZQ=;
        b=CnCetcHOIYeJotvQ1GA4SV+AYtCV8Qx7Uona1I3my87uOahV6Bms/zaCyO4hd21ErP
         sfeAMLqYjoTtPGoI7QR7tZauiJOB3Vmqoo1fNQ/Wk21SRUvWYdgAuwrPg8Y67QVvFfWv
         SkuRoQB4JkX//NqTXCQtmZIYX4hlBlmr4qmw9HeAfKNUf+iG48XElDf/vJsg5XJK2NLx
         qm1MaPSMVD7gva7oeqT2umUH4bSNfX8JdkJheA1pqMx+/FxhsoKdkTqiIKOc4/Qzmq1y
         +hhzRVT2Of53/cePhUiWNfjKQ90FFg4Z0nwjQ0JoKtfx9SAEVk/Ma65iURh/LNrlOAZN
         4ZBg==
X-Forwarded-Encrypted: i=1; AHgh+RrHrhVtBQ6gQCFlFe9947Fq4Lr0UeI+j702PbaoinoL+SwhuLtb+OCgnZAJgNGUk2XiLPowxprDdDeV@vger.kernel.org
X-Gm-Message-State: AOJu0YzWaXafm7OnyeNFogZGfnA6QOjJkbuE/VM7PbkSkfjTAdx7ScoJ
	jgLASr8ZhAdJbapIZHqlBjDj112NROhaMaZvlF4sh1r5itfJQsuAIWN9xnParr2eZAAWRAtSS6y
	ze1VR4NeXBj0YFnzHQjusAe6VRzf0SDBH/T101fkqKKTEuXzdeU2cxgtWXy81RwRL
X-Gm-Gg: AR+sD11eEoZc88RFBYQd6qNc1CWjRDmR1INhP4/UpuOtueYyoQqEhJFu0qyp6j5xN73
	IrLczuGUbpCV7vvdI7SLK9UhCMD0cW5Hk1I7JUsV0tC/fhkTabY4pIcBP+LToAlz+vdlDCrfa9W
	5yFlRtRdEAPaBIJuH6jNnD1IDtOLGCzIyMGCZYZ/I/hsM/IGXJO8VvReqvz1Omu0q9LwT7JoJzJ
	/v367ZGme986IezczPYEYeTgkzM7dA09wfnajl5RqpEVd8QsOrLV28OGlH5pbRn0nxUNP+9mrnb
	7XenkviW+CYywaLnweCbPIZJjiBs7YVHiDJAjG0OmLzfDxaDlDbnoVJkby73DIj0gmvb1q1xF7K
	2cynXWtx1pFPGCkAj6RMM3JBQrU7obB3H/bpYPAvIrqAULbe9h4w=
X-Received: by 2002:a17:90b:17cb:b0:38e:55ec:e436 with SMTP id 98e67ed59e1d1-38f6a0b11f1mr5477351a91.0.1785320866764;
        Wed, 29 Jul 2026 03:27:46 -0700 (PDT)
X-Received: by 2002:a17:90b:17cb:b0:38e:55ec:e436 with SMTP id 98e67ed59e1d1-38f6a0b11f1mr5477321a91.0.1785320866244;
        Wed, 29 Jul 2026 03:27:46 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f7f0ed10csm1121477a91.4.2026.07.29.03.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 03:27:45 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 15:57:27 +0530
Subject: [PATCH v3 3/3] arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe
 M.2 Key E connector
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-hamoa-m2-dts-v2-v3-3-4d7ef9274575@oss.qualcomm.com>
References: <20260729-hamoa-m2-dts-v2-v3-0-4d7ef9274575@oss.qualcomm.com>
In-Reply-To: <20260729-hamoa-m2-dts-v2-v3-0-4d7ef9274575@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Chen-Yu Tsai <wenst@chromium.org>, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA4NiBTYWx0ZWRfXzeqmWYaKQ850
 QAVKd2YSQnMbEAu8qrUsIKgvGByQ6nW7heTOWxx2dmamobvU0aY3ukhIfTtxFTl5aiMAl124jtL
 MI4vntIb8xurIFEoCd1Dau6JOFoMu23OJPdyHZagaifZSwLu5cueckMQHG0pnDk7lCTaxND+eJT
 Zqktega8hwE2sxM+TMkl6tCT7zQcf1Gqi6lLX7YbLbfZISydgUBIh7p9vz21pW2aiQPo4Qyr7LR
 HsmnHEirpLJNJ17g0ilL8tIPEanWP6+pfLqBUYZHfNyqkM6NRF6VwSrWOo0Q9vSvMPQL7vDHewV
 LrdFdP8Mvqq2gAeEhI0LZMT/gfNKIEOabECvelyNbKf9mwv2auQ9ZzV3xYsxSea3c1akxRrrhPk
 VV0hpdRYvGMkpe7Dq11Bf/4qv9vZgGxbRUWgNRH/3MyHOx16SFzMQ7+kRny389fDvcRklLMDua3
 kCfsC2Bf7q8yX7p3vtg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA4NiBTYWx0ZWRfXwKB4cFb3yjHJ
 3PGRn6C+rC0u6yf7yNQOqGbVrWXcM+ehVxmCBJt2M3HjMZStX9P06vu7WGUAc8K6xYUShbQjbR+
 gPCSE3zIvZKJx15etMEFmOi8qUEab/I=
X-Proofpoint-ORIG-GUID: JJrkyBIFbxLlfAmrs_s3I-RMoy078zNO
X-Authority-Analysis: v=2.4 cv=Ap/eGu9P c=1 sm=1 tr=0 ts=6a69d5a3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=maK4k0u04xuWkcZLn_MA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: JJrkyBIFbxLlfAmrs_s3I-RMoy078zNO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290086

The Hamoa IoT EVK has a PCIe M.2 Mechanical Key E connector for wireless
connectivity cards exposing Wi-Fi over PCIe and Bluetooth over either
UART or USB, depending on the card variant.

Describe the connector node with:
- port@0: PCIe for Wi-Fi, linked to pcie4_port0
- port@2: USB for Bluetooth (USB variants), linked to usb_2 port@1
- port@3: UART for Bluetooth (UART variants), linked to uart14

This allows the pwrseq-pcie-m2 driver to manage card power and
dynamically create the UART serdev for UART BT variants, while USB
BT variants are enumerated via the USB hub pwrseq path.

Remove the chip-specific wcn7850-pmu node, the static bluetooth
serdev under uart14, and the wifi@0 PCI child node, as the M.2
connector approach replaces WCN7850-specific power sequencing with
a chip-agnostic model.

Also remove the now-unused vreg_wcn_0p95 and vreg_wcn_1p9 dummy
fixed regulators whose only consumers were the wcn7850-pmu node.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 170 ++++++++++-------------------
 1 file changed, 60 insertions(+), 110 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 9fa86bb6438e..34e3fb9bbdcf 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -479,32 +479,6 @@ vph_pwr: regulator-vph-pwr {
 		regulator-boot-on;
 	};
 
-	/*
-	 * TODO: These two regulators are actually part of the removable M.2
-	 * card and not the EVK mainboard. Need to describe this differently.
-	 * Functionally it works correctly, because all we need to do is to
-	 * turn on the actual 3.3V supply above.
-	 */
-	vreg_wcn_0p95: regulator-wcn-0p95 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_WCN_0P95";
-		regulator-min-microvolt = <950000>;
-		regulator-max-microvolt = <950000>;
-
-		vin-supply = <&vreg_wcn_3p3>;
-	};
-
-	vreg_wcn_1p9: regulator-wcn-1p9 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_WCN_1P9";
-		regulator-min-microvolt = <1900000>;
-		regulator-max-microvolt = <1900000>;
-
-		vin-supply = <&vreg_wcn_3p3>;
-	};
-
 	vreg_wcn_3p3: regulator-wcn-3p3 {
 		compatible = "regulator-fixed";
 
@@ -538,6 +512,55 @@ vreg_wwan: regulator-wwan {
 		regulator-boot-on;
 	};
 
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vreg_wcn_3p3>;
+
+		w-disable1-gpios = <&tlmm 117 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&tlmm 116 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&wcn_wlan_en>, <&wcn_bt_en>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie4_port0_ep>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_usb_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&usb_2_m2_ep>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart14_ep>;
+				};
+			};
+		};
+	};
+
 	sound {
 		compatible = "qcom,x1e80100-sndcard";
 		model = "X1E80100-EVK";
@@ -677,66 +700,9 @@ usb_1_ss0_sbu_mux: endpoint {
 		};
 	};
 
-	wcn7850-pmu {
-		compatible = "qcom,wcn7850-pmu";
-
-		vdd-supply = <&vreg_wcn_0p95>;
-		vddio-supply = <&vreg_l15b_1p8>;
-		vddaon-supply = <&vreg_wcn_0p95>;
-		vdddig-supply = <&vreg_wcn_0p95>;
-		vddrfa1p2-supply = <&vreg_wcn_1p9>;
-		vddrfa1p8-supply = <&vreg_wcn_1p9>;
-
-		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
-		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
-
-		pinctrl-0 = <&wcn_bt_en>, <&wcn_wlan_en>;
-		pinctrl-names = "default";
-
-		regulators {
-			vreg_pmu_rfa_cmn: ldo0 {
-				regulator-name = "vreg_pmu_rfa_cmn";
-			};
-
-			vreg_pmu_aon_0p59: ldo1 {
-				regulator-name = "vreg_pmu_aon_0p59";
-			};
-
-			vreg_pmu_wlcx_0p8: ldo2 {
-				regulator-name = "vreg_pmu_wlcx_0p8";
-			};
-
-			vreg_pmu_wlmx_0p85: ldo3 {
-				regulator-name = "vreg_pmu_wlmx_0p85";
-			};
-
-			vreg_pmu_btcmx_0p85: ldo4 {
-				regulator-name = "vreg_pmu_btcmx_0p85";
-			};
-
-			vreg_pmu_rfa_0p8: ldo5 {
-				regulator-name = "vreg_pmu_rfa_0p8";
-			};
-
-			vreg_pmu_rfa_1p2: ldo6 {
-				regulator-name = "vreg_pmu_rfa_1p2";
-			};
-
-			vreg_pmu_rfa_1p8: ldo7 {
-				regulator-name = "vreg_pmu_rfa_1p8";
-			};
-
-			vreg_pmu_pcie_0p9: ldo8 {
-				regulator-name = "vreg_pmu_pcie_0p9";
-			};
-
-			vreg_pmu_pcie_1p8: ldo9 {
-				regulator-name = "vreg_pmu_pcie_1p8";
-			};
-		};
-	};
 };
 
+
 &i2c1 {
 	clock-frequency = <400000>;
 	status = "okay";
@@ -1024,21 +990,10 @@ &pcie3_port0 {
 &pcie4_port0 {
 	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+};
 
-	wifi@0 {
-		compatible = "pci17cb,1107";
-		reg = <0x10000 0x0 0x0 0x0 0x0>;
-
-		vddaon-supply = <&vreg_pmu_aon_0p59>;
-		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
-		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
-		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
-		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
-		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
-		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
-		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
-	};
+&pcie4_port0_ep {
+	remote-endpoint = <&m2_e_pcie_ep>;
 };
 
 &pcie5 {
@@ -1530,19 +1485,10 @@ wcn_usb_sw_n: wcn-usb-sw-n-state {
 
 &uart14 {
 	status = "okay";
+};
 
-	bluetooth {
-		compatible = "qcom,wcn7850-bt";
-		max-speed = <3200000>;
-
-		vddaon-supply = <&vreg_pmu_aon_0p59>;
-		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
-		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
-		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
-		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
-		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
-	};
+&uart14_ep {
+	remote-endpoint = <&m2_e_uart_ep>;
 };
 
 &uart21 {
@@ -1612,6 +1558,10 @@ &usb_2_hsphy {
 	pinctrl-names = "default";
 };
 
+&usb_2_m2_ep {
+	remote-endpoint = <&m2_e_usb_ep>;
+};
+
 &usb_mp_hsphy0 {
 	phys = <&eusb3_repeater>;
 };

-- 
2.34.1

