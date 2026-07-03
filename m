Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60B63D952E
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 12:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783082331; cv=none; b=jj/uLcxuJCdPHH7ArLXbWcDBC1e7K759ceghmTXGRiLmBUHE7tZ8YVKGTLWgutfuFTblD111BrgBgaMykeiHhoiCNG8YN2kWRFaEadQsoVP81vtjd5o7NABei2ktJndbrfEjTESuPH0cSN2c6ohq3XYcJ4vY/qirgbcNZxYPPKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783082331; c=relaxed/simple;
	bh=zkvpr0+IBNpCcvVata0dYcAkxYLO6TWzdxrQ0fau8HM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YCzV63coB2RZqob7V8zPr3br9ooYm3NwaMwOopTlTMhlPyUbcBerRPj9x5QGeHyu92HV5/RQu54AGu6s+jQZJWhPrKKjMWv3qtAYyweP4ZreQC3PDtzIlZAPQ1iP2RSYVRxIgpZ1oef1m9COCbGKnkwLYHutbO7feIyHpldZJkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gr484Pk+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=abjP8Ww0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gr484Pk+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="abjP8Ww0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BO8XB2994889
	for <devicetree@vger.kernel.org>; Fri, 3 Jul 2026 12:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1mScC6jo38A7a/6Yn25WN+90CHFBKwBJ8seDVQeSB8M=; b=gr484Pk+lWpQng+H
	vWXaNPKgyvYp7Lea7W7OIh185ynjrXqbr7hj+BhBdCyGoWAUvC18BA5BQzsYegk1
	VpK/BCxx11NWPLWQCq7+PtliTr8hvEZm/cndXKnnnYN1eUsVTtfgrU83OnJcxpTn
	JilevUKw6WdQKtOiYJXttwibvtPpJ1PAb8qRHGARC1X2Af17848Ct3WFOu2yz8cM
	Ox0DjsL95R0/9lH2c6Vs7ghk4054rDIyGkoWJvPDSzNCvt6y8yBae6ZsiBog4bs4
	YFn2YWiMqIcnwnuX4rvVfo1U7W138SFigaqoIWx/OoNq2qCmRN11Z3LrHSFKd3KX
	qJgVuA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n2drv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 12:38:48 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9aa197d5easo2082073a12.1
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 05:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783082327; x=1783687127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1mScC6jo38A7a/6Yn25WN+90CHFBKwBJ8seDVQeSB8M=;
        b=abjP8Ww0MBvpch+xTSNQxCsYTyzsjBEHSIN26rEuuZZmO7cNz1dbHSYMu2bB4qELxK
         FWOf84cAlDFtxhQRCP2BZcJUsr9rspNQJ7mQj80i08cne6e6C+oRAHH2mMkIdZ1KnzQW
         wyXa7eGGG0VzCeexTYnu29cydwN9bAGYAN31ZLrBZLWfugffT2SYcY9p1HtupTT9pKp4
         KdFNyMiUlec1eZV1qQ4V+rqmG4d2ktpAuukFJ9Gi2rjF4TMFtXvpvlwF5VlkriiKsFDP
         vLbbeOubV2/OQ4RQ2mfi2VpPrtDsqVPwuB8+j/zKgw+w0d9nh6YOW1Xyl4XZUoZZ/NoQ
         jDYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783082327; x=1783687127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1mScC6jo38A7a/6Yn25WN+90CHFBKwBJ8seDVQeSB8M=;
        b=lWLWy17d9XExNUM6cnt1sLwxE8IhsdfMYna1oEhC4S4gR9cCWqOX4iMHgMUvkXiFID
         Mevts9r5jDFGTSf8kJh1QQ+KGlTqxbknknshkDjCSmUWwzQ+X9eWx+jeenvcVaIxCfv+
         xYhedddHP3L2TLuI2fy/arJkU4Ii0D/uhzMYksEuaJxJjsCIciArH1+0GLlpuX9LdtgI
         IPeQq3CpcqN+g8NkOdqL8yt2DqzVEGdDMxhKLwihr4EAmp0vPdoxjfzZSboMQf/0RbFr
         9H8A9Sjka2EAGashgUaMqXw6uUE5/1r/m8J0FjAKGGeQ0wmUP68p31VrfawnxHViyetX
         MY1Q==
X-Forwarded-Encrypted: i=1; AHgh+RraG7+V955TLKUmkoa77OoO//mdtJt62E6xEiKSZ9TDnpoms8dBZ6DkWDOxlXURtRVs9rYy024p41Zp@vger.kernel.org
X-Gm-Message-State: AOJu0YwU05XWsOlNbalvSvGp5YSu9cNLgtSBrk9Tk1hAmH6Du2tP+sHH
	TvL2c8zPOWRN50UPYOkPYwHxzWGEQpXiqsALRs/w+Z3rneXXazm73DuP/h19doq/OHtP74YKziC
	p0MJIWDCIB3MHh6elJgyCox/rPiTRBw38M98r99lVauzBW/ku4e4OHfb4pCfnZk6C
X-Gm-Gg: AfdE7ckMd6pROxIfKKUR21GQvxdqnQWSfpGzQa7zWTe3P2lnpyQPgh//C9U1ObEwzIS
	jFb2wRrQoXotUbNAIwao8anNbkeyUhPijWBkDZxuTjlg8q4x90WfNvi1jD5bPjD0G8vIeq41fpA
	JG/5yqXpS49K69+hT33sgv4qEUaAnVJesDtniHPjXBSnRrHN0nIPN47SUGhsTaQTclH/fQ10bea
	jWM03LZf8UFNV1tNknmDW3gzZPoNbQStxBsX2LsdB5MbJoiZ/8kau0op6XtVG5L2XQjJ3lZLddz
	MNZglzC8vg2EuosOsjAxiOwGPVNKiVwK3Jwy/LWCnCHcq7SH+XOQkDuP3y9o5PtwUyF09HIDiyc
	vglyaA63QlT2uUhBqtrRgLiPW4IOjnJ0fM2uDGihXkiM8lA==
X-Received: by 2002:a17:902:d2c5:b0:2ca:5023:f983 with SMTP id d9443c01a7336-2cacb1c7b68mr39362575ad.29.1783082327431;
        Fri, 03 Jul 2026 05:38:47 -0700 (PDT)
X-Received: by 2002:a17:902:d2c5:b0:2ca:5023:f983 with SMTP id d9443c01a7336-2cacb1c7b68mr39362265ad.29.1783082326952;
        Fri, 03 Jul 2026 05:38:46 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c870effsm24356993c88.12.2026.07.03.05.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 05:38:46 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 18:08:30 +0530
Subject: [PATCH 1/3] arm64: dts: qcom: eliza-evk: Add PCIe0 with M.2 E key
 connector
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-eliza_evk-v1-1-7624440bd76d@oss.qualcomm.com>
References: <20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com>
In-Reply-To: <20260703-eliza_evk-v1-0-7624440bd76d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783082317; l=4231;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=zkvpr0+IBNpCcvVata0dYcAkxYLO6TWzdxrQ0fau8HM=;
 b=r2gXgCVhdvNcdW/UMeT1rjIg9QD4wDmufHv+cnbjL7M2R8v8it0L76UjXiwn5wFxkCNiQDtQT
 HWYJEUu5mvSCDG50kUpni4BIw8Y6sMKpnfyU1eIwBk+6lFwzE9UDx9h
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDEyNCBTYWx0ZWRfX6YI9bra26Mbz
 ls90A7JuQUDwubzBvwjJ1ghKOlTnHaJBSDwPBC5EaAnb3pStseR2nHLZz5g3zU/ZHTB9xVpmdC5
 wY4EhoH6B7UUeRiPFxY6ztAEX2erL0k=
X-Proofpoint-ORIG-GUID: 1f5DR-SddTzwX7agqAETX6XR8DeGXKsF
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a47ad58 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=xTuWgevKKEmUOcCBws0A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: 1f5DR-SddTzwX7agqAETX6XR8DeGXKsF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDEyNCBTYWx0ZWRfX+miBEV+MXmHh
 K/6kWjqL3FouI6LBEhI5sk7raB3UwDjCqnPXRFl4DAruHBzJp2BcXQvg5i0+lFMkBH2bcvMTzRO
 5RIcC8DkIqld2ULYs4Sci6u10UWuNw76lhxm1n7J19KS5e5MrvNFWkCqQwwKEwsG7diTFgR/VUD
 AEe3GxrXBRGhIzlRyynBwh92XODhwI2iZxoyoNNaExLtSAnXSXOhbAQk+z0gzClK1g/WPOcw6TT
 EAh4xczggU7eI4kRj1Ij8ZiDYpnNvkOiGk2QgOzh8TmpNfWeh38w6MNiJVXkvub8+ZftgsxC7Zl
 8yu+R2yweFDdFSvTBMd7O9ci5TKmlzTJrq6E947fD9jh2P2gidfNBEzsY9QKo2ew8poO5WxRpLc
 2yE2q9l6hquoGaJ5WTGbxdQChOLjEMoB7vEgHE37eBok4ZRIrpZOoQXVmEbEONFMnXawhAU1Zhw
 0sPRrOt7okxbdbc/sLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030124

The Eliza EVK board features an M.2 E key connector connected to PCIe0.
Enable the PCIe0 root port and its QMP PHY with the necessary RPMH
regulator supplies. The M.2 slot's 3.3V supply rail is GPIO-controlled
via a TCA9538 I/O expander on I2C4.

The M.2 E key slot hosts a WLAN card connected over PCIe and a Bluetooth
device connected over UART. Model the connector using the
pcie-m2-e-connector binding, wiring the PCIe root port and UART5 for
the respective interfaces.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 142 ++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/eliza.dtsi     |   1 +
 2 files changed, 143 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index e47b24f8b827..ba41dbc34b81 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -11,6 +11,95 @@ aliases {
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
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
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
+&pcie0port0 {
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
@@ -18,3 +107,56 @@ &uart13 {
 
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
+
+	pcie0_default_state: pcie0-default-state {
+		perst-pins {
+			pins = "gpio78";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		clkreq-pins {
+			pins = "gpio80";
+			function = "pcie0_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		wake-pins {
+			pins = "gpio114";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index e68a5fb99e2b..4d507b0651be 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -1906,6 +1906,7 @@ opp-8000000-3 {
 			};
 
 			pcie0port0: pcie@0 {
+				compatible = "pciclass,0604";
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

-- 
2.34.1

