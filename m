Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7F53E023A
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 07:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582193; cv=none; b=U73eSiQoMNJDLK82glodBX8oE101KlKuisqth8iM6UCi34CCfAXjWmAgFhoacpj4Arrc6RWCs+qKQiIv89M3LRyxtSE1n+QVrDo2eQY4fBsEn1bYqciWWcJEZqyd9ve1CDWqyGcPZleeVa8r6+Dk6nEibcMVbm6Z9HNRE0UjrgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582193; c=relaxed/simple;
	bh=ti18E3whOjj3E/clAE26Ilsl5ydBCy/MZpD7NC2EUk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eUons/QSjorhZzZFztEQgFTWt9Phr/aeENgFyGqsEe/oyZqZ0zCx3cGUN+dYPCVGYieZ3Nq/HR13FOFfhLICvJHwJQ/G1QSL5clN1TeXks+OQMzP2vNJyQ4C7/x+Q3dTudp+Qs9YOtjkKyf0Fe+gBtxDEFIHd4CbYlOx6+/HnYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=btsOzL5j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EDyt7AT+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="btsOzL5j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EDyt7AT+"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960GM0887916
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 07:29:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vScidbHly171Kf0BpSO9ox3SUP4FemmOhWhhk06koyM=; b=btsOzL5j3LfvjMji
	9np+rj9bTGs6uDp/e4zKFJE+05qLgcNptS9W1STcFqAwdIWamzMdZSWR6IDLzt9T
	tPrsrvG7uYA3aOrsLVGy8LlggCGJoE6jZ97300rvTFwJmYFCs0j+0S6LCnwMi7Lc
	o4mFG6OeBf7EY/cInoM0e9MRFqEybw3zUQCTYse/ABDVW2bjLv2ekP8WLn/vSpZ8
	SM1FkeeDo4EFfB/fr7n93B/g2uXv7v2fQ8svShIvN9nzwPAM8Pzsvs+Ed4UHWo0O
	i9knQqzCSekiQH+xmoYNV1HcjzaEaqaZ3MTuQJDMv2kCSL9B1Ztjso8xh76IaaD6
	uRRMiw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq339tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 07:29:50 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8477d84264bso438457b3a.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 00:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783582190; x=1784186990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vScidbHly171Kf0BpSO9ox3SUP4FemmOhWhhk06koyM=;
        b=EDyt7AT+PB0rNikDNFg5tcb3hFxWrEsSQmEQz3LLVHW5a9AuLVgyOhA2Qf3KilAlxB
         dKZ9rd4oaFlZEVSBl9yvByEkYm6P11DLHloBncBWMtH7WsPyF0EyutYZvVXRvmWdZ6je
         94WHTX96MQ5ONgHUB/m03xnECZtnSkEhrQRSMNcCVg4YeY/XVv6Qqizhexza2O9DTm7Q
         gw0q6yRrH48kOGlMi7RQzWjQtYo+kORdShdYiwzn4EQlaz2hbLR3Gk2Pd7lZGSGavT6a
         0693v4E21ElI6Z8m50mOCDHxC/3AyPOE1RdbgzeASh/CtEpg32n908OykRMWOtxaCMIS
         ulUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783582190; x=1784186990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vScidbHly171Kf0BpSO9ox3SUP4FemmOhWhhk06koyM=;
        b=OqPZm0aZ3IcQH5MJ4JZl39wBLMeu52vT2fS2Y/aIGnuyyPOhGmdYxQzpmirZKHuW/A
         1vTS2Omj3rM0YhcBtbY0QBULc+un6G/Xyj0/3OI9k0P6+A7nARBPRyI7fm/gN7toTDm/
         dQAM6tMeNrNGiPrFfgoaFBl7ylJS8rF2BLtHtnr93wlb6me7kSaLs+uzOZvgxDThkY4L
         AybJRrhl6jcLnOkFbop8T7ICtAILKF5ZMpSBwViUU3S1WEXK5v33SoYK7qW7jwQiIb8Y
         tqC47HrkxfJHun/Wg0yj2GVYA5NFgsX5iNyb3yEszbhBtwGdD78WkRPvvEx/NMmt4SfC
         2ldg==
X-Forwarded-Encrypted: i=1; AHgh+Rri/XYLGFMlSWN9HG5j959ZKYwVXQW094m2Nwb93eom3InzOJC6QUMSMiuttx/pBNZ+IpO8pDCN0QZD@vger.kernel.org
X-Gm-Message-State: AOJu0YyOFtaQohikz0uwxMbJHyFWejw+YKxIv9ziBds8ADIXcpPFEHvG
	PS5TFiSlrPvv354F47+s5T9awRKyqx5tLcKSdsHtXNsO2ygagU9D4WR5uGeuwDV06f+PpbiV0Nq
	Uw1hmBrjEF3XhxAWMN/k/xl1WcEdb3ZNMtreBRwpjqMn0/j56cdp+kPAV8dbV1uGI
X-Gm-Gg: AfdE7cm9CdI+UORx0QBAJ3Je7t2Cbrh2kMZDVUV+g6FUCuFg/aHUB4UQUQleePsnlWV
	1Q5nG+IY3WFWoP47UZxJ3zlW8YMSFJjOPujE5o+NQhTtut/Nd9bysHtPI3RDw3EskbTRzeDzLX9
	sPG4bnX+pB28o3mC7B4Um2pVvDYvuXW+zzpzYGFgIvJSCFNA1ZQDXz0xbQfZryfSh6PCGTPEC6k
	M5YyE57Rqc3ySnIgV73Pda7W2Tv5ge3cjk5QY6jtzEaFh6c2M94l6FDv4xqfKLZW+vhWb9PGk7a
	k82vek9gii1RuFda4uesQFaf7fb9XzSh6ogPo6gIrYmk2IPo/mM7Hcp3WUZs15LwsRWpLIEPnAg
	WE+HCg6dryoSO6YpQM8c3o7faIpQ6+DtGKuN8Zv98r1jrRPvIXjg94qtrOq9vbg==
X-Received: by 2002:a05:6a00:a0c:b0:842:3932:71cb with SMTP id d2e1a72fcca58-84855fe8b89mr1634945b3a.4.1783582189792;
        Thu, 09 Jul 2026 00:29:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:a0c:b0:842:3932:71cb with SMTP id d2e1a72fcca58-84855fe8b89mr1634921b3a.4.1783582189335;
        Thu, 09 Jul 2026 00:29:49 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d44d53sm8167222b3a.38.2026.07.09.00.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 00:29:48 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Thu, 09 Jul 2026 12:59:40 +0530
Subject: [PATCH 1/3] arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe M.2
 Key E connector
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-fix-hamoa-m2-w-disable2-v1-1-5e725091266a@oss.qualcomm.com>
References: <20260709-fix-hamoa-m2-w-disable2-v1-0-5e725091266a@oss.qualcomm.com>
In-Reply-To: <20260709-fix-hamoa-m2-w-disable2-v1-0-5e725091266a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>,
        mengshi.wu@oss.qualcomm.com
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: rFirUgV6PXYAMNZQCB47bpZNoNVccaLi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA2OSBTYWx0ZWRfX24v2sJRAjuJs
 Ly2xcLLqIy9ceab89jMmSjxA6j4DOzeXK+yj5JkhQAU8f6H2zNc0ASGeCyX+J/LzXSX2UkCsxC4
 zl8tgHkcsG7eKpa8QJLskAXiHPPloRNAPoYusBK3d8RaTH6VrrUhhSs6Hn9zHPh/u+QWAxcUHwY
 jxh89Uv8SG9k+F2yEbR/yPn8KcdxEnjnq0V/lewRA77TghaZt82SnlYVIscTTd6jT68ZXObS4Q3
 TA5jYYR2mHSSLzkYLc99h4WHgCXTdGgULAndCsDCT6IQg78NV35L4OlaAf3ofWOdj1k25iV6Wj7
 qdC3dLNpRhvzOtesAaZxSXtYZ++j0fRzhHxJzpevbZjjeZpqlvjE0mRJ80OhJU1D6FUNkblFQ2r
 qBUyNDnOoo1n9NC/Mvge5aJoDfuH1Bdj5JsFlCIDW894/l/xKoIn4EgwIT5atINXDm7OMMNeGGH
 UuUMWsSnB+8Qpr4ZRhw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA2OSBTYWx0ZWRfX20/h/nvtRs3d
 df4ITKxOWabRb0+tG5Xg9/2K7RjiaZeixkNwQIJmwheOhO2oaPIgQPGtJdl3yUcIaUynr4+P1Ps
 sl0n7ZZVSMgqaFtPceIeLfpIY+gYoLw=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f4dee cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6xwnDyfGkisnSeZ8xU8A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: rFirUgV6PXYAMNZQCB47bpZNoNVccaLi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090069

The hamoa IoT EVK has the PCIe M.2 Mechanical Key E connector to
connect wireless connectivity cards over PCIe and UART interfaces.
Hence, describe the connector node, link it with the PCIe 4 Root Port
node and replace the static BT serdev under UART14 and the
chip-specific wifi@0 child node with graph port/endpoints, allowing
the pwrseq-pcie-m2 driver to power the card and dynamically create
the BT serdev device.

The M.2 Key E connector is powered by vreg_wcn_3p3. WLAN enable is
controlled via W_DISABLE1# (GPIO117) and BT enable via W_DISABLE2#
(GPIO116), both described as active-low GPIOs on the connector node.

Remove the chip-specific wcn7850-pmu node as the M.2 connector
approach replaces the WCN7850-specific power sequencing with a
chip-agnostic one managed by the pwrseq-pcie-m2 driver.

Also add 'compatible = "pciclass,0604"' to pcie4_port0 in hamoa.dtsi
to allow the PCI subsystem to associate the DT node with the
PCI-to-PCI bridge device.

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 129 ++++++++++-------------------
 arch/arm64/boot/dts/qcom/hamoa.dtsi        |   1 +
 2 files changed, 47 insertions(+), 83 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 9fa86bb6438e..41c2004f0ef6 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -68,6 +68,44 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	connector {
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
+					remote-endpoint = <&pcie4port0_ep>;
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
 	connector3 {
 		compatible = "usb-a-connector";
 		label = "USB-3-Type-A";
@@ -676,65 +714,6 @@ usb_1_ss0_sbu_mux: endpoint {
 			};
 		};
 	};
-
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
 
 &i2c1 {
@@ -1025,19 +1004,10 @@ &pcie4_port0 {
 	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
 
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
+	port {
+		pcie4port0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
 	};
 };
 
@@ -1531,17 +1501,10 @@ wcn_usb_sw_n: wcn-usb-sw-n-state {
 &uart14 {
 	status = "okay";
 
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
+	port {
+		uart14_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 60f485a4892e..566a6b4c6208 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -3776,6 +3776,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			pcie4_port0: pcie@0 {
 				device_type = "pci";
+				compatible = "pciclass,0604";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 

-- 
2.34.1

