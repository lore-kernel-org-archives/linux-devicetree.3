Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D175377004
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 12:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785846772; cv=none; b=qnDU/9zzFWNK0bKxECSEf6DBQW1LrRgfw+2mdPWDvJQlgEBHGsIRb00sVNYfHmurz45JPVNQvNfu4rN6q0cPWZU6EbRXAmLFA1ZRgZM9ugGxLJmNOa3F0e/xdkrMh6UoF+db0JYc3VB85BV8CmsOCxNWE7VDqIUbs9US8Xf4cDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785846772; c=relaxed/simple;
	bh=7KrZQ/NlGj1MWa2YU5pm4cuN5AXuJsIrNe1OF1KGBEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K9DLy+o8kPRVJvLWsKJpvT1nPEHO76kKi60S91c3kh6BatU9dfisDAzGCy+ZAVczF4XMQGUnk8P2xXzR3BpxF2ViT0LvoOOQ9/4e7rLAqfNklrhBJs5NnV5zGiPt4D0ast8kuU+mfrv6D4nPSaRnGjZ/X/bzE2n7uDiDmDYvUKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XjoG8TKw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HsrQm+i8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XjoG8TKw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HsrQm+i8"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6748CFUL3300421
	for <devicetree@vger.kernel.org>; Tue, 4 Aug 2026 12:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rxCVYVUNQmMUQQMCkSnXOjCofEZwWUb1f5DdnxniEIA=; b=XjoG8TKwOFWx2g77
	Smjh/EdvIJDkL0ajYIAl5oHPAGYMkIGizM7elnS7A7p7iq52jFWEfB+Y/YF6ofwX
	BkVdm6iSt0zDsGHzISCWp0X81spML3U7wibP6NqTVbKq7aU3FowDc9tXf/egHEeJ
	7j8jDqWE/JXFY9WNWUr8P1mfnkPdZXfN5ILTzSBdIaaGmODBCVT6SzNQATZQHUyA
	wuMQrJv2qhRjP2wChlj9bVKoX8Glf9+7d0MMzUysVu9dJ2Wa6CuD2Iaq1zYcx2qj
	u70VczQJ+z8TJoPn0coXluotOzQ4/k8NPONvR0XIRF6R8dlDOrpGnx/V6KQZF6mr
	fD1ygQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu1p8bjh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 12:32:49 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4940e68ef7fso411372b6e.2
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 05:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785846768; x=1786451568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rxCVYVUNQmMUQQMCkSnXOjCofEZwWUb1f5DdnxniEIA=;
        b=HsrQm+i8Q1ulFU4FUYcU7jT53l+9WuTBzC1QRi62oi2aUFwR4zYbOL1cM7NHDh4OaJ
         Yz6+W3HHMb/cXXHd4TIxFdDvqYdap6ickGQylwRxWqMleDgj0XyNywupifELONVsuUC9
         sXjZj9BwORzrczVjfqV5O0Cp4gzL8Okg9cnKbZFfHEHDH6kc2dYEcO+nXubud4WqN+/J
         58qn1GS9DA00ZxJEeC/6m55ukLwfeOuKZn5GJgoWJjshOhfw6trc1pTiytpCaIvJsDDS
         91O/lXsUBGZ2MC/JWYUsChWZpbAx1KYNZXoPLTAFmS4UCEPpHV1q5fBWV5x7wgMFI/qz
         ga9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785846768; x=1786451568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rxCVYVUNQmMUQQMCkSnXOjCofEZwWUb1f5DdnxniEIA=;
        b=RuXfXs/5JtUM4+XZWMbFzhnImfLMbjenUEnVqPg/TlzfEKF2UtzlU8e4qD2jd218OF
         UIXupPUZ7Vl83guvrqvh6JDX4Ple95l/Sqfz+Gg3oSpYZdhuh2ckoGYLqMCgJpycKbgA
         DtftuArwjOjdzUwQLsi/xKUdzsbzXvCgs3gbJkcr2GNtxCrGc4ljh54Fjn0Kxmocmiqq
         PsIuGe48tVIUyQL8tLvMPz3so4CxW7Vw7MqXqfJsFD+jGICGw+b12pBEyR2TJz0/2Eck
         tgAV+qM5HZnnlBmkDvFaHXaN/dxefVpA9bOvVm1LeEMyiommIRPdRMtUjbfY5gWQ6h9E
         IzCg==
X-Forwarded-Encrypted: i=1; AHgh+Rr+kemEX2wzexzYS1UCJ3JksR9v9D8OT0AoXWp0lrESxLNE/4qvJfH6thjrOfsKGcqIkBh2Gtr0R9mM@vger.kernel.org
X-Gm-Message-State: AOJu0YwDnuuVVJEi13+RGsDbyaXlxHfjvtgBHO1Cux0QjQEwi8g0r0wr
	19GED2YaUOmVuh1MGmBi5x2MPKZQCFL9UfDcJZnovMSQxVIFnHXZpuVSWTz4zFGarjl8Rpb4+oi
	dVcVkrpluh0EIeRlbPROQARQ1133Q/j9e4upGnVGkJzbiwW11kg9JEe8E+hYW++zR
X-Gm-Gg: AR+sD11jt+qce5EO3ZYPDyrBfck1jwFphRh6VY3H3ovJpYPeOyAEJgKTcBksO9RyH8s
	JidAsnmrZyw/i4Dqd3qxRsYqhRm7WA/zMa89pHN2D8VajEcUpr21kLFzs6F00N0AZ2hvt1xD0+6
	QzOhyXGhYAuDQ+llrMb5Ohao8852YnSUGaKDTSE1gF6iwt2kkVM9Czi8Kvs6lkdei+vxZR6TVkX
	bJ3NtX6kiUWRXzEU2vN6aaGQhmTnMysWeMNFU3gQu4VHJpmOUuCQP9aQkZj1mNsWK1VMdNtuB4j
	Rmh6sDGoV14xEzjWNpoq0CLXLJkUm4M0X8gT9VpOJrRi7EtWFNs1ZS9KJbllUgFVjUGfP3RF3Pl
	7pDCV43W/3WBdJcOPlpDB0HqgfrPlhHhuZUstm4108tx3gsrzruQ=
X-Received: by 2002:a05:6808:2219:b0:4a4:866:c2c0 with SMTP id 5614622812f47-4af5e25c3efmr12317415b6e.4.1785846768367;
        Tue, 04 Aug 2026 05:32:48 -0700 (PDT)
X-Received: by 2002:a05:6808:2219:b0:4a4:866:c2c0 with SMTP id 5614622812f47-4af5e25c3efmr12317396b6e.4.1785846767969;
        Tue, 04 Aug 2026 05:32:47 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458f6064d2esm12227013fac.3.2026.08.04.05.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:32:47 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Tue, 04 Aug 2026 18:02:27 +0530
Subject: [PATCH v4 3/4] arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe
 M.2 Key E connector
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-hamoa-m2-dts-v2-v4-3-1b5ceac74538@oss.qualcomm.com>
References: <20260804-hamoa-m2-dts-v2-v4-0-1b5ceac74538@oss.qualcomm.com>
In-Reply-To: <20260804-hamoa-m2-dts-v2-v4-0-1b5ceac74538@oss.qualcomm.com>
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
        mengshi.wu@oss.qualcomm.com, Wei Deng <wei.deng@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=A5xc+aWG c=1 sm=1 tr=0 ts=6a71dbf1 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=sIvI8tPoeWXx_RDIuOMA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA5OSBTYWx0ZWRfX2UlEfm9/Ywt8
 oxQp+omB5xVq+H3IPiV6wHJgsIVi7QutZ7r3GmWpJ7Fi94QmOJoCoiWCqtiN3JRVW1zp63tDKcs
 wj2cCOIX89tNii1DhcdILO94uXBoJSWFwgxLPAR00CEjHeMD2mQQpX6iZXNFdVwDGXkKg3eZFtP
 VAIbfkJFFk2oIItTnLxO2446XW6BMoek2PkdfjbgEK4bBCk+rf1m74+cLbWsDDgAXb3PSkw4JYo
 W8BYz1Kz/M00Cu3NgVDjsp9vZlmND+AZ1A045J8ScL+Ei6Qh1RcwnOtr6scrHUHD1cfX7f5aLX+
 aeQHO1FFNIOqi2n0yMJgzZP0BDtr8ZmfHZQpBiVBUczX/qpbcxufWfdjJltAiT/wcPKViJCGAfo
 VK3pmiJ1UqM6ZtOwYHah0NuQh53XSIUU3TFrYFPeT8kZIpgENqYfU3LjYM6kfdEq2i6NaXJjADu
 EBJHOzK29QotF5gaZVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA5OSBTYWx0ZWRfXwP6d4xTwCwRa
 ZGSExArE5tURe7q06SmoHvbEmuOVfd0r6/C/heDkCqzybRtbDxE0xOvF41skY162q2S4YZBV5c4
 /wwAqD8JaxkxnId/CY9KjiBx4tFiZn4=
X-Proofpoint-ORIG-GUID: VbUyj2Rrt3edbMLgTgz-TlgaDaenqXud
X-Proofpoint-GUID: VbUyj2Rrt3edbMLgTgz-TlgaDaenqXud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608040099

The Hamoa IoT EVK has a PCIe M.2 Mechanical Key E connector for wireless
connectivity cards exposing Wi-Fi over PCIe and Bluetooth over UART.

Describe the connector node with:
- port@0: PCIe for Wi-Fi, linked to pcie4_port0
- port@3: UART for Bluetooth, linked to uart14

This allows the pwrseq-pcie-m2 driver to manage card power and
dynamically create the UART serdev for UART BT variants of the M.2
card.

Remove the chip-specific wcn7850-pmu node, the static bluetooth
serdev under uart14, and the wifi@0 PCI child node, as the M.2
connector approach replaces WCN7850-specific power sequencing with
a chip-agnostic model.

Also remove the now-unused vreg_wcn_0p95 and vreg_wcn_1p9 dummy
fixed regulators whose only consumers were the wcn7850-pmu node.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 130 +++++++----------------------
 1 file changed, 32 insertions(+), 98 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 9fa86bb6438e..776bded3a312 100644
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
 
@@ -677,64 +651,44 @@ usb_1_ss0_sbu_mux: endpoint {
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
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vreg_wcn_3p3>;
 
-		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
-		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		w-disable1-gpios = <&tlmm 117 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&tlmm 116 GPIO_ACTIVE_LOW>;
 
-		pinctrl-0 = <&wcn_bt_en>, <&wcn_wlan_en>;
+		pinctrl-0 = <&wcn_wlan_en>, <&wcn_bt_en>;
 		pinctrl-names = "default";
 
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
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
 
-			vreg_pmu_rfa_1p2: ldo6 {
-				regulator-name = "vreg_pmu_rfa_1p2";
-			};
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-			vreg_pmu_rfa_1p8: ldo7 {
-				regulator-name = "vreg_pmu_rfa_1p8";
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie4_port0_ep>;
+				};
 			};
 
-			vreg_pmu_pcie_0p9: ldo8 {
-				regulator-name = "vreg_pmu_pcie_0p9";
-			};
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-			vreg_pmu_pcie_1p8: ldo9 {
-				regulator-name = "vreg_pmu_pcie_1p8";
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart14_ep>;
+				};
 			};
 		};
 	};
+
 };
 
 &i2c1 {
@@ -1024,21 +978,10 @@ &pcie3_port0 {
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
@@ -1530,19 +1473,10 @@ wcn_usb_sw_n: wcn-usb-sw-n-state {
 
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

-- 
2.34.1

