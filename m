Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB35037B002
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 13:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224530; cv=none; b=NmiK1r2D1Pw3WWZuI2QwqcLFyr9Wjwwy+zGnGdtTRVZPpl6aLOdSU8qazxb6WfSA3v3VVt6Y/0jKEXVkJJ5Knno97+2mgv+yP0578XHRbykQAEiYRc4pdfogmLPoy8Hz0K9QYZh51vWJD+lq392pT5JekseNO/IpBRCQ6GAo2Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224530; c=relaxed/simple;
	bh=akUQPIrMgPWRNFtOss4vuRIj1MAE0awNf856ZYFJhDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uZOJS58aWEDarGVl5SP5eXhohzDKiuDz1v7sFJTdnNA+pTISyv3ja/toYqjd/rGrVXqescnXkI/MuY8xCnjc/Q2tufXM6uxOwW3P4jCC3KsaYr1d3KEKeQ4Jzzof+DR8oc1MRpP0YevliVtwtb/6iU7LKa7+JGDDVvoCGBW9Oi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1iJCghLn; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1iJCghLn"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b93698bb57aso386406866b.0
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 06:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1775224522; x=1775829322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EPHsiCpdUUXRFvwRdI2OtsPeWnYw906MZTDdwum5VRU=;
        b=1iJCghLnvgfSUtBrShdDy/L79Y4llpI3oHKz2+th4NqH//TI3YsOLlElBFTCFSwQth
         s2TttnLzyVCC6TT5Hqh0S3Q7w5CPh/XN94iAhtFlUExUFSEIhKsLbO4qZxCx6C5nQE0q
         mYH4j3uW0hAoLlm/RAE91f0r9igUBigZ6Vqrlln4t9KiT0TsNpxOSxrJWqwpJlCtFDKf
         RtbRRm3bQVdadj9CquFjAM//SK5tmu5HgRQ5E8pZoWo+WQKvdSfGYpYmmHumpTel/6Ip
         2V6Z0ARw/Lm6cLIx72YKxhq0+CVyFeXaRhyWn2yk33YEzdE3v07YnrkbVenO4wpixqU/
         bGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224522; x=1775829322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EPHsiCpdUUXRFvwRdI2OtsPeWnYw906MZTDdwum5VRU=;
        b=GBbHwTSONN5z1YLPhBDKJOjIeJ3VAYe9yma1gXQqxez2tOzqQB6yWBlWYTvklBsL51
         WFpwKHgv4Gzak/8XokVv9lXSDvfXFJ19JysN+61x6F1cLSI14nOUzTlda6P86DkofQdf
         DRdnpnDvcmgsvxAKv7/5hJHawyLIuxp9rLj4dr/mmXyZTJxaHJgwJeyr9YwBzmGnppeN
         UVv1b6AgOwDsa8VgQ0kV+Siw0vgPJAyQ+u98Kf5tLSzxEL7coPiVf+DrvdJjsXcEGFpC
         uQadpCojWqTSme6JnZr2P8GPI2MfBzrp1uAcmV1MCyZDbtFHe+DvAi4npXyQjZ2O5Djx
         xFtA==
X-Forwarded-Encrypted: i=1; AJvYcCWxjaabr51/VeETJhh1ds8cjB2sZ/Me3qnoNTJ1J2C8z0cVQtYfcF31ZwHzBvus4ypi6g0DR8tKTaol@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv7Bz+sjZksJA4q3w6lH+J3uCD6l5N42oqV/8sPy6Nd/oKujAh
	z0B5Cz6DszVZ64uY05vxXwjRUFnyyA8RzrlKiXto88wXBPrHEaEFMUkwhEYZ0sSigIc=
X-Gm-Gg: ATEYQzylWk9tkfV6ttjJs5kUmilrra1SUihVrLS/ERBTEOR+pFKF2QDjdU9oeUsqmrQ
	Ta9ATXKA56+hQf/z9ggg3LFhVjftSCVKpom4AU5lrxxQfGStExBOBm+7SSbkOHGbGA93HQTOZ4D
	Dru5ZP2rk1cZt/OqBhHBEWz6TOhAF5/ZXeGsYL9guJRZPln2MfnnqD6Juhr8b9rBABnDiBeMuk2
	mjvJUR/wjMwNKVC6YXi+OamBc6vDJISqlvSVoFK9uKoyvZbkculBu3NXlq0ZspZ3EcxckXEZ1hh
	XLvvSqiyFK6MHuOGE6KSDkknnpIphhFXF6r3WeaOhfIzIyaKPWg5royCSf+NKTiFVYXuF3x5R0A
	iHBr40XDgxtivu4OjQPTq3jNO6vRKPP7KKH+zAJHD+/nyhfYhcEToKs+/Vtebx392D9h9UL7r1e
	DncFNBMoHicvS3Z8prI3NGJq3CQbokAUArA9M/01JiiwOKFpazs4/mlvE2rEybzPKWw/2sub8dn
	EoqZG18iBanupgbrjIw/qCaf7Iv1ZMua86Rpg==
X-Received: by 2002:a17:907:3d56:b0:b94:231f:26ca with SMTP id a640c23a62f3a-b9c46fedc37mr308190066b.20.1775224522291;
        Fri, 03 Apr 2026 06:55:22 -0700 (PDT)
Received: from otso.local (2001-1c00-3b89-c600-71a4-084f-6409-1447.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b89:c600:71a4:84f:6409:1447])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c972e28sm198057266b.1.2026.04.03.06.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:55:21 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 03 Apr 2026 15:52:52 +0200
Subject: [PATCH v2 6/7] arm64: dts: qcom: milos-fairphone-fp6: Enable
 Bluetooth
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-milos-fp6-bt-wifi-v2-6-393322b27c5f@fairphone.com>
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alexander Koskovich <AKoskovich@pm.me>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, 
 Johannes Berg <johannes@sipsolutions.net>, 
 Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775224512; l=5650;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=akUQPIrMgPWRNFtOss4vuRIj1MAE0awNf856ZYFJhDg=;
 b=dyYdc5Ec1aiox9qFG4Riy10GAz315VOhkO2VRCASezMRP6RTMEzf6wuziUmcu2DsGn7c72cho
 P8++lG8qX9OCFoKmQAwkmfYwCfcltX0EMy6Baz9Am39oTehVbjctRh/
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add the nodes to describe the WCN6755 chip with its PMU and Bluetooth
parts.

Thanks to Alexander Koskovich for helping with the bringup, adding
'clocks' to the PMU node to make Bluetooth work.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 174 +++++++++++++++++++++++
 1 file changed, 174 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index c1899db46e71..db72418b7195 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -24,6 +24,7 @@ / {
 
 	aliases {
 		serial0 = &uart5;
+		serial1 = &uart11;
 	};
 
 	gpio-keys {
@@ -225,6 +226,67 @@ trip1 {
 			};
 		};
 	};
+
+	wcn6750-pmu {
+		compatible = "qcom,wcn6755-pmu", "qcom,wcn6750-pmu";
+
+		vddaon-supply = <&vreg_s3b>;
+		vddasd-supply = <&vreg_l7b>;
+		vddpmu-supply = <&vreg_s3b>;
+		vddrfa0p8-supply = <&vreg_s3b>;
+		vddrfa1p2-supply = <&vreg_s2b>;
+		vddrfa1p7-supply = <&vreg_s1b>;
+		vddrfa2p2-supply = <&vreg_s1j>;
+
+		bt-enable-gpios = <&tlmm 53 GPIO_ACTIVE_HIGH>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK1>;
+
+		pinctrl-0 = <&bluetooth_enable_default>;
+		pinctrl-names = "default";
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -752,6 +814,39 @@ &pon_resin {
 	status = "okay";
 };
 
+&qup_uart11_cts {
+	/*
+	 * Configure a bias-bus-hold on CTS to lower power
+	 * usage when Bluetooth is turned off. Bus hold will
+	 * maintain a low power state regardless of whether
+	 * the Bluetooth module drives the pin in either
+	 * direction or leaves the pin fully unpowered.
+	 */
+	bias-bus-hold;
+};
+
+&qup_uart11_rts {
+	/* We'll drive RTS, so no pull */
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&qup_uart11_rx {
+	/*
+	 * Configure a pull-up on RX. This is needed to avoid
+	 * garbage data when the TX pin of the Bluetooth module is
+	 * in tri-state (module powered off or not driving the
+	 * signal yet).
+	 */
+	bias-pull-up;
+};
+
+&qup_uart11_tx {
+	/* We'll drive TX, so no pull */
+	drive-strength = <2>;
+	bias-disable;
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -810,6 +905,59 @@ &tlmm {
 			       <13 1>, /* NC */
 			       <63 2>; /* WLAN UART */
 
+	qup_uart11_sleep_cts: qup-uart11-sleep-cts-state {
+		pins = "gpio48";
+		function = "gpio";
+		/*
+		 * Configure a bias-bus-hold on CTS to lower power
+		 * usage when Bluetooth is turned off. Bus hold will
+		 * maintain a low power state regardless of whether
+		 * the Bluetooth module drives the pin in either
+		 * direction or leaves the pin fully unpowered.
+		 */
+		bias-bus-hold;
+	};
+
+	qup_uart11_sleep_rts: qup-uart11-sleep-rts-state {
+		pins = "gpio49";
+		function = "gpio";
+		/*
+		 * Configure pull-down on RTS. As RTS is active low
+		 * signal, pull it low to indicate the BT SoC that it
+		 * can wakeup the system anytime from suspend state by
+		 * pulling RX low (by sending wakeup bytes).
+		 */
+		bias-pull-down;
+	};
+
+	qup_uart11_sleep_tx: qup-uart11-sleep-tx-state {
+		pins = "gpio50";
+		function = "gpio";
+		/*
+		 * Configure pull-up on TX when it isn't actively driven
+		 * to prevent BT SoC from receiving garbage during sleep.
+		 */
+		bias-pull-up;
+	};
+
+	qup_uart11_sleep_rx: qup-uart11-sleep-rx-state {
+		pins = "gpio51";
+		function = "gpio";
+		/*
+		 * Configure a pull-up on RX. This is needed to avoid
+		 * garbage data when the TX pin of the Bluetooth module
+		 * is floating which may cause spurious wakeups.
+		 */
+		bias-pull-up;
+	};
+
+	bluetooth_enable_default: bluetooth-enable-default-state {
+		pins = "gpio53";
+		function = "gpio";
+		output-low;
+		bias-disable;
+	};
+
 	sdc2_card_det_n: sdc2-card-det-state {
 		pins = "gpio65";
 		function = "gpio";
@@ -836,6 +984,32 @@ &uart5 {
 	status = "okay";
 };
 
+&uart11 {
+	/delete-property/ interrupts;
+	interrupts-extended = <&intc GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH 0>,
+			      <&tlmm 51 IRQ_TYPE_EDGE_FALLING>;
+
+	pinctrl-1 =  <&qup_uart11_sleep_cts>,
+		     <&qup_uart11_sleep_rts>,
+		     <&qup_uart11_sleep_tx>,
+		     <&qup_uart11_sleep_rx>;
+	pinctrl-names = "default",
+			"sleep";
+
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn6755-bt", "qcom,wcn6750-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+	};
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 167 GPIO_ACTIVE_LOW>;
 

-- 
2.53.0

