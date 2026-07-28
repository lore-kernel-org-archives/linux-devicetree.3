Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECD13D9026
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785222410; cv=none; b=Ssbsdwhy7j2yICbjtpXy6EWcO/ziK3OPSnL2xhShx7VcYCOUzK+utv0LyL+Fn4lXuCykv2DY3AXLunkIG/dxJ0uwDhybaW02AVlMmiSLjq14rPt4rYgxDBlyWE47+CmJzk0G1u3I9UHaU1V9kqmEgnajDvTLHczUEtN31PyuzNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785222410; c=relaxed/simple;
	bh=ztQ16TX6JHl54CQY4JeUYC4JsypCSsLL05RbsKPqIws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OVfQ4xI6hqVx8LbAufmcAvs2ij+xa529NeeL8hSZUkbSSOu/fRQGREkNlUDTm9vdUT+BAHRrGt9uJ/oDfx5/XK/tuhjSPvvT9f6zN5DiymhEM/s2glpQghBnkVJEWcvmoGy66Z94J5vAB3qXDb/t4er35TzRHQYyCDf8aR0eNiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SWeeAcUo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8Hgr5M/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SWeeAcUo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8Hgr5M/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S46fu11821469
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:06:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+TCd8VYlfoTqCZXBNdcc0rSBVEIa1+gKOgOniEJSCGo=; b=SWeeAcUol5xJAz26
	r8ulz9Sgh5SBnp0vE1DBMVS993SqTFczhq/hbNu9SNtzN0kQOZPssJyFJzxD7Px2
	jzU3H410c0i+N5AXHxAimx52fWgD9D1Rk+aZVsFrVZwD+FEU1zw6hziDgw581TFB
	J3o8O43dvV+18FIjJ5FIFq2Bivbq6MnCKRayfFLAQ23KKsie4bliEqaD4b9PDn/E
	e0STmsK7VU5qI/Yt98gm9saoI9KkK9tzmnZRuMAgjxgXIbdrnykb4DdcOr8FQTHa
	4OLwI8vgWsyuouQ813VlLiaaP62KWE2RUvA0zb1JvRT1i6mwrhGL9ChEx4ksMRV0
	iqS3mg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpn3y0mk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 07:06:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfbf3e4a63so99268155ad.0
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 00:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785222402; x=1785827202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+TCd8VYlfoTqCZXBNdcc0rSBVEIa1+gKOgOniEJSCGo=;
        b=U8Hgr5M/rVE3D4hEI8RLmmEo5BYQWi0HkvpHudDKvxkhrvoXziiqLm2XnDurF7ikoE
         ZNLx/rxiAShFVveAl8ZRWNLiKMbnApgEMZLlnj9XSXf8RmbOrRUiIA9NRSjKkDQTLZD9
         tfckmh1wuCZ1dSnQBhhTwLdvZlw/0kao6oYsrcs1/JF2KpGi0fkYv61eN1/jYzlrHX7T
         c5l0IGrCZ3w3FHLu0BYGCOrKK3Q6xdWBpoiBS1koxxPdqA+wMsRQ6wpFyEoQDI6tLi8s
         hybYBHzJQy3MVvvIa6xP7mrvzYvwkn1XL1LnbWJpCw4jlGtGCsZeiHs1AhOfY9lJDrPU
         FP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785222402; x=1785827202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+TCd8VYlfoTqCZXBNdcc0rSBVEIa1+gKOgOniEJSCGo=;
        b=mMuPCOsBuSwav4V+wSI/AaGglYw4d3iIJqYM7O2EZayL+ye1Tr+yOC3BKuiYvBGo/5
         rV1rZ47XqhgCKUWsElmCI512Eke4ec8JjgFGSJoWseYBaDFrc+RNB8gj4ptgg+mO74nG
         u57YbMyUoH4DDrPTnqEd3FWDCJOIBWRKnZpgPWNzucDYR9WA+C9cD5RptocY0roHLKCi
         4QUZbSUgWrqKJPS79wgBQGvJs7WjjW85wJm3OzHkjLmNs9f5EOEcqbuBuIaIDRCBsD3R
         q642vq3k8PIYInAYoiimROeLiJ13k6m/E8WtoRNBA5y64Aka9ad3YnCnGLvJPZTuYgu5
         bzOw==
X-Forwarded-Encrypted: i=1; AHgh+RrUVnWZZeoTHGY6jz+5R7oe18DYsVjTl/gJNzGJW0DjDiM1ACbS7qnBtb0DRXSiI2OkgIXs2PGJzuJf@vger.kernel.org
X-Gm-Message-State: AOJu0YxHJOJPI39wPVddSKQVT+Qakzl6fr+3SSJuBp+bHPHBZPuz1TIs
	DFbA1bnfY46o1BZhpfK7yYhBvu14WAofvL7V1PxNJ4YP/UG3We4nprggQE/E2c1mmwy7/zKCy4A
	PbB83Jag2nQ4ToplAjcVmL3fu4Ww23hPrEpp2hBwcnTjrTX5Yq6Fvk+rizDRu2jQa
X-Gm-Gg: AR+sD12ihjtphH3eM/f3C+4VB4Xl7Jb1TyMV+okdBzw1ufiPi/wc9zDIck1j7zHf9iO
	+kj7BcwiVS82rBN3zxYsR5TEylNANm9pqhJwz0jqiXg/EP4/oge5eE9yzuzO6W8yplwLPPe/hQj
	w3xffv+BRSozWXhSIJWVmkpx99Lbh9IiIemjCbDVYfPZDSjVOxeKNryPef7o3Cm+hxQYaHbNet1
	UPWH//3WhTuUm0MQyLBcYYUUX9yWu+qAkDFUcy8ShyJnc+NZUvQ8b6h29Il2QKUCXXBtvun4nnV
	ySPy9Ko6Pleo3g6o07g2Z6UrQiZDu7PwE8XmkS6DwDEJu5h+UCZLTCz8mDuiy7LRtfCjVoz+alS
	Pjz1tnHL1GqCMxMR917ngHKjPFfl90TjRrvE=
X-Received: by 2002:a05:6a21:4c08:b0:3c3:becb:b705 with SMTP id adf61e73a8af0-3c8ac70867dmr1644500637.27.1785222402430;
        Tue, 28 Jul 2026 00:06:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:4c08:b0:3c3:becb:b705 with SMTP id adf61e73a8af0-3c8ac70867dmr1644465637.27.1785222402077;
        Tue, 28 Jul 2026 00:06:42 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e1255sm59846776eec.4.2026.07.28.00.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 00:06:41 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 12:36:14 +0530
Subject: [PATCH v4 2/3] arm64: dts: qcom: eliza-evk: Add PCIe0 with M.2 E
 key connector
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-eliza_evk-v4-2-decc7fe5246e@oss.qualcomm.com>
References: <20260728-eliza_evk-v4-0-decc7fe5246e@oss.qualcomm.com>
In-Reply-To: <20260728-eliza_evk-v4-0-decc7fe5246e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785222387; l=3855;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=ztQ16TX6JHl54CQY4JeUYC4JsypCSsLL05RbsKPqIws=;
 b=ft8+vXMn50lEQEsDtLGBhzcEEzdnjDtxFzWjldrrO7WSn5IRCWqIrXDOYxRJ2OL17b1aEuvlE
 5DBhczmkwD5APCmScKYY+S4Hr2q3rjmvPDnKV8QiBKj72dE2BCyAp4m
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=fbidDUQF c=1 sm=1 tr=0 ts=6a685503 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qQkGquXN9PvF_GGjQ98A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MSBTYWx0ZWRfXxrUn9ppzB4ln
 UTncV2WC+7ptquxwh4GWNFoeVkHS1tGlDrZxV6wSptyRtcNtywcKVzeE37NWxyrAtx/6676akt8
 zUPGEbUTeJPvyU3lSPh5LYx4MXx8PNg=
X-Proofpoint-ORIG-GUID: P42749nP4jgKeVHrpfrzS-tYC8TG6Ni1
X-Proofpoint-GUID: P42749nP4jgKeVHrpfrzS-tYC8TG6Ni1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MSBTYWx0ZWRfX/vaHMprkFgLI
 GoEpBYEx2RDSJ655AryrY4PhqnKpjf7U1bLxX8YXDeZ6/bukkxVzPhX5X1swlXxvE1LUI14qE9t
 s1cUO18Lo+5gZPo3yow7cpuCm71+RaH4Hr4eE9i1tFpZc0NynFvrrYNM8wms/IY2nNwyW2OYepv
 RshkaUb/oxvH9j2AmSTb7PBb+nAt1D7x6PKovECsQeMfDwGVAEXK4jQm+1rDjR3tMdsC1+TCFKE
 wF8mcMd3CBTeJAipAUq3mMlW/bI79rgcHbV7SfVS6cvUoicmYKfx9e/Rutd0VvBh4ksx042H3CB
 J6AecSax+evBLtPZd83o1FWo5XgS9Iapo/ZRZi7XFB/nqyjneAt6lFXkuIMhHsKSBOV7YqXZPtZ
 xxDGKa8DllxZ4U9TNB9IITPlqJ66ntbhrVzr+z+5Eq4ROr3N/LKV655uybST+TvMNf7vi58AB6x
 DUuzCVvDApyjg/4cu9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_01,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280061

The Eliza EVK board features an M.2 E key connector connected to PCIe0.
Enable the PCIe0 root port and its QMP PHY with the necessary RPMH
regulator supplies. The M.2 slot's 3.3V supply rail is GPIO-controlled
via a TCA9538 I/O expander on I2C4.

The M.2 E key slot hosts a WLAN card connected over PCIe and a Bluetooth
device connected over UART. Model the connector using the
pcie-m2-e-connector binding, wiring the PCIe root port and UART5 for
the respective interfaces.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 116 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi     |   1 +
 2 files changed, 117 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index e47b24f8b827..b35fffb50976 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -11,6 +11,92 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	vreg_pcie_m_3p3: regulator-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vreg_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&gpio_expander1 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	connector-0 {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vreg_pcie_m_3p3>;
+		w-disable1-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&pm8550vs_g_gpios 4 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&m2_w_disable1>, <&m2_w_disable2>;
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
+					remote-endpoint = <&pcieport0_ep>;
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
+					remote-endpoint = <&uart5_ep>;
+				};
+			};
+		};
+	};
+};
+
+&i2c4 {
+	pinctrl-0 = <&qup_i2c4_data_clk>;
+	pinctrl-names = "default";
+
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	gpio_expander1: gpio@3c {
+		compatible = "ti,tca9538";
+		#gpio-cells = <2>;
+		gpio-controller;
+		reg = <0x3c>;
+	};
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l1k>;
+	vdda-pll-supply = <&vreg_l3k>;
+
+	status = "okay";
+};
+
+&pcie0_port0 {
+	wake-gpios = <&tlmm 114 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
+
+	port {
+		pcieport0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
 };
 
 &uart13 {
@@ -18,3 +104,33 @@ &uart13 {
 
 	status = "okay";
 };
+
+&uart5 {
+	status = "okay";
+
+	port {
+		uart5_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
+};
+
+&pm8550vs_g_gpios {
+	m2_w_disable2: m2-w-disable2-state {
+		pins = "gpio4";
+		function = "normal";
+		input-disable;
+		output-enable;
+		bias-disable;
+		power-source = <2>;
+	};
+};
+
+&tlmm {
+	m2_w_disable1: m2-w-disable1-state {
+		pins = "gpio35";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index a54a956531e5..c99bcccae00c 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -1909,6 +1909,7 @@ opp-8000000-3 {
 			};
 
 			pcie0_port0: pcie@0 {
+				compatible = "pciclass,0604";
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

-- 
2.34.1

