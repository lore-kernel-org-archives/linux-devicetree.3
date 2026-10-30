Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793323941;
	b=nOmqd9fkoQoH0WxJVVNSRKcWjx3trISpUimddJ1RQcJmlC4Yj3VrdwTWW2HFEz+z+kJ+
	 FomtwPCKNA9xS88GQB+soV2UJMG0LM/alb875/76+X1FnLAbaJrcHgmchKGudnbFVO0jM
	 dHEgAc2+CbKvycZ1udO3XiZMxpwbnesAvCdQRfqbu+WsK7Y/vcxtBX/i9aEVkeDIDRRiQ
	 fWfy8z9/Gkj0WRAPj/ozeqEWcfq29lvoWk9dQT33KNUrDdK1AYLfIoXAsZzKBZMrx3KFz
	 6cv8xf0kibd+XAd9Ln9hylQJYBoPWdqGsMaaP/kifEMqjodoDM9wa15vsphRnS8JgMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793323941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=LwJR8SmWPzbQS6wnKWhljw9vroJMe6zMXjC6hnIcgfE=;
	b=B3XCCZAvtAJ7UvcLvUomaHV9km4G8XrNdJAhr7wWDhALSzbbKUtoKGYDBmDI7TbWF+1L
	 hPN8qWU7DBmw7XXpuOoy3Fa7yVNAMWcZ9BaaUa665vT6b87SySTN8oi1uO9bXBnr/YLBX
	 63Ciu0k5mv9ujfXzi7C3S8RkRUVQXXZ8+EfZ9XUNv3nHVNQcICRkEg8emZyFQz5YZeDJ6
	 u4xmd2M5t1nLq6ZdYOm0inXnCbxBvu6zW679o84qvzAqdsWz4k3zGmQC/TDsuRlUZkyha
	 KN48LPO/Eang/BorWqfGIMJeAL2QFyA/f0e/hdWWDZLNfYMnox31xKD5zijlnHdWj+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oXNruOHg;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0E6606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 01:32:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D0E6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oXNruOHg
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e99b1e5b4cso1229695ad.0
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 18:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793323941; x=1793928741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LwJR8SmWPzbQS6wnKWhljw9vroJMe6zMXjC6hnIcgfE=;
        b=oXNruOHgKfnX2H4Wylq0k6TKYfObEUIYskVAEBJMWe4UU7gLrANP3DQE4rAfjvKov1
         JAyPIG1VvxbTiG5NUzU17YCfrl3oTGgjxTIjxyemswY3VRKQpSjPBb6c0SlX0Gyqb2yk
         G5qIHyaatZTq/NqOiwdRqaB6Q3JDbVwamyLCnS00N6cZGqES8K/vTRsUQHpvt21G8E7c
         uM9L3zPfCCq5LyIiWgkFjX6h7n8+NlBYPiHv5o5oK6x9LJv+DjMlKPz9LA5DXcDfrBYr
         zHLshibvtjW3nfgfkupE8m0MbJ8xwie1NzWwW0KshD+SZxCKNh3qjNlB8cSFW5rEfi9w
         FFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793323941; x=1793928741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LwJR8SmWPzbQS6wnKWhljw9vroJMe6zMXjC6hnIcgfE=;
        b=RzVO+Q87+SQWWJuaeWD6pr+/SJWIXeAJdxld7LiUYP4RxZY5VjeX/zhg/gRPOLMt8O
         kF4XKvOTU3+RVQOfTG7ssh8MT9yAaSzB8xDm10Y3QKpcBRiHShhpqT6DwtENh0R2qhyn
         jwJZ79Hz8jFbZaX6nXeRmGanhARi0isZ8sAfbaFwgTUvTKoN6ePxMYBcFkWjMwRRJ1Nu
         ey85RIxJw7f9qNBWv4UArhjczzKoB6MgH10fwG7U6pnjYdUH2lyceX6UcPkBgz5j/7S0
         BZmFrtu5sUsnfznZq8+fwd6QasoZ23B4K5sYJYUi4qjlw7yRICm6EoAjkJODLOWwBNfC
         uBEg==
X-Forwarded-Encrypted: i=1; AKwUvBzfJbI/PVPgcwiCQk/7Hu+kCH5FbCaGA1qRXVxl0nH1+k8/1SXWvUEzTmR5AODsZU5O1J3WET/a6OSb@vger.kernel.org
X-Gm-Message-State: AFq9FYIoppv85llMCbTtWUxZctm6c6jM1x4qUXG/4qmMv0zJ9xurzENo
	pPdLopqfeLbRxxsoyNC5GqB95aey7wbb/pROl6gSzpDOUl7aJ8LYlnwI
X-Gm-Gg: AYBFou05DiLpHUqp60oeJtTNyW4ovnOg0rmfXdV/R0Y3HwnBgJTarxe1d2uGvPsvSiL
	KZ3rGuuHjBwV1J5i/0lkfPXe83ifnr0FHuP9liRTnzJ2ATcwwqS6xkx9oYu5eDcXLjlk5iIghh0
	vORd646zOl2hNQlkSkexPIsK2kOytfzKHjWWXEo5Xnl2Ix4aBS9U8n8JbIbpoWVV2EASlBT1c0U
	GctImD0bIGOMLb8SUtaf47yrSov04lJ6B/f105Kg4KOb9+Jq0qfmRzQtvucJhOZbht27UG6rDEP
	gvVydQir7L9gXA+KCsQ9uSzbqyeq1iqDcP9r7/z+wjh1ArW1R0k0G/hXzaBE9ZkSDNm7k4/Rtt6
	OTC3zy5/Kby+KioTLP6yrJeWeO8H1deuZk5kgBx5Z6vi2DqFiC3lT+gPB2NdyYc0/OjsmUtXL+l
	VtZuH98LUmkgslqjy2x3S2/PXvDOKmvWgTxoo2gO3+LprlxIFwDkl/4W5KehX4ViOYu/23tZAen
	vDLHTAvTOueNspPJr9+Zk5WxuK+n/f2ePOB+EzwLeKT+NHUm6g5QO05QHhaAzu+FC857CvMzQX+
	8dJ9ThOFRuc73kTmxkI7PmtkQGgiEBBOSuGe4wWfwsk=
X-Received: by 2002:a17:902:d50a:b0:2e5:cf96:9340 with SMTP id d9443c01a7336-2eb3648bb2amr9865565ad.18.1793323940405;
        Thu, 29 Oct 2026 18:32:20 -0700 (PDT)
Received: from localhost.localdomain ([240c:c983:5:4bbd:2481:c7c4:68af:3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392b15f0sm911575ad.73.2026.10.29.18.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:32:18 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: [PATCH v3 5/6] arm64: dts: qcom: sm8250-hdk: Add support of QCA6390
Date: Fri, 30 Oct 2026 09:31:34 +0800
Message-ID: <20261030013135.158157-6-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030013135.158157-1-dc_redstone@outlook.com>
References: <20261030013135.158157-1-dc_redstone@outlook.com>
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

The sm8250-hdk has a built-in QCA6390 WiFi/BT module
which hasn't been added in the dts file.

Enable the UART port of BT, add the bluetooth node.
Add the QCA6390 PMU node.
Add the wifi node of pcieport0.
Add the missing regulator node of PM8009 which is used by QCA6390.
Add the pinctrl of QCA6390 enable pins.

Co-developed-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 121 +++++++++++++++++++++++-
 1 file changed, 120 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index fe89af067..f25447f1d 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -48,6 +48,67 @@ lt9611_1v2: lt9611-vdd12-regulator {
 		regulator-max-microvolt = <1200000>;
 	};
 
+	qca6390-pmu {
+		compatible = "qcom,qca6390-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&qca6390_pins>;
+
+		vddaon-supply = <&vreg_s6a_0p95>;
+		vddpmu-supply = <&vreg_s2f_0p95>;
+		vddrfa0p95-supply = <&vreg_s2f_0p95>;
+		vddrfa1p3-supply = <&vreg_s8c_1p3>;
+		vddrfa1p9-supply = <&vreg_s5a_1p9>;
+		vddpcie1p3-supply = <&vreg_s8c_1p3>;
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
 	vph_pwr: vph-pwr-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vph_pwr";
@@ -346,7 +407,6 @@ vreg_l11c_3p3: ldo11 {
 
 	regulators-2 {
 		compatible = "qcom,pm8009-rpmh-regulators";
-		qcom,pmic-id = "f";
 
 		vdd-s1-supply = <&vph_pwr>;
 		vdd-s2-supply = <&vreg_bob>;
@@ -354,6 +414,15 @@ regulators-2 {
 		vdd-l5-l6-supply = <&vreg_bob>;
 		vdd-l7-supply = <&vreg_s4a_1p8>;
 
+		qcom,pmic-id = "f";
+
+		vreg_s2f_0p95: smps2 {
+			regulator-name = "vreg_s2f_0p95";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <952000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+
 		vreg_l1f_cam_dvdd1_1p1: ldo1 {
 			regulator-name = "vreg_l1f_cam_dvdd1_1p1";
 			regulator-min-microvolt = <1104000>;
@@ -519,6 +588,23 @@ &pcie0_phy {
 	status = "okay";
 };
 
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1101";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
 &pcie2 {
 	vddpe-3v3-supply = <&vreg_3p3>;
 
@@ -650,6 +736,24 @@ rst-pins {
 		};
 	};
 
+	qca6390_pins: qca6390-default-state {
+		wlan-enable-pins {
+			pins = "gpio20";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-pull-up;
+			output-low;
+		};
+
+		bt-enable-pins {
+			pins = "gpio21";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-pull-up;
+			output-low;
+		};
+	};
+
 	sd_ufs_cd_pins: sd-ufs-cd-default-state {
 		pins = "gpio77";
 		function = "gpio";
@@ -677,6 +781,21 @@ clk-pins {
 	};
 };
 
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
+};
+
 &uart12 {
 	status = "okay";
 };
-- 
2.47.3

