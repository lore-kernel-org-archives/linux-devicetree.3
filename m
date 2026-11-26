Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695115;
	b=a5KmI7FMSRtpk2wxqYfML1t2isaHVRNHkX1oLn4rsumnKt2cIO/HKLM2NCit4WMUSgrO
	 EPPbf7x5idtdNiyVAHlwTFWYBXDcIEP3ihQKVLWBtBNbJ33wgqVjMbbq41Vh1qnO8lcG6
	 GQHd17jx1f0XCzxNxivAyXme9zdT2P0n285Ba56tjuKAYxCiSDQabqXCc5AdW6WhA8cDI
	 Et4MSDvI4DzhrxPtHnt47pZI7Y2/qxENbjQffT4PHX5mXoby8fxHyYYx8gIzDACTIi4Cr
	 EhXq6r3R9eX8NcaSoRxniyHQ4FVCoIUkcCdXcz50FbnKIDkN7chQ2GpjRJZY/OPh15Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695115;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0ZGbNTlnuESZhYgot/UdfNh+dFpS9FLgU6tMHPcOxq8=;
	b=chgEN7ErxuOKea+AzHy9DfI2/9qYbZ5ZpjJ7yn7IwODXfvm67APQG+22apeHXi8xELqL
	 zQKwqeQUgpzQ8idk0oahZy4NRw/nqFaxjcSErWXHzUBVyvnQQaDUW1WBcmx6u7sAtufiC
	 nsAAeet5nI4uI9WcFwxK1Da7fNbbIbv4t2CFv9EEcqjxodH8vQVyuHqW7RBRagO0RiA2t
	 iHdMA03yHhne1js+gUSKCpJ2K14KZwanJP1MX1ag8/oHj0v2w0/VdmNquegpulp9EKVy0
	 w98lOPjaEh0dp6zWb5WMJtgPuKk6UKJdSXMV4WSXtVtLlXpgrhCCXnwBmwxw3oiNODw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TVnwCm3B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RqaldHDg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6807606A338
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6807606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TVnwCm3B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RqaldHDg
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVqo32264012
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ZGbNTlnuESZhYgot/UdfNh+dFpS9FLgU6tMHPcOxq8=; b=TVnwCm3BFhST469q
	W3Q6ybS7ehK5CMZ1UQUCWNkbr5efhFUJcEBbH99aCRPKmgBLHMxQrHzBnCOQal6M
	cER09U1khLDmWMXOROkL8xguz30ugpeyYy3cDOiKwVe53xN18lxE3z6w9s3/rEcS
	eahNbd5w7BS4XN//mDixTtX4qiJDLTFrEKfiJBlSfHsK/GW5Kt5sZ8HQ1e0Iu7YD
	8AX9QjhDGgqG4KgsuGmoHXzwkhP/9zAR3JZe2HyZTEKCSxCwGJIGlJSGA3/JG1y4
	uua0yi2795S1JBaj/oHlk0YNk0QSyisykhBJAJXoTmF2lvBj3dQQa8IEoPRff7K4
	6G5hWA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62aem1ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 12:11:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso7225148eec.0
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 04:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795695113; x=1796299913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0ZGbNTlnuESZhYgot/UdfNh+dFpS9FLgU6tMHPcOxq8=;
        b=RqaldHDgYBRSEXoYsnYtqNVnsBtOQyzm0eGiYEcCZO3vzVtJCjdHrtvq480ECl1rux
         xop5FL4RwrZch25G6RaFFHXr1MdCp/NAbUDOH/Gu/IS1DWZRw3jBFpmKP285CnFDMvJs
         OPTSICMdjsllaJsPn+7UqqJo89JWASxWx2kxHxFlGlCSx9QMnK8O5JSK8ShSnGpBcTiD
         N1/1Wfzs3NTFVaXV9jNQbr1V9y1lIG0BxN3iaoICu35wT3nsRPjN5oBsAfYQulr2M1zF
         JlclStqQZSZ7viTgJC0EIfOLZ3Jtuk5iQrX4KogmujLJ7p8Ls6tD9b5B6PSlYF8wuL7f
         56nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695113; x=1796299913;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ZGbNTlnuESZhYgot/UdfNh+dFpS9FLgU6tMHPcOxq8=;
        b=qK1wVYcLfC1G3LJLo4UNB81w8Rwig3VXe/2Zd6PE19x/MNkUXcPNCYk6uHvpLl0qh+
         JRwwqajnrFaibAWDLskc2EfZX9nBKb+bbAgN1xVo5s0Tr9jbTt/WM5/o7zK/xmUCrpZD
         c4gpvH6ryANZum+8WDqrTgXdYxnr9zt5PXe2BgBG2tqfbqwSfPa7e/1ZVvrrQbu5kVzo
         QG1tqM5yhLAV1zCTugBH/ZYMxOHUDcMY+S9F2zTSpmJ2q5baG3N5ZZvls7/HEE5dJnhE
         C1/tLV5a1ikkNVqpxrL1dzb9aLz81wPdkvAWPLnYb60tIOgceT7ZTkQLK7D86XGvUpZB
         lORQ==
X-Forwarded-Encrypted: i=1; AL+hErH8FfKXLnXuLzSbanVWSTwDt87dkVuidbbql4N6wzS2AAu3hHu0Jh7Bn2Lp+vByIyfwfrIv6P2O+T2J@vger.kernel.org
X-Gm-Message-State: APuU4Z+xUoaJ7EoV+mnjUol8PqYBsfTWpJy8SfaxyQttiz0cnaPskymn
	KHfS2jGRGUJ2ODlDX52iKUa6tRxHtNAWQPMxLspwl1o+OfABi58OBg12cUHf+JTrToWoKfRr6ch
	yLmerHCp1uDo8eCNQKPzna+BH+wuUiH3SaUE2IQSEyqKJVHgBPbh5VoZkN8CJS7Fe
X-Gm-Gg: AZFdTZejiS2DxiLj2kzZa2rmG6/9Ps+ESUn4nfyThvkZO4AhfF0OEgdbkOAW13XUHLU
	QTokjJfjQPOVhzllFiKuPA5Nf0eLv/XnhdA6roO5XB5I9eKBKrk8Q3RvL26lYhIyomm6GgIJeSJ
	ppvOy86g/lHS6G21bGWCPuocOHcyeHRM28ujqvVFYlZfdNJoCYwcgS2yutODhMtwdlm/4XZN9uN
	1CBL+sawBZs5qlhKR4kcH4XMhEL6THzY9EM/8V/jQsRxG65dmNXaAB3dEtN0m3O4+dQYByQrDZ7
	t8UDShWAEtXCL5Nv7ofmDQZe5yzZWGPsyDwo4ZHsOo7r8ot+DIhzy+9f6bD/qJhxIPUZfdyjlST
	bR6yEl1NQD7916rn1nN8FU0QdbPMM4d0bw/IIj0W9WpfU+dmMOe7yikieChsIWq0SyHzDnQK85j
	f7YQ==
X-Received: by 2002:a05:7301:c089:b0:372:14fb:2573 with SMTP id 5a478bee46e88-3856fd5bf76mr20747689eec.20.1795695113238;
        Thu, 26 Nov 2026 04:11:53 -0800 (PST)
X-Received: by 2002:a05:7301:c089:b0:372:14fb:2573 with SMTP id 5a478bee46e88-3856fd5bf76mr20747674eec.20.1795695112716;
        Thu, 26 Nov 2026 04:11:52 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm58457549eec.13.2026.11.26.04.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:11:52 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 2/2] arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports
Date: Thu, 26 Nov 2026 17:41:40 +0530
Message-ID: <20261126121140.1716190-3-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126121140.1716190-1-akash.kumar@oss.qualcomm.com>
References: <20261126121140.1716190-1-akash.kumar@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfXzQfQuftlfi/c
 6cihdYbXmG51bOrVSTzSLAtDuwO2x+3F9cpndk43/f/1r1cIychOFNdkovqiFYamZztKzeXC2yI
 AVasNSyo3etrl2NcpttQHIEqvhJwP07nkBtkQnM0Vf/JdVHWgKsnCYfqgE38Bmtn4CtaaMGQgf/
 ATTgcKWkjtrdr+wdRUY0R6i/3ahCB1QcDjcC4rRLq3qVdTwitdHuX+B8ErJwPZrbbI2gyGjWufl
 H9iJjg/KzEPykEYCiXOr9AAGah+D4aB4oqWpjKiHcgKtiR0/JG3Q+UfQz677CZiEiG9ygrHGfcZ
 Smbo4HQqjkyselDFWtqGhWwfKBLakAveS01JJcYE21E0KiYjLyu+gMzjncRTlivPOWFKSIxdrfk
 lmTWYIAKD7od0FTKfmfF13L3zp2qWR8Jqy7ZkVbN2Xr8PFtpFbABD7aKzcWhSvMJ/9KjY0zNK2y
 zPRtid0lysfnAGJ/W6Q==
X-Proofpoint-GUID: BMm5bRTT8xBiyWLqgvIWn8PzLBJSxSyF
X-Proofpoint-ORIG-GUID: BMm5bRTT8xBiyWLqgvIWn8PzLBJSxSyF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX2my++yCwWvXz
 YcOcINI8VbnX9Y1TfIGf+r3mhH/bnZNWIAMWFPII1HkRwtAmP6mgp05Z7MDMMMIfw7N5Ek0Bseb
 PG6uez7jsHl0JNaV5X15yZfz2Pk1QAc=
X-Authority-Analysis: v=2.4 cv=PqoG/AM3 c=1 sm=1 tr=0 ts=6b08220a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=fMFum6Eq_5t3XPXbPEkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260047

Add the CYPD6129 UCSI PD controller (typec@40) on i2c5, along with its
GPIO86 interrupt line and the PM8150 GPIO10 VBUS-enable control. The PD
controller chip is part of the SoC/SoM card, so it is added to
talos-lyra-evk-som.dtsi.

The two USB-C connectors themselves, and the endpoint wiring that
routes them to usb_1/usb_2's dwc3 controllers and the USB QMP PHY, are
carrier-board-specific — a different carrier board could wire the same
SoM differently — so connector@0/connector@1 and the related
usb_1/usb_1_dwc3_hs/usb_2/usb_2_dwc3_hs/usb_qmpphy_out endpoints are
added to talos-lyra-evk.dts, extending the som.dtsi's typec@40 node by
path.

connector@1 additionally routes its SBU lines through a GPIO-controlled
SBU mux (onnn,fsusb43l10x), since connector@1's physical Type-C port
carries SuperSpeed and SBU while connector@0's port is USB-HS-only by
hardware design. The SBU mux lives on the carrier board, so it is added
to talos-lyra-evk.dts along with the TLMM GPIO64 VBUS boost enable
fixed regulator that supplies the USB daughter-card connector's VBUS.

Add orientation-gpios to the typec@40 node so CC orientation can be
read for both connectors: connector@0 is USB-HS-only, so it gets the
<0> placeholder, while connector@1 reports orientation via TLMM
GPIO104. GPIO104 was already used for the carrier board's DP
hot-plug-detect pin, so move dp_hot_plug_det to GPIO80 to free it up.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 .../boot/dts/qcom/talos-lyra-evk-som.dtsi     |  41 +++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts   | 109 +++++++++++++++++-
 2 files changed, 145 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
index 94bf2e73889a..c4a8a79a82a2 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
@@ -31,6 +31,16 @@ xo_board_clk: xo-board-clk {
 			#clock-cells = <0>;
 		};
 	};
+
+	regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB1_VBUS";
+		gpio = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb1_en>;
+		pinctrl-names = "default";
+		enable-active-high;
+		regulator-always-on;
+	};
 };
 
 &apps_rsc {
@@ -195,6 +205,28 @@ nvmem-layout {
 			#size-cells = <1>;
 		};
 	};
+
+	typec@40 {
+		compatible = "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 86 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		orientation-gpios = <0>, <&tlmm 104 GPIO_ACTIVE_HIGH>;
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+};
+
+&pm8150_gpios {
+	usb1_en: usb1-en-state {
+		pins = "gpio10";
+		function = "normal";
+		output-enable;
+		power-source = <0>;
+	};
 };
 
 &qspi {
@@ -259,6 +291,15 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio86";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
index bd9980b9259b..572b1e8c9a8a 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -4,6 +4,7 @@
  */
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include "talos-lyra-evk-som.dtsi"
 
 / {
@@ -22,6 +23,28 @@ dp0_connector_in: endpoint {
 			};
 		};
 	};
+
+	regulator-vbus-boost-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_vbus_boost_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&tlmm 64 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&vbus_boost_en>;
+		pinctrl-names = "default";
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	sbu-mux {
+		compatible = "onnn,fsusb43l10x", "gpio-sbu-mux";
+
+		port {
+			sbu_mux_in: endpoint {
+				remote-endpoint = <&ccg_typec_con1_sbu>;
+			};
+		};
+	};
 };
 
 &i2c5 {
@@ -52,6 +75,66 @@ expander3: gpio@3c {
 		#gpio-cells = <2>;
 		gpio-controller;
 	};
+
+	typec@40 {
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port_0_hs: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port_1_hs: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ccg_typec_con1_ss: endpoint {
+						remote-endpoint = <&usb_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					ccg_typec_con1_sbu: endpoint {
+						remote-endpoint = <&sbu_mux_in>;
+					};
+				};
+			};
+		};
+	};
 };
 
 &mdss {
@@ -92,20 +175,36 @@ tpm@0 {
 
 &tlmm {
 	dp_hot_plug_det: dp-hot-plug-det-state {
-		pins = "gpio104";
+		pins = "gpio80";
 		function = "dp_hot";
 		bias-disable;
 	};
+
+	vbus_boost_en: vbus-boost-en-state {
+		pins = "gpio64";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
 };
 
 &usb_1 {
-	dr_mode = "peripheral";
-
 	status = "okay";
 };
 
-&usb_2 {
-	dr_mode = "host";
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port_1_hs>;
+};
 
+&usb_2 {
 	status = "okay";
 };
+
+/* HS only */
+&usb_2_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port_0_hs>;
+};
+
+&usb_qmpphy_out {
+	remote-endpoint = <&ccg_typec_con1_ss>;
+};
-- 
2.43.0

