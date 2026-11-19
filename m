Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107275;
	b=ThBQ1dLoM+gSpPu8QRnCX3A+wCd9KUIsepNjDmbay+vkM2roErT1XNICP/t9bzZCg9gb
	 qjCUVSQ5c8z0LsTSiaLUs88tF/PeulYl39/x2X0vBRX7rdFjZA3dZGVVPYyFtdyrIy3Vp
	 WGbZd94OjNycmcWErr/eGdDqf0Xvh8D2FSXNQd5sReGe3B+CPzwZgYQcp5vE9iRAAD+Ic
	 fkuyGYh91BdISAa6TDWWx2Y+3LUBv7UVFa2coh4xHzycbZrYMBUr24/DeatVgNEpV78zk
	 qJpoRihmcK8Gu+uJTzqaW5N0mffNhylneEgsc8igREfisI1KywxGQCgaQyTSP1iM6NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eWJ+9K9CujW+/eiSnl3KVXLfbSNQleY4XU8YoN4v9sc=;
	b=gUzWyxptaSZi8OYozRyqRs+Xh8EFzbVaiLVQTFVyFWxFe1uO+9MaJBniC0P9hAtcDrF1
	 MlySM5TNUVhrgmvs1Rf/WfS1blOgyTZtdTPsgqmzou3Equ40XM/dAFlODLo3Myc8aLLPt
	 bDHUlKls3NYvHTvNGKWvPlFKtFe4gU8t0Af3FJED0Nrvd73Juq5v7LGnxobYSw+6/1P3Y
	 +onbPFOhQ92nEA8kSH4GZJtPqLQV3cmLf/8fpfPgHZbqeddEZcH4q9nVqmpIMC8cGbXwc
	 KBYB9ca6kpQxC7P4YlXliLRRzdJSIFDCSWIc5QGNO4ut0u5oDqVC18o1TKvktjpfdvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nrx391Qe;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C94660A6F7D
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:54:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C94660A6F7D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nrx391Qe
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb72b44a97so19449855e9.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107274; x=1795712074; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eWJ+9K9CujW+/eiSnl3KVXLfbSNQleY4XU8YoN4v9sc=;
        b=Nrx391Qe8+O8LqOtDCxu0O4VfUEM6BMWsAQwTIo6k8TAeB/r7c7TRfxpIZo1divfz4
         r8tO2cydvdc/MU3hs6payqwcxFAz9jPrmXFLNOdrDAvI3N9j+cXAVx2J2yH2FUrhXRea
         K+jyFhiVfTiha3RQw9kkuX2nQRWcBS5adNGDMSxkH0QsFJyVRSHwUMpxaZxkGUbgDGb1
         6b5CLWS1UAN4WZ2Ws7iiTdWqW1mRUPWrNVKiSTlA8306egVDp8KG7vtlPMrUmECR3+ny
         CjReWy+0X4DMn9i0Mmy+v/siVTSLv7Xb8hx/Gp2kpi1xdliQfdCEUV6OtE2fncCVBnri
         SGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107274; x=1795712074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eWJ+9K9CujW+/eiSnl3KVXLfbSNQleY4XU8YoN4v9sc=;
        b=Ml7eO+IDuybhTpzKeFbXeToENNh9RCR3WjNRu6LnVJesgU4yW5oR3Ejv5qHpdjIMfX
         J/t2uAk19L1n9qtoft3MhQZN32R1CyueFukSAOg2Xn1ZpDJ3csa3wQgf6RIG1FwPfTbI
         Ab8O36DQdBM9WAYGrXRZdW2APtxdO+2LtW1BFz6DLirdyT1/2sN4Q2fT/gmUJdJl4FUj
         5cV6t5cPb9eOwv5bGcXFWLF5acZQyJrF7RSpaUT4maGU6C5cdRFySS8nknEC/0OGphHq
         O0L2kFKg1k2iMPDBvQNVJihJ/IcuWrOGd1vQqXr+fkHyu09hLCmAuMTkzSNbn5omiI/O
         4udw==
X-Gm-Message-State: APuU4Z+RnfYDC7uC2DCvEGhrL6hja4rRppetsTQ1EcGd/96BBXUK3iUB
	MYmkeJMGGyoUETqMzPUZW/qQ7dPhglhb+qHyK43Fnc5q9AezZxqcJqjb
X-Gm-Gg: AYBFou2oT3obSv+8ZBIfBlOK1gNPN32fXMr37oE2TEdLJg0+k2fSVOeH03Y7YgIOrDI
	KBrip0Fl6MuVM3I04Niu9NN5EBwZhrtO2sNMEB9jHyRDntsLV2j4NzSyCR3Giihj8FPY2z8EGLz
	x09Fb/Ay9yE7x0llJfHSZIggLOfmVdMB3O3zggCdF1fxIoutPpy30tgRBkbVCPdrqjW+kQWXoEO
	BFHcQD9klPc5iweUrBoK4j3ApBD5TdU/93khJdS+cvTH3V+m0rMrikb4KWIlH39FU8AS76jMQWH
	WjcfDA1cua3iU7O+FAlpovHu+1UFewoPrU9hZUu4l43zozHSryYxpSy2LjV4uLUGTIetXpCiuj7
	x8IJmfhx1U3bSm9rv/1HD6Zr8gm0vVLWZxc9fGmBebzFPi7jd2rfoHsv3Mg4IWwLf9NPolVSmeZ
	H+dHIgjlVuxOBeRygnc0NfpQQla/5YnFOVEmpAgB0oHQ1YhOfn6QC5mp7/8eghOGMZddq3c15fo
	sUJIAA7rUrUBxi0zWbeL1+hZxAVyCAcPnhC5p17yrb8Z7I9PiXy45f6ybrPfYhuuOKpFKWLCe/h
	xuPqvKtp+k+AF1Uf4c1vo53C7KB1vK+3oOsoMj7WLsBZLriWswDtbYPc/phAmzNav9Q6TAD5eDQ
	=
X-Received: by 2002:a05:600c:3ba4:b0:4ba:493b:3401 with SMTP id 5b1f17b1804b1-4bb8880abafmr2552105e9.9.1795107273824;
        Thu, 19 Nov 2026 08:54:33 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm9894555e9.0.2026.11.19.08.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:54:33 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v3 10/10] arm64: dts: qcom: sm8250-lg-timelm: add QCA6390 Bluetooth
Date: Thu, 19 Nov 2026 17:54:20 +0100
Message-Id: <20261119165420.24466-11-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261119165420.24466-1-rofikcoga@gmail.com>
References: <20261119165420.24466-1-rofikcoga@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the QCA6390 power sequencer with properly voltaged supplies
and enable Bluetooth HCI on GENI UART6.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 3ce8161574a95..1426ce82d3f58 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -65,6 +65,67 @@ key-assistant {
 		};
 	};
 
+	qca6390-pmu {
+		compatible = "qcom,qca6390-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_en_state>, <&wlan_en_state>;
+
+		vddaon-supply = <&vreg_s6a_0p95>;
+		vddpmu-supply = <&vreg_s6a_0p95>;
+		vddrfa0p95-supply = <&vreg_s6a_0p95>;
+		vddrfa1p3-supply = <&vreg_s8c_1p35>;
+		vddrfa1p9-supply = <&vreg_s5a_1p9>;
+		vddpcie1p3-supply = <&vreg_s8c_1p35>;
+		vddpcie1p9-supply = <&vreg_s5a_1p9>;
+		vddio-supply = <&vreg_s4a_1p8>;
+
+		wlan-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
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
+
 	reserved-memory {
 		res_xbl_uefi_log_region: memory@80880000 {
 			reg = <0x0 0x80880000 0x0 0x14000>;
@@ -634,6 +695,14 @@ &sdhc_2 {
 &tlmm {
 	gpio-reserved-ranges = <40 4>, <52 4>;
 
+	bt_en_state: bt-enable-state {
+		pins = "gpio21";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
 	sdc2_default_state: sdc2-default-state {
 		clk-pins {
 			pins = "sdc2_clk";
@@ -667,6 +736,29 @@ ts_int_default: ts-int-default-state {
 		drive-strength = <8>;
 		bias-pull-up;
 	};
+
+	wlan_en_state: wlan-enable-state {
+		pins = "gpio20";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-up;
+		output-low;
+	};
+};
+
+&uart6 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,qca6390-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+	};
 };
 
 &uart12 {
-- 
2.39.5

